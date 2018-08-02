<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pdf_users_report_controller extends CI_Controller {

	public function __construct()
	{
	  parent::__construct();
	  $this->load->model('Store_config/Store_config_model','store');
	  $this->load->model('Products/Products_model','products');
	  $this->load->model('Packages/Packages_model','packages');

	  $this->load->model('Trans_details/Trans_details_model','trans_details');

	  $this->load->model('Transactions/Transactions_model','transactions');

	  $this->load->model('Users/Users_model','users');
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

		// get daily transaction count data ----------------------------------------------------------------------------------------------------

		$dine_in_total = $this->transactions->get_count_trans_total($status, 'DINE-IN');
		$take_out_total = $this->transactions->get_count_trans_total($status, 'TAKE-OUT');

		$total_trans_count = $dine_in_total + $take_out_total;

		// -------------------------------------------------------------------------------------------------------------------------------------

		// users count  ----------------------------------------------------------------------------------------------------

		$admin_users = 0;
		$cashier_users = 0;
		$staff_users = 0;

		$total_users = $admin_users + $cashier_users + $staff_users;

		// -------------------------------------------------------------------------------------------------------------------------------------

		// ==================================== REPORT ESSENTIALS ========================================================


		$data['logo_img'] = $this->store->get_store_config_img(1);

		$data['comp_name'] = $this->store->get_store_config_name(1);

		$data['data'] = $this->LoadData($status); // load and fetch data
		
		$data['title'] = 'Transactions Report';

		$data['date_today'] = $today;

		$data['current_date'] = date('l, F j, Y', strtotime(date('Y-m-d')));

		$data['current_time'] = date("h:i:s A");

		$data['user_fullname'] = $this->session->userdata('firstname') .' '. $this->session->userdata('lastname');

		// column titles
		$data['header'] = array('UserID', 'UserName', 'UserType', 'Staff', 'Cashier', 'Total', 'Void', 'Cancelled', 'Refunded');

		$data['total_trans_count'] = $total_trans_count;

		$this->load->library('MYPDF');
		$this->load->view('reports/makepdf_transactions_view', $data);
	}

	// Load table data from file
	public function LoadData() 
	{
		$list = $this->users->get_api_datatables();
		$data = array();

		foreach ($list as $users) {
		    $row = array();

		    $row[] = 'U' . $users->trans_id;
		    $row[] = $users->username;

		    $row[] = $user_type;

		    $gross = $this->trans_details->get_trans_gross($users->trans_id);
		    $discount = $users->discount;
		    $total_due = ($gross - $discount);

		    $row[] = $gross;
		    $row[] = $discount;
		    // $row[] = $users->disc_type;
		    $row[] = number_format($total_due, 2);
		    
		    $row[] = $users->method;

		    $row[] = $this->users->get_username($users->user_id);
		    $row[] = $users->receipt_no;

		    // $row[] = $users->status;

		    $data[] = $row;
		}

		return $data;
	}

}
