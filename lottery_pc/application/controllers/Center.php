<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Center extends CI_Controller {
	public function __construct(){
		parent::__construct();
		if( ! isset($_SESSION['user']['id'])) header("Location: ./login"); 
	}
	public function index(){




		Loader::view(array('center') , array() , 'home');
	}



	/**
	 * 我的消息
	 * @return [type] [description]
	 */
	public function message(){
		$this->load->model('Message_model');
		$type = $this->config->item('type');

		$Message_list = $this->Message_model->get_list(array('uid' => $_SESSION['user']['id']));
		foreach ($Message_list as &$value) {
			$value['type'] = $type[$value['type']];
			$value['state'] = $state == '0' ? '未读' : '已读';
		}

		Loader::view(array('center/message') , array(
			'Message_list' => $Message_list,
			'list_count' => $this->Message_model->get_count(array('uid' => $_SESSION['user']['id']))
		) , 'home');
	}
}
