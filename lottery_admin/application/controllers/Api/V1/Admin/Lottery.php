<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Lottery extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Admin_group_model');
	}
	public function _remap($method){
		Admin::is_login(false , "Admin_user/{$method}");
		$this->$method();
	}


	/**
	 * 创建一个彩票
	 * @param $[name] [<彩票名称>]
	 * @param $[from_group] [<游戏规则>]
	 * @param $[periods] [<彩票期数>]
	 * @param $[stop_interval] [<停止投注间隔>]
	 * @param $[open_interval] [<开奖间隔>]
	 * @return null [<description>]
	 */
	public function Create(){
		$params = Autumn::params(array('name','from_group','periods','stop_interval','open_interval'));
		Rule::check($params , array(
			'name' => array('max' => 16 , 'min' => 2 , 'name' => '彩票名称'),
			'from_group' => array('is_number' => true , 'name' => '游戏规则'),
			'periods' => array('max' => 350 , 'is_number' => true , 'name' => '彩票期数'),
			'stop_interval' => array('is_number' => true , 'name' => '停止投注间隔'),
			'open_interval' => array('is_number' => true , 'name' => '开奖间隔'),
			'draw_interval' => array('is_number' => true , 'name' => '摇奖间隔'),

		) , true);
		extract($params);

		$this->load->model('Lottery_model');
		$this->load->model('Game_rule_model');
		if($this->Game_rule_model->is_exist(array('from_group' => $from_group , 'type' => 2))){
			Autumn::end(false , '您选择的彩票规则不存在');
		}
		if($this->Lottery_model->is_exist(array('name' => $name))){
			Autumn::end(false , '您输入的彩票名称重复');
		}

		$lottery_id = $this->Lottery_model->create(array(
			'name' => $name,
			'from_group' => $from_group,
			'periods' => $periods,
			'stop_interval' => $stop_interval,
			'open_interval' => $open_interval,
			'draw_interval' => $draw_interval,
		));


		$periods_byid = 0;
		$this->load->model('Lottery_time_model');
		


		$data = array();
		for($index = 0; $index < $periods; $index ++) {
			$periods_byid ++;
			array_push($data, array(
				'periods' => $periods_byid,
				'from_lottery' => $lottery_id,
				'time' => '00:00',
				'timestamp' => 0
			));
		}
		$this->Lottery_time_model->create_batch($data);

		Autumn::end(true);
	}


	/**
	 * 编辑一个彩票
	 * @param $[name] [<彩票名称>]
	 * @param $[from_group] [<游戏规则>]
	 * @param $[periods] [<彩票期数>]
	 * @param $[stop_interval] [<停止投注间隔>]
	 * @param $[open_interval] [<开奖间隔>]
	 * @return null [<description>]
	 */
	public function Edit(){
		$params = Autumn::params(array('id','name','from_group','periods','stop_interval','open_interval'));
		Rule::check($params , array(
			'name' => array('max' => 16 , 'min' => 2 , 'name' => '彩票名称'),
			'from_group' => array('is_number' => true , 'name' => '游戏规则'),
			'periods' => array('is_number' => true , 'name' => '彩票期数'),
			'stop_interval' => array('is_number' => true , 'name' => '停止投注间隔'),
			'open_interval' => array('is_number' => true , 'name' => '开奖间隔'),
			'draw_interval' => array('is_number' => true , 'name' => '摇奖间隔'),
		) , true);
		extract($params);

		$this->load->model('Lottery_model');
		$this->load->model('Game_rule_model');
		if($this->Game_rule_model->is_exist(array('from_group' => $from_group , 'type' => 2))){
			Autumn::end(false , '您选择的彩票规则不存在');
		}

		$this->Lottery_model->edit(array('id' => $id) , array(
			'name' => $name,
			'from_group' => $from_group,
			'periods' => $periods,
			'stop_interval' => $stop_interval,
			'open_interval' => $open_interval,
			'draw_interval' => $draw_interval,
		));

		Autumn::end(true);
	}

}
