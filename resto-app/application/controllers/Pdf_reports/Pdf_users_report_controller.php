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
	  $this->load->model('Logs/Trans_logs_model','trans_logs');
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

		// $dine_in_total = $this->transactions->get_count_trans_total($status, 'DINE-IN');
		// $take_out_total = $this->transactions->get_count_trans_total($status, 'TAKE-OUT');

		// $total_trans_count = $dine_in_total + $take_out_total;

		// -------------------------------------------------------------------------------------------------------------------------------------

		// users count  ----------------------------------------------------------------------------------------------------

		$admin_users = $this->users->get_user_type_count('administrator');
		$cashier_users = $this->users->get_user_type_count('cashier');
		$staff_users = $this->users->get_user_type_count('staff');

		$total_users = $admin_users + $cashier_users + $staff_users;

		// -------------------------------------------------------------------------------------------------------------------------------------

		// void count  ----------------------------------------------------------------------------------------------------

		$void_total = $this->trans_logs->get_total_void();

		// -------------------------------------------------------------------------------------------------------------------------------------

		// ==================================== REPORT ESSENTIALS ========================================================


		$data['logo_img'] = $this->store->get_store_config_img(1);

		$data['comp_name'] = $this->store->get_store_config_name(1);

		$data['data'] = $this->LoadData(); // load and fetch data
		
		$data['title'] = 'Users Report';

		$data['date_today'] = $today;

		$data['current_date'] = date('l, F j, Y', strtotime(date('Y-m-d')));

		$data['current_time'] = date("h:i:s A");

		$data['user_fullname'] = $this->session->userdata('firstname') .' '. $this->session->userdata('lastname');

		// column titles
		$data['header'] = array('UserID', 'UserName', 'UserType', 'A', 'C', 'S', 'Staff', 'Cashier', 'Total', 'Void', 'Cancel', 'Refund');

		$data['total_users'] = $total_users;
		$data['total_users_str'] = 'Admin [ ' . $admin_users . ' ] | Cashier [ ' . $cashier_users . ' ] | Staff [ ' . $staff_users . ' ]';

		$data['void_total'] = $void_total;

		$this->load->library('MYPDF');
		$this->load->view('reports/makepdf_users_view', $data);
	}

	// Load table data from file
	public function LoadData() 
	{
		$list = $this->users->get_api_datatables();
		$data = array();

		foreach ($list as $users) {
		    $row = array();

		    $row[] = 'U' . $users->user_id;
		    $row[] = $users->username;

		    // check if the user is admin
			if ($users->administrator == 1)
			{
				$row[] = 'ADMIN';
			}
			else if ($users->cashier == 1)
			{
				$row[] = 'CASHIER';
			}
			else
			{
				$row[] = 'STAFF';
			}


		    $is_admin = $users->administrator;
		    $is_cashier = $users->cashier;
		    $is_staff = $users->staff;

		    if ($is_admin == 1)
	    	{ 
	    		$row[] = 'Y'; 
	    	}
		    else
		    { 
		    	$row[] = 'N'; 
		    }

		    if ($is_cashier == 1)
		    { 
		    	$row[] = 'Y'; 
			}
		    else
		    { 
		    	$row[] = 'N'; 
			}

		    if ($is_staff == 1)
		    { 
		    	$row[] = 'Y'; 
		    }
		    else
		    { 
		    	$row[] = 'N'; 
		    }

		    $staff_trans_count = $this->transactions->get_count_trans_staff($users->user_id);
		    $cashier_trans_count = $this->transactions->get_count_trans_cashier($users->user_id);
		    $total_trans_count = ($staff_trans_count + $cashier_trans_count);

		    $row[] = $staff_trans_count;
		    $row[] = $cashier_trans_count;
		    $row[] = $total_trans_count;

		    $row[] = $this->trans_logs->get_total_void_by_user($users->username);
		    
		    $row[] = $this->trans_logs->get_total_cancelled_by_user($users->username);

		    $row[] = $this->trans_logs->get_total_refunded_by_user($users->username);

		    $data[] = $row;
		}

		return $data;
	}

}
