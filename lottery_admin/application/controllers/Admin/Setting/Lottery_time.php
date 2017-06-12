<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Lottery_time extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Game_rule_model');
		$this->load->model('Lottery_time_model');
		$this->load->model('Lottery_model');
	}

	
	public function index(){
		$Lottery_list = $this->Lottery_model->get_list(array() , 0 , 0 , array('name' , 'id') , 'all');

		$page = isset($_GET['page']) ? $this->input->get('page' , true) : 1;


		$from_lottery = isset($_GET['from_lottery']) ? htmlspecialchars($this->input->get('from_lottery')) : $Lottery_list[0]['id'];
		$Lottery_time_list = $this->Lottery_time_model->get_list_by(array(
			'from_lottery' => (int) $from_lottery
		) , $page , 20 , array() , 'Not all', array('time' => 'asc'));
		$Lottery_data = $this->Lottery_model->get(array('id' => $from_lottery));

		
		$list_count = $this->Lottery_time_model->get_count();
		Loader::view(array('setting/lottery_time') , array(
			'Lottery_list' => $Lottery_list,
			'Lottery_data' => $Lottery_data,
			'list_count' => $list_count,

			'Lottery_time_list' => $Lottery_time_list,
		));
	}


	
}
