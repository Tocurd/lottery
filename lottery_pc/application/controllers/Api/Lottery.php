<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Lottery extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Lottery_model');
		$this->load->model('Lottery_time_model');
		$this->load->model('Lottery_data_model');
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
		$Now_lottery_data = $this->Lottery_data_model->get(array(
			'from_time_id' => $Now_lottery['id'],
			'day' => date('Y-m-d'),
		));



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
				'byid' => date('Ymd') . '-' . $Now_lottery['periods'] ,
				'data' => $data, 
				'time' => $time
			)
		));


	}
}
