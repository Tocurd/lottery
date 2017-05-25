<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Lottery_time extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Admin_group_model');
		$this->load->model('Lottery_time_model');
	}
	public function _remap($method){
		Admin::is_login(false , "Admin_user/{$method}");
		$this->$method();
	}



	/**
	 * 编辑开奖时间
	 * @return [type] [description]
	 */
	public function edit(){
		$params = Autumn::params(array('id' , 'time'));
		Rule::check($params , array(
			'time' => array('max' => 5 , 'min' => 5 , 'name' => '开奖时间'),
		) , true);
		extract($params);


		$this->Lottery_time_model->edit(array('id' => $id) , array(
			'time' => $time,
			'timestamp' => strtotime(date("Y-m-d H:i:s" , strtotime($time))) - strtotime(date('Y-m-d'))
		));


		Autumn::end(true);
	}
}

?>