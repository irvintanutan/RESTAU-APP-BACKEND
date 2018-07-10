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

        $data['title'] = 'Dashboard';	
        $this->load->view('template/dashboard_header',$data);
        $this->load->view('template/dashboard_body',$data);
        $this->load->view('template/dashboard_navigation');
        $this->load->view('template/dashboard_footer');

    }

    SELECT distinct trans_details.prod_id as prod_id, trans_details.pack_id as pack_id, SUM(trans_details.qty) as sold from trans_details INNER JOIN transactions ON trans_details.trans_id = transactions.trans_id WHERE trans_details.prod_type != 2 and transactions.status = "CLEARED" and transactions.datetime >= "2018-07-01 00:00:00" and transactions.datetime <= "2018-07-10 23:59:59" group by trans_details.prod_id, trans_details.pack_id order by sold desc

    public function ajax_list()
    {
        $list = $this->trans_details->get_datatables_sold_today();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $trans_details) {
            $no++;
            $row = array();

            $prod_id = $trans_details->prod_id;
            $pack_id = $trans_details->pack_id;
            $sold = $trans_details->sold;

            $row[] = 'P' . $trans_details->prod_id;
            $row[] = $this->clients->get_client_name($trans_details->client_id);

            $row[] = number_format($trans_details->total_trans_details, 2, '.', ',');
            $row[] = number_format($trans_details->paid, 2, '.', ',');
            $row[] = number_format($trans_details->balance, 2, '.', ',');
 
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
