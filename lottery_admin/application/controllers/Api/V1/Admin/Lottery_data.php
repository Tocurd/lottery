<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Lottery_data extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Admin_group_model');
		$this->load->model('Lottery_data_model');
		$this->load->model('Betting_model');
		$this->load->model('Game_rule_model');
	}
	public function _remap($method){
		Admin::is_login(false , "Admin_user/{$method}");
		$this->$method();
	}



	
	public function open(){
		extract(Autumn::params(array('id')));
		$Lottery_data = $this->Lottery_data_model->get(array('id' => $id));
		if( ! isset($Lottery_data['from_lottery'])) Autumn::end(false , '您输入的开奖数据不存在');
		$is_ok = false;

		

		$winning_number = str_split($Lottery_data['data'] , 1);


		$where = array(
			'day' => $Lottery_data['day'],
			'from_lottery' => $Lottery_data['from_lottery'],
			'from_lottery_time_id' => $Lottery_data['from_time_id'],
		);
		$Betting_data = $this->Betting_model->get_list($where);

		foreach($Betting_data as $key => $value) {
			$Song_game_rule_data = $this->Game_rule_model->get(array('id' => $value['from_game_rule']));
			$Top_game_rule_data = $this->Game_rule_model->get(array('id' => $Song_game_rule_data['from_group']));
			$Top_game_rule_data = $this->Game_rule_model->get(array('id' => $Top_game_rule_data['from_group']));

			
			$number = json_decode($value['number']);
			$winning_money = 0;


			if($Top_game_rule_data['byid'] == 'shishicai'){
				if($Song_game_rule_data['byid'] == 'five_location'){
					$is_ok = true;
					foreach ($number as $number_key => $number_value) {
						if(in_array($winning_number[$number_key] , $number_value)){
							$winning_money += $Song_game_rule_data['highest_bonus'];
						}
					}

					$this->Betting_model->edit(array('id' => $value['id']) , array(
						'winning_money' => $winning_money,
						'winning_state' => ($winning_money > 0 ? 1 : 0) 
					));

				}
			}
		}



		if( ! $is_ok) Autumn::end(false , '无对应开奖策略，请联系管理员添加策略');
		Autumn::end(true);
	}
}

?>