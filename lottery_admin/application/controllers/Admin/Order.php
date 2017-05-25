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

		$where = array();
		$Betting_list = $this->Betting_model->get_list($where);
		foreach ($Betting_list as &$value) {
			$value['uid'] = $this->User_model->get(array('id' => $value['uid']))['username'];
			$value['from_lottery'] = $this->Lottery_model->get(array('id' => $value['from_lottery']))['name'];
			$value['from_game_rule'] = $this->Game_rule_model->get(array('id' => $value['from_game_rule']))['name'];
			
			switch ($value['state']) {
				case 0 : $value['state'] = '<span class="label">未开奖</span>';break;
				case 1 : $value['state'] = '<span class="label success">已开奖</span>';break;
			}
		}
		Loader::view(array('order/betting') , array(
			'Betting_list' => $Betting_list,
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

		$where = array();
		$Recharge_list = $this->Recharge_model->get_list($where);
		foreach ($Recharge_list as &$value) {
			$value['uid'] = $this->User_model->get(array('id' => $value['uid']))['username'];
			
			switch ($value['state']) {
				case 0 : $value['state'] = '<span class="label">正常</span>';break;
				case 1 : $value['state'] = '<span class="label success">成功</span>';break;
				case 2 : $value['state'] = '<span class="label danger">超时</span>';break;
			}
		}

		Loader::view(array('order/recharge') , array(
			'Recharge_list' => $Recharge_list,
			'list_count' => $this->Recharge_model->get_count($where)
		));
	}
}
