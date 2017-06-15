<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Letter extends CI_Controller{
	public function __construct(){
		parent::__construct();
	}

	public function index(){
		$this->load->model('User_model');
		$this->load->model('Letter_model');
		$Collection_list = $this->Letter_model->get_list(array());
		foreach ($Collection_list as &$value) {
			$value['json'] = json_encode($value);

			$value['uid'] = $value['uid'] == -1 ? '<span class="label success">群发私信</span>' : $this->User_model->get(array('id' => $value['uid']))['username'];
			$value['type'] = $value['type'] == 0 ? '<span class="label success">私信</span>' : '<span class="label danger">通知</span>';
			$value['state'] = $value['state'] == 0 ? '<span class="label success">未回复</span>' : '<span class="label">已回复</span>';

		}
		Loader::view(array('letter') , array(
			'Collection_list' => $Collection_list,
			'list_count' => $this->Letter_model->get_count()
		) , 'admin');
	}


}
