<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MX_Controller {

    function __construct() {
        parent::__construct();
        Modules::run("admin/admin_ini/admin_ini");
    }

    public function index() {
        $view_data["tab"] = "dashboard";
        $data['page_data'] = $this->load->view('admin/dashboard/dashboard',$view_data,TRUE);
        echo Modules::run(ADMIN_TEMPLATE, $data);
    }

}
