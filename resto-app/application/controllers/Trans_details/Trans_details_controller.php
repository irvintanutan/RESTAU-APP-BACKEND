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

        $this->load->model('Users/Users_model','users');

        $this->load->model('Discounts/Discounts_model','discounts');
    }

    public function index($trans_id)						
    {
        if($this->session->userdata('user_id') == '')
        {
            redirect('error500');
        }

        $this->load->helper('url');

        $transactions_data = $this->transactions->get_by_id($trans_id);

        $gross_total = $this->trans_details->get_trans_gross($trans_id);

        $tables = $this->table_groups->get_table_group_tables($trans_id);

        if ($tables->num_rows() != 0)
        {
            $tables_data = array();

            foreach ($tables->result() as $tables_list) 
            {
                if ($tables_list->tbl_id == 0)
                {
                    $tables_data[] = 'No Table';
                }
                else
                {
                    $tables_data[] = $this->tables->get_table_name($tables_list->tbl_id);
                }
            }

            $table_str = implode(', ', $tables_data);
        }
        else
        {
            $table_str = 'n/a';
        }

        $discounts_data = $this->discounts->get_discounts();
        
        $data['discounts'] = $discounts_data;
        
        $data['transaction'] = $transactions_data;
        $data['gross_total'] = $gross_total;
        $data['table_str'] = $table_str;

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

            if ($trans_details->prod_type == 1) // if prod_type is package
            {
                $item_id = 'G' . $trans_details->pack_id;
                $item_name = $this->packages->get_package_name($trans_details->pack_id);

                $void_btn = '<a class="btn btn-sm btn-danger" href="javascript:void(0)" title="Void" onclick="delete_trans_detail_pack('."'".$trans_id."'".', '."'".$trans_details->pack_id."'".')"><i class="fa fa-trash"></i></a>';
            }
            else if ($trans_details->prod_type == 0) // if prod_type is individual product
            {
                $item_id = 'P' . $trans_details->prod_id;
                $item_name = $this->products->get_product_name($trans_details->prod_id);

                $void_btn = '<a class="btn btn-sm btn-danger" href="javascript:void(0)" title="Void" onclick="delete_trans_detail_prod('."'".$trans_id."'".', '."'".$trans_details->prod_id."'".')"><i class="fa fa-trash"></i></a>';
            }
            else if ($trans_details->prod_type == 2) // if prod_type is package product
            {   
                $item_id = 'P' . $trans_details->prod_id;
                $item_name = $this->products->get_product_name($trans_details->prod_id);

                $void_btn = '<a class="btn btn-sm btn-danger" href="javascript:void(0)" title="Void" onclick="delete_trans_detail_prod('."'".$trans_id."'".', '."'".$trans_details->prod_id."'".')" disabled><i class="fa fa-trash"></i></a>';
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
 
    public function ajax_set_payment() // set payment function
    {
        $trans_id = $this->input->post('trans_id');

        $method = $this->input->post('method');
        if ($method == 'Cash') // if method is Cash
        {
            $cash_amt = $this->input->post('cash_amt');
        }
        else // if Credit Card or Cash Card
        {
            $cash_amt = $this->input->post('amount_due'); // if method is not cash, set cash as amount due (result: no change amount)
        }

        $card_number = $this->input->post('card_number');
        if ($card_number == '') // set as n/a if empty
        {
            $card_number = 'n/a';
        }

        $cust_name = $this->input->post('cust_name');
        if ($cust_name == '') // set as n/a if empty
        {
            $cust_name = 'n/a';
        }

        $this->_validate_payment();

        $data = array(
                'status' => 'CLEARED',

                'cash_amt' => $cash_amt,
                'change_amt' => ($cash_amt - $this->input->post('amount_due')),

                'method' => $method,
                
                'card_number' => $card_number,
                'cust_name' => $cust_name,

                'cashier_id' => $this->session->userdata('user_id')

            );
        $this->transactions->update(array('trans_id' => $trans_id), $data);
        
        $this->table_groups->delete_by_trans_id($trans_id);

        $trans_details_items = $this->trans_details->get_trans_detail_items($trans_id); // get all trans_details items (products, packages, package products)

        foreach ($trans_details_items as $items) // update sold of each items
        {
            $qty = $items->qty; // get qty to use as sold value to update

            if ($items->prod_type == 0) // if prod_type is individual product
            {
                $this->products->update_sold_prod($items->prod_id, $qty);
            }
            else if ($items->prod_type == 1) // if prod_type is package
            {
                $this->packages->update_sold_pack($items->pack_id, $qty);
            }
            else if ($items->prod_type == 2) // if prod_type is package product
            {
                $this->products->update_sold_pack_prod($items->prod_id, $qty);
            }
        }

        echo json_encode(array("status" => TRUE));
    }

    public function ajax_set_discount() // set payment function
    {
        $trans_id = $this->input->post('trans_id');

        $cust_name = $this->input->post('cust_name');

        if ($cust_name == '') // set as n/a if empty
        {
            $cust_name = 'n/a';
        }

        $this->_validate_discount();

        $data = array(
                'disc_type' => $this->input->post('disc_type'),

                'discount' => $this->input->post('discount'),

                'cust_disc_id' => $this->input->post('cust_disc_id'),
                
                'cust_name' => $cust_name
            );
        $this->transactions->update(array('trans_id' => $trans_id), $data);

        echo json_encode(array("status" => TRUE));
    }

    public function ajax_set_cancel($trans_id) // set cancel function
    {
        $status = 'CANCELLED';

        $data = array(
                'status' => $status,
            );
        $this->transactions->update(array('trans_id' => $trans_id), $data);

        echo json_encode(array("status" => TRUE));
    }
 
    // public function ajax_update()
    // {
    //     $this->_validate_qty_only();
    //     $data = array(
    //             'qty' => $this->input->post('qty'),
    //         );
        // $this->trans_details->update(array('trans_id' => $this->input->post('trans_id'), 'prod_id' => $this->input->post('current_prod_id')), $data); // update record with multiple where clause
        // echo json_encode(array("status" => TRUE));
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

    private function _validate_payment()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if($this->input->post('method') == 'Cash') // if payment method is cash
        {
            if($this->input->post('cash_amt') == '')
            {
                $data['inputerror'][] = 'cash_amt';
                $data['error_string'][] = 'Cash amount is required';
                $data['status'] = FALSE;
            }
            else if($this->input->post('cash_amt') <= 0)
            {
                $data['inputerror'][] = 'cash_amt';
                $data['error_string'][] = 'Cash amount value should be greater than zero';
                $data['status'] = FALSE;
            }
            else if($this->input->post('cash_amt') < $this->input->post('amount_due'))
            {
                $data['inputerror'][] = 'cash_amt';
                $data['error_string'][] = 'Cash amount value should be equal or greater than amount due';
                $data['status'] = FALSE;
            }
        }
        // if payment method is credit card or cash card
        else
        {
            if($this->input->post('card_number') == '')
            {
                $data['inputerror'][] = 'card_number';
                $data['error_string'][] = 'Card number is required';
                $data['status'] = FALSE;
            }  
        }

        if($data['status'] === FALSE)
        {
            echo json_encode($data);
            exit();
        }
    }

    private function _validate_discount()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if($this->input->post('disc_type') == '')
        {
            $data['inputerror'][] = 'disc_type';
            $data['error_string'][] = 'Discount type is required';
            $data['status'] = FALSE;
        }

        if($this->input->post('discount') == '')
        {
            $data['inputerror'][] = 'discount';
            $data['error_string'][] = 'Actual discount amount is required';
            $data['status'] = FALSE;
        }
        else if($this->input->post('discount') <= 0)
        {
            $data['inputerror'][] = 'discount';
            $data['error_string'][] = 'Actual discount amount should be greater than zero';
            $data['status'] = FALSE;
        }
        else if($this->input->post('discount') > $this->input->post('gross_total'))
        {
            $data['inputerror'][] = 'discount';
            $data['error_string'][] = 'Discount amount should be equal or less than gross_total';
            $data['status'] = FALSE;
        }

        if($this->input->post('cust_disc_id') == '')
        {
            $data['inputerror'][] = 'cust_disc_id';
            $data['error_string'][] = 'Customer ID number is required';
            $data['status'] = FALSE;
        }

        if($data['status'] === FALSE)
        {
            echo json_encode($data);
            exit();
        }
    }


    // ================================================ API GET REQUEST METHOD ============================================


    public function ajax_api_list($trans_id) // get all that belongs to this ID via foreign key
    {
        // ------------------------------------------- Details ----------------------------------------

        $transactions_data = $this->transactions->get_by_id($trans_id);

        $gross_total = $this->trans_details->get_trans_gross($trans_id);

        $details_data = array();

        $details_data['order_type'] = $transactions_data->order_type;
        $details_data['user_id'] = $transactions_data->user_id;

        $details_data['status'] = $transactions_data->status;

        $discount = $transactions_data->discount;

        $net_total = $gross_total - $discount;

        $details_data['gross_total'] = $gross_total;
        $details_data['discount'] = $discount;
        $details_data['net_total'] = $net_total;


        // ------------------------------------------- Products/Package ---------------------------------

        $list = $this->trans_details->get_api_datatables($trans_id);
        $prod_data = array();
        $pack_data = array();
        
        foreach ($list as $trans_details) {

            if ($trans_details->prod_type == 1) // if prod_type is package
            {
                $row = array();

                $item_id = $trans_details->pack_id;
                $item_name = $this->packages->get_package_name($trans_details->pack_id);
                $img = $this->packages->get_package_img($trans_details->pack_id);

                $row['pack_id'] = $item_id;
                $row['name'] = $item_name;
                $row['img'] = $img;

                $row['price'] = $trans_details->price;
                $row['qty'] = $trans_details->qty;
                $row['total'] = $trans_details->total;

                $pack_data[] = $row;
            }
            else if ($trans_details->prod_type == 0) // if prod_type is individual product
            {
                $row = array();

                $item_id = $trans_details->prod_id;
                $item_name = $this->products->get_product_name($trans_details->prod_id);
                $cat_id = $this->products->get_product_cat_id($trans_details->prod_id);
                $img = $this->products->get_product_img($trans_details->prod_id);

                $row['prod_id'] = $item_id;
                $row['name'] = $item_name;
                $row['cat_id'] = $cat_id;
                $row['img'] = $img;

                $row['price'] = $trans_details->price;
                $row['qty'] = $trans_details->qty;
                $row['total'] = $trans_details->total;

                $prod_data[] = $row;
            }
        }

        // ------------------------------------------- Tables ---------------------------------

        $tables = $this->table_groups->get_table_group_tables($trans_id);
        $tables_data = array();

        if ($tables->num_rows() != 0)
        {
            foreach ($tables->result() as $tables_list) 
            {
                $row = array();

                $row['table_id'] = $tables_list->tbl_id;

                if ($tables_list->tbl_id == 0)
                {
                    $row['name'] = 'No Table';
                }
                else
                {
                    $row['name'] = $this->tables->get_table_name($tables_list->tbl_id);
                }

                $tables_data[] = $row;
            }
        }
 
        $output = array(
                        "details" => $details_data,
                        "products" => $prod_data,
                        "packages" => $pack_data,
                        "tables" => $tables_data,
                );
        //output to json format
        echo json_encode($output);
    }


    // ================================================ API POST REQUEST METHOD ============================================
 }