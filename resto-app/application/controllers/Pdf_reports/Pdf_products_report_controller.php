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

        $total_products = $this->products->count_all();

		$categories = $this->categories->get_categories();

        if (sizeOf($categories) != 0)
        {
            $categories_data = array();

            foreach ($categories as $categories_list) 
            {
            	$cat_id = $categories_list->cat_id;
            	$cat_name = $categories_list->name;
            	$cat_prod_count = $this->products->get_cat_prod_count($cat_id);
                $categories_data[] = $cat_name . ' [' . $cat_prod_count . ']';
            }

            $categories_str = implode(', ', $categories_data);
        }
        else
        {
            $categories_str = 'None';
        }

		$total_products_sold = $this->products->get_total_prod_sold();

		$total_pack_prod_sold = $this->products->get_total_pack_prod_sold();

		$total_menu_sales = $this->trans_details->get_total_menu_sales(0); // total sales of package type menu



		// ==================================== REPORT ESSENTIALS ========================================================


		$data['logo_img'] = $this->store->get_store_config_img(1);

		$data['comp_name'] = $this->store->get_store_config_name(1);

		$data['data'] = $this->LoadData(); // load and fetch data
		
		$data['title'] = 'Products List';

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

		$data['total_menu_sales'] = $total_menu_sales;

		$this->load->library('MYPDF');
		$this->load->view('reports/makepdf_products_view', $data);
	}

	// Load table data from file
	public function LoadData() 
	{
		// get best selling list -------------------------------------------------

		$min_price = $this->store->get_store_bs_price(1);

		$best_selling = $this->products->get_best_selling($min_price);
		$best_selling_array = array();

		foreach ($best_selling as $bp_products) 
		{
		    $best_selling_array[] = $bp_products->prod_id;
		}
		//------------------------------------------------------------------------

		$list = $this->products->get_products();
		$data = array();

		foreach ($list as $products) {
		    
		    $row = array();
		    $row[] = 'P' . $products->prod_id;

		    $row[] = $products->name;
		    $row[] = $products->short_name; // 12 char short name
		    // $row[] = $products->descr;

		    $row[] = $this->categories->get_category_name($products->cat_id); // get name instead of id

		    $row[] = $products->price;
		

		    if (in_array($products->prod_id, $best_selling_array))
		    {
		        $item_sold = '( R: ' . (array_search($products->prod_id, $best_selling_array) + 1) . " ) " . $products->sold;    
		    }
		    else
		    {
		        $item_sold = $products->sold;
		    }

		    $row[] = $item_sold;
		
		    $data[] = $row;
		}

		return $data;
	}

}
