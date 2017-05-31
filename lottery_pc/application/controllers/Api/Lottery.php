<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Lottery extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Game_rule_model');
		$this->load->model('Lottery_model');
		$this->load->model('Lottery_time_model');
		$this->load->model('Lottery_data_model');
		$this->load->model('Betting_model');

	}





	public function betting(){
		Rule::check(Autumn::params(array('byid' , 'lottery_id')) , array(
			'byid' => array('is_number' => true , 'name' => '彩票编号') ,
			'lottery_id' => array('is_number' => true , 'name' => '彩票编号') ,
		) , true);
		extract(Rule::reslut());

		$money = 0;
		$Betting_list = array();


		// 检查选择的彩票期数是否已经停止投注或者超时
		$time = strtotime(date('Y-m-d H:i:s')) - strtotime(date('Y-m-d'));
		$Lottery_item_data = $this->Lottery_data_model->get(array('byid' => $byid));
		$Lottery_time_data = $this->Lottery_time_model->get(array('id' => $Lottery_item_data['from_time_id']));
		if($time >= $Lottery_time_data['timestamp']) Autumn::end(false , "您选择彩票期数【{$byid}】已经停止投注");
		


		$lottery = $this->input->post('lottery');
		if(count($lottery) <= 0) Autumn::end(false , '您还没有选择要投注的彩票');
		foreach ($lottery as $key => $value) {
			

			$Game_rule_data = $this->Game_rule_model->get(array('id' => $value['songIndex']));
			$Group_rule = $this->Game_rule_model->get(array('id' => $value['topIndex']));
			$Top_game_rule = $this->Game_rule_model->get(array('id' => $Group_rule['from_group']));
			if( ! isset($Game_rule_data['id']) ||  ! isset($Group_rule['id']) ||  ! isset($Top_game_rule['id'])){
				Autumn::end(false , '选择游戏规则不存在');
			}




			// 检查输入的模式
			$choose_money = array('元' => 2 , '角' => 0.2 , '分' => 0.02 , '厘' => 0.002);
			if( ! isset($choose_money[$value['type']])) Autumn::end(false , '您选择的模式不正确');
			if($value['lt_sel_times'] < 0) Autumn::end(false , '您输入的倍数不正确');





			// 创建最少行数及最少单行数目
			$data = explode('&&', str_replace("||" , '&&' , $Game_rule_data['rule']));
			$line = array('line' => count($data) , 'count' => 1);

			if($Top_game_rule['byid'] == 'shishicai'){
				if($Game_rule_data['byid'] == 'end_three_group_three') $line = array('line' => 1 , 'count' => 2);
				if($Game_rule_data['byid'] == 'end_three_group_six') $line = array('line' => 1 , 'count' => 3);
			}




			// 将投置的数字转换为数组
			$line_count = 0;
			$number_data = array();
			$number = explode(',' , $value['data']);


			if(count($number) > $Top_game_rule['count']) Autumn::end(false , '您输入的给彩票规则不正确1');


			foreach($number as $line_key => $number_value){
				$count = 0;
				$row = explode(' ', $number_value);
				array_push($number_data , $row);
				if(count($row) > 0) $line_count ++;


				// 对规范进行检测
				foreach ($data as $data_key => $data_value) {
					$data_rule = explode('=', $data_value);
					if($data_rule[0] == $line_key + 1){
						$count ++;
						if(count($row) < $line['count'] || count($row) > count(explode(',', $Game_rule_data['number']))) Autumn::end(false , '您输入的给彩票规则不正确1');
					}
				}
			
			}


			// 算出注数
			$custom = false;
			$noteNumber = 0;

			if($Top_game_rule['byid'] == 'shishicai'){
				if($Game_rule_data['byid'] == 'end_three_group_six'){
					$custom = true;
					$noteNumber = Bet::z6(implode('', $number_data[2]));
				}
				if($Game_rule_data['byid'] == 'end_three_group_three'){
					$custom = true;
					$noteNumber = Bet::z3(implode('', $number_data[2]));
				}
				if($Game_rule_data['byid'] == 'five_location'){
					$custom = true;
					foreach ($number_data as $params_data_key => $params_data_value) {
						foreach ($params_data_value as $as_key => $as_value) {
							$noteNumber += $as_value != '' ? 1 : 0;
						}
					}
				}
			}


			// 默认算法
			if($custom == false){
				$noteNumber = 1;
				foreach ($number_data as $params_data_key => $params_data_value) {
					$noteNumber *= count($params_data_value);
				}
			}
			

			if($value['lt_sel_nums'] != $noteNumber) Autumn::end(false , '您输入的彩票注数与系统计算的不一致');


			// 检查用户是否已经投注下单过相同的彩票注
			if($this->Betting_model->is_exist(array(
				'byid' => $byid,
				'from_lottery' => $lottery_id,
				'from_game_rule' => $Game_rule_data['id'],
				'number' => json_encode($number_data),
			))) Autumn::end(false , '您已经下单过相同注数的订单了');




			$money += (($noteNumber * $choose_money[$value['type']]) * $value['lt_sel_times']);
			array_push($Betting_list , array(
				'byid' => $byid,
				'uid' => $_SESSION['user']['id'],
				'order_id' => 'O' . date('Ymd') . rand(100000 , 999999),
				'create_time' => date('Y-m-d H:i:s'),
				'from_lottery' => $lottery_id,
				'from_game_rule' => $Game_rule_data['id'],
				'from_lottery_time_id' => $Lottery_time_data['id'],

				'pattern_money' => $choose_money[$value['type']],
				'pattern' => $value['type'],
				'multiple' => (int) $value['lt_sel_times'] ,
				'money' => (($noteNumber * $choose_money[$value['type']]) * $value['lt_sel_times']),
				'notes' => $noteNumber,
				'number' => json_encode($number_data),
			));

		}

	
		if(count($Betting_list) == count($lottery)){
			$this->load->model('Message_model');
			$this->Message_model->add(array('type' => '消费' , 'title' => "您已成功消费{$money}元购置彩票"));
			$this->Betting_model->create_batch($Betting_list);
		}
		Autumn::end(true);
	}










	/**
	 * 获取最新期开奖数据
	 * @return [type] [description]
	 */
	public function now(){
		$data = Rule::check(Autumn::params(array('lottery_id')) , array(
			'lottery_id' => array('is_number' => true , 'name' => '彩票编号') ,
		) , true);
		extract(Rule::reslut());

		if( ! $this->Lottery_model->is_exist(array('id' => $lottery_id))) Autumn::end(false , '您输入的彩票不存在');
		$Lottery_data = $this->Lottery_model->get(array('id' => $lottery_id));




		// 获取彩票最新期的开奖数据
		$now_time = time() - strtotime(date('Y-m-d'));
		$Next_lottery_data = $this->Lottery_time_model->get_by(array(
			'from_lottery' => $lottery_id,
			'timestamp >' => strtotime(date("Y-m-d H:i:s")) - strtotime(date('Y-m-d'))
		) , array() , array('timestamp' => 'asc'));
		$Next_lottery_data['byid'] = date('Ymd') . '-' . $Next_lottery_data['periods'];


		// 假如获取不到最新期开奖数据，则顺延到第二天
		if( ! isset($Next_lottery_data['id'])){
			$Next_lottery_data = $this->Lottery_time_model->get_by(array(
				'from_lottery' => $Lottery_data['id'],
				'timestamp >' => 0
			) , array() , array('timestamp' => 'asc'));
			$Next_lottery_data['timestamp'] += 86400;
			$Next_lottery_data['byid'] = date('Ymd' , time() + 86400) . '-' . $Next_lottery_data['periods'];
		}





		// 获取当前该开奖的期数
		$Now_lottery = $this->Lottery_time_model->get_by(array(
			'from_lottery' => $lottery_id,
			'timestamp <=' => strtotime(date("Y-m-d H:i:s")) - strtotime(date('Y-m-d'))
		) , array() , array('timestamp' => 'desc'));
		if( ! isset($Now_lottery['id'])){
			$Now_lottery = $this->Lottery_time_model->get_by(array(
				'from_lottery' => $lottery_id,
			) , array() , array('timestamp' => 'asc'));
			$Now_lottery['is_lost'] = true;
		}


		if(isset($Now_lottery['is_lost']) && $Now_lottery['is_lost'] == true){
			$Now_lottery_data = $this->Lottery_data_model->get_by(array(
				'from_lottery' => $lottery_id,
				'day' => date('Y-m-d' , time() - 86400),
			) , array() , array('periods' => 'desc'));
		}else{
			$Now_lottery_data = $this->Lottery_data_model->get_by(array(
				'from_lottery' => $lottery_id,
				'periods' => $Now_lottery['periods'],
				'day' => date('Y-m-d' , time()),
			) , array() , array('periods' => 'asc'));
		}


	



		$data = '';
		if($Now_lottery_data['state'] == '1'){
			$time = ($Now_lottery['timestamp'] + $Lottery_data['draw_interval']) - (time() - strtotime(date('Y-m-d')));
		}else{
			$time = -1;
			if($Now_lottery_data['state'] == '2'){
				$data = $Now_lottery_data['data'];
			}else{
				$data = '';
			}
		}
		
		



		Autumn::end(true , '' , array(
			'byid' => $Next_lottery_data['byid'],
			'Next_lottery_time' => $Next_lottery_data['timestamp'] - $now_time,

			'Now_lottery' => array(
				'byid' => $Now_lottery_data['byid'] ,
				'data' => $data, 
				'time' => $time
			)
		));
	}



	/**
	 * 获取未来几期的数据
	 * @return [type] [description]
	 */
	public function reloadperiods(){
		$data = Rule::check(Autumn::params(array('lottery_id')) , array(
			'lottery_id' => array('is_number' => true , 'name' => '彩票编号') ,
		) , true);
		extract(Rule::reslut());


		$Lottery_data = $this->Lottery_model->get(array('id' => $lottery_id));


		// 获取彩票最新期的开奖数据
		$now_time = time() - strtotime(date('Y-m-d'));
		$Next_lottery_data = $this->Lottery_time_model->get_by(array(
			'from_lottery' => $lottery_id,
			'timestamp >' => strtotime(date("Y-m-d H:i:s")) - strtotime(date('Y-m-d'))
		) , array() , array('timestamp' => 'asc'));
		$Next_lottery_data['byid'] = date('Ymd') . $Next_lottery_data['periods'];


		// 假如获取不到最新期开奖数据，则顺延到第二天
		if( ! isset($Next_lottery_data['id'])){
			$Next_lottery_data = $this->Lottery_time_model->get_by(array(
				'from_lottery' => $Lottery_data['id'],
				'timestamp >' => 0
			) , array() , array('timestamp' => 'asc'));
			$Next_lottery_data['timestamp'] += 86400;
			$Next_lottery_data['byid'] = date('Ymd' , time() + 86400) . $Next_lottery_data['periods'];
		}


		$Periods_list = $this->Lottery_data_model->get_list_by(array(
			'periods >=' => $Next_lottery_data['periods'],
			'day >=' => date('Y-m-d'),
			'from_lottery' => $lottery_id
		) , 1 , 60 , array(
			'byid',
		) , 'Not all' , array('day' => 'asc' , 'periods' => 'asc'));



		Autumn::end(true , '' , array(
			'Periods_list' => $Periods_list,
		));
	}
}
