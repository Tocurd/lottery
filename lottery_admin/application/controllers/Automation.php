<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Automation extends CI_Controller {
	


	/**
	 * [index description]
	 * @return [type] [description]
	 */
	public function index(){
		$this->prints('脚本开启');
		set_time_limit(0);
		ignore_user_abort();
		ob_implicit_flush(1);
		$time = -1;
		$this->load->model('Lottery_time_model');
		$this->load->model('Lottery_model');
		$this->load->model('Lottery_data_model');
		$this->load->model('Game_rule_model');

		
		while (true) {
			$time ++;
			if($time % ((60 * 60) * 2) == 0) $this->checkData();
			$this->open_lottery();
			sleep(1);
		}



		$this->prints('脚本结束');
	}



	/**
	 * 开奖监听事件
	 * @return [type] [description]
	 */
	private function open_lottery(){
		echo '.';
		// $this->prints('检查是否有彩票期数需要开奖');
		$date = date('H:i:s');

		// 获取所有彩票
		$Lottery_list = $this->Lottery_model->get_list(array() , 0 , 0 , array('name' , 'id' , 'from_group' , 'draw_interval') , 'all');
		foreach($Lottery_list as $key => $value) {

			$Game_rule = $this->Game_rule_model->get(array('id' => $value['from_group']));

			$Lottery_time_data = $this->Lottery_time_model->get_by(array(
				'from_lottery' => $value['id'],
				'timestamp <=' => strtotime(date("Y-m-d H:i:s")) - strtotime(date('Y-m-d'))
			) , array() , array('timestamp' => 'desc'));



			$data = $this->Lottery_data_model->get(array(
				'from_time_id' => $Lottery_time_data['id'],
				'from_lottery' => $value['id'],
				'day' => date('Y-m-d'),
			));


			if(isset($data['id'])){
				if($data['state'] == '0'){
					echo PHP_EOL;
					$this->prints("【{$value['name']}】第{$Lottery_time_data['periods']}期，需要开奖");
					$this->prints(json_encode($Lottery_time_data));
					$this->prints(json_encode($data));
					$this->Lottery_data_model->edit(array('id' => $data['id']) , array('state' => 1));
					$this->prints("【{$value['name']}】第{$Lottery_time_data['periods']}期，正在摇奖中");
				}
				if($data['state'] == '1'){
					$date = strtotime(date("Y-m-d H:i:s")) - strtotime(date('Y-m-d'));
					if($date >= $Lottery_time_data['timestamp'] + $value['draw_interval']){

						echo PHP_EOL;
						$this->Lottery_data_model->edit(array('id' => $data['id']) , array('state' => 2));
						$this->prints("【{$value['name']}】第{$Lottery_time_data['periods']}期，已成功开奖");
					}
				}
			}else{
				$this->prints("未发现开奖数据，正在准备号码采集策略");

			}


		}
	}



	/**
	 * 检查彩票是否有近七日自动生成的数据
	 * @return [type] [description]
	 */
	private function checkData(){

		// 获取彩票列表
		$Lottery_list = $this->Lottery_model->get_list(array() , 0 , 0 , array() , 'all');
		foreach($Lottery_list as $key => $value) {
			$this->prints("检查【{$value['name']}】是否有近七日数据");

			// 彩票的游戏规则
			$Game_rule = $this->Game_rule_model->get(array('id' => $value['from_group']));

			$date = date('Y-m-d');
			for($index = 0;$index < 7;$index++) { 
				if( ! $this->Lottery_data_model->is_exist(array(
					'from_lottery' => $value['id'],
					"day" => $date
				))){
					$data = array();
					$this->prints("{$date} : no");
					$Lottery_time_list = $this->Lottery_time_model->get_list(array('from_lottery' => $value['id']) , 0 , 0 , array() , 'all');
					foreach ($Lottery_time_list as $time_value) {
						$push = array(
							'day' => $date,
							'from_lottery' => $value['id'],
							'from_time_id' => $time_value['id'],
							'data' => $this->generate_code($Game_rule['count']),
							'state' => 0
						);
						array_push($data, $push);
					}
					$this->Lottery_data_model->create_batch($data);
				}else{
					$this->prints("{$date} : yes");
				}

				$date = date('Y-m-d' , strtotime($date) + 86400);
			}
		}
	}





	private function generate_code($length = 4) {
	    return rand(pow(10,($length-1)), pow(10,$length)-1);
	}

	private function prints($text = ''){
		$text = date('Y-m-d H:i:s') . ' ' . $text . PHP_EOL;
		echo $this->strToGBK($text , 'UTF-8','GBK');
		$log_file = APPPATH . 'logs\automation ' . date('Y-m-d') . '.log';
		$fh = fopen($log_file, "a");
		fwrite($fh, $text);    // 输出：6
		fclose($fh);
	}

	private function strToGBK($strText){
	    $encode = mb_detect_encoding($strText, array('UTF-8','GB2312','GBK'));
	    if($encode == "UTF-8"){
	        return @iconv('UTF-8','GB18030',$strText);
	    }else{
	        return $strText;
	    }
	}
}
