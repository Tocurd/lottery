<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Withdrawals extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->model("Withdrawals_model");
		$this->load->model("User_model");
	}
	
	public function _remap($method){
		Admin::is_login(false , "Withdrawals/{$method}");
		$this->$method();
	}



	public function trash(){
		extract(Autumn::params(array('id')));
		$Order_data = $this->Withdrawals_model->get(array('id' => $id));
		if( ! isset($Order_data['id'])) Autumn::end(false , '您操作的订单不存在');
		$this->Withdrawals_model->remove(array('id' => $id));
		Autumn::end(true);
	}

	public function remove_all(){
		extract(Autumn::params(array('id')));

		$this->Withdrawals_model->remove("`id` in (" . implode(',' , $id) . ")");
		Autumn::end(true);
	}




	public function check(){
		extract(Autumn::params(array('id' , 'type')));
		
		$Withdraw_data = $this->Withdrawals_model->get(array('id' => $id));
		$User_data = $this->User_model->get(array('id' => $Withdraw_data['uid']));
		if($Withdraw_data['state'] == 2){
			Autumn::end(false , '已经拒绝提现的用户将无法再进行操作');
		}
		if($type == '0'){
			$this->Withdrawals_model->edit(array('id' => $id) , array(
				'finishtime' => date('Y-m-d H:i:s'),
				'state' => 1
			));
		}else{
			if($Withdraw_data['state'] != 2){
				$this->User_model->edit(array('id' => $Withdraw_data['uid']) , array(
					'money' => $User_data['money'] + $Withdraw_data['money']
				));
			}

			$this->Withdrawals_model->edit(array('id' => $id) , array(
				'state' => 2
			));
		}

		Autumn::end(true);
	}
}
