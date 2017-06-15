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
			$this->open_lottery($time);
			sleep(1);
		}



		$this->prints('脚本结束');
	}



	/**
	 * 开奖监听事件
	 * @return [type] [description]
	 */
	private function open_lottery($time_interval){

		// $this->prints('检查是否有彩票期数需要开奖');
		$date = date('H:i:s');
		$now_time = strtotime(date("Y-m-d H:i:s")) - strtotime(date('Y-m-d'));

		// 获取所有彩票
		$Lottery_list = $this->Lottery_model->get_list(array() , 0 , 0 , array() , 'all');
		foreach($Lottery_list as $key => $value) {

			$Game_rule = $this->Game_rule_model->get(array('id' => $value['from_group']));





			$Lottery_time_data = $this->Lottery_time_model->get_by(array(
				'from_lottery' => $value['id'],
				'timestamp <=' => $now_time
			) , array() , array('timestamp' => 'desc'));


			$day = date('Y-m-d');
			if(in_array($Lottery_time_data['periods'] , json_decode($value['inter_day_periods']))){
				$day = date('Y-m-d' , strtotime($day) - 86400);
			}
			
			$data = $this->Lottery_data_model->get(array(
				'from_time_id' => $Lottery_time_data['id'],
				'from_lottery' => $value['id'],
				'day' => $day,
			));




			// 获取下一期的数据
			$Next_lottery_data = $this->Lottery_time_model->get_by(array(
				'from_lottery' => $value['id'],
				'timestamp >' => strtotime(date("Y-m-d H:i:s")) - strtotime(date('Y-m-d'))
			) , array() , array('timestamp' => 'asc'));

			// 假如获取不到最新期开奖数据，则顺延到第二天
			if( ! isset($Next_lottery_data['id'])){
				$Next_lottery_data = $this->Lottery_time_model->get_by(array(
					'from_lottery' => $value['id'],
					'timestamp >' => 0
				) , array() , array('timestamp' => 'asc'));
			}

			$day = date('Y-m-d');
			if(in_array($Next_lottery_data['periods'] , json_decode($value['inter_day_periods']))){
				$day = date('Y-m-d H:i:s' , strtotime($day) - 86400);
			}

			$Next_lottery_data = array_merge($Next_lottery_data , $this->Lottery_data_model->get(array(
				'periods' => $Next_lottery_data['periods'],
				'day' => $day
			)));




			// 用以计算距离下一期摇奖还有多少秒
			if($time_interval % 15 == 0){
				$this->prints("【{$value['name']}】第{$Next_lottery_data['periods']}期，距离开奖还剩" . ($Next_lottery_data['timestamp'] - $now_time) . '秒');
			}


			if($Next_lottery_data['timestamp'] - $now_time < $value['stop_interval']){
				$this->Lottery_data_model->edit(array('id' => $Next_lottery_data['id']) , array(
					'stop_interval' => 1
				));

				$this->prints("【{$value['name']}】第{$Next_lottery_data['periods']}期，即将开奖已禁止用户进行投注");
			}






			if(isset($data['id'])){
				
				// 开奖时间
				$Lottery_time = date('Y-m-d H:i:s' , strtotime(date('Y-m-d' , strtotime($Next_lottery_data['day'])) . ' ' . $Lottery_time_data['time']));



				if($data['state'] == '0'){
					$this->prints("【{$value['name']}】第{$Lottery_time_data['periods']}期，需要开奖");
					$this->prints("【{$value['name']}】第{$Lottery_time_data['periods']}期，开奖时间为：" . $Lottery_time);
					
					$this->prints(json_encode($Lottery_time_data));
					$this->prints(json_encode($data));
					$this->Lottery_data_model->edit(array('id' => $data['id']) , array('state' => 1));
					$this->prints("【{$value['name']}】第{$Lottery_time_data['periods']}期，正在摇奖中");
				}


				if($data['manual_lottery'] == '1'){
					if(! isset($_SESSION['manual_lottery'][md5($data['id'])])){
						$_SESSION['manual_lottery'][md5($data['id'])] = true;
						$this->prints("【{$value['name']}】第{$Lottery_time_data['periods']}期，开奖器得知了管理员并不情愿让他开这期奖");
					}
					return true;
				}



				if($data['state'] == '1'){



					$date = strtotime(date("Y-m-d H:i:s")) - strtotime(date('Y-m-d'));




					if( ! isset($_SESSION['draw_interval'][md5($data['id'])])){
						$_SESSION['draw_interval'][md5($data['id'])] = rand($value['draw_interval'] , $value['draw_end_interval']);
						$draw_interval = $_SESSION['draw_interval'][md5($data['id'])];
						$this->prints("【{$value['name']}】第{$Lottery_time_data['periods']}期，本次开奖随机摇奖时间为：{$draw_interval}秒");


						$_SESSION['draw_interval'][md5($data['id'])] = date('Y-m-d H:i:s' , strtotime($Lottery_time) + $draw_interval);
						$this->prints("【{$value['name']}】第{$Lottery_time_data['periods']}期，正式开奖时间为：" . $_SESSION['draw_interval'][md5($data['id'])]);
					}



					if(time() > strtotime($_SESSION['draw_interval'][md5($data['id'])])){
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

			$date = date('Y-m-d' , time() - (86400 * 3));
			for($index = 0;$index < 10;$index++) { 
				if( ! $this->Lottery_data_model->is_exist(array(
					'from_lottery' => $value['id'],
					"day" => $date
				))){


					$data = array();
					$this->prints("{$date} : no");
					$Lottery_time_list = $this->Lottery_time_model->get_list(array('from_lottery' => $value['id']) , 0 , 0 , array() , 'all');
					foreach ($Lottery_time_list as $time_value) {
						

						if($time_value['periods'] == 120){
							$time = date('Ymd' , strtotime($date) - 86400);
						}else{
							$time = $date;
						}
						$push = array(
							'day' => $time,
							'byid' => date('Ymd' , strtotime($time)) . $time_value['periods'],
							'periods' => $time_value['periods'],
							'from_lottery' => $value['id'],
							'from_time_id' => $time_value['id'],
							'data' => $this->generate_code($Game_rule['count']),
							'state' => 0,
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
