<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Game_rule extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model("Game_rule_model");
	}



	public function index(){
		$Game_rule_list = $this->Game_rule_model->get_list(array('type' => 0));

		Loader::view(array('setting/game_rule') , array(
			'Game_rule_list' => $Game_rule_list
		));
	}




	public function create(){
		Loader::view(array('setting/game_rule_create') , array());
	}




	/**
	 * 编辑游戏规则
	 * @return [type] [description]
	 */
	public function edit(){
		$id = $this->input->get('id' , true);
		$this->load->model('Game_rule_model');
		$Game_data = $this->Game_rule_model->get(array('id' => $id));
		if( ! isset($Game_data['id'])) show_404();


		// 获取子玩法
		$Game_rule_list = $this->Game_rule_model->get_list_by(array('from_group' => $id , 'type' => 1) , 1 , 1 , array() , 'all' , array('id' => 'asc'));
		foreach ($Game_rule_list as &$value) {
			$value['item_list'] = $this->Game_rule_model->get_list_by(array(
				'from_group' => $value['id'] , 
				'type' => 2
			) , 1 , 1 , array() , 'all' , array('id' => 'asc'));
		}

		$Game_data['Game_rule_list'] = $Game_rule_list;



		Loader::view(array('setting/game_rule_edit') , $Game_data);
	}
}
