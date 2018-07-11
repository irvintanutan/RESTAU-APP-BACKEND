<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Store_config/Store_config_model','store');
        $this->load->model('Products/Products_model','products');
        $this->load->model('Packages/Packages_model','packages');

        $this->load->model('Trans_details/Trans_details_model','trans_details');
        $this->load->model('Store_config/Store_config_model','store');

    }

    public function index()
    {						
        if ($this->session->userdata('user_id') == '')
        {
            redirect('error500');
        }
        
        $this->load->helper('url');

        $store = $this->store->get_by_id(1); // set 1 as ID since there is only 1 config entry
        
        $data['store'] = $store;       
        // get today's date and yesterday
        $today = date('Y-m-d');

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
}
