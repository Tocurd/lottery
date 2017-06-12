<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Order_betting extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Admin_group_model');
		$this->load->model('Lottery_time_model');
		$this->load->model('Betting_model');
		$this->load->model('User_model');
	}
	public function _remap($method){
		Admin::is_login(false , "Order_betting/{$method}");
		$this->$method();
	}


	public function Revoke(){
		$params = Autumn::params(array('id'));
		extract($params);
		$Betting_data = $this->Betting_model->get(array('id' => $id));
		$User_data = $this->User_model->get(array('id' => $Betting_data['uid']));
		if($Betting_data['revoke'] == 1){
			Autumn::end(false , '该订单已撤单，无法继续撤单');
		}
		if($Betting_data['state'] == 1){
			Autumn::end(false , '该订单已开奖，无法继续撤单');
		}

		$this->User_model->edit(array('id' => $User_data['id']) , array(
			'money' => $User_data['money'] + $Betting_data['money']
		));

		$this->Betting_model->edit(array('id' => $id) , array(
			'revoke' => 1
		));

		Autumn::end(true);
	}
}

?>