<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Lottery_list extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Game_rule_model');
		$this->load->model('Lottery_model');
	}

	
	public function index(){
		$Lottery_list = $this->Lottery_model->get_list();
		foreach ($Lottery_list as &$value) {
			$value['from_group'] = $this->Game_rule_model->get(array('id' => $value['from_group']))['name'];
		}
		Loader::view(array('setting/lottery_list') , array(
			'Lottery_list' => $Lottery_list,
			'Lottery_count' => $this->Lottery_model->get_count()
		));
	}


	public function create(){
		$Game_rule_list = $this->Game_rule_model->get_list(array('type' => 0) , 0 , 0 , array('name' , 'id') , 'all');

		Loader::view(array('setting/lottery_create') , array(
			'Game_rule_list' => $Game_rule_list
		));
	}



	public function edit(){
		if( ! $this->Lottery_model->is_exist(array('id' => $this->input->get('id')))) show_404();
		$Game_rule_list = $this->Game_rule_model->get_list(array('type' => 0) , 0 , 0 , array('name' , 'id') , 'all');
		$Lottery_data = $this->Lottery_model->get(array('id' => $this->input->get('id')));

		
		Loader::view(array('setting/lottery_edit') , array(
			'Lottery_data' => $Lottery_data,
			'Game_rule_list' => $Game_rule_list
		));
	}
}
