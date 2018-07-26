<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Transactions_model extends CI_Model {
 
    var $table = 'transactions';

    var $column_order = array('trans_id','datetime','order_type',null,'discount',null,'method','user_id',null); //set column field database for datatable orderable
    var $column_search = array('trans_id','datetime','order_type','discount','method','user_id'); //set column field database for datatable searchable

    var $order = array('trans_id' => 'desc'); // default order 
 
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
 
    private function _get_datatables_query()
    {
         
        $this->db->from($this->table);
 
        $i = 0;
     
        foreach ($this->column_search as $item) // loop column 
        {
            if($_POST['search']['value']) // if datatable send POST for search
            {
                 
                if($i===0) // first loop
                {
                    $this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
                    $this->db->like($item, $_POST['search']['value']);
                }
                else
                {
                    $this->db->or_like($item, $_POST['search']['value']);
                }
 
                if(count($this->column_search) - 1 == $i) //last loop
                    $this->db->group_end(); //close bracket
            }
            $i++;
        }
         
        if(isset($_POST['order'])) // here order processing
        {
            $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        } 
        else if(isset($this->order))
        {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
    }
 
    function get_datatables($trans_status)
    {        
        $this->_get_datatables_query();
        if($_POST['length'] != -1)
        $this->db->limit($_POST['length'], $_POST['start']);

        if ($trans_status == 0)
        {
            $this->db->where('status','ONGOING'); // if data is part of the object by ID    
        }
        else if ($trans_status == 1)
        {
            $this->db->where('status','CLEARED'); // if data is part of the object by ID       
        }
        else // cancelled - 2
        {
            $this->db->where('status','CANCELLED'); // if data is part of the object by ID       
        }
        
        $query = $this->db->get();
        return $query->result();
    }

    function get_api_datatables()
    {        
        $this->db->from($this->table);

        $this->db->order_by("trans_id", "desc");
        
        $query = $this->db->get();
        return $query->result();
    }

    function get_trans_status($trans_id)
    {
        $this->db->select('status');
        $this->db->from($this->table);
        $this->db->where('trans_id',$trans_id);
        
        $query = $this->db->get();

        $row = $query->row();

        return $row->status;
    }

    function get_last_receipt_no() // function to get the last receipt number to increment in every receipt generation
    {
        $this->db->select_max('receipt_no');
        $this->db->from($this->table);
        
        $query = $this->db->get();

        $row = $query->row();

        return $row->receipt_no;
    }

    function get_last_receipt_transaction_data() // function to get the last receipt number to increment in every receipt generation
    {
        $this->db->select('receipt_no, trans_id');
        $this->db->from($this->table);

        $this->db->order_by("receipt_no", "desc");
        $this->db->limit(1);
        
        $query = $this->db->get();
        return $query->row();
    }

    // get monthly net sales specified by month and year
    public function get_monthly_net_sales($month, $year)
    {
        $this->db->select('SUM(cash_amt - change_amt) AS total');    
        
        $this->db->from($this->table);

        $date_from = $year . '-' . $month . '-01 00:00:00';
        $date_to = $year . '-' . $month . '-31 23:59:59';

        $this->db->where('status', 'CLEARED'); // transaction status should be cleared (paid by customer already)
        $this->db->where('datetime >=', $date_from);
        $this->db->where('datetime <=', $date_to);
        
        $query = $this->db->get();

        return $query->row()->total;
    }

    // get daily net sales
    public function get_daily_net_sales($date)
    {
        $this->db->select('SUM(cash_amt - change_amt) AS total');    
        
        $this->db->from($this->table);

        $date_from = $date . ' 00:00:00'; // get date today to filter
        $date_to = $date . ' 23:59:59';

        $this->db->where('status', 'CLEARED'); // transaction status should be cleared (paid by customer already)
        $this->db->where('datetime >=', $date_from);
        $this->db->where('datetime <=', $date_to);
        
        $query = $this->db->get();

        return $query->row()->total;
    }

    // get daily net sales
    public function get_daily_discounts_rendered($date)
    {
        $this->db->select('SUM(discount) AS discount');    
        
        $this->db->from($this->table);

        $date_from = $date . ' 00:00:00'; // get date today to filter
        $date_to = $date . ' 23:59:59';

        $this->db->where('status', 'CLEARED'); // transaction status should be cleared (paid by customer already)
        $this->db->where('datetime >=', $date_from);
        $this->db->where('datetime <=', $date_to);
        
        $query = $this->db->get();

        return $query->row()->discount;
    }

    // get daily transaction count based on order type
    public function get_count_trans_today($date, $order_type)
    {
        $this->db->select('COUNT(trans_id) AS trans_count');    
        
        $this->db->from($this->table);

        $date_from = $date . ' 00:00:00'; // get date today to filter
        $date_to = $date . ' 23:59:59';

        $this->db->where('order_type', $order_type);
        $this->db->where('datetime >=', $date_from);
        $this->db->where('datetime <=', $date_to);
        
        $query = $this->db->get();

        return $query->row()->trans_count;
    }
 
    function count_filtered($trans_status)
    {
        $this->_get_datatables_query();

        if ($trans_status == 0)
        {
            $this->db->where('status','ONGOING'); // if data is part of the object by ID    
        }
        else if ($trans_status == 1)
        {
            $this->db->where('status','CLEARED'); // if data is part of the object by ID       
        }
        else // cancelled - 2
        {
            $this->db->where('status','CANCELLED'); // if data is part of the object by ID       
        }

        $query = $this->db->get();
        return $query->num_rows();
    }
 
    public function count_all($trans_status)
    {
        $this->db->from($this->table);

        if ($trans_status == 0)
        {
            $this->db->where('status','ONGOING'); // if data is part of the object by ID    
        }
        else if ($trans_status == 1)
        {
            $this->db->where('status','CLEARED'); // if data is part of the object by ID       
        }
        else // cancelled - 2
        {
            $this->db->where('status','CANCELLED'); // if data is part of the object by ID       
        }

        return $this->db->count_all_results();
    }
 
    public function get_by_id($trans_id)
    {
        $this->db->from($this->table);
        $this->db->where('trans_id',$trans_id);
        $query = $this->db->get();
 
        return $query->row();
    }

    public function get_by_receipt_no($receipt_no) // get transaction by receipt number
    {
        $this->db->from($this->table);
        $this->db->where('receipt_no',$receipt_no);
        $query = $this->db->get();
 
        return $query->row();
    }
 
    public function save($data)
    {
        $this->db->insert($this->table, $data);
        return $this->db->insert_id();
    }
 
    public function update($where, $data)
    {
        $this->db->update($this->table, $data, $where);
        return $this->db->affected_rows();
    }
}