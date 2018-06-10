<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Trans_details_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Transactions/Transactions_model','transactions');

        $this->load->model('Products/Products_model','products');
        $this->load->model('Packages/Packages_model','packages');
        $this->load->model('Pack_details/Pack_details_model','pack_details');
        $this->load->model('Tables/Tables_model','tables');

        $this->load->model('Trans_details/Trans_details_model','trans_details');
        $this->load->model('Table_groups/Table_groups_model','table_groups');
    }

    public function index($trans_id)						
    {
        if($this->session->userdata('user_id') == '')
        {
            redirect('error500');
        }

        $this->load->helper('url');

        $transactions_data = $this->transactions->get_by_id($trans_id);
        
        $data['transaction'] = $transactions_data;

        $data['title'] = 'Transaction Details';
        $this->load->view('template/dashboard_header',$data);
        $this->load->view('trans_details/trans_details_view',$data);
        $this->load->view('template/dashboard_navigation');
        $this->load->view('template/dashboard_footer');

    }
   
    public function ajax_list($trans_id) // get all that belongs to this ID via foreign key
    {
        $list = $this->trans_details->get_datatables($trans_id);
        $data = array();
        $no = $_POST['start'];

        $item_count = 0; // initialize number of items counter

        foreach ($list as $trans_details) {
            $no++;
            $row = array();

            if ($trans_details->prod_id == 0)
            {
                $item_id = 'G' . $trans_details->pack_id;
                $item_name = $this->packages->get_package_name($trans_details->pack_id);

                $void_btn = '<a class="btn btn-sm btn-danger" href="javascript:void(0)" title="Void" onclick="delete_trans_detail_pack('."'".$trans_id."'".', '."'".$trans_details->pack_id."'".')"><i class="fa fa-trash"></i></a>';
            }
            else
            {
                $item_id = 'P' . $trans_details->prod_id;
                $item_name = $this->products->get_product_name($trans_details->prod_id);

                $void_btn = '<a class="btn btn-sm btn-danger" href="javascript:void(0)" title="Void" onclick="delete_trans_detail_prod('."'".$trans_id."'".', '."'".$trans_details->prod_id."'".')"><i class="fa fa-trash"></i></a>';
            }

            $row[] = $item_id;
            $row[] = $item_name;

            $row[] = $trans_details->price;
            $row[] = $trans_details->qty;
            $row[] = $trans_details->total;

            //add html for action
            $row[] = $void_btn;

            $prod_type = $trans_details->prod_type;
            
            if ($prod_type == 0 || $prod_type == 2) // if prod_type is individual product or package product only
            {
                $item_count += $trans_details->qty;
            }

            $row[] = $prod_type;
            $row[] = $trans_details->part_of;
            $row[] = $item_count;
 
            $data[] = $row;
        }
 
        $output = array(
                        "draw" => $_POST['draw'],
                        "recordsTotal" => $this->trans_details->count_all($trans_id),
                        "recordsFiltered" => $this->trans_details->count_filtered($trans_id),
                        "data" => $data,
                );
        //output to json format
        echo json_encode($output);
    }
 
    // public function ajax_edit($trans_id, $prod_id)
    // {
    //     $data = $this->trans_details->get_by_id($trans_id, $prod_id);
    //     echo json_encode($data);
    // }
 
    // public function ajax_add()
    // {
    //     $this->_validate();
    //     $data = array(
    //             'trans_id' => $this->input->post('trans_id'),
    //             'prod_id' => $this->input->post('prod_id'),
    //             'qty' => $this->input->post('qty'),
    //         );
    //     $insert = $this->trans_details->save($data);
    //     echo json_encode(array("status" => TRUE));
    // }
 
    // public function ajax_update()
    // {
    //     $this->_validate_qty_only();
    //     $data = array(
    //             'qty' => $this->input->post('qty'),
    //         );
    //     $this->trans_details->update(array('trans_id' => $this->input->post('trans_id'), 'prod_id' => $this->input->post('current_prod_id')), $data); // update record with multiple where clause
    //     echo json_encode(array("status" => TRUE));
    // }

    // delete a record
    public function ajax_delete_prod($trans_id, $prod_id)
    {
        $this->trans_details->delete_by_id_prod($trans_id, $prod_id);
        echo json_encode(array("status" => TRUE));
    }

    public function ajax_delete_pack($trans_id, $pack_id)
    {
        $this->trans_details->delete_by_id_pack($trans_id, $pack_id);
        echo json_encode(array("status" => TRUE));
    }

    // private function _validate()
    // {
    //     $data = array();
    //     $data['error_string'] = array();
    //     $data['inputerror'] = array();
    //     $data['status'] = TRUE;

    //     if($this->input->post('prod_id') == '')
    //     {
    //         $data['inputerror'][] = 'prod_id';
    //         $data['error_string'][] = 'Package product is required';
    //         $data['status'] = FALSE;
    //     }
    //     // validation for duplicates
    //     else
    //     {
    //         $trans_id = $this->input->post('trans_id');
    //         $new_prod_id = $this->input->post('prod_id');
    //         // check if name has a new value or not
    //         if ($this->input->post('current_prod_id') != $new_prod_id)
    //         {
    //             // validate if name already exist in the databaase table
    //             $duplicates = $this->trans_details->get_duplicates($trans_id, $new_prod_id);

    //             if ($duplicates->num_rows() != 0)
    //             {
    //                 $data['inputerror'][] = 'prod_id';
    //                 $data['error_string'][] = 'Package product already registered';
    //                 $data['status'] = FALSE;
    //             }
    //         }
    //     }

    //     if($this->input->post('qty') == '')
    //     {
    //         $data['inputerror'][] = 'qty';
    //         $data['error_string'][] = 'Package product quantity is required';
    //         $data['status'] = FALSE;
    //     }
    //     else if($this->input->post('qty') <= 0)
    //     {
    //         $data['inputerror'][] = 'qty';
    //         $data['error_string'][] = 'Quantity value should be greater than zero';
    //         $data['status'] = FALSE;
    //     }


    //     if($data['status'] === FALSE)
    //     {
    //         echo json_encode($data);
    //         exit();
    //     }
    // }

    // private function _validate_qty_only()
    // {
    //     $data = array();
    //     $data['error_string'] = array();
    //     $data['inputerror'] = array();
    //     $data['status'] = TRUE;
        

    //     if($this->input->post('qty') == '')
    //     {
    //         $data['inputerror'][] = 'qty';
    //         $data['error_string'][] = 'Package product quantity is required';
    //         $data['status'] = FALSE;
    //     }
    //     else if($this->input->post('qty') <= 0)
    //     {
    //         $data['inputerror'][] = 'qty';
    //         $data['error_string'][] = 'Quantity value should be greater than zero';
    //         $data['status'] = FALSE;
    //     }


    //     if($data['status'] === FALSE)
    //     {
    //         echo json_encode($data);
    //         exit();
    //     }
    // }


    // ================================================ API GET REQUEST METHOD ============================================


    public function ajax_api_list($trans_id) // get all that belongs to this ID via foreign key
    {
        $list = $this->trans_details->get_api_datatables($trans_id);
        $data = array();
        
        foreach ($list as $trans_details) {
        
            $row = array();
            if ($trans_details->prod_id == 0)
            {
                $item_name = $this->packages->get_package_name($trans_details->pack_id);
            }
            else
            {
                $item_name = $this->products->get_product_name($trans_details->prod_id);
            }

            $row['prod_id'] = $trans_details->$prod_id;
            $row['pack_id'] = $trans_details->$pack_id;
            $row['item_name'] = $item_name;

            $row['prod_type'] = $trans_details->prod_type;

            $row['price'] = $trans_details->price;
            $row['qty'] = $trans_details->qty;
            $row['total'] = $trans_details->total;
            $row['part_of'] = $trans_details->part_of;

            $data[] = $row;
        }
 
        //output to json format
        echo json_encode($data);
    }


    // ================================================ API POST REQUEST METHOD ============================================
 }