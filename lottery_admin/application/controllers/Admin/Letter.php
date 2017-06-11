<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Letter extends CI_Controller{
	public function __construct(){
		parent::__construct();
	}

	public function index(){
		$this->load->model('Letter_model');
		$Collection_list = $this->Letter_model->get_list(array());
		foreach ($Collection_list as &$value) {
			$value['json'] = json_encode($value);

		}
		Loader::view(array('letter') , array(
			'Collection_list' => $Collection_list,
			'list_count' => $this->Letter_model->get_count()
		) , 'admin');
	}


}
