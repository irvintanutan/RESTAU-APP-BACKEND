<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Store_config_model extends CI_Model {
 
    var $table = 'store_config';

    // var $column_order = array('conf_id','name','descr','encoded',null); //set column field database for datatable orderable
    // var $column_search = array('conf_id','name','descr','encoded'); //set column field database for datatable searchable

    // var $order = array('conf_id' => 'desc'); // default order 
 
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
 
    // private function _get_datatables_query()
    // {
         
    //     $this->db->from($this->table);
 
    //     $i = 0;
     
    //     foreach ($this->column_search as $item) // loop column 
    //     {
    //         if($_POST['search']['value']) // if datatable send POST for search
    //         {
                 
    //             if($i===0) // first loop
    //             {
    //                 $this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
    //                 $this->db->like($item, $_POST['search']['value']);
    //             }
    //             else
    //             {
    //                 $this->db->or_like($item, $_POST['search']['value']);
    //             }
 
    //             if(count($this->column_search) - 1 == $i) //last loop
    //                 $this->db->group_end(); //close bracket
    //         }
    //         $i++;
    //     }
         
    //     if(isset($_POST['order'])) // here order processing
    //     {
    //         $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
    //     } 
    //     else if(isset($this->order))
    //     {
    //         $order = $this->order;
    //         $this->db->order_by(key($order), $order[key($order)]);
    //     }
    // }
 
    // function get_datatables()
    // {        
    //     $this->_get_datatables_query();
    //     if($_POST['length'] != -1)
    //     $this->db->limit($_POST['length'], $_POST['start']);

    //     // get only records that are not currently removed
    //     $this->db->where('removed', '0');
    //     $query = $this->db->get();
    //     return $query->result();
    // }

    function get_api_datatables()
    {        
        $this->db->from($this->table);
        
        $query = $this->db->get();
        return $query->result();
    }

    // get both id and names
    function get_store_config()
    {
        $this->db->from($this->table);

        $query = $this->db->get();

        return $query->result();
    }

    function get_store_config_img($conf_id)
    {
        $this->db->select('img');
        $this->db->from($this->table);
        $this->db->where('conf_id',$conf_id);

        $query = $this->db->get();

        $row = $query->row();

        return $row->img;
    }

    function get_store_config_password($conf_id)
    {
        $this->db->select('password');
        $this->db->from($this->table);
        $this->db->where('conf_id',$conf_id);

        $query = $this->db->get();

        $row = $query->row();

        return $row->password;
    }

    function get_store_bs_price($conf_id)
    {
        $this->db->select('bs_price');
        $this->db->from($this->table);
        $this->db->where('conf_id',$conf_id);

        $query = $this->db->get();

        $row = $query->row();

        return $row->bs_price;
    }
 
    // function count_filtered()
    // {
    //     $this->_get_datatables_query();

    //     // get only records that are not currently remove
    //     $this->db->where('removed', '0');
    //     $query = $this->db->get();
    //     return $query->num_rows();
    // }
 
    // public function count_all()
    // {
    //     $this->db->from($this->table);

    //     // get only records that are not currently removed
    //     $this->db->where('removed', '0');
    //     return $this->db->count_all_results();
    // }
 
    public function get_by_id($conf_id)
    {
        $this->db->from($this->table);
        $this->db->where('conf_id',$conf_id);
        $query = $this->db->get();
 
        return $query->row();
    }
 
    // public function save($data)
    // {
    //     $this->db->insert($this->table, $data);
    //     return $this->db->insert_id();
    // }
 
    public function update($where, $data)
    {
        $this->db->update($this->table, $data, $where);
        return $this->db->affected_rows();
    }
}