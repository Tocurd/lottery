<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Lottery extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->output->enable_profiler(TRUE);
	}
	public function index(){
		$this->load->model('Game_rule_model');
		$this->load->model('Lottery_model');
		$this->load->model('Lottery_time_model');
		$this->load->model('Lottery_data_model');

		if( ! $this->Lottery_model->is_exist(array('id' => $this->input->get('id' , true)))) show_404();


		// 左侧导航栏
		$Game_rule_list = $this->Game_rule_model->get_list(array('type' => 0) , 1 , 1 , array() , 'all');
		foreach($Game_rule_list as &$value) {
			$value['lottery'] = $this->Lottery_model->get_list(array('from_group' => $value['id']) , 1 , 1 , array() , 'all');
		}

		// 游戏规则获取
		$Lottery_data = $this->Lottery_model->get(array('id' => $this->input->get('id')));
		$Game_rule_data = $this->Game_rule_model->get(array('id' => $Lottery_data['from_group']));
		$Game_rule_menu_list = $this->Game_rule_model->get_list(array(
			'from_group' => $Game_rule_data['id'],
			'type' => 1
		));

		foreach ($Game_rule_menu_list as &$Game_rule_menu_value) {
			$Game_rule_menu_value['song'] = $this->Game_rule_model->get_list(array(
				'from_group' => $Game_rule_menu_value['id'],
				'type' => 2
			), 1 , 1 , array() , 'all');
		}

		


		// 获取该彩票最近五期的开奖结果
		$date = date('H:i');
		$Lottery_time_data = $this->Lottery_time_model->get_list_by(array(
			'from_lottery' => $Lottery_data['id'],
			'timestamp <=' => strtotime(date("Y-m-d H:i:s")) - strtotime(date('Y-m-d'))
		) , 1 , 5 , array() , 'Not all' , array('timestamp' => 'desc'));


		foreach ($Lottery_time_data as &$Lottery_time_data_value) {
			$Lottery_time_data_value['byid'] = date('Ymd') . $Lottery_time_data_value['periods'];
			$Lottery_time_data_value['data'] = $this->Lottery_data_model->get(array(
				'from_time_id' => $Lottery_time_data_value['id'],
				'day' => date('Y-m-d')
			))['data'];
			$Lottery_time_data_value['a'] = $Lottery_time_data_value['data'][0];
			$Lottery_time_data_value['b'] = $Lottery_time_data_value['data'][1];
			$Lottery_time_data_value['c'] = $Lottery_time_data_value['data'][2];
			$Lottery_time_data_value['d'] = $Lottery_time_data_value['data'][3];
			$Lottery_time_data_value['e'] = $Lottery_time_data_value['data'][4];
		}


		print_r($Lottery_data);





		Loader::view(array('lottery') , array(
			'Game_rule_list' => $Game_rule_list,
			'Game_rule_data' => $Game_rule_data,
			'Lottery_data' => $Lottery_data,
			'Game_rule_menu_list' => $Game_rule_menu_list,
			'Lottery_time_data' => $Lottery_time_data,
			'Now_lottery' => $Lottery_time_data[0],
		) , 'home');
	}
}