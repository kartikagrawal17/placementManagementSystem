<?php

class Users_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function get_education() {
        $this->db->where('status', 1);
        return $this->db->get('educations')->result_array();
    }

    function get_educational_detail() {
        
    }

    function index($type) {
        $input = $this->input->post();
        if (isset($_GET["id"]) && $_GET["id"]) {
            $this->db->where('id', $_GET["id"]);
            $return['users'] = $this->db->get("users")->row_array();

            $this->db->select('ued.*,edu.title as edu_title');
            $this->db->where('user_id', $_GET["id"]);
            $this->db->where('ued.status', 1);
            $this->db->join('educations edu', 'edu.id=ued.education_id AND edu.status=1');
            $return['educational'] = $this->db->get('user_educational_detail ued')->result_array();

            return $return;
        }
        if ($input) {
            if (isset($input["id"])) {
                $user_info = array(
                    'name' => $input['name'],
                    'email' => $input['email'],
                    'mobile' => $input['mobile'],
                    'stream' => $input['stream'],
                    'skills' => $input['skills'],
                    'batch' => $input['batch'],
                    'user_type' => $type
                );
                if (isset($input["password"]) && $input["password"]) {
                    $user_info["password"] = md5($input["password"]);
                }
                $this->db->where("id", $input["id"]);
                $this->db->update("users", $user_info);
                
                foreach ($input['education_id'] as $key => $value) {
                    $sub = array(
                        'education_id' => $input['education_id'][$key],
                        'marks' => $input['marks'][$key],
                        'max_marks' => $input['max_marks'][$key],
                        'roll_no' => $input['roll_no'][$key]
                    );

                    $this->db->where('id', $input['edu_ids'][$key]);
                    $this->db->update("user_educational_detail", $sub);
                }
            } else {
                $user_info = array(
                    'name' => $input['name'],
                    'email' => $input['email'],
                    'mobile' => $input['mobile'],
                    'password' => md5($input['password']),
                    'stream' => $input['stream'],
                    'skills' => $input['skills'],
                    'user_type' => $type,
                    'status' => 1
                );

                $this->db->insert('users', $user_info);
                $id = $this->db->insert_id();

                $education = array();
                foreach ($input['education_id'] as $key => $value) {
                    $sub = array(
                        'user_id' => $id,
                        'education_id' => $input['education_id'][$key],
                        'marks' => $input['marks'][$key],
                        'max_marks' => $input['max_marks'][$key],
                        'roll_no' => $input['roll_no'][$key],
                        'created' => time(),
                        'status' => 1,
                    );
                    $education[] = $sub;
                }
                $this->db->insert_batch('user_educational_detail', $education);
            }
        }
        return [];
    }

    function ajax_user_list($type) {
        $request = $_REQUEST;
//        pre($request);die;;
//        $sorting = array(
//            "name"=>'name'
//        );

        $this->db->where('user_type', $type);
        $count = $this->db->get('users')->num_rows();
        $where = " AND user_type=" . $type;

        $sql = "select * from users where 1 " . $where . " limit " . $request['start'] . "," . $request['length'];
        $result = $this->db->query($sql)->result_array();

        $draw_data = array();
        $start = (int) $request['start'];
        foreach ($result as $re) {
            $draw = array();
            $draw[] = ++$start;
            $draw[] = $re['name'];
            $draw[] = $re['appeared_in'];
            $draw[] = $re['stream'];
            $draw[] = "<a class='btn btn-success btn-xs' href='" . ADMIN_URL . "users/index?id=" . $re['id'] . "'>Edit</a>";
            $draw_data[] = $draw;
        }
        echo json_encode(array(
            "draw" => 10,
            "recordsTotal" => 10,
            "recordsFiltered" => $count,
            "data" => $draw_data
        ));
    }

    function get_invigilator() {
        $this->db->where('status', 1);
        return $this->db->get('users')->result_array();
    }

    function ajax_invigilator_list($type) {
        $request = $_REQUEST;
//        pre($request);die;;
//        $sorting = array(
//            "name"=>'name'
//        );
        $count = $this->db->get('users')->num_rows();
        $sql = "select * from users where status=1 and user_type=2 " . " limit " . $request['start'] . "," . $request['length'];
        $result = $this->db->query($sql)->result_array();

        $draw_data = array();
        foreach ($result as $re) {
            $draw = array();
            $draw[] = ++$request['start'];
            $draw[] = "<a href='google.com' target='_blank'>" . $re['name'] . "</a>";
            $draw[] = $re['email'];
            $draw[] = $re['mobile'];
            $draw[] = "<a class='btn btn-success btn-xs' href='" . ADMIN_URL . "invigilator/index?id=" . $re['id'] . "'>Edit</a>";
            $draw_data[] = $draw;
        }
        echo json_encode(array(
            "draw" => $count,
            "recordsTotal" => $count,
            "recordsFiltered" => $count,
            "data" => $draw_data
        ));
    }

}
