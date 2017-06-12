<?php 
include_once APPPATH . 'models/Base_model.php';
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Config_model extends Base_model {
	public function __construct() {
	    parent::__construct();
	    $this->table_name = 'config';
	}


	public function get_item($name = ''){
		$value = $this->get(array('name' => $name));
		return @$value['value'];
	}
	public function add($name = '' , $value = ''){
		if($this->is_exist(array('name' => $name))){
			$this->edit(array('name' => $name) , array(
				'value' => $value
			));
		}else{
			$this->create(array(
				'name' => $name,
				'value' => $value
			));
		}
	}
}