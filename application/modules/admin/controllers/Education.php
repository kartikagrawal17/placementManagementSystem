<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Education extends MX_Controller {

    function __construct() {
        parent::__construct();
        Modules::run("admin/admin_ini/admin_ini");
        $this->load->model("Education_model");
    }

    public function index()
    {
        $view_data['result']=$this->Education_model->index();
        $view_data['tab'] = "education";
        $view_data['educations'] = $this->Education_model->get_education();
        $data['page_data'] = $this->load->view('education/education', $view_data, TRUE);
        echo Modules::run(ADMIN_TEMPLATE, $data);
    }

    function ajax_education_list() {
        $this->Education_model->ajax_education_list();
    }

}