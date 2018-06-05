<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tables_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Tables/Tables_model','tables');
    }

    public function index()						
    {
        if($this->session->userdata('user_id') == '')
        {
            redirect('error500');
        }

        $this->load->helper('url');

        // $categories_data = $this->categories->get_categories();
        
        // $data['categories'] = $categories_data;

        $data['title'] = 'Tables Information List';
        $this->load->view('template/dashboard_header',$data);
        $this->load->view('tables/tables_view',$data);
        $this->load->view('template/dashboard_navigation');
        $this->load->view('template/dashboard_footer');

    }
   
    public function ajax_list()
    {
        $list = $this->tables->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $tables) {
            $no++;
            $row = array();
            $row[] = 'P' . $tables->tbl_id;
            $row[] = $tables->name;
            $row[] = $tables->status;

            $row[] = $tables->encoded;

            //add html for action
            $row[] = '<a class="btn btn-sm btn-primary" href="javascript:void(0)" title="View" onclick="view_table('."'".$tables->tbl_id."'".')"><i class="fa fa-eye"></i> </a>

            <a class="btn btn-sm btn-info" href="javascript:void(0)" title="Edit" onclick="edit_table('."'".$tables->tbl_id."'".')"><i class="fa fa-pencil-square-o"></i></a>
                      
                      <a class="btn btn-sm btn-danger" href="javascript:void(0)" title="Delete" onclick="delete_table('."'".$tables->tbl_id."'".', '."'".$tables->name."'".')"><i class="fa fa-trash"></i></a>';
 
            $data[] = $row;
        }
 
        $output = array(
                        "draw" => $_POST['draw'],
                        "recordsTotal" => $this->tables->count_all(),
                        "recordsFiltered" => $this->tables->count_filtered(),
                        "data" => $data,
                );
        //output to json format
        echo json_encode($output);
    }
 
    public function ajax_edit($tbl_id)
    {
        $data = $this->tables->get_by_id($tbl_id);
        echo json_encode($data);
    }
 
    public function ajax_add()
    {
        $this->_validate();
        $data = array(
                'name' => $this->input->post('name'),
                'status', => 0 // 0 = available
                'removed' => 0
            );
        $insert = $this->tables->save($data);
        echo json_encode(array("status" => TRUE));
    }
 
    public function ajax_update()
    {
        $this->_validate();
        $data = array(
                'name' => $this->input->post('name'),
                'status' => 0, // 0 = available
            );
        $this->tables->update(array('tbl_id' => $this->input->post('tbl_id')), $data);
        echo json_encode(array("status" => TRUE));
    }

    // delete a tables
    public function ajax_delete($tbl_id)
    {
        $data = array(
                'removed' => 1
            );
        $this->tables->update(array('tbl_id' => $tbl_id), $data);
        echo json_encode(array("status" => TRUE));
    }

    private function _validate()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if($this->input->post('name') == '')
        {
            $data['inputerror'][] = 'name';
            $data['error_string'][] = 'Table name is required';
            $data['status'] = FALSE;
        }
        // validation for duplicates
        else
        {
            $new_name = $this->input->post('name');
            // check if name has a new value or not
            if ($this->input->post('current_name') != $new_name)
            {
                // validate if name already exist in the databaase table
                $duplicates = $this->tables->get_duplicates($this->input->post('name'));

                if ($duplicates->num_rows() != 0)
                {
                    $data['inputerror'][] = 'name';
                    $data['error_string'][] = 'Table name already registered';
                    $data['status'] = FALSE;
                }
            }
        }


        if($data['status'] === FALSE)
        {
            echo json_encode($data);
            exit();
        }
    }


    // ================================================ API GET REQUEST METHOD ============================================


    // public function ajax_api_list() // using associative array to set index names instead
    // {
    //     $list = $this->tables->get_api_datatables();
    //     $data = array();
        
    //     foreach ($list as $tables) {
        
    //         $row = array();
    //         $row['tbl_id'] = $tables->tbl_id;
    //         $row['name'] = $tables->name;
    //         $row['descr'] = $tables->descr;

    //         $row['cat_id'] = $tables->cat_id;
    //         $row['cat_name'] = $this->categories->get_category_name($tables->cat_id); // get name instead of id

    //         $row['price'] = $tables->price;
    //         // $row[] = $tables->img;
    //         $row['sold'] = $tables->sold;

    //         $row['encoded'] = $tables->encoded;

    //         $row['img'] = $tables->img;            

    //         // get number of rows found / check if it has details data
    //         $row['item_count'] = $this->prod_details->check_if_found($tables->tbl_id)->num_rows();

 
    //         $data[] = $row;
    //     }
 
    //     //output to json format
    //     echo json_encode($data);
    // }


    // // ================================================ API POST REQUEST METHOD ============================================


    // public function ajax_input_test($tbl_id)
    // {
    //     $stream_clean = $this->security->xss_clean($this->input->raw_input_stream);
    //     $request = json_decode($stream_clean);
    //     // $ready = $request->ready;
    //     $array = json_decode(json_encode($request), true);
        
    //     foreach ($array as $items) {
    //         $data = array(
    //             'name' => $items['name'],
    //         );
    //     }
        
    //     $this->tables->update(array('tbl_id' => $tbl_id), $data);
    //     echo json_encode(array("status" => TRUE));
    // }

    // public function ajax_input_test_insert()
    // {
    //     $stream_clean = $this->security->xss_clean($this->input->raw_input_stream);
    //     $request = json_decode($stream_clean);
    //     // $ready = $request->ready;
    //     $array = json_decode(json_encode($request), true);
        
    //     foreach ($array as $items) 
    //     {
    //         $data = array(
    //             'name' => $items['name'],
    //             'descr' => $items['descr'],
    //             'cat_id' => $items['cat_id'],
    //             'price' => $items['price'],
    //             'img' => '',
    //             'sold' => 0,
    //             'removed' => 0
    //         );
            
    //         $insert = $this->tables->save($data);
    //     }
    //     echo json_encode(array("status" => TRUE));
    // }
 }
