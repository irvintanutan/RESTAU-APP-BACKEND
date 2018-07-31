<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Statistics_controller extends CI_Controller {
 
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Transactions/Transactions_model','transactions');

        $this->load->model('Products/Products_model','products');
        $this->load->model('Packages/Packages_model','packages');
        $this->load->model('Pack_details/Pack_details_model','pack_details');
        $this->load->model('Categories/Categories_model','categories');

        $this->load->model('Tables/Tables_model','tables');

        $this->load->model('Trans_details/Trans_details_model','trans_details');
        $this->load->model('Table_groups/Table_groups_model','table_groups');

        $this->load->model('Users/Users_model','users');
    }

    public function index()
    {						
        if($this->session->userdata('administrator') == '0')
        {
            redirect('error500');
        }

        // ========================= FOR CATEGORY PRODUCTS CHART ==================================================

        $cat_list = $this->categories->get_categories();

        $cat_array = array();

        $row = array();
        $row['cat_id'] = 0;
        $row['name'] = 'Packages';

        $cat_prod_count = $this->packages->count_all();
        $row['cat_prod_count'] = $cat_prod_count;
        $cat_prod_sales = $this->trans_details->get_sales_pack();
        $row['cat_prod_sales'] = $cat_prod_sales;

        $cat_array[] = $row;

        foreach ($cat_list as $categories) {
            
            $row = array();
            $row['cat_id'] = $categories->cat_id;
            $row['name'] = $categories->name;

            $cat_prod_count = $this->products->get_cat_prod_count($categories->cat_id);
            $row['cat_prod_count'] = $cat_prod_count;
            $cat_prod_sales = $this->trans_details->get_sales_by_cat($categories->cat_id);
            $row['cat_prod_sales'] = $cat_prod_sales;

            $cat_array[] = $row;
        }

        $data['cat_array'] = $cat_array;




        // ========================= FOR MONTHLY NET SALES CHART ==================================================


        $current_year = date('Y');

        $jan = $this->transactions->get_monthly_net_sales('01', $current_year);
        $feb = $this->transactions->get_monthly_net_sales('02', $current_year);
        $mar = $this->transactions->get_monthly_net_sales('03', $current_year);
        $apr = $this->transactions->get_monthly_net_sales('04', $current_year);

        $may = $this->transactions->get_monthly_net_sales('05', $current_year);
        $jun = $this->transactions->get_monthly_net_sales('06', $current_year);
        $jul = $this->transactions->get_monthly_net_sales('07', $current_year);
        $aug = $this->transactions->get_monthly_net_sales('08', $current_year);

        $sep = $this->transactions->get_monthly_net_sales('09', $current_year);
        $oct = $this->transactions->get_monthly_net_sales('10', $current_year);
        $nov = $this->transactions->get_monthly_net_sales('11', $current_year);
        $dec = $this->transactions->get_monthly_net_sales('12', $current_year);

        $year_total = ($jan + $feb + $mar + $apr + $may + $jun + $jul + $aug + $sep + $oct + $nov + $dec);



        $data['current_year'] = $current_year;

        $data['jan'] = $jan;
        $data['feb'] = $feb;
        $data['mar'] = $mar;
        $data['apr'] = $apr;

        $data['may'] = $may;
        $data['jun'] = $jun;
        $data['jul'] = $jul;
        $data['aug'] = $aug;

        $data['sep'] = $sep;
        $data['oct'] = $oct;
        $data['nov'] = $nov;
        $data['dec'] = $dec;

        $data['year_total'] = number_format($year_total, 2, '.', ',');

        $data['title'] = '<i class="fa fa-pie-chart"></i> <i class="fa fa-area-chart"></i> <i class="fa fa-bar-chart"></i> Statistics / Charts';
        $this->load->view('template/dashboard_header',$data);
        $this->load->view('statistics/statistics_view',$data);
        $this->load->view('template/dashboard_navigation');
        $this->load->view('template/dashboard_footer');

    }

    // public function ajax_list()
    // {
    // $list = $this->loans->get_datatables_top_list();
    // $data = array();
    // $no = $_POST['start'];
    // foreach ($list as $loans) {
    // $no++;
    // $row = array();
    // $row[] = 'C' . $loans->client_id;
    // $row[] = $this->clients->get_client_name($loans->client_id);

    // $row[] = number_format($loans->total_loans, 2, '.', ',');
    // $row[] = number_format($loans->paid, 2, '.', ',');
    // $row[] = number_format($loans->balance, 2, '.', ',');

    // $data[] = $row;
    // }

    // $output = array(
    // "draw" => $_POST['draw'],
    // "recordsTotal" => $this->loans->count_all_top_list(),
    // "recordsFiltered" => $this->loans->count_filtered_top_list(),
    // "data" => $data,
    // );
    // //output to json format
    // echo json_encode($output);
    // }

    }
