<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Order extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('User_model');
	}


	/**
	 * 订单明细
	 * @return [type] [description]
	 */
	public function detail(){
		$this->load->model('Detail_model');
		$this->load->model('Lottery_model');
		$this->load->model('Game_rule_model');

		$where = array();
		$Detail_list = $this->Detail_model->get_list($where);
		foreach ($Detail_list as &$value) {
			$value['uid'] = $this->User_model->get(array('id' => $value['uid']))['username'];
			$value['from_lottery'] = $this->Lottery_model->get(array('id' => $value['from_lottery']))['name'];
			$value['from_game_rule'] = $this->Game_rule_model->get(array('id' => $value['from_game_rule']))['name'];
			

			$value['money'] = $value['money'] < 0 ? '<span class="label danger">' . $value['money'] . '</span>' : '<span class="label success"">' . $value['money'] . '</span>'; 
			

			$value['type'] = $this->config->item('actype')[$value['type']];
		
		}

		Loader::view(array('order/detail') , array(
			'Detail_list' => $Detail_list,
			'list_count' => $this->Detail_model->get_count($where)
		));
	}


	/**
	 * 投注订单
	 * @return [type] [description]
	 */
	public function betting(){
		$this->load->model('Betting_model');
		$this->load->model('Lottery_model');
		$this->load->model('Game_rule_model');
		$this->load->model('Lottery_time_model');

		$where = array();
		if(isset($_GET['type'])) $where['from_lottery'] = $_GET['type'];
		if(isset($_GET['periods'])){
			$time_list = $this->Lottery_time_model->get_list(array(
				'from_lottery' => $_GET['type'] ,
				'periods' => $_GET['periods'] ,
			) , 1 , 1 , array() , 'all');
			foreach ($time_list as $key => $value) {
				$this->Betting_model->or_where(array('from_lottery_time_id' => $value['id']));
			}

		}
		if(isset($_GET['order_id'])) $where['order_id'] = $_GET['order_id'];
		if(isset($_GET['username'])){
			$where['uid'] = $this->User_model->get(array('username' => $_GET['username']))['id'];
		}


		if(isset($_GET['start_time']) && isset($_GET['end_time'])){
			$where['create_time >='] = strtotime($_GET['start_time']);
			$where['create_time <='] = strtotime($_GET['end_time']);
		}



		$Betting_list = $this->Betting_model->get_list($where);
		foreach ($Betting_list as &$value) {

			$value['json'] = json_encode($value);
			$value['uid'] = $this->User_model->get(array('id' => $value['uid']))['username'];
			$value['from_lottery'] = $this->Lottery_model->get(array('id' => $value['from_lottery']))['name'];
			$value['from_game_rule'] = $this->Game_rule_model->get(array('id' => $value['from_game_rule']))['name'];

			$value['number'] = json_decode($value['number'] , true);
			foreach ($value['number'] as &$number_value) {
				$number_value = implode('', $number_value);
			}
			$value['number'] = implode(',', $value['number']);

			$value['from_lottery_time'] = $this->Lottery_time_model->get(array('id' => $value['from_lottery_time_id']));
			$value['from_periods'] = $this->Lottery_time_model->get(array('id' => $value['from_lottery_time_id']))['periods'];

			
			$value['pattern'] = array('元' , '角' , '分' , '厘')[$value['pattern']];
			switch ($value['state']) {
				case 0 : $value['state'] = '<span class="label">未开奖</span>';break;
				case 1 : $value['state'] = '<span class="label success">已开奖</span>';break;
			}

			$value['revoke'] = $value['revoke'] == 0 ? '<i class="fa fa-reply-all"></i>' : '<span class="label danger">已撤单</span>';
		}

		$this->load->model('Game_rule_model');
		$Game_rule_list = $this->Lottery_model->get_list(array() , 1 , 1 , array('name' , 'id') , 'all');

		Loader::view(array('order/betting') , array(
			'Betting_list' => $Betting_list,
			'Game_rule_list' => $Game_rule_list,
			'list_count' => $this->Betting_model->get_count($where)
		));
	}



	/**
	 * 提现页面
	 * @return [type] [description]
	 */
	public function withdrawals(){
		$this->load->model('Withdrawals_model');

		$where = array();
		$Withdrawals_list = $this->Withdrawals_model->get_list($where);
		foreach ($Withdrawals_list as &$value) {
			$value['uid'] = $this->User_model->get(array('id' => $value['uid']))['username'];
			
			switch ($value['state']) {
				case 0 : $value['state'] = '<span class="label">等待提现</span>';break;
				case 1 : $value['state'] = '<span class="label success">提现成功</span>';break;
				case 2 : $value['state'] = '<span class="label danger">拒绝提现</span>';break;
			}

			$value['json'] = json_encode($value);
		}
		Loader::view(array('order/withdrawals') , array(
			'Withdrawals_list' => $Withdrawals_list,
			'list_count' => $this->Withdrawals_model->get_count($where)
		));
	}



	/**
	 * 充值页面
	 * @return [type] [description]
	 */
	public function index(){
		$this->load->model('Recharge_model');
		$this->load->model('Config_model');

		$where = array();
		$Recharge_list = $this->Recharge_model->get_list($where);
		foreach ($Recharge_list as &$value) {
			$value['uid'] = $this->User_model->get(array('id' => $value['uid']))['username'];
			$value['json'] = json_encode($value);

			if($value['state'] != 1){
				if(strtotime($value['create_time']) < time() - ($this->Config_model->get_item('out_time') * 60)){
					$value['state'] = 2;
				}
			}
			switch ($value['state']) {
				case 0 : $value['state'] = '<span class="label">未支付</span>';break;
				case 1 : $value['state'] = '<span class="label success">已支付</span>';break;
				case 2 : $value['state'] = '<span class="label danger">超时订单</span>';break;
			}
		}

		Loader::view(array('order/recharge') , array(
			'Recharge_list' => $Recharge_list,
			'list_count' => $this->Recharge_model->get_count($where)
		));
	}
}
