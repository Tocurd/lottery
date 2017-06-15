<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Lottery_data extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Admin_group_model');
		$this->load->model('Lottery_data_model');
		$this->load->model('Betting_model');
		$this->load->model('Game_rule_model');
		$this->load->model('Lottery_model');
	}
	public function _remap($method){
		Admin::is_login(false , "Admin_user/{$method}");
		$this->$method();
	}


	public function edit(){
		extract(Autumn::params(array('id' , 'number')));
		$Lottery_data = $this->Lottery_data_model->get(array('id' => $id));
		if( ! isset($Lottery_data['from_lottery'])) Autumn::end(false , '您输入的开奖数据不存在');


		$Top_game_rule_data = $this->Lottery_model->get(array('id' => $Lottery_data['from_lottery']));
		$Top_game_rule_data = $this->Game_rule_model->get(array('id' => $Top_game_rule_data['from_group']));

		if(strlen($number) > $Top_game_rule_data['count']){
			Autumn::end(false , '想搞事情？输入的那么大的长度干嘛？');
		}

		if($Lottery_data['state'] == 2){
			Autumn::end(false , '你对已经开奖的数据进行编辑，是不是想搞事情？');
		}

		$Lottery_data = $this->Lottery_data_model->edit(array('id' => $id) , array(
			'data' => $number,
			'manual_lottery' => 1
		));
		Autumn::end(true);
	}


	
	public function open($id = ''){
		if(isset($_POST['id'])) extract(Autumn::params(array('id')));

		$Lottery_data = $this->Lottery_data_model->get(array('id' => $id));
		if( ! isset($Lottery_data['from_lottery'])) Autumn::end(false , '您输入的开奖数据不存在');
		$is_ok = false;


		if($Lottery_data['state'] == 2){
			Autumn::end(false , '您要开奖的数据，已经开过奖了。');
		}

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




			$len = strlen($value['pattern_money']) - 2;
			$len = $len <= 0 ? 0 : $len;
			$len = (($len * 10) <= 0 ? 0 : ($len));
			$len = '1' . str_pad('' , $len , '0');

			$item_notes_money = ($Song_game_rule_data['highest_bonus'] / $len) * $value['multiple'];

			if($Top_game_rule_data['byid'] == 'shishicai'){


				// 定位胆
				if($Song_game_rule_data['byid'] == 'five_location'){
					$is_ok = true;
					foreach ($number as $number_key => $number_value) {
						if(in_array($winning_number[$number_key] , $number_value)) $winning_money += $item_notes_money;
					}
				}


			}


			$this->Betting_model->edit(array('id' => $value['id']) , array(
				'winning_money' => $winning_money,
				'winning_state' => ($winning_money > 0 ? 1 : 0),
				'state' => 2,
			));
		}



		
		$this->Lottery_data_model->edit(array('id' => $id) , array(
			'state' => 2,
			'manual_lottery' => 1
		));
		// if( ! $is_ok) Autumn::end(false , '无对应开奖策略，或无任何号码投注，请联系管理员添加策略');
		Autumn::end(true);
	}
}

?>