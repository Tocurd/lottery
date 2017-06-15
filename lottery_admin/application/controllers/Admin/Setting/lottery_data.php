<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class lottery_data extends CI_Controller {
	public function __construct(){
		parent::__construct();

		$this->load->model('Betting_model');
		$this->load->model('Lottery_model');
		$this->load->model('Lottery_data_model');
		$this->load->model('Lottery_time_model');
	}
	public function index(){
		$Lottery_list = $this->Lottery_model->get_list(array() , 0 , 0 , array('name' , 'id') , 'all');
		$from_lottery = isset($_GET['from_lottery']) ? htmlspecialchars($this->input->get('from_lottery')) : $Lottery_list[0]['id'];
		$page = isset($_GET['page']) ? $this->input->get('page' , true) : 1;


		$date = date('Y-m-d');
		$time = strtotime(date('Y-m-d'));
		$Lottery_time_list = $this->Lottery_time_model->get_list_by(array(
			'from_lottery' => (int) $from_lottery,
		) , $page , 14 , array() , 'Not all', array(
			'time' => 'asc',
			'periods' => 'asc'
		));




		$Lottery_data_list = array();
		$Lottery_data = $this->Lottery_model->get(array('id' => $from_lottery));
		foreach ($Lottery_time_list as &$value) {
			$value['from_lottery'] = $Lottery_data;
			$value['name'] = $value['from_lottery']['name'];
			$value['lottery_time'] = date('Y-m-d H:i:s' , strtotime($value['time']));
			$value['day'] = date('Y-m-d');
			$value['order_count'] = '---';
			$value['send_lottery_count'] = '---';
			$value['winning_count'] = '---';
			$value['participate_count'] = '---';
			$value['betting_money'] = '---';
			$value['winning_money'] = '---';
			$value['rebate_money'] = '---';
			$value['profit_loss'] = '---';
			$value['data'] = '---';


			if($value['periods'] == '120'){
				$data = $this->data(array(
					'from_time_id' => $value['id'],
					'periods' => 120,
					'day' => date('Ymd' , strtotime($date) - 86400)
				) , $value);
				array_push($Lottery_data_list , $data);
			}else if($this->Lottery_data_model->is_exist(array(
				'from_time_id' => $value['id'],
				'day' => $date
			))){
				$data = $this->data(array(
					'from_time_id' => $value['id'],
					'day' => $date
				) , $value);
				array_push($Lottery_data_list , $data);
			}else{
				$value['state'] = '<span class="label">未开奖</span>';
				array_push($Lottery_data_list , $value);
			}
		}





		Loader::view(array('setting/lottery_data') , array(
			'Lottery_list' => $Lottery_list,
			'list_count' => $this->Lottery_time_model->get_count(array(
				'from_lottery' => (int) $from_lottery
			)),
			'Lottery_data_list' => $Lottery_data_list
		));
	}




	private function data($where = array() , $value){
		$data = $this->Lottery_data_model->get($where);
		$data['periods'] = $value['periods'];
		$data['name'] = $value['from_lottery']['name'];
		$data['lottery_time'] = $value['lottery_time'];
		$data['day'] = date('Y-m-d' , strtotime($data['day']));
		switch ($data['state']) {
			case '0' : $data['state'] = '<span class="label">未开奖</span>';break;
			case '1' : $data['state'] = '<span class="label danger">摇奖中</span>';break;
			case '2' : $data['state'] = '<span class="label success">已开奖</span>';break;
		}


		// 计算相关的数据
		$where = array('day' => $data['day'] , 'from_lottery_time_id' => $data['from_time_id'],'from_lottery' => $data['from_lottery']);
		$data['order_count'] = $this->Betting_model->get_count($where);
		$data['send_lottery_count'] = $this->Betting_model->get_count(array_merge($where , array('sendprize_state' => 1)));
		

		// 中奖订单数量
		$data['winning_count'] = $this->Betting_model->get_count(array_merge($where , array('winning_state' => 1)));
		

		// 参与人数
		$this->Betting_model->group_by('uid');
		$data['participate_count'] = $this->Betting_model->get_count($where);


		// 总金额
		$this->Betting_model->select_sum('money');
		$data['betting_money'] = $this->Betting_model->get($where)['money'];


		// 中奖金额
		$this->Betting_model->select_sum('winning_money');
		$data['winning_money'] = $this->Betting_model->get($where)['winning_money'];


		// 返点金额
		$this->Betting_model->select_sum('rebate_money');
		$data['rebate_money'] = $this->Betting_model->get($where)['rebate_money'];


		// 盈亏
		$data['profit_loss'] = $data['betting_money'] - $data['winning_money'] - $data['rebate_money'];

		//manual_lottery
		if($data['manual_lottery'] <= 0){
			$data['manual_lottery'] = '<lable class="label">机器开奖</lable>';
		}else{
			$data['manual_lottery'] = '<lable class="label success">需要手动</lable>';
		}
		

		if($data['order_count'] <= 0) $data['order_count'] = '<span style="color:#bbb">---</span>';
		if($data['send_lottery_count'] <= 0) $data['send_lottery_count'] = '<span style="color:#bbb">---</span>';
		if($data['winning_count'] <= 0) $data['winning_count'] = '<span style="color:#bbb">---</span>';
		if($data['participate_count'] <= 0) $data['participate_count'] = '<span style="color:#bbb">---</span>';
		if($data['betting_money'] <= 0) $data['betting_money'] = '<span style="color:#bbb">---</span>';
		if($data['winning_money'] <= 0) $data['winning_money'] = '<span style="color:#bbb">---</span>';
		if($data['rebate_money'] <= 0) $data['rebate_money'] = '<span style="color:#bbb">---</span>';


		$data['profit_loss'] = $data['profit_loss'] >= 0 ? "<span class='label success'>{$data['profit_loss']}</span>" : "<span class='label danger'>{$data['profit_loss']}</span>";
		return $data;
	}

}
