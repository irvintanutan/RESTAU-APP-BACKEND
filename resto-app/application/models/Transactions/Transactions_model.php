<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Transactions_model extends CI_Model {
 
    var $table = 'transactions';

    var $column_order = array('trans_id','datetime','gross','discrount','disc_type','total_due','status','order_type','cash_amt','change_amt',null); //set column field database for datatable orderable
    var $column_search = array('trans_id','datetime','gross','discrount','disc_type','total_due','status','order_type','cash_amt','change_amt'); //set column field database for datatable searchable

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
 
    function get_datatables()
    {        
        $this->_get_datatables_query();
        if($_POST['length'] != -1)
        $this->db->limit($_POST['length'], $_POST['start']);

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

    // get monthly new sales specified by month and year
    public function get_monthly_net_sales($month, $year)
    {
        $this->db->select('SUM(cash_amt) AS cash_amt');    
        
        $this->db->from($this->table);

        $date_from = $year . '-' . $month . '-01 00:00:00';
        $date_to = $year . '-' . $month . '-31 24:00:00';

        $this->db->where('status', 'CLEARED'); // transaction status should be cleared (paid by customer already)
        $this->db->where('datetime >=', $date_from);
        $this->db->where('datetime <=', $date_to);
        
        $query = $this->db->get();

        $data['cash_amt'] = $query->row()->cash_amt;

        return $data;
    }
 
    function count_filtered()
    {
        $this->_get_datatables_query();

        $query = $this->db->get();
        return $query->num_rows();
    }
 
    public function count_all()
    {
        $this->db->from($this->table);

        return $this->db->count_all_results();
    }
 
    public function get_by_id($trans_id)
    {
        $this->db->from($this->table);
        $this->db->where('trans_id',$trans_id);
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