<?php 
include_once APPPATH . 'models/Base_model.php';
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Letter_model extends Base_model {
	public function __construct() {
	    parent::__construct();
	    $this->table_name = 'letter';
	}

	public function add($params = array()){
		if( ! isset($_SESSION['user']['id'])) return false;
		$this->create(array(
			'uid' => $_SESSION['user']['id'],
			'title' => $params['title'],
			'create_time' => date('Y-m-d H:i:s'),
			'type' => array_search($params['type'] , $this->config->item('type')),
			'state' => 0,
		));

	}

}