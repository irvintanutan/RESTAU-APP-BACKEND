<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pdf_dashboard_report_controller extends CI_Controller {

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

	public function index($child_id)
	{
		// check if logged in and admin
		if($this->session->userdata('user_id') == '' || $this->session->userdata('administrator') == "0")
		{
          redirect('error500');
        }

        // get today's date and yesterday
        $today = date('Y-m-d');
        $yesterday = date('Y-m-d',(strtotime ( '-1 day' , strtotime ( $today) ) ));

		$data['current_date'] = date('l, F j, Y', strtotime(date('Y-m-d')));

		// get daily net sales data -------------------------------------------------------------------------------------------------------------

		$today_net_sales = $this->transactions->get_daily_net_sales($today);

		$yesterday_net_sales = $this->transactions->get_daily_net_sales($yesterday);


		if ($yesterday_net_sales > $today_net_sales) // if yesterday net sales is higher
		{
		    if ($yesterday_net_sales == 0)
		    {
		        if ($today_net_sales == 0) // if both today and yesterday is zero
		        {
		            $percent_higher_net_sales = 0;    
		        }
		        else
		        {
		            $percent_higher_net_sales = 100;
		        }
		    }
		    else
		    {
		        $percent_higher_net_sales = ((1 - ($today_net_sales / $yesterday_net_sales)) * 100);
		    }
		    
		    $percent_higher_net_sales_str = '[ ' . number_format($percent_higher_net_sales, 1) . ' % ] Higher than yesterday\'s ' . '[ ₱ ' . number_format($yesterday_net_sales, 2) . ' ]';
		}
		else // if yesterday net sales is lower (higher today)
		{
		    if ($today_net_sales == 0)
		    {
		        if ($yesterday_net_sales == 0) // if both today and yesterday is zero
		        {
		            $percent_higher_net_sales = 0;    
		        }
		        else
		        {
		            $percent_higher_net_sales = 100;
		        }
		    }
		    else
		    {
		        if ($yesterday_net_sales == 0) // if both today and yesterday is zero
		        {
		            $percent_higher_net_sales = 100;    
		        }
		        else
		        {
		            $percent_higher_net_sales = (($yesterday_net_sales / $today_net_sales) * 100);
		        }
		    }

		    $percent_higher_net_sales_str = '[ ' . number_format($percent_higher_net_sales, 1) . ' % ] Higher than yesterday\'s ' . '[ ₱ ' . number_format($yesterday_net_sales, 2) . ' ]';
		}
		
		$today_net_sales_str = '₱ ' . number_format($today_net_sales, 2);

		// -------------------------------------------------------------------------------------------------------------------------------------


		// get daily transaction count data ----------------------------------------------------------------------------------------------------

		$dine_in_today = $this->transactions->get_count_trans_today($today, 'DINE-IN');
		$take_out_today = $this->transactions->get_count_trans_today($today, 'TAKE-OUT');

		$total_trans_count_today = $dine_in_today + $take_out_today;

		// -------------------------------------------------------------------------------------------------------------------------------------


		// get menu items sold today -----------------------------------------------------------------------------------------------------------

		$individual_products_sold_today = $this->trans_details->count_all_sold_today_by_prod_type(0);
		$packages_sold_today = $this->trans_details->count_all_sold_today_by_prod_type(1);

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


		// ==================================== REPORT ESSENTIALS ========================================================


		$data['logo_img'] = $this->store->get_store_config_img(1);

		$data['comp_name'] = $this->store->get_store_config_name(1);

		$data['data'] = $this->LoadData($child_id); // load and fetch data
		
		$data['title'] = 'Dashboard Daily Statistics Report';

		$data['current_date'] = date('l, F j, Y', strtotime(date('Y-m-d')));

		$data['user_fullname'] = $this->session->userdata('firstname') .' '. $this->session->userdata('lastname');

		// column titles
		// $data['header'] = array('ID', 'Fullname', 'Relation', 'Age', 'Gender', 'C.Status', 'Education', 'Occupation', 'Income');
		$data['header'] = array('Fullname', 'Relation', 'Age', 'Gender', 'Occupation');


		$data['store'] = $store;

		$data['today_net_sales_str'] = $today_net_sales_str;
		$data['percent_higher_net_sales_str'] = $percent_higher_net_sales_str;

		$data['total_trans_count_today'] = $total_trans_count_today;
		$data['dine_in_today'] = $dine_in_today;
		$data['take_out_today'] = $take_out_today;

		$data['total_menu_items_sold_today'] = $total_menu_items_sold_today;
		$data['individual_products_sold_today'] = $individual_products_sold_today;
		$data['packages_sold_today'] = $packages_sold_today;      

		$data['discounts_rendered_today_str'] = $discounts_rendered_today_str;
		$data['discounts_gross_percentage_str'] = $discounts_gross_percentage_str;

		$this->load->library('MYPDF');
		$this->load->view('reports/makepdf_dashboard_view', $data);
	}

	// Load table data from file
	public function LoadData($child_id) 
	{
		$list = $this->family->get_family_list($child_id);
		$data = array();
		
		foreach ($list as $family) 
		{
		    $row = array();
		    $row[] = $family->name;
		    $row[] = $family->relation;

		    $row[] = $family->age . ' y.o.';          
		    $row[] = $family->sex;
		    // $row[] = $family->status;

		    // $row[] = $family->education;
		    $row[] = $family->occupation;
		    // $row[] = 'Php ' . $family->income;
		
		    $data[] = $row;
		}

		return $data;
	}

}
