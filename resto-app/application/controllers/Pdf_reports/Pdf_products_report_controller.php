<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pdf_products_report_controller extends CI_Controller {

	public function __construct()
	{
	  parent::__construct();
	  $this->load->model('Store_config/Store_config_model','store');
	  $this->load->model('Products/Products_model','products');
	  $this->load->model('Packages/Packages_model','packages');
	  $this->load->model('Categories/Categories_model','categories');

	  $this->load->model('Trans_details/Trans_details_model','trans_details');

	  $this->load->model('Transactions/Transactions_model','transactions');
	}

	public function index()
	{
		// check if logged in and admin
		if($this->session->userdata('user_id') == '' || $this->session->userdata('administrator') == "0")
		{
          redirect('error500');
        }

        // get today's date and yesterday
        $today = date('Y-m-d');
        $yesterday = date('Y-m-d',(strtotime ( '-1 day' , strtotime ( $today) ) ));

		// get products data -------------------------------------------------------------------------------------------------------------

        $total_producs = $this->products->count_all();

		$categories = $this->categories->get_categories();

        if ($categories->num_rows() != 0)
        {
            $categories_data = array();

            foreach ($categories->result() as $categories_list) 
            {
            	$cat_id = $categories_list->cat_id;
            	$cat_name = $categories_list->name;
            	$cat_prod_count = $this->categories->get_cat_prod_count($cat_id)
                $categories_data[] = $cat_name . ' [' . $cat_prod_count . ']';
            }

            $categories_str = implode(', ', $categories_data);
        }
        else
        {
            $categories_str = 'n/a';
        }

		$total_products_sold = $this->products->get_total_prod_sold();

		$total_pack_prod_sold = $this->products->get_total_pack_prod_sold();



		// ==================================== REPORT ESSENTIALS ========================================================


		$data['logo_img'] = $this->store->get_store_config_img(1);

		$data['comp_name'] = $this->store->get_store_config_name(1);

		$data['data'] = $this->LoadData(); // load and fetch data
		
		$data['title'] = 'Daily Statistics Report';

		$data['date_today'] = $today;

		$data['current_date'] = date('l, F j, Y', strtotime(date('Y-m-d')));

		$data['current_time'] = date("h:i:s A");

		$data['user_fullname'] = $this->session->userdata('firstname') .' '. $this->session->userdata('lastname');

		// column titles
		$data['header'] = array('ID', 'Name', 'ShortName', 'Category', 'Price', 'Sold');


		$data['total_products'] = $total_products;
		$data['categories_str'] = $categories_str;

		$data['total_products_sold'] = $total_products_sold;
		$data['total_pack_prod_sold'] = $total_pack_prod_sold;

		$this->load->library('MYPDF');
		$this->load->view('reports/makepdf_products_view', $data);
	}

	// Load table data from file
	public function LoadData() 
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

		$list = $this->trans_details->get_reports_sold_today();
		$data = array();

		foreach ($list as $trans_details) {
		    $row = array();
		    
		    if ($trans_details->prod_type == 1) // if prod_type is package
		    {
		        $item_id = 'G' . $trans_details->pack_id;
		        $item_name = $this->packages->get_package_name($trans_details->pack_id);
		        $item_type = 'PACKAGE';
		        $item_price = $this->packages->get_package_price($trans_details->pack_id);

		        if (in_array($trans_details->pack_id, $best_selling_pack_array))
		        {
		            $item_sold = '( R: ' . (array_search($trans_details->pack_id, $best_selling_pack_array) + 1) . " ) " . $trans_details->sold;    
		        }
		        else
		        {
		            $item_sold = $trans_details->sold;
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
		            $item_sold = '( R: ' . (array_search($trans_details->prod_id, $best_selling_prod_array) + 1) . " ) " . $trans_details->sold;    
		        }
		        else
		        {
		            $item_sold = $trans_details->sold;
		        }
		    }

		    $row[] = $item_id;
		    $row[] = $item_name;
		    $row[] = $item_type;

		    $row[] = $item_price;

		    $row[] = $item_sold;

		    $total_item_sales = ($item_price * $trans_details->sold);

		    $row[] = number_format($total_item_sales, 2);

		    $data[] = $row;
		}

		return $data;
	}

}
