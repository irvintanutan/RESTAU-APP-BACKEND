<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pdf_packages_report_controller extends CI_Controller {

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

		// get packages data -------------------------------------------------------------------------------------------------------------

        $total_packages = $this->packages->count_all();

		$total_packages_sold = $this->packages->get_total_pack_sold();

		$total_pack_prod_sold = $this->products->get_total_pack_prod_sold();

		$total_menu_sales = $this->trans_details->get_total_menu_sales(1); // total sales of package type menu



		// ==================================== REPORT ESSENTIALS ========================================================


		$data['logo_img'] = $this->store->get_store_config_img(1);

		$data['comp_name'] = $this->store->get_store_config_name(1);

		$data['data'] = $this->LoadData(); // load and fetch data
		
		$data['title'] = 'Packages List';

		$data['date_today'] = $today;

		$data['current_date'] = date('l, F j, Y', strtotime(date('Y-m-d')));

		$data['current_time'] = date("h:i:s A");

		$data['user_fullname'] = $this->session->userdata('firstname') .' '. $this->session->userdata('lastname');

		// column titles
		$data['header'] = array('ID', 'Name', 'ShortName', 'Description', 'Price', 'Sold');


		$data['total_packages'] = $total_packages;

		$data['total_packages_sold'] = $total_packages_sold;
		$data['total_pack_prod_sold'] = $total_pack_prod_sold;

		$data['total_menu_sales'] = 'Php ' . number_format($total_menu_sales, 2);

		$this->load->library('MYPDF');
		$this->load->view('reports/makepdf_packages_view', $data);
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
		    $best_selling_array[] = $bp_products->pack_id;
		}
		//------------------------------------------------------------------------

		$list = $this->packages->get_packages();
		$data = array();

		foreach ($list as $packages) {

		    $row = array();
		    $row[] = 'G' . $packages->pack_id;

		    $row[] = $packages->name;
		    $row[] = $packages->short_name;
		    $row[] = $packages->descr;

		    $row[] = $packages->price;
		    

		    if (in_array($packages->pack_id, $best_selling_array))
		    {
		        $item_sold = '( R: ' . (array_search($packages->pack_id, $best_selling_array) + 1) . " ) " . $packages->sold;    
		    }
		    else
		    {
		        $item_sold = $packages->sold;
		    }

		    $row[] = $item_sold;

		    $data[] = $row;
		}
		
		//output to json format
		return $data;
	}

}
