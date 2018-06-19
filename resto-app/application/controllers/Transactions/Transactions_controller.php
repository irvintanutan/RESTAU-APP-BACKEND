<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Transactions_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Transactions/Transactions_model','transactions');

        $this->load->model('Products/Products_model','products');
        $this->load->model('Packages/Packages_model','packages');
        $this->load->model('Pack_details/Pack_details_model','pack_details');

        $this->load->model('Trans_details/Trans_details_model','trans_details');
        $this->load->model('Table_groups/Table_groups_model','table_groups');

        $this->load->model('Users/Users_model','users');
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

        $data['title'] = 'Transactions Information List';
        $this->load->view('template/dashboard_header',$data);
        $this->load->view('transactions/transactions_view',$data);
        $this->load->view('template/dashboard_navigation');
        $this->load->view('template/dashboard_footer');

    }
   
    public function ajax_list()
    {
        $list = $this->transactions->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $transactions) {
            $no++;
            $row = array();
            $row[] = 'S' . $transactions->trans_id;
            $row[] = $transactions->datetime;

            $gross = $this->trans_details->get_trans_gross($transactions->trans_id);
            $discount = $transactions->discount;
            $total_due = ($gross - $discount);

            $row[] = $gross;
            $row[] = $discount;
            // $row[] = $transactions->disc_type;
            $row[] = number_format($total_due, 2);
            $row[] = $transactions->status;
            $row[] = $transactions->order_type;

            $row[] = $this->users->get_username($transactions->user_id);
            // $row[] = $transactions->cash_amt;
            // $row[] = $transactions->change_amt;

            //add html for action
            $row[] = '<a class="btn btn-sm btn-primary" href="javascript:void(0)" title="View" onclick="view_transaction('."'".$transactions->trans_id."'".')"><i class="fa fa-eye"></i> </a>';
 
            $data[] = $row;
        }
 
        $output = array(
                        "draw" => $_POST['draw'],
                        "recordsTotal" => $this->transactions->count_all(),
                        "recordsFiltered" => $this->transactions->count_filtered(),
                        "data" => $data,
                );
        //output to json format
        echo json_encode($output);
    }
 
    public function ajax_edit($trans_id)
    {
        $data = $this->transactions->get_by_id($trans_id);
        echo json_encode($data);
    }
 
    // public function ajax_add()
    // {
    //     $this->_validate();
    //     $data = array(
    //             'name' => $this->input->post('name'),
    //             'status' => 0, // 0 = available/vacant, 1 = occupied, 2 = reserved, 3 = unavailable

    //             'removed' => 0
    //         );
    //     $insert = $this->transactions->save($data);
    //     echo json_encode(array("status" => TRUE));
    // }
 
    public function ajax_update()
    {
        $this->_validate();
        $data = array(
                'discount' => $this->input->post('discount'),
                'disc_type' => $this->input->post('disc_type'), 
                
                'status' => $this->input->post('status'),
                'cash_amt' => $this->input->post('cash_amt'),
                'change_amt' => $this->input->post('change_amt'),
            );
        $this->transactions->update(array('trans_id' => $this->input->post('trans_id')), $data);
        echo json_encode(array("status" => TRUE));
    }

    // delete a transactions
    // public function ajax_delete($trans_id)
    // {
    //     $data = array(
    //             'removed' => 1
    //         );
    //     $this->transactions->update(array('trans_id' => $trans_id), $data);
    //     echo json_encode(array("status" => TRUE));
    // }

    // private function _validate()
    // {
    //     $data = array();
    //     $data['error_string'] = array();
    //     $data['inputerror'] = array();
    //     $data['status'] = TRUE;

    //     if($this->input->post('name') == '')
    //     {
    //         $data['inputerror'][] = 'name';
    //         $data['error_string'][] = 'Table name is required';
    //         $data['status'] = FALSE;
    //     }
    //     // validation for duplicates
    //     else
    //     {
    //         $new_name = $this->input->post('name');
    //         // check if name has a new value or not
    //         if ($this->input->post('current_name') != $new_name)
    //         {
    //             // validate if name already exist in the databaase table
    //             $duplicates = $this->transactions->get_duplicates($this->input->post('name'));

    //             if ($duplicates->num_rows() != 0)
    //             {
    //                 $data['inputerror'][] = 'name';
    //                 $data['error_string'][] = 'Table name already registered';
    //                 $data['status'] = FALSE;
    //             }
    //         }
    //     }


    //     if($data['status'] === FALSE)
    //     {
    //         echo json_encode($data);
    //         exit();
    //     }
    // }


    // ================================================ API GET REQUEST METHOD ============================================


    public function ajax_api_list() // using associative array to set index names instead
    {
        $list = $this->transactions->get_api_transactions();
        $data = array();
        
        foreach ($list as $transactions) {
        
            $row = array();
            $row['trans_id'] = $transactions->trans_id;
            $row['datetime'] = $transactions->datetime;

            $row['discount'] = $transactions->discount;
            $row['disc_type'] = $transactions->disc_type;

            $row['status'] = $transactions->status;

            $row['order_type'] = $transactions->order_type;

            $row['cash_amt'] = $transactions->cash_amt;
            $row['change_amt'] = $transactions->change_amt;
 
            $data[] = $row;
        }
 
        //output to json format
        echo json_encode($data);
    }


    // // ================================================ API POST REQUEST METHOD ============================================


    // public function ajax_input_test($trans_id)
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
        
    //     $this->transactions->update(array('trans_id' => $trans_id), $data);
    //     echo json_encode(array("status" => TRUE));
    // }

    public function ajax_api_add_trans()
    {
        $stream_clean = $this->security->xss_clean($this->input->raw_input_stream);
        $request = json_decode($stream_clean);
        // $ready = $request->ready;
        $array = json_decode(json_encode($request), true);
        
        foreach ($array as $transaction) 
        {
            foreach ($transaction['details'] as $details)
            {
                // insert new transaction ------------------------------------------------

                $data = array(
                        'datetime' => date("Y-m-d H:i:s"),

                        'discount' => 0,

                        'status' => 'ONGOING',

                        'order_type' => $details['order_type'],

                        'cash_amt' => 0,
                        'change_amt' => 0,

                        'user_id' => $details['user_id'],
                        'cashier_id' => 0,
                    );
                    
                $insert = $this->transactions->save($data);
            }
            
            // end insert new transaction ------------------------------------------------

            $trans_id = $insert; // get the new trans_id

            // get each product for trans_details  ------------------------------------------------

            foreach ($transaction['products'] as $products)
            {
                $prod_id = $products['prod_id'];
                $prod_price = $this->products->get_product_price($prod_id);
                $prod_qty = $products['qty'];

                $prod_total = ($prod_price * $prod_qty);

                // insert new product to trans_details ---------------------------------------------

                $data_products = array(
                    'trans_id' => $trans_id,
                    'prod_id' => $prod_id,

                    'prod_type' => 0, // 0 - individual product

                    'price' => $prod_price,
                    'qty' => $prod_qty,

                    'total' => $prod_total
                );
                $this->trans_details->save($data_products);
            }

            // get each package for trans_details  ------------------------------------------------

            foreach ($transaction['packages'] as $packages)
            {
                $pack_id = $packages['pack_id'];
                $pack_price = $this->packages->get_package_price($pack_id);
                $pack_qty = $packages['qty'];

                $pack_total = ($pack_price * $pack_qty);

                // insert new package to trans_details ---------------------------------------------

                $data_packages = array(
                    'trans_id' => $trans_id,
                    'pack_id' => $pack_id,

                    'prod_type' => 1, // 1 - package

                    'price' => $pack_price,
                    'qty' => $pack_qty,

                    'total' => $pack_total
                );
                $this->trans_details->save($data_packages);

                // get package product list ---------------------------------------------------------

                $pack_products = $this->pack_details->get_pack_detail_products($pack_id);

                // get each product of the package -----------------------------------------------------              
                
                foreach ($pack_products as $pack_products_list)
                {
                    $pack_prod_id = $pack_products_list->prod_id;
                    $pack_prod_qty = ($pack_products_list->qty * $pack_qty); // multiply package product qty by pack_qty

                    // insert new product to trans_details (from package products) ------------------------

                    $data_pack_products = array(
                        'trans_id' => $trans_id,
                        'prod_id' => $pack_prod_id,

                        'prod_type' => 2, // 2 - package product

                        'price' => 0,
                        'qty' => $pack_prod_qty,

                        'total' => 0,
                        'part_of' => $pack_id 
                    );
                    $this->trans_details->save($data_pack_products);
                }
            }

            // get each table for table_groups -------------------------------------------------------------

            foreach ($transaction['tables'] as $tables)
            {
                // insert new table to table_groups -------------------------------------------------------
                $tbl_id = $tables['tbl_id'];

                $data_tables = array(
                    'trans_id' => $trans_id,
                    'tbl_id' => $tbl_id,
                );
                $this->table_groups->save($data_tables);
            }

        }

        echo json_encode(array("status" => TRUE));
    }
 }
