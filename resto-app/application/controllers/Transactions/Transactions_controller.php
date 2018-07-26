<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// require_once(APPPATH.'vendor/mike42/escpos-php/autoload.php');
require_once(APPPATH.'vendor/mike42/autoload.php');
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;
use Mike42\Escpos\Printer;

class Transactions_controller extends CI_Controller {

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
        $this->load->model('Store_config/Store_config_model','store');

        $this->load->model('Pack_discounts/Pack_discounts_model','pack_discounts');
        $this->load->model('Prod_discounts/Prod_discounts_model','prod_discounts');
    }

    public function index() // index of ongoing transactions
    {
        if($this->session->userdata('staff') == '1')
        {
            redirect('error500');
        }

        $this->load->helper('url');

        $managers_password = $this->store->get_store_config_password(1); // get manager's password
        
        $data['managers_password'] = $managers_password;
        
        $data['trans_status'] = 'ONGOING';

        $data['title'] = '<i class="fa fa-qrcode" style="color: green;"></i> Transactions - <span class="label-success badge" style="color: green; font-size:25px; padding: .5%">&nbsp;&nbsp;<b> [ ONGOING ] </b>&nbsp;&nbsp;</span>';
        $this->load->view('template/dashboard_header',$data);
        $this->load->view('transactions/transactions_view',$data);
        $this->load->view('template/dashboard_navigation');
        $this->load->view('template/dashboard_footer');

    }

    public function index_cleared() // index of cleared transactions                     
    {
        if($this->session->userdata('staff') == '1')
        {
            redirect('error500');
        }

        $this->load->helper('url');

        $managers_password = $this->store->get_store_config_password(1); // get manager's password
        
        $data['managers_password'] = $managers_password;

        $data['trans_status'] = 'CLEARED';

        $data['title'] = '<i class="fa fa-qrcode" style="color: gray;"></i> Transactions - <span class="label-dark badge" style="color: white; font-size:25px; padding: .5%">&nbsp;&nbsp;<b> [ CLEARED ] </b>&nbsp;&nbsp;</span>';

        $this->load->view('template/dashboard_header',$data);
        $this->load->view('transactions/transactions_view',$data);
        $this->load->view('template/dashboard_navigation');
        $this->load->view('template/dashboard_footer');

    }

    public function index_cancelled() // index of cancelled transactions
    {
        if($this->session->userdata('staff') == '1')
        {
            redirect('error500');
        }

        $this->load->helper('url');

        $managers_password = $this->store->get_store_config_password(1); // get manager's password
        
        $data['managers_password'] = $managers_password;

        $data['trans_status'] = 'CANCELLED';

        $data['title'] = '<i class="fa fa-qrcode" style="color: red;"></i> Transactions - <span class="label-danger badge" style="color: white; font-size:25px; padding: .5%">&nbsp;&nbsp;<b> [ CANCELLED ] </b>&nbsp;&nbsp;</span>';

        $this->load->view('template/dashboard_header',$data);
        $this->load->view('transactions/transactions_view',$data);
        $this->load->view('template/dashboard_navigation');
        $this->load->view('template/dashboard_footer');

    }
   
    public function ajax_list($trans_status)
    {
        $list = $this->transactions->get_datatables($trans_status);
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $transactions) {
            $no++;
            $row = array();
            $row[] = '<b>S' . $transactions->trans_id . '</b>';
            $row[] = $transactions->datetime;

            $row[] = $transactions->order_type;

            $gross = $this->trans_details->get_trans_gross($transactions->trans_id);
            $discount = $transactions->discount;
            $total_due = ($gross - $discount);

            $row[] = $gross;
            $row[] = $discount;
            // $row[] = $transactions->disc_type;
            $row[] = '<b>' . number_format($total_due, 2) . '</b>';
            
            $row[] = $transactions->method;

            $row[] = $this->users->get_username($transactions->user_id);
            // $row[] = $transactions->cash_amt;
            // $row[] = $transactions->change_amt;

            //add html for action
            $row[] = '<a class="btn btn-sm btn-primary" href="javascript:void(0)" title="View" onclick="view_transaction('."'".$transactions->trans_id."'".')"><i class="fa fa-eye"></i> </a>';

            $row[] = $transactions->status;
 
            $data[] = $row;
        }
 
        $output = array(
                        "draw" => $_POST['draw'],
                        "recordsTotal" => $this->transactions->count_all($trans_status),
                        "recordsFiltered" => $this->transactions->count_filtered($trans_status),
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

    public function ajax_get_last_receipt_no_trans()
    {
        $data = $this->transactions->get_last_receipt_transaction_data();
        echo json_encode($data);
    }

    public function ajax_get_by_receipt($receipt_no)  // get transaction by receipt number
    {
        $data = $this->transactions->get_by_receipt_no($receipt_no);
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
        $list = $this->transactions->get_api_datatables();
        $data = array();
        
        foreach ($list as $transactions) {

            if ($transactions->status == 'ONGOING')
            {
                $row = array();
                $row['trans_id'] = $transactions->trans_id;
                $row['datetime'] = $transactions->datetime;

                $gross_total = $this->trans_details->get_trans_gross($transactions->trans_id);
                $discount = $transactions->discount;
                $total_due = ($gross_total - $discount);

                $row['gross_total'] = $gross_total;
                $row['discount'] = $discount;
                $row['net_total'] = $total_due;

                $row['status'] = $transactions->status;

                $row['order_type'] = $transactions->order_type;

                $row['cash_amt'] = $transactions->cash_amt;
                $row['change_amt'] = $transactions->change_amt;

                $row['user_id'] = $transactions->user_id;

                $tables = $this->table_groups->get_table_group_tables($transactions->trans_id);

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

                $row['table_str'] = $table_str;

                $data[] = $row;
            }
        }
 
        //output to json format
        echo json_encode($data);
    }


    // // ================================================ API POST REQUEST METHOD ============================================


    public function ajax_api_add_trans()
    {
        $stream_clean = $this->security->xss_clean($this->input->raw_input_stream);
        $request = json_decode($stream_clean);
        // $ready = $request->ready;
        $array = json_decode(json_encode($request), true);
        
        $line_items = array();

        foreach ($array as $transaction) 
        {
            foreach ($transaction['details'] as $details)
            {
                // insert new transaction ------------------------------------------------

                $order_type = $details['order_type'];
                $user_id = $details['user_id'];
                $staff_username = $this->users->get_username($user_id);

                $data = array(
                        'datetime' => date("Y-m-d H:i:s"),

                        'discount' => 0,
                        'disc_type' => 0,

                        'status' => 'ONGOING',

                        'order_type' => $order_type,

                        'cash_amt' => 0,
                        'change_amt' => 0,

                        'user_id' => $user_id,
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
                $prod_name = $this->products->get_product_short_name($prod_id);
                $prod_price = $this->products->get_product_price($prod_id);
                $prod_qty = $products['qty'];

                // check if product is discounted
                $check_discount = $this->prod_discounts->get_by_prod_id($prod_id);

                if ($check_discount != null)
                {
                    $new_price = $check_discount->new_price;

                    $prod_price = $new_price;

                    $prod_name = $prod_name . "*"; // discounted product indicator
                }

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

                // add line item to line_items array
                $line_items[] = new item($prod_qty . " " . $prod_name . " @" . $prod_price, number_format($prod_total, 2));
            }

            // get each package for trans_details  ------------------------------------------------

            foreach ($transaction['packages'] as $packages)
            {
                $pack_id = $packages['pack_id'];
                $pack_name = $this->packages->get_package_short_name($pack_id);
                $pack_price = $this->packages->get_package_price($pack_id);
                $pack_qty = $packages['qty'];

                // check if product is discounted
                $check_discount = $this->pack_discounts->get_by_pack_id($pack_id);

                if ($check_discount != null)
                {
                    $new_price = $check_discount->new_price;

                    $pack_price = $new_price;

                    $pack_name = $pack_name . "*"; // discounted product indicator
                }

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

                // add line item to line_items array
                $line_items[] = new item($pack_qty . " " . $pack_name . " @" . $pack_price, number_format($pack_total, 2));

                // get package product list ---------------------------------------------------------

                $pack_products = $this->pack_details->get_pack_detail_products($pack_id);

                // get each product of the package -----------------------------------------------------              
                
                foreach ($pack_products as $pack_products_list)
                {
                    $pack_prod_id = $pack_products_list->prod_id;
                    $pack_prod_name = $this->products->get_product_short_name($pack_prod_id);
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

                    // add line item to line_items array
                    $line_items[] = new item("   " . $pack_prod_qty . " " . $pack_prod_name, "");
                }
            }

            // get each table for table_groups -------------------------------------------------------------

            $line_tables = array();

            foreach ($transaction['tables'] as $tables)
            {
                // insert new table to table_groups -------------------------------------------------------
                $tbl_id = $tables['tbl_id'];

                if ($tbl_id != 0)
                {
                    $tbl_name = $this->tables->get_table_name($tbl_id);    
                }
                else
                {
                    $tbl_name = 'No Table';
                }
                

                $data_tables = array(
                    'trans_id' => $trans_id,
                    'tbl_id' => $tbl_id,
                );
                $this->table_groups->save($data_tables);

                $line_tables[] = $tbl_name;
            }

            if (sizeof($line_tables) != 0)
            {
                $table_str = implode(', ', $line_tables);
            }
            else
            {
                $table_str = 'n/a';
            }


            $gross_total = $this->trans_details->get_trans_gross($trans_id);

            $this->print_receipt_cook($line_items, $order_type, $trans_id, $staff_username, $table_str, $gross_total);

        }

        

        echo json_encode(array("status" => TRUE));
    }

    public function ajax_api_add_refund_trans()
    {
        $stream_clean = $this->security->xss_clean($this->input->raw_input_stream);
        $request = json_decode($stream_clean);
        // $ready = $request->ready;
        $array = json_decode(json_encode($request), true);
        
        $line_items = array();

        foreach ($array as $transaction) 
        {
            foreach ($transaction['details'] as $details)
            {
                // insert new transaction ------------------------------------------------

                // $discount = $details['discount'];
                // $disc_type = $details['disc_type']; // discount type id

                $order_type = $details['order_type'];

                // $method = $details['method'];

                $cash_amt = (-1 * $details['cash_amt']);

                // $card_number = $details['card_number'];
                // $cust_name = $details['cust_name'];

                $user_id = $details['user_id'];
                $staff_username = $this->users->get_username($user_id);

                $cashier_id = $details['cashier_id'];
                $cashier_username = $this->users->get_username($cashier);
                
                $amount_due = (-1 * $details['amount_due']);

                $receipt_no = $details['receipt_no'];


                // if ($method == 'Cash') // if method is Cash
                // {
                //     $cash_amt = $cash_amt;
                // }
                // else // if Credit Card or Cash Card
                // {
                //     $cash_amt = $amount_due; // if method is not cash, set cash as amount due (result: no change amount)
                // }

                // if ($card_number == '') // set as n/a if empty
                // {
                //     $card_number = 'n/a';
                // }

                // if ($cust_name == '') // set as n/a if empty
                // {
                //     $cust_name = 'n/a';
                // }

                $data = array(
                        'datetime' => date("Y-m-d H:i:s"),

                        'discount' => $discount,
                        'disc_type' => $disc_type,

                        'status' => 'CLEARED',

                        'order_type' => $order_type,

                        'method' => $method,

                        'cash_amt' => $cash_amt,
                        'change_amt' => ($cash_amt - $amount_due),

                        'card_number' => $card_number,
                        'cust_name' => $cust_name,

                        'user_id' => $user_id,
                        'cashier_id' => $cashier_id,

                        'receipt_no' => $receipt_no
                    );
                    
                $insert = $this->transactions->save($data);
            }
            
            // end insert new transaction ------------------------------------------------

            $trans_id = $insert; // get the new trans_id

            // get each product for trans_details  ------------------------------------------------

            foreach ($transaction['products'] as $products)
            {
                $prod_id = $products['prod_id'];
                $prod_name = $this->products->get_product_short_name($prod_id);
                $prod_price = $this->products->get_product_price($prod_id);
                $prod_qty = $products['qty'];

                // check if product is discounted
                $check_discount = $this->prod_discounts->get_by_prod_id($prod_id);

                if ($check_discount != null)
                {
                    $new_price = $check_discount->new_price;

                    $prod_price = $new_price;

                    $prod_name = $prod_name . "*"; // discounted product indicator
                }

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

                // add line item to line_items array
                $line_items[] = new item($prod_qty . " " . $prod_name . " @" . $prod_price, number_format($prod_total, 2));
            }

            // get each package for trans_details  ------------------------------------------------

            foreach ($transaction['packages'] as $packages)
            {
                $pack_id = $packages['pack_id'];
                $pack_name = $this->packages->get_package_short_name($pack_id);
                $pack_price = $this->packages->get_package_price($pack_id);
                $pack_qty = $packages['qty'];

                // check if product is discounted
                $check_discount = $this->pack_discounts->get_by_pack_id($pack_id);

                if ($check_discount != null)
                {
                    $new_price = $check_discount->new_price;

                    $pack_price = $new_price;

                    $pack_name = $pack_name . "*"; // discounted product indicator
                }

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

                // add line item to line_items array
                $line_items[] = new item($pack_qty . " " . $pack_name . " @" . $pack_price, number_format($pack_total, 2));

                // get package product list ---------------------------------------------------------

                $pack_products = $this->pack_details->get_pack_detail_products($pack_id);

                // get each product of the package -----------------------------------------------------              
                
                foreach ($pack_products as $pack_products_list)
                {
                    $pack_prod_id = $pack_products_list->prod_id;
                    $pack_prod_name = $this->products->get_product_short_name($pack_prod_id);
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

                    // add line item to line_items array
                    $line_items[] = new item("   " . $pack_prod_qty . " " . $pack_prod_name, "");
                }
            }

            // get each table for table_groups -------------------------------------------------------------

            $line_tables = array();

            foreach ($transaction['tables'] as $tables)
            {
                // insert new table to table_groups -------------------------------------------------------
                $tbl_id = $tables['tbl_id'];

                if ($tbl_id != 0)
                {
                    $tbl_name = $this->tables->get_table_name($tbl_id);    
                }
                else
                {
                    $tbl_name = 'No Table';
                }
                

                $data_tables = array(
                    'trans_id' => $trans_id,
                    'tbl_id' => $tbl_id,
                );
                $this->table_groups->save($data_tables);

                $line_tables[] = $tbl_name;
            }

            if (sizeof($line_tables) != 0)
            {
                $table_str = implode(', ', $line_tables);
            }
            else
            {
                $table_str = 'n/a';
            }

        }

        echo json_encode(array("status" => TRUE));
        
        
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

    // public function print_receipt_cook($line_items, $tables, $gross_total, $discount
    public function print_receipt_cook($line_items, $order_type, $trans_id, $staff_username, $table_str, $gross_total)
    {
        /* Open the printer; this will change depending on how it is connected */
        $connector = new WindowsPrintConnector("epsontmu");
        $printer = new Printer($connector);

        // $logo = EscposImage::load("cafe.png", false);


        // fetch config data
        $store = $this->store->get_by_id(1); // set 1 as ID since there is only 1 config entry


        /* Information for the receipt */
        $store_name = wordwrap("KITCHEN", 15, "\n");
        // $address = wordwrap($store->address, 25, "\n");
        // $city = $store->city;
        // $tin = wordwrap($store->tin, 25, "\n");
        $date = date('D, j F Y h:i A'); // format: Wed, 4 July 2018 11:20 AM
        $vat = ($store->vat / 100); // ------------------------------------------------------------------------- SAMPLE VAT AMOUNT

        $items = $line_items;
        
        // $total_sales = ($gross_total / (1 + $vat));

        // $vat_amount = ($gross_total - $total_sales);

        // $amount_due = $gross_total;


        // // string variables
        // $total_sales_str = new item('Total Sales', number_format($total_sales, 2));
        // $vat_str = new item('Vat', number_format($vat_amount, 2));
        // $amount_due_str = new item('Amount Due     Php', number_format($amount_due, 2));
        

        /* Start the printer */
        $printer = new Printer($connector);

        /* Print top logo */
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        // $printer -> graphics($logo);

        /* Name of shop */
        $printer -> selectPrintMode(Printer::MODE_DOUBLE_WIDTH);
        $printer -> text($store_name . "\n");
        $printer -> selectPrintMode();
        // $printer -> text($address . "\n");
        // $printer -> text($city . "\n");
        // $printer -> text($tin . "\n");

        $printer -> text(str_pad("", 30, '*', STR_PAD_BOTH) . "\n");
        $printer -> text($table_str . "\n");
        $printer -> text(str_pad("", 30, '*', STR_PAD_BOTH) . "\n");

        /* Title of receipt */
        $printer -> selectPrintMode(Printer::MODE_DOUBLE_WIDTH);
        $printer -> text($order_type . "\n");
        $printer -> selectPrintMode();

        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> text(new item('Transaction#: ' . $trans_id, ''));
        $printer -> text(new item('Staff: ' . $staff_username, ''));

        $printer -> text(str_pad("", 35, '=', STR_PAD_BOTH) . "\n");

        /* Items */
        $printer -> setEmphasis(true);
        $printer -> text(new item('', 'Php'));
        $printer -> setEmphasis(false);
        foreach ($items as $item) {
            $printer -> text($item);
        }

        $printer -> text(str_pad("", 35, '=', STR_PAD_BOTH) . "\n");

        // $printer -> setEmphasis(true);
        // $printer -> text($total_sales_str);
        // /* Tax and total */
        // $printer -> text($vat_str);
        // $printer -> setEmphasis(false);

        // $printer -> setEmphasis(true);
        // $printer -> text(new item('', '=========='));
        
        // $printer -> text($amount_due_str);
        // $printer -> setEmphasis(false);
        

        /* Footer */
        $printer -> feed();
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text($date . "\n");

        // $printer -> feed();
        // $printer -> text("Innotech Solutions\n");
        // $printer -> text("Thank You Come Again\n");
        $printer -> text(str_pad("", 35, '_', STR_PAD_BOTH) . "\n");
        
        /* Cut the receipt and open the cash drawer */
        $printer -> cut();
        // $printer -> pulse();

        $printer -> close();

        echo json_encode(array("status" => TRUE));
    }

    public function ajax_api_reset_trans($trans_id) // reset trans_details of a checked out transaction (add, update qty, delete line items)
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

                        'order_type' => $details['order_type'], // DINE-IN, TAKE-OUT

                        'status' => $details['status'], // ONGOING, CANCELLED

                        'is_updated' => 1, // set is_updated to true in every transaction updates method process
                    );

                $this->transactions->update(array('trans_id' => $trans_id), $data);
            }
            
            // end insert new transaction ------------------------------------------------

            // delete trans_details items for the specified trans_id ------------------------------

            $this->trans_details->delete_by_id_trans($trans_id);

            // ------------------------------------------------------------------------------------

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

            // delete table_groups tables for the specified trans_id ------------------------------

            $this->table_groups->delete_by_trans_id($trans_id);

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

 /* A wrapper to do organise item names & prices into columns */
 class item
 {
     private $name;
     private $price;
     private $dollarSign;

     public function __construct($name = '', $price = '', $dollarSign = false)
     {
         $this -> name = $name;
         $this -> price = $price;
         $this -> dollarSign = $dollarSign;
     }

     public function __toString()
     {
         $rightCols = 10;
         $leftCols = 25;
         if ($this -> dollarSign) {
             $leftCols = $leftCols / 2 - $rightCols / 2;
         }
         $left = str_pad($this -> name, $leftCols) ;

         $sign = ($this -> dollarSign ? 'Php ' : '');
         $right = str_pad($sign . $this -> price, $rightCols, ' ', STR_PAD_LEFT);
         return "$left$right\n";
     }
 }
