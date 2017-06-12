<?php
/**
 * Admin 用于后台相关
 * Create Time : 2016年10月29日 09:40:15
 * Update Time : 2016年10月29日 09:40:30
 */
class Lottery{
	static public $CI;
	public function __construct(){
		self::$CI = & get_instance();
	}

	static public function trun_time($time){
		$date = strtotime(date('Y-m-d'));
		return strtotime(date('Y-m-d') . ' ' . $time) - $date;
	}
	static public function get_rule($data , $rule){

	}
}