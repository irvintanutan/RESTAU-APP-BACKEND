<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        // $this->load->model('clients/clients_model','clients');

    }

    public function index()
    {						
        if ($this->session->userdata('user_id') == '')
    {
        redirect('error500');
    }

        // get today's date and yesterday
        $today = date('Y-m-d');

        $data['title'] = 'Dashboard';	
        $this->load->view('template/dashboard_header',$data);
        $this->load->view('template/dashboard_body',$data);
        $this->load->view('template/dashboard_navigation');
        $this->load->view('template/dashboard_footer');

    }
}
