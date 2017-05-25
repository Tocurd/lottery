<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Home extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Admin_user_model');
		$this->load->model('Admin_group_model');
		Admin::is_login();
	}

	
	public function index(){

		$page = isset($_GET['page']) ? $this->input->get('page') : 1;
		if($_SESSION['admin_user']['group'] == '1'){
			$where = array();
			$User_list = $this->Admin_user_model->get_list_by($where , $page , 10 ,  array() , "Not all" , array('id' => 'asc'));
		}else{

			// 是否有查看别人用户权限
			// 有的话显示同组下的所有人
			$where = limit::check('admin_user_view') ? array(
				'group' => $_SESSION['admin_user']['group']
			) : array(
				'id' => $_SESSION['admin_user']['id']
			);
			$User_list = $this->Admin_user_model->get_list_by($where , $page , 10 ,  array() , "Not all" , array('id' => 'asc'));
		}



		$Group_list = $this->Admin_group_model->get_list_by(array() , 1 , 10 ,  array() , "all" ,array('id' => 'asc'));
		foreach ($User_list as &$value) {
			$value['group_id'] = $value['group'];
			$value['state_id'] = $value['state'];
			
			$value['state_text'] = $value['state'] == '0' ? '正常' : '封禁';
			$value['state'] = $value['state'] == '0' ? 'success' : 'danger';

			$value['group_data'] = $this->Admin_group_model->get(array(
				'id' => $value['group']
			));
			$value['group_text'] = $value['group_data']['name'];
			$value['group'] = $value['group'] == '1' ? 'danger' : '';

			if($value['LostTime'] == '' || $value['LostTime'] == 0){
				$value['LostTime'] = '从未登录';
			}else{
				$value['LostTime'] = date('Y-m-d H:i:s' , $value['LostTime']);
			}
			if($value['LostIp'] == '' || $value['LostIp'] == 0) $value['LostIp'] = '从未登录';
			
		}

		Loader::view(array('admin_user/home') , array(
			'list_count' =>  $this->Admin_user_model->get_count($where) ,
			'User_list' => $User_list ,
			'Group_list' => $Group_list ,
		));
	}
}
