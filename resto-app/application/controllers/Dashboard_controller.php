<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once(APPPATH.'vendor/mike42/autoload.php');
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;
use Mike42\Escpos\Printer;

class Dashboard_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Store_config/Store_config_model','store');
        $this->load->model('Products/Products_model','products');
        $this->load->model('Packages/Packages_model','packages');

        $this->load->model('Trans_details/Trans_details_model','trans_details');
        $this->load->model('Store_config/Store_config_model','store');

        $this->load->model('Transactions/Transactions_model','transactions');

    }

    public function index()
    {						
        if ($this->session->userdata('user_id') == '')
        {
            redirect('error500');
        }
        
        $this->load->helper('url');

        $store = $this->store->get_by_id(1); // set 1 as ID since there is only 1 config entry

        // get today's date and yesterday
        $today = date('Y-m-d');
        $yesterday = date('Y-m-d',(strtotime ( '-1 day' , strtotime ( $today) ) ));


        // get daily net sales data -------------------------------------------------------------------------------------------------------------

        $today_net_sales = $this->transactions->get_daily_net_sales($today);

        $yesterday_net_sales = $this->transactions->get_daily_net_sales($yesterday);


        if ($yesterday_net_sales > $today_net_sales) // if yesterday net sales is higher
        {
            if ($yesterday_net_sales == 0)
            {
                if ($today_net_sales == 0) // if both today and yesterday is zero
                {
                    $percent_net_sales = 0;    
                }
                else
                {
                    $percent_net_sales = 100;
                }
            }
            else
            {
                $percent_net_sales = ((1 - ($today_net_sales / $yesterday_net_sales)) * 100);
            }
            
            $percent_net_sales_str = '[ ' . number_format($percent_net_sales, 1) . ' % ] Lower than yesterday\'s ' . '[ ₱ ' . number_format($yesterday_net_sales, 2) . ' ]';
        }
        else // if yesterday net sales is lower (higher today)
        {
            if ($today_net_sales == 0)
            {
                if ($yesterday_net_sales == 0) // if both today and yesterday is zero
                {
                    $percent_net_sales = 0;    
                }
                else
                {
                    $percent_net_sales = 100;
                }
            }
            else
            {
                if ($yesterday_net_sales == 0) // if both today and yesterday is zero
                {
                    $percent_net_sales = 100;    
                }
                else
                {
                    $percent_net_sales = (($yesterday_net_sales / $today_net_sales) * 100);
                }
            }

            $percent_net_sales_str = '[ ' . number_format($percent_net_sales, 1) . ' % ] Higher than yesterday\'s ' . '[ ₱ ' . number_format($yesterday_net_sales, 2) . ' ]';
        }
        
        $today_net_sales_str = '₱ ' . number_format($today_net_sales, 2);

        // -------------------------------------------------------------------------------------------------------------------------------------


        // get daily transaction count data ----------------------------------------------------------------------------------------------------

        $dine_in_today = $this->transactions->get_count_trans_today($today, 'DINE-IN');
        $take_out_today = $this->transactions->get_count_trans_today($today, 'TAKE-OUT');

        $total_trans_count_today = $dine_in_today + $take_out_today;

        // -------------------------------------------------------------------------------------------------------------------------------------


        // get menu items sold today -----------------------------------------------------------------------------------------------------------

        $individual_products_sold_today = 1 * ($this->trans_details->count_all_sold_today_by_prod_type(0));
        $packages_sold_today = 1 * ($this->trans_details->count_all_sold_today_by_prod_type(1));

        $total_menu_items_sold_today = $individual_products_sold_today + $packages_sold_today;

        // -------------------------------------------------------------------------------------------------------------------------------------


        // get daily discounts rendered today --------------------------------------------------------------------------------------------------

        $discounts_rendered_today = $this->transactions->get_daily_discounts_rendered($today);

        $gross_total_today = $discounts_rendered_today + $today_net_sales;

        if ($gross_total_today == 0)
        {
            $discounts_gross_percentage = 0;
        }
        else
        {
            $discounts_gross_percentage = ($discounts_rendered_today / $gross_total_today) * 100;    
        }
        

        $discounts_rendered_today_str = '₱ ' . number_format($discounts_rendered_today, 2);
        $discounts_gross_percentage_str = '[ ' . number_format($discounts_gross_percentage, 1) . ' % ]  of the Total Gross Sales [ ₱ ' . number_format($gross_total_today, 2) . ' ]';



        $data['store'] = $store;

        $data['today_net_sales_str'] = $today_net_sales_str;
        $data['percent_net_sales_str'] = $percent_net_sales_str;

        $data['total_trans_count_today'] = $total_trans_count_today;
        $data['dine_in_today'] = $dine_in_today;
        $data['take_out_today'] = $take_out_today;

        $data['total_menu_items_sold_today'] = $total_menu_items_sold_today;
        $data['individual_products_sold_today'] = $individual_products_sold_today;
        $data['packages_sold_today'] = $packages_sold_today;      

        $data['discounts_rendered_today_str'] = $discounts_rendered_today_str;
        $data['discounts_gross_percentage_str'] = $discounts_gross_percentage_str;

        $data['title'] = '<i class="fa fa-tachometer"></i> Dashboard';	
        $this->load->view('template/dashboard_header',$data);
        $this->load->view('template/dashboard_body',$data);
        $this->load->view('template/dashboard_navigation');
        $this->load->view('template/dashboard_footer');

    }

    public function ajax_list() // get all that belongs to this ID via foreign key
    {
        // get best selling list -------------------------------------------------

        $min_price = $this->store->get_store_bs_price(1);

        $best_selling = $this->products->get_best_selling($min_price);
        $best_selling_prod_array = array();
        $best_selling_pack_array = array();

        foreach ($best_selling as $bp_products) // different storage for products and package since index is used to get the rank
        {
            $best_selling_prod_array[] = $bp_products->prod_id;
            $best_selling_pack_array[] = $bp_products->pack_id;
        }
        //------------------------------------------------------------------------

        $list = $this->trans_details->get_datatables_sold_today();
        $data = array();
        $no = $_POST['start'];

        foreach ($list as $trans_details) {
            $no++;
            $row = array();
            
            if ($trans_details->prod_type == 1) // if prod_type is package
            {
                $item_id = 'G' . $trans_details->pack_id;
                $item_name = $this->packages->get_package_name($trans_details->pack_id);
                $item_type = 'PACKAGE';
                $item_price = $this->packages->get_package_price($trans_details->pack_id);

                if (in_array($trans_details->pack_id, $best_selling_pack_array))
                {
                    $item_sold = '( <i class="fa fa-star"></i> Rank: ' . (array_search($trans_details->pack_id, $best_selling_pack_array) + 1) . " ) &nbsp;&nbsp;&nbsp;&nbsp; <b>" . $trans_details->sold . "</b>";    
                }
                else
                {
                    $item_sold = '<b>' . $trans_details->sold . '</b>';
                }
            }
            else if ($trans_details->prod_type == 0) // if prod_type is individual product
            {
                $item_id = 'P' . $trans_details->prod_id;
                $item_name = $this->products->get_product_name($trans_details->prod_id);
                $item_type = 'PRODUCT';
                $item_price = $this->products->get_product_price($trans_details->prod_id);

                if (in_array($trans_details->prod_id, $best_selling_prod_array))
                {
                    $item_sold = '( <i class="fa fa-star"></i> Rank: ' . (array_search($trans_details->prod_id, $best_selling_prod_array) + 1) . " ) &nbsp;&nbsp;&nbsp;&nbsp; <b>" . $trans_details->sold . "</b>";    
                }
                else
                {
                    $item_sold = '<b>' . $trans_details->sold . '</b>';
                }
            }

            $row[] = $item_id;
            $row[] = $item_name;
            $row[] = $item_type;

            $row[] = $item_price;

            $row[] = $item_sold;

            $total_item_sales = ($item_price * $trans_details->sold);

            $row[] = "₱ " . number_format($total_item_sales, 2);

            $data[] = $row;
        }
 
        $output = array(
                        "draw" => $_POST['draw'],
                        "recordsTotal" => $this->trans_details->count_all_sold_today(),
                        "recordsFiltered" => $this->trans_details->count_filtered_sold_today(),
                        "data" => $data,
                );
        //output to json format
        echo json_encode($output);
    }

    public function print_readings($reading_no, $pos_no, $cashier_username, $trans_count, $gross_sales, $trans_cancel_count, $refund_count, $refund_sales, $total_sales, $discounts_list, $total_discounts, $net_sales, $vat_sales, $vat_amount, $vat_exempt, $receipt_start_no, $receipt_end_no)
    {

        /* Open the printer; this will change depending on how it is connected */
        $connector = new WindowsPrintConnector("epsontmu");
        $printer = new Printer($connector);

        // $logo = EscposImage::load("cafe.png", false);


        // ======================================== DATA FETCH SECTION ==========================================================

        $store = $this->store->get_by_id(1); // set 1 as ID since there is only 1 config entry

        $pos_no = 1;
        $cashier_username = $this->session->userdata('username');
        $cashier_id = $this->session->userdata('user_id');
        $today = date('Y-m-d');

        // ------------------------- COUNTS -------------------------------------------------------------------------------
        $trans_count_dine_in = $this->transactions->get_count_trans_shift($today, 'DINE-IN', $cashier_id);
        $trans_count_take_out = $this->transactions->get_count_trans_shift($today, 'TAKE-OUT', $cashier_id);

        $trans_count_total = ($trans_count_dine_in + $trans_count_take_out);

        $trans_count_cancelled =


        // ------------------------- AMOUNT -------------------------------------------------------------------------------
        $net_sales = $this->transactions->get_daily_net_sales_shift($today, $cashier_id);
        $discounts_rendered = $this->transactions->get_daily_discounts_rendered_shift($today, $cashier_id, $disc_id);
        $gross_sales = $discounts_rendered + $net_sales;




        // ========================================= PRINTING SECTION ===========================================================

        // fetch config data
        $store = $this->store->get_by_id(1); // set 1 as ID since there is only 1 config entry


        /* Information for the receipt */
        $branch_id = wordwrap($store->branch_id, 15, "\n");
        $store_name = wordwrap($store->name, 15, "\n");
        $address = wordwrap($store->address, 25, "\n");
        $city = wordwrap($store->city, 25, "\n");
        $tin = wordwrap($store->tin, 25, "\n");
        $telephone = wordwrap('Tel#: ' . $store->telephone, 25, "\n");
        $mobile = wordwrap('Cel#: ' . $store->mobile, 25, "\n");
        $date = date('D, j F Y h:i A'); // format: Wed, 4 July 2018 11:20 AM
        $vat = ($store->vat / 100);

        $items = $line_items;
        
        $total_sales = ($gross_total / (1 + $vat));

        $vat_amount = ($gross_total - $total_sales);

        $amount_due = ($gross_total - $discount);


        // string variables
        $total_sales_str = new item('Total Sales', number_format($total_sales, 2));
        $vat_str = new item('Vat', number_format($vat_amount, 2));

        $discount_str = new item('Less: ' . $disc_type_name, "-" . number_format($discount, 2));

        $amount_due_str = new item('Amount Due       Php', number_format($amount_due, 2));
        $cash_amt_str = new item('CASH             Php', number_format($cash_amt, 2));
        $change_amt_str = new item('CHANGE           Php', number_format($change_amt, 2));

        

        /* Start the printer */
        $printer = new Printer($connector);

        $printer -> pulse();

        /* Print top logo */
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        // $printer -> graphics($logo);

        /* Name of shop */
        $printer -> selectPrintMode(Printer::MODE_DOUBLE_WIDTH);
        $printer -> text($store_name . "\n");
        $printer -> selectPrintMode();
        $printer -> text($address . "\n");
        $printer -> text($city . "\n");
        $printer -> text($telephone . "\n");
        $printer -> text($mobile . "\n");
        $printer -> text($tin . "\n");

        $printer -> text(str_pad("", 30, '*', STR_PAD_BOTH) . "\n");
        $printer -> text($table_str . "\n");
        $printer -> text(str_pad("", 30, '*', STR_PAD_BOTH) . "\n");

        /* Title of receipt */
        $printer -> selectPrintMode(Printer::MODE_DOUBLE_WIDTH);
        $printer -> text($order_type . "\n");
        $printer -> selectPrintMode();

        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> text(new item('Transaction#: ' . $trans_id, ''));
        $printer -> text(new item('Receipt#: ' . $receipt_no, ''));
        $printer -> text(new item('Staff: ' . $staff_username, ''));
        $printer -> text(new item('Cashier: ' . $cashier_username, ''));

        $printer -> text(str_pad("", 35, '=', STR_PAD_BOTH) . "\n");

        /* Items */
        $printer -> setEmphasis(true);
        $printer -> text(new item('', 'Php'));
        $printer -> setEmphasis(false);
        foreach ($items as $item) {
            $printer -> text($item);
        }

        $printer -> text(str_pad("", 35, '=', STR_PAD_BOTH) . "\n");

        $printer -> setEmphasis(true);
        $printer -> text($total_sales_str);
        /* Tax and total */
        $printer -> text($vat_str);


        if ($discount != 0) // print only if there is a discount (not zero)
        {
            $printer -> text($discount_str);
        }

        $printer -> setEmphasis(false);

        $printer -> setEmphasis(true);
        $printer -> text(new item('', '=========='));
        
        $printer -> text($amount_due_str);

        // ------------------------------------------ PAYMENT RECEIPT PRINTS --------------------------------------------------

        $printer -> text($cash_amt_str);
        $printer -> text($change_amt_str);        

        $printer -> setEmphasis(false);
        
        // --------------------------------------------------------------------------------------------------------------------

        /* Footer */
        $printer -> feed();
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text($date . "\n");

        $printer -> feed();
        $printer -> text("Innotech Solutions\n");
        $printer -> text("Thank You Come Again\n");
        $printer -> text(str_pad("", 35, '_', STR_PAD_BOTH) . "\n");
        
        /* Cut the receipt and open the cash drawer */
        $printer -> cut();
        $printer -> pulse();

        $printer -> close();
    }
}
