<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Group extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Admin_user_model');
		$this->load->model('Admin_group_model');
		Admin::is_login();
	}
	public function index(){

		$Group_list = $this->Admin_group_model->get_list_by(array() , 1 , 10 ,  array() , "Not all" , $order_by = array('id' => 'asc'));
		foreach ($Group_list as &$value) {
			$value['state_text'] = $value['state'] == '0' ? '正常' : '封禁';
			$value['state'] = $value['state'] == '0' ? 'success' : 'danger';
			$value['group_state'] = $value['id'] == '1' ? 'danger' : '';
			$value['limit'] = $value['limit'] == 'all' ? '[]' : $value['limit'];

			$limitText = '';
			$limitConfig = $this->config->item('Jurisdiction');

			$limit = json_decode($value['limit'] , true);
			if(count($limit) > 0 && is_array($limit)){
				foreach ($limitConfig as $limitKey => $limitValue) {
					foreach ($limit as $limitValue_text) {
						$type = array_search($limitValue_text , $limitValue);
						if($type != false){
							$limitText .= $limitKey . $type . ' , ';
						}						
					}
				}
			}
			$value['limit_trun'] = $value['limit'] == 'all' ? '全部权限' : $limitText;

		}
		Loader::view(array('admin_user/group') , array(
			'list_count' =>  $this->Admin_group_model->get_count() ,
			'Group_list' => $Group_list
		));
	}
}
