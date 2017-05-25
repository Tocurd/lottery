<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class User extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('User_model');
	}
	public function index(){
		$where = array();
		if(isset($_GET['search'])){
			if(isset($_GET['username'])) $where['username'] = $this->input->get('username');
			if(isset($_GET['source'])) $where['source'] = $this->input->get('source');
			if(isset($_GET['type'])) $where['type'] = $this->input->get('type');
			if(isset($_GET['regtime'])) $where['regtime >='] = strtotime(date("Y-m-d" , strtotime($this->input->get('regtime'))));
			if(isset($_GET['regtime'])) $where['regtime <='] = strtotime(date("Y-m-d" , strtotime($this->input->get('regtime')))) + 86400;
		}
		$User_list = $this->User_model->get_list($where);
		foreach ($User_list as &$value) {
			$value['json'] = json_encode($value);
			$value['type'] = $value['type'] == '0' ? '<span class="label success">会员</span>' : '<span class="label danger">代理</span>';
			$value['state'] = $value['state'] == '0' ? '<span class="label success">正常</span>' : '<span class="label danger">封禁</span>';
			$value['source'] = $value['state'] == '0' ? '<span class="label success">正常</span>' : '<span class="label danger">封禁</span>';
			switch ($value['source']) {
				case 0:
					$value['source'] = '后台添加';
				break;
				
			}
		}

		Loader::view(array('User') , array(
			'User_list' => $User_list
		));
	}
}
