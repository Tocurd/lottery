<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Order extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->model('User_model');
		$this->load->model('Recharge_model');
		$this->load->model('Config_model');
		$this->load->model('Withdrawals_model');
	}
	
	
	public function bullseye(){
		if( ! Admin::is()) Autumn::end(false , 'notLogin');
		extract(Autumn::params(array('id')));
		
		$Recharge_data = $this->Recharge_model->get(array('id' => $id));
		if($Recharge_data['status'] != '2' || $Recharge_data['payno'] == '0'){
			Autumn::end(false  , '订单还未支付，或请勿重复操作分红');

		}
		
		$User_data = $this->User_model->get(array('id' => $Recharge_data['uid']));
		$Parent_data = $this->User_model->get(array('id' => $User_data['parent']));
		
		$this->Recharge_model->edit(array('id' => $id) , array('payno' => '0'));
		if( isset($Parent_data['userType']) && $Parent_data['userType'] == '2'){
			$level = $Recharge_data['point'];
			
			
			$money = round($Recharge_data['fee'] * ($level / 100) , 2);

			$this->User_model->edit(array('id' => $Parent_data['id']) , array(
				'point' => $Parent_data['point'] + $money
			));

			$this->Recharge_model->edit(array('id' => $Recharge_data['id']) , array(
				'payno' => 0
			));

			
		}else{
			Autumn::end(false  , '该用户没有上级代理');
		}
		Autumn::end(true);

	}
	
	public function remove_check(){
		if( ! Admin::is()) Autumn::end(false , 'notLogin');
		extract(Autumn::params(array('id')));
		$this->Recharge_model->edit(array('id' => $id) , array('payno' => '-1'));

		Autumn::end(true);
	}


	/**
	 * 心跳检查
	 * @return [type] [description]
	 */
	public function check(){
		if( ! Admin::is()) Autumn::end(false , 'notLogin');
		$out_time = time() - ($this->Config_model->get_item('out_time') * 60);
		$count = $this->Recharge_model->get_count(array(
			'unix_timestamp(`tradetime`) >' => $out_time,
			'status' => 1
		));
		$atm_count = $this->Withdrawals_model->get_count(array(
			'status' => 1
		));

		$alipay = $this->Config_model->get_item('alipay');
		$wxpay = $this->Config_model->get_item('wxpay');

		Autumn::end(true , '' , array(
			'voice_order' => $count > 0 ,
			'voice_atm' => $atm_count > 0 ,
			'software' => array(
				'alipay' => (time() - $alipay)  > 40,
				'wxpay' => (time() - $wxpay) > 40,
			)
		));
	}



	public function success(){
		extract(Autumn::params(array('id')));
		$Recharge_data = $this->Recharge_model->get(array('id' => $id));
		$User_data = $this->User_model->get(array('id' => $Recharge_data['uid']));
		if( ! isset($Recharge_data['id'])) Autumn::end(false , '您操作的订单不存在');


		if($Recharge_data['state'] == 1) Autumn::end(false , '您操作的订单已经到账');
		$out_times = $this->Config_model->get_item('out_time') * 60;
		$this->Recharge_model->edit(array('id' => $id) , array(
			'finishtime' => date('Y-m-d H:i:s'),
			'state' => 1,
		));

		$this->User_model->edit(array('id' => $Recharge_data['uid']) , array(
			'money' => $User_data['money'] + (floor($Recharge_data['money']) * $this->Config_model->get_item('money'))
		));


		$money = $Recharge_data['money'];
		$User_data = $this->User_model->get(array('id' => $Recharge_data['uid']));
		



		Autumn::end(true);
	}


	public function remove(){
		extract(Autumn::params(array('id')));
		$Recharge_data = $this->Recharge_model->get(array('id' => $id));
		if( ! isset($Recharge_data['id'])) Autumn::end(false , '您操作的订单不存在');
		$this->Recharge_model->remove(array('id' => $id));
		Autumn::end(true);
	}

	public function remove_all(){
		extract(Autumn::params(array('id')));

		$this->Recharge_model->remove("`id` in (" . implode(',' , $id) . ")");
		Autumn::end(true);
	}
}
