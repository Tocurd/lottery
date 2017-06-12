<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Test extends CI_Controller {
	public function __construct(){
		parent::__construct();
	}
	public function index(){
		$this->load->model('Lottery_time_model');
		$Lottery_time_data = $this->Lottery_time_model->get_list_by(array(
			'from_lottery' => 20
		) , 1 , 1 , array() , 'all' , array('periods' => 'asc'));
		

		$date = strtotime(date('Y-m-d'));
		$timestamp = 0;
		foreach ($Lottery_time_data as $key => $value) {
			$timestamp += 300;

			// print_r(array(
			// 	'time' => date('H:i' , $date + $timestamp),
			// 	'timestamp' => $timestamp,
			// ));
			$this->Lottery_time_model->edit(array('id' => $value['id']) , array(
				'time' => date('H:i' , $date + $timestamp),
				'timestamp' => $timestamp,
			));
		}

		print_r($Lottery_time_data);
	}
}
