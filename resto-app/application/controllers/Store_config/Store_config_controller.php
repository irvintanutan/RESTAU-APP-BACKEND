<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Store_config_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Store_config/Store_config_model','store');
    }

    public function index()                     
    {
        if($this->session->userdata('administrator') == '0')
        {
            redirect('error500');
        }

        $this->load->helper('url');

        $store = $this->store->get_by_id(1); // set 1 as ID since there is only 1 config entry
        
        $data['store'] = $store;                        

        $data['title'] = '<i class="fa fa-cogs"></i> Store Configurations';                 
        $this->load->view('template/dashboard_header',$data);
        $this->load->view('store_config/store_config_view',$data);
        $this->load->view('template/dashboard_navigation');
        $this->load->view('template/dashboard_footer');
    }


    // ================================================= IMAGE SECTION =====================================================


    public function do_upload() 
    {
        $version = 0;

        try
        {
            $img_name = $this->store->get_store_config_img(1);

            $version = explode("_", $img_name)[1]; // get index 1 of the exploded img_name to increment
        }
        catch (Exception $e) {
            // json_encode 'Caught exception: ',  $e->getMessage(), "\n";
        }

        $new_version = ($version + 1);

         $config['upload_path']   = 'assets/img'; 
         $config['allowed_types'] = 'png'; 
         $config['max_size']      = 2000; 
         $config['max_width']     = 5000; 
         $config['max_height']    = 5000;
         $new_name = 'complogo_' . $new_version . '_.png';
         $config['file_name'] = $new_name;
         $config['overwrite'] = TRUE;

         $this->load->library('upload', $config);
            
         if ( ! $this->upload->do_upload('userfile1')) // upload fail
         {
            $error = array('error' => $this->upload->display_errors()); 
            $this->load->view('upload_form', $error);
            // echo '<script type="text/javascript">alert("' . $error.toString() . '"); </script>';
         }
         else // upload success
         { 
            $data = array('upload_data' => $this->upload->data()); 
            
            $data = array(
                'img' => $new_name
            );
            $this->store->update(array('conf_id' => 1), $data); //  set id as 1 since there is only a single configuration
            redirect('/store-config-page');
         } 
    }


    // ======================================= END IMAGE SECTION ===========================================================
   
    // public function ajax_list()
    // {
    //     $list = $this->store->get_datatables();
    //     $data = array();
    //     $no = $_POST['start'];
    //     foreach ($list as $store) {
    //         $no++;
    //         $row = array();
    //         $row[] = 'C' . $store->conf_id;
    //         $row[] = $store->name;
    //         $row[] = $store->descr;

    //         $row[] = $store->encoded;

    //         //add html for action
    //         $row[] = '<a class="btn btn-info" href="javascript:void(0)" title="Edit" onclick="edit_product('."'".$store->conf_id."'".')"><i class="fa fa-pencil-square-o"></i></a>
                      
    //                   <a class="btn btn-danger" href="javascript:void(0)" title="Delete" onclick="delete_product('."'".$store->conf_id."'".', '."'".$store->name."'".')"><i class="fa fa-trash"></i></a>';
 
    //         $data[] = $row;
    //     }
 
    //     $output = array(
    //                     "draw" => $_POST['draw'],
    //                     "recordsTotal" => $this->store->count_all(),
    //                     "recordsFiltered" => $this->store->count_filtered(),
    //                     "data" => $data,
    //             );
    //     //output to json format
    //     echo json_encode($output);
    // }
 
    public function ajax_edit($conf_id)
    {
        $data = $this->store->get_by_id($conf_id);
        echo json_encode($data);
    }
 
    // public function ajax_add()
    // {
    //     $this->_validate();
    //     $data = array(
    //             'name' => $this->input->post('name'),
    //             'descr' => $this->input->post('descr'),
                
    //             'removed' => 0
    //         );
    //     $insert = $this->store->save($data);
    //     echo json_encode(array("status" => TRUE));
    // }
 
    public function ajax_update()
    {
        $this->_validate();
        $data = array(
                'name' => $this->input->post('name'),
                'address' => $this->input->post('address'),
                'city' => $this->input->post('city'),
                'telephone' => $this->input->post('telephone'),
                'mobile' => $this->input->post('mobile'),
                'tin' => $this->input->post('tin'),
                'vat' => $this->input->post('vat'),
                'bs_price' => $this->input->post('bs_price'),
                'password' => $this->input->post('password')
            );
        $this->store->update(array('conf_id' => $this->input->post('conf_id')), $data);
        echo json_encode(array("status" => TRUE));
    }

    // delete a store
    // public function ajax_delete($conf_id)
    // {
    //     $data = array(
    //             'removed' => 1
    //         );
    //     $this->store->update(array('conf_id' => $conf_id), $data);
    //     echo json_encode(array("status" => TRUE));
    // }

    private function _validate()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if($this->input->post('name') == '')
        {
            $data['inputerror'][] = 'name';
            $data['error_string'][] = 'Store name / Company name is required';
            $data['status'] = FALSE;
        }

        if($this->input->post('address') == '')
        {
            $data['inputerror'][] = 'address';
            $data['error_string'][] = 'Store address is required';
            $data['status'] = FALSE;
        }

        if($this->input->post('city') == '')
        {
            $data['inputerror'][] = 'city';
            $data['error_string'][] = 'Store city is required';
            $data['status'] = FALSE;
        }

        if($this->input->post('telephone') == '')
        {
            $data['inputerror'][] = 'telephone';
            $data['error_string'][] = 'Store telephone is required';
            $data['status'] = FALSE;
        }

        if($this->input->post('mobile') == '')
        {
            $data['inputerror'][] = 'mobile';
            $data['error_string'][] = 'Store mobile is required';
            $data['status'] = FALSE;
        }

        if($this->input->post('tin') == '')
        {
            $data['inputerror'][] = 'tin';
            $data['error_string'][] = 'Tin identification number is required';
            $data['status'] = FALSE;
        }

        if($this->input->post('vat') == '')
        {
            $data['inputerror'][] = 'vat';
            $data['error_string'][] = 'VAT (% value) is required';
            $data['status'] = FALSE;
        }
        else if($this->input->post('vat') < 0)
        {
            $data['inputerror'][] = 'vat';
            $data['error_string'][] = 'VAT value should be greater than zero';
            $data['status'] = FALSE;
        }
        else if($this->input->post('vat') > 99)
        {
            $data['inputerror'][] = 'vat';
            $data['error_string'][] = 'VAT value should be less than 100%';
            $data['status'] = FALSE;
        }

        if($this->input->post('bs_price') == '')
        {
            $data['inputerror'][] = 'bs_price';
            $data['error_string'][] = 'Best selling min value is required';
            $data['status'] = FALSE;
        }

        if($this->input->post('password') == '')
        {
            $data['inputerror'][] = 'password';
            $data['error_string'][] = 'Manager\'s password is required';
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
        $list = $this->store->get_api_datatables();
        $data = array();
        
        foreach ($list as $store) {
            
            $row = array();
            $row['conf_id'] = $store->conf_id;
            $row['name'] = $store->name;
            $row['address'] = $store->address;
            $row['city'] = $store->city;
            $row['tin'] = $store->tin;
            $row['vat'] = $store->vat;
            $row['bs_price'] = $store->bs_price;
            $row['img'] = $store->img;
            $row['password'] = $store->password;
 
            $data[] = $row;
        }
 
        //output to json format
        echo json_encode($data);
    }


    // ================================================ API POST REQUEST METHOD ==========================================
 }