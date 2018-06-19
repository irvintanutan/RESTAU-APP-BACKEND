<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Discounts_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Discounts/Discounts_model','discounts');
    }

    public function index()						
    {
        if($this->session->userdata('user_id') == '')
        {
            redirect('error500');
        }

        $this->load->helper('url');							

        $data['title'] = 'Discounts Information List';					
        $this->load->view('template/dashboard_header',$data);
        $this->load->view('discounts/discounts_view',$data);
        $this->load->view('template/dashboard_navigation');
        $this->load->view('template/dashboard_footer');

    }
   
    public function ajax_list()
    {
        $list = $this->discounts->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $discounts) {
            $no++;
            $row = array();
            $row[] = 'D' . $discounts->disc_id;
            $row[] = $discounts->name;
            $row[] = $discounts->descr;
            $row[] = $discounts->less_c;
            $row[] = $discounts->less_p;

            $row[] = $discounts->encoded;

            //add html for action
            $row[] = '<a class="btn btn-info" href="javascript:void(0)" title="Edit" onclick="edit_discount('."'".$discounts->disc_id."'".')"><i class="fa fa-pencil-square-o"></i></a>
                      
                      <a class="btn btn-danger" href="javascript:void(0)" title="Delete" onclick="delete_discount('."'".$discounts->disc_id."'".', '."'".$discounts->name."'".')"><i class="fa fa-trash"></i></a>';
 
            $data[] = $row;
        }
 
        $output = array(
                        "draw" => $_POST['draw'],
                        "recordsTotal" => $this->discounts->count_all(),
                        "recordsFiltered" => $this->discounts->count_filtered(),
                        "data" => $data,
                );
        //output to json format
        echo json_encode($output);
    }
 
    public function ajax_edit($disc_id)
    {
        $data = $this->discounts->get_by_id($disc_id);
        echo json_encode($data);
    }
 
    public function ajax_add()
    {
        $this->_validate();
        $data = array(
                'name' => $this->input->post('name'),
                'descr' => $this->input->post('descr'),

                'less_c' => $this->input->post('less_c'),
                'less_p' => $this->input->post('less_p'),
                
                'removed' => 0
            );
        $insert = $this->discounts->save($data);
        echo json_encode(array("status" => TRUE));
    }
 
    public function ajax_update()
    {
        $this->_validate();
        $data = array(
                'name' => $this->input->post('name'),
                'descr' => $this->input->post('descr'),

                'less_c' => $this->input->post('less_c'),
                'less_p' => $this->input->post('less_p'),
            );
        $this->discounts->update(array('disc_id' => $this->input->post('disc_id')), $data);
        echo json_encode(array("status" => TRUE));
    }

    // delete a discounts
    public function ajax_delete($disc_id)
    {
        $data = array(
                'removed' => 1
            );
        $this->discounts->update(array('disc_id' => $disc_id), $data);
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
            $data['error_string'][] = 'Discount name is required';
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
                $duplicates = $this->discounts->get_duplicates($this->input->post('name'));

                if ($duplicates->num_rows() != 0)
                {
                    $data['inputerror'][] = 'name';
                    $data['error_string'][] = 'Discount name already registered';
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


    public function ajax_api_list()
    {
        $list = $this->discounts->get_api_datatables();
        $data = array();
        
        foreach ($list as $discounts) {
            
            $row = array();
            $row['disc_id'] = $discounts->disc_id;
            $row['name'] = $discounts->name;
            $row['descr'] = $discounts->descr;

            $row['encoded'] = $discounts->encoded;
 
            $data[] = $row;
        }
 
        //output to json format
        echo json_encode($data);
    }


    // ================================================ API POST REQUEST METHOD ==========================================
 }