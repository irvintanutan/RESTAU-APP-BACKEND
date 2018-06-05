<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Packages_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Packages/Packages_model','packages');
        $this->load->model('Pack_details/Pack_details_model','pack_details');
    }

    public function index()						
    {
        if($this->session->userdata('user_id') == '')
        {
            redirect('error500');
        }

        $this->load->helper('url');							

        $data['title'] = 'Packages Information List';					
        $this->load->view('template/dashboard_header',$data);
        $this->load->view('packages/packages_view',$data);
        $this->load->view('template/dashboard_navigation');
        $this->load->view('template/dashboard_footer');

    }
   
    public function ajax_list()
    {
        $list = $this->packages->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $packages) {
            $no++;
            $row = array();
            $row[] = 'G' . $packages->pack_id;
            $row[] = $packages->name;
            $row[] = $packages->descr;
            $row[] = $packages->price;
            // $row[] = $packages->img;
            $row[] = $packages->sold;

            $row[] = $packages->encoded;

            //add html for action
            $row[] = '<a class="btn btn-sm btn-primary" href="javascript:void(0)" title="View" onclick="view_package('."'".$packages->pack_id."'".')"><i class="fa fa-eye"></i> </a>

            <a class="btn btn-sm btn-info" href="javascript:void(0)" title="Edit" onclick="edit_package('."'".$packages->pack_id."'".')"><i class="fa fa-pencil-square-o"></i></a>
                      
                      <a class="btn btn-sm btn-danger" href="javascript:void(0)" title="Delete" onclick="delete_package('."'".$packages->pack_id."'".', '."'".$packages->name."'".')"><i class="fa fa-trash"></i></a>';
            

            // get number of rows found / check if it has details data
            $row[] = $this->pack_details->check_if_found($packages->pack_id)->num_rows();


            $data[] = $row;
        }
 
        $output = array(
                        "draw" => $_POST['draw'],
                        "recordsTotal" => $this->packages->count_all(),
                        "recordsFiltered" => $this->packages->count_filtered(),
                        "data" => $data,
                );
        //output to json format
        echo json_encode($output);
    }
 
    public function ajax_edit($pack_id)
    {
        $data = $this->packages->get_by_id($pack_id);
        echo json_encode($data);
    }
 
    public function ajax_add()
    {
        $this->_validate();
        $data = array(
                'name' => $this->input->post('name'),
                'descr' => $this->input->post('descr'),
                'price' => $this->input->post('price'),
                'img' => '',
                'sold' => 0,
                'removed' => 0
            );
        $insert = $this->packages->save($data);
        echo json_encode(array("status" => TRUE));
    }
 
    public function ajax_update()
    {
        $this->_validate();
        $data = array(
                'name' => $this->input->post('name'),
                'descr' => $this->input->post('descr'),
                'price' => $this->input->post('price'),
                // 'img' => $this->input->post('img'),
                // 'sold' => 0,
            );
        $this->packages->update(array('pack_id' => $this->input->post('pack_id')), $data);
        echo json_encode(array("status" => TRUE));
    }

    // delete a packages
    public function ajax_delete($pack_id)
    {
        $data = array(
                'removed' => 1
            );
        $this->packages->update(array('pack_id' => $pack_id), $data);
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
            $data['error_string'][] = 'Package name is required';
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
                $duplicates = $this->packages->get_duplicates($this->input->post('name'));

                if ($duplicates->num_rows() != 0)
                {
                    $data['inputerror'][] = 'name';
                    $data['error_string'][] = 'Package name already registered';
                    $data['status'] = FALSE;
                }
            }
        }

        if($this->input->post('price') == '')
        {
            $data['inputerror'][] = 'price';
            $data['error_string'][] = 'Package price is required';
            $data['status'] = FALSE;
        }
        else if($this->input->post('price') <= 0)
        {
            $data['inputerror'][] = 'price';
            $data['error_string'][] = 'Product price should be greater than zero';
            $data['status'] = FALSE;
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
        $list = $this->packages->get_api_datatables();
        $data = array();
        
        foreach ($list as $packages) {

            $row = array();
            $row['pack_id'] = $packages->pack_id;
            $row['name'] = $packages->name;
            $row['descr'] = $packages->descr;
            $row['price'] = $packages->price;
            // $row[] = $packages->img;
            $row['sold'] = $packages->sold;

            $row['encoded'] = $packages->encoded;

            $row['img'] = $packages->img;

            // get number of rows found / check if it has details data
            $row['prod_count'] = $this->pack_details->check_if_found($packages->pack_id)->num_rows();

            $data[] = $row;
        }
    
        //output to json format
        echo json_encode($data);
    }   


    // ================================================ API POST REQUEST METHOD ============================================
 }