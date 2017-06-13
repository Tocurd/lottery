<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Config extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Config_model');
	}
	public function _remap($method){
		Admin::is_login(false , "Config/{$method}");
		$this->$method();
	}


	public function edit(){
		$params = Autumn::params(array('withdrawalLostMoney' , 'withdrawalUpMoney' , 'withdrawalStartTime' , 'withdrawalEndTime' , 'recharge' , 'out_time' , 'withdrawalMaxCount' , 'customerServiceLink' , 'initializeRebate' , 'oddsSetting'));
		foreach ($params as $key => $value) {
			$this->Config_model->edit(array('name' => $key) , array(
				'value' => $value
			));

			if($key == 'oddsSetting'){
				$this->load->model('Game_rule_model');
				$this->Game_rule_model->edit(array('id' => 95) , array(
					'highest_bonus' => $value
				));
			}
		}
		Autumn::end(true);
	}
}

?>