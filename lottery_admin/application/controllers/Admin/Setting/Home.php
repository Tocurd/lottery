<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Home extends CI_Controller {
	public function __construct(){
		parent::__construct();
	}
	public function index(){
		$this->load->model('Config_model');
		
		$Config_item = array();
		$Config_list = $this->Config_model->get_list(array() , 1 , 1 , array() , 'all');
		foreach ($Config_list as $key => $value) {
			$Config_item[$value['name']] = $value['value'];
		}



		Loader::view(array('setting/home') , $Config_item);
	}
}
