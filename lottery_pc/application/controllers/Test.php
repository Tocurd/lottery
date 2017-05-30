<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Test extends CI_Controller {
	public function __construct(){
		parent::__construct();
	}
	public function index(){


		$this->load->model('Lottery_time_model');

		$data = $this->Lottery_time_model->get_list(array() , 1 , 1 , array() , 'all');
		foreach ($data as $key => $value) {

			$this->Lottery_time_model->edit(array('id' => $value['id']) , array(
				'time' => date('H:i' , strtotime(date('Y-m-d')) + $value['timestamp'])
				// 'timestamp' => strtotime(date("Y-m-d H:i:s" , strtotime($value['time']))) - strtotime(date('Y-m-d'))
			));
		}


	}
}