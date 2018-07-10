<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Trans_details_model extends CI_Model {
 
    var $table = 'trans_details';

    var $column_order = array(null,null,'price','qty','total',null); //set column field database for datatable orderable
    var $column_search = array('price','qty','total'); //set column field database for datatable searchable

    var $order = array('trans_id' => 'desc'); // date descending order 
 
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

    private function _get_datatables_query_sold_today()
    {   
        $this->db->from($this->table);
 
        $i = 0;
    }
 
    function get_datatables($trans_id)
    {        
        $this->_get_datatables_query();
        if($_POST['length'] != -1)
        $this->db->limit($_POST['length'], $_POST['start']);

        $this->db->where('trans_id',$trans_id); // if data is part of the object by ID

        $query = $this->db->get();
        return $query->result();
    }

    function get_datatables_sold_today()
    {   
        $this->_get_datatables_query_sold_today();
        if($_POST['length'] != -1)
        $this->db->limit($_POST['length'], $_POST['start']);

        $this->db->select('distinct trans_details.prod_id as prod_id, trans_details.pack_id as pack_id, SUM(trans_details.qty) as sold');
         
        $this->db->join('transactions', 'transactions.trans_id = trans_details.trans_id');

        $date_from = date("Y-m-d") . ' 00:00:00'; // get date today to filter
        $date_to = date("Y-m-d") . ' 23:59:59';

        $this->db->where('trans_details.prod_type !=', 2); // no package-product included
        $this->db->where('transactions.status', 'CLEARED'); // transaction status should be cleared (paid by customer already)
        $this->db->where('transactions.datetime >=', $date_from);
        $this->db->where('transactions.datetime <=', $date_to);

        $this->db->group_by('trans_details.prod_id');
        $this->db->group_by('trans_details.pack_id'); 
        $this->db->order_by('sold', 'DESC');

        $query = $this->db->get();
        return $query->result();
    }

    function get_api_datatables($trans_id) // api function in getting data list
    {        
        $this->db->from($this->table);

        $this->db->where('trans_id',$trans_id); // if data is part of the object by ID

        $query = $this->db->get();
        return $query->result();
    }

    // get both id and names
    function get_trans_detail_items($trans_id)
    {
        $this->db->from($this->table);
        $this->db->where('trans_id',$trans_id);

        $query = $this->db->get();

        return $query->result();
    }

    function get_trans_gross($trans_id)
    {
        $this->db->select('SUM(total) as gross');
        $this->db->from($this->table);
        $this->db->where('trans_id',$trans_id);
        
        $query = $this->db->get();

        $row = $query->row();

        return $row->gross;
    }

    // check if the parent data has children in FK
    // function check_if_found($trans_id)
    // {      
    //     $this->db->from($this->table);
    //     $this->db->where('trans_id',$trans_id);

    //     $query = $this->db->get();

    //     return $query;
    // }
 
    function count_filtered($trans_id)
    {
        $this->_get_datatables_query();
        $this->db->where('trans_id',$trans_id);

        $query = $this->db->get();
        return $query->num_rows();
    }
 
    public function count_all($trans_id)
    {
        $this->db->from($this->table);
        $this->db->where('trans_id',$trans_id);

        return $this->db->count_all_results();
    }

    function count_filtered_sold_today()
    {
        $this->_get_datatables_query_sold_today();

        $this->db->select('distinct trans_details.prod_id as prod_id, trans_details.pack_id as pack_id, SUM(trans_details.qty) as sold');
         
        $this->db->join('transactions', 'transactions.trans_id = trans_details.trans_id');

        $date_from = date("Y-m-d") . ' 00:00:00'; // get date today to filter
        $date_to = date("Y-m-d") . ' 23:59:59';

        $this->db->where('trans_details.prod_type !=', 2); // no package-product included
        $this->db->where('transactions.status', 'CLEARED'); // transaction status should be cleared (paid by customer already)
        $this->db->where('transactions.datetime >=', $date_from);
        $this->db->where('transactions.datetime <=', $date_to);

        $this->db->group_by('trans_details.prod_id');
        $this->db->group_by('trans_details.pack_id'); 
        $this->db->order_by('sold', 'DESC');

        $query = $this->db->get();
        return $query->num_rows();
    }
 
    public function count_all_sold_today()
    {
        $this->db->from($this->table);

        $this->db->select('distinct trans_details.prod_id as prod_id, trans_details.pack_id as pack_id, SUM(trans_details.qty) as sold');
         
        $this->db->join('transactions', 'transactions.trans_id = trans_details.trans_id');

        $date_from = date("Y-m-d") . ' 00:00:00'; // get date today to filter
        $date_to = date("Y-m-d") . ' 23:59:59';

        $this->db->where('trans_details.prod_type !=', 2); // no package-product included
        $this->db->where('transactions.status', 'CLEARED'); // transaction status should be cleared (paid by customer already)
        $this->db->where('transactions.datetime >=', $date_from);
        $this->db->where('transactions.datetime <=', $date_to);

        $this->db->group_by('trans_details.prod_id');
        $this->db->group_by('trans_details.pack_id'); 
        $this->db->order_by('sold', 'DESC');

        return $this->db->count_all_results();
    }
 
    // public function get_by_id($trans_id, $prod_id)
    // {
    //     $this->db->from($this->table);
    //     $this->db->where('trans_id',$trans_id);
    //     $this->db->where('prod_id',$prod_id);

    //     $query = $this->db->get();
 
    //     return $query->row();
    // }
 
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

    public function delete_by_id_prod($trans_id, $prod_id)
    {
        $this->db->where('trans_id', $trans_id);
        $this->db->where('prod_id', $prod_id);
        $this->db->where('prod_type', 0); // prod_type is individual product
        $this->db->delete($this->table);
    }

    public function delete_by_id_pack($trans_id, $pack_id)
    {
        $this->db->where('trans_id', $trans_id);
        $this->db->where('pack_id', $pack_id);
        $this->db->where('prod_type', 1); // prod_type is package
        $this->db->delete($this->table);

        // delete all products that are part of the package
        $this->db->where('trans_id', $trans_id);
        $this->db->where('part_of', $pack_id);
        $this->db->where('prod_type', 2); // prod_type is product package
        $this->db->delete($this->table);        
    }

    public function delete_by_id_trans($trans_id)
    {
        $this->db->where('trans_id', $trans_id);
        $this->db->delete($this->table);
    }
}