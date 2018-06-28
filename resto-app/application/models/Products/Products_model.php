<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 
class Products_model extends CI_Model {
 
    var $table = 'products';

    var $column_order = array('prod_id','name','descr','cat_id','price','sold','encoded',null); //set column field database for datatable orderable
    var $column_search = array('prod_id','name','descr','cat_id','price','sold','encoded'); //set column field database for datatable searchable

    var $order = array('prod_id' => 'desc'); // default order 
 
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

        // get only records that are not currently removed
        $this->db->where('removed', '0');
        $query = $this->db->get();
        return $query->result();
    }

    function get_api_datatables()
    {        
        $this->db->from($this->table);

        // get only records that are not currently removed
        $this->db->where('removed', '0');

        $this->db->order_by("name", "asc");
        
        $query = $this->db->get();
        return $query->result();
    }

    // check for duplicates in the database table for validation
    function get_duplicates($name)
    {      
        $this->db->from($this->table);
        $this->db->where('name',$name);

        $query = $this->db->get();

        return $query;
    }

    // get both id and names
    function get_products()
    {
        $this->db->from($this->table);

        $this->db->where('removed', '0');

        $this->db->order_by("name", "asc");
        
        $query = $this->db->get();

        return $query->result();
    }

    function get_product_id($name)
    {
        $this->db->select('prod_id');
        $this->db->from($this->table);
        $this->db->where('name',$name);

        $query = $this->db->get();

        $row = $query->row();

        return $row->prod_id;
    }

    function get_product_name($prod_id)
    {
        $this->db->select('name');
        $this->db->from($this->table);
        $this->db->where('prod_id',$prod_id);
        
        $query = $this->db->get();

        $row = $query->row();

        return $row->name;
    }

    function get_product_descr($prod_id)
    {
        $this->db->select('descr');
        $this->db->from($this->table);
        $this->db->where('prod_id',$prod_id);
        
        $query = $this->db->get();

        $row = $query->row();

        return $row->descr;
    }

    function get_product_cat_id($prod_id)
    {
        $this->db->select('cat_id');
        $this->db->from($this->table);
        $this->db->where('prod_id',$prod_id);
        
        $query = $this->db->get();

        $row = $query->row();

        return $row->cat_id;
    }

    function get_product_price($prod_id)
    {
        $this->db->select('price');
        $this->db->from($this->table);
        $this->db->where('prod_id',$prod_id);
        
        $query = $this->db->get();

        $row = $query->row();

        return $row->price;
    }

    function get_product_img($prod_id)
    {
        $this->db->select('img');
        $this->db->from($this->table);
        $this->db->where('prod_id',$prod_id);
        
        $query = $this->db->get();

        $row = $query->row();

        return $row->img;
    }
 
    function count_filtered()
    {
        $this->_get_datatables_query();

        // get only records that are not currently remove
        $this->db->where('removed', '0');
        $query = $this->db->get();
        return $query->num_rows();
    }
 
    public function count_all()
    {
        $this->db->from($this->table);

        // get only records that are not currently removed
        $this->db->where('removed', '0');
        return $this->db->count_all_results();
    }
 
    public function get_by_id($prod_id)
    {
        $this->db->from($this->table);
        $this->db->where('prod_id',$prod_id);
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

    public function update_sold_prod($prod_id, $qty)
    {
        $this->db->set('sold', 'sold + ' . (int) $qty, FALSE);
        $this->db->where('prod_id',$prod_id);
        $this->db->update($this->table);
        return $this->db->affected_rows();
    }

    public function update_sold_pack_prod($prod_id, $qty)
    {
        $this->db->set('sold_pack', 'sold_pack + ' . (int) $qty, FALSE);
        $this->db->where('prod_id',$prod_id);
        $this->db->update($this->table);
        return $this->db->affected_rows();
    }
}