<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class lottery_data extends CI_Controller {
	public function __construct(){
		parent::__construct();

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
			if($this->Lottery_data_model->is_exist(array(
				'from_time_id' => $value['id'],
				'day' => $date
			))){
				$data = $this->Lottery_data_model->get(array(
					'from_time_id' => $value['id'],
					'day' => $date
				));
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
}
