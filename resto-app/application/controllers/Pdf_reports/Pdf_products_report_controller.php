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

		$data['total_menu_sales'] = 'Php ' . number_format($total_menu_sales, 2);

		$this->load->library('MYPDF');
		$this->load->view('reports/makepdf_products_view', $data);
	}

	public function index_annual($year)
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

        $total_products = $this->products->count_all_annual($year);

		$categories = $this->categories->get_categories();

        if (sizeOf($categories) != 0)
        {
            $categories_data = array();

            foreach ($categories as $categories_list) 
            {
            	$cat_id = $categories_list->cat_id;
            	$cat_name = $categories_list->name;
            	$cat_prod_count = $this->products->get_cat_prod_count_annual($cat_id, $year);
                $categories_data[] = $cat_name . ' [' . $cat_prod_count . ']';
            }

            $categories_str = implode(', ', $categories_data);
        }
        else
        {
            $categories_str = 'None';
        }

		$total_products_sold = $this->products->get_total_prod_sold_annual($year);

		$total_pack_prod_sold = $this->products->get_total_pack_prod_sold_annual($year);

		$total_menu_sales = $this->trans_details->get_total_menu_sales_annual(0, $year); // total sales of product type menu



		// ==================================== REPORT ESSENTIALS ========================================================


		$data['logo_img'] = $this->store->get_store_config_img(1);

		$data['comp_name'] = $this->store->get_store_config_name(1);

		$data['data'] = $this->LoadData(); // load and fetch data
		
		$data['title'] = 'Annual ( ' . $year . ' ) Products List';

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

		$data['total_menu_sales'] = 'Php ' . number_format($total_menu_sales, 2);

		$this->load->library('MYPDF');
		$this->load->view('reports/makepdf_products_view', $data);
	}

	public function index_monthly($year, $month)
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

        $total_products = $this->products->count_all_monthly($year, $month);

		$categories = $this->categories->get_categories();

        if (sizeOf($categories) != 0)
        {
            $categories_data = array();

            foreach ($categories as $categories_list) 
            {
            	$cat_id = $categories_list->cat_id;
            	$cat_name = $categories_list->name;
            	$cat_prod_count = $this->products->get_cat_prod_count_monthly($cat_id, $year, $month);
                $categories_data[] = $cat_name . ' [' . $cat_prod_count . ']';
            }

            $categories_str = implode(', ', $categories_data);
        }
        else
        {
            $categories_str = 'None';
        }

		$total_products_sold = $this->products->get_total_prod_sold_monthly($year, $month);

		$total_pack_prod_sold = $this->products->get_total_pack_prod_sold_monthly($year, $month);

		$total_menu_sales = $this->trans_details->get_total_menu_sales_monthly(0, $year, $month); // total sales of product type menu

		$dateObj   = DateTime::createFromFormat('!m', $month);
		$monthName = $dateObj->format('F'); // March

		// ==================================== REPORT ESSENTIALS ========================================================


		$data['logo_img'] = $this->store->get_store_config_img(1);

		$data['comp_name'] = $this->store->get_store_config_name(1);

		$data['data'] = $this->LoadData(); // load and fetch data
		
		$data['title'] = 'Monthly ( ' . $monthName . ' ' . $year . ' ) Products List';

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

		$data['total_menu_sales'] = 'Php ' . number_format($total_menu_sales, 2);

		$this->load->library('MYPDF');
		$this->load->view('reports/makepdf_products_view', $data);
	}

	public function index_custom($date_from, $date_to)
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

        $total_products = $this->products->count_all_custom($date_from, $date_to);

		$categories = $this->categories->get_categories();

        if (sizeOf($categories) != 0)
        {
            $categories_data = array();

            foreach ($categories as $categories_list) 
            {
            	$cat_id = $categories_list->cat_id;
            	$cat_name = $categories_list->name;
            	$cat_prod_count = $this->products->get_cat_prod_count_custom($cat_id, $date_from);
                $categories_data[] = $cat_name . ' [' . $cat_prod_count . ']';
            }

            $categories_str = implode(', ', $categories_data);
        }
        else
        {
            $categories_str = 'None';
        }

		$total_products_sold = $this->products->get_total_prod_sold_custom($date_from, $date_to);

		$total_pack_prod_sold = $this->products->get_total_pack_prod_sold_custom($date_from, $date_to);

		$total_menu_sales = $this->trans_details->get_total_menu_sales_custom(0, $date_from, $date_to); // total sales of product type menu

		// ==================================== REPORT ESSENTIALS ========================================================


		$data['logo_img'] = $this->store->get_store_config_img(1);

		$data['comp_name'] = $this->store->get_store_config_name(1);

		$data['data'] = $this->LoadData(); // load and fetch data
		
		$data['title'] = 'Custom ( ' . $date_from . ' - ' . $date_to . ' ) Products List';

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

		$data['total_menu_sales'] = 'Php ' . number_format($total_menu_sales, 2);

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

	// Load table data from file
	public function LoadData_annual($year) 
	{
		// get best selling list -------------------------------------------------

		$min_price = $this->store->get_store_bs_price(1);

		$best_selling = $this->products->get_best_selling_annual($min_price, $year);
		$best_selling_array = array();
		$best_selling_sold_array = array();

		foreach ($best_selling as $bp_products) 
		{
		    $best_selling_array[] = $bp_products->prod_id;
		    $best_selling_sold_array[] = $bp_products->sold;
		}
		//------------------------------------------------------------------------

		$list = $this->products->get_products_annual($year);
		$data = array();

		foreach ($list as $products) {
		    
		    $row = array();
		    $row[] = 'P' . $products->prod_id;

		    $row[] = $products->name;
		    $row[] = $products->short_name; // 12 char short name
		    // $row[] = $products->descr;

		    $row[] = $this->categories->get_category_name($products->cat_id); // get name instead of id

		    $row[] = $products->price;
		

		    if (in_array($products->prod_id, $best_selling_array)) // if part of top selling
		    {
		    	$prod_index = array_search($products->prod_id, $best_selling_array); // get index of the product
		        $item_sold = '( R: ' . $prod_index + 1 . " ) " . $best_selling_sold_array[$prod_index]; // insert rank by adding index by 1. get sold value using index
		    }
		    else
		    {
		        $item_sold = $this->products->get_prod_sold_by_id_annual($prod_id, $year);
		    }

		    $row[] = $item_sold;
		
		    $data[] = $row;
		}

		return $data;
	}

	// Load table data from file
	public function LoadData_monthly($year, $month) 
	{
		// get best selling list -------------------------------------------------

		$min_price = $this->store->get_store_bs_price(1);

		$best_selling = $this->products->get_best_selling_monthly($min_price, $year, $month);
		$best_selling_array = array();
		$best_selling_sold_array = array();

		foreach ($best_selling as $bp_products) 
		{
		    $best_selling_array[] = $bp_products->prod_id;
		    $best_selling_sold_array[] = $bp_products->sold;
		}
		//------------------------------------------------------------------------

		$list = $this->products->get_products_monthly($year, $month);
		$data = array();

		foreach ($list as $products) {
		    
		    $row = array();
		    $row[] = 'P' . $products->prod_id;

		    $row[] = $products->name;
		    $row[] = $products->short_name; // 12 char short name
		    // $row[] = $products->descr;

		    $row[] = $this->categories->get_category_name($products->cat_id); // get name instead of id

		    $row[] = $products->price;
		

		    if (in_array($products->prod_id, $best_selling_array)) // if part of top selling
		    {
		    	$prod_index = array_search($products->prod_id, $best_selling_array); // get index of the product
		        $item_sold = '( R: ' . $prod_index + 1 . " ) " . $best_selling_sold_array[$prod_index]; // insert rank by adding index by 1. get sold value using index
		    }
		    else
		    {
		        $item_sold = $this->products->get_prod_sold_by_id_monthly($prod_id, $year, $month);
		    }

		    $row[] = $item_sold;
		
		    $data[] = $row;
		}

		return $data;
	}

	// Load table data from file
	public function LoadData_custom($date_from, $date_to) 
	{
		// get best selling list -------------------------------------------------

		$min_price = $this->store->get_store_bs_price(1);

		$best_selling = $this->products->get_best_selling_custom($min_price, $date_from, $date_to);
		$best_selling_array = array();
		$best_selling_sold_array = array();

		foreach ($best_selling as $bp_products) 
		{
		    $best_selling_array[] = $bp_products->prod_id;
		    $best_selling_sold_array[] = $bp_products->sold;
		}
		//------------------------------------------------------------------------

		$list = $this->products->get_products_custom($date_from, $date_to);
		$data = array();

		foreach ($list as $products) {
		    
		    $row = array();
		    $row[] = 'P' . $products->prod_id;

		    $row[] = $products->name;
		    $row[] = $products->short_name; // 12 char short name
		    // $row[] = $products->descr;

		    $row[] = $this->categories->get_category_name($products->cat_id); // get name instead of id

		    $row[] = $products->price;
		

		    if (in_array($products->prod_id, $best_selling_array)) // if part of top selling
		    {
		    	$prod_index = array_search($products->prod_id, $best_selling_array); // get index of the product
		        $item_sold = '( R: ' . $prod_index + 1 . " ) " . $best_selling_sold_array[$prod_index]; // insert rank by adding index by 1. get sold value using index
		    }
		    else
		    {
		        $item_sold = $this->products->get_prod_sold_by_id_custom($prod_id, $date_from, $date_to);
		    }

		    $row[] = $item_sold;
		
		    $data[] = $row;
		}

		return $data;
	}

}
