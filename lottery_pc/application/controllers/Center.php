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
			$value['state'] = $value['state'] == 0 ? '<span style="color:red">未读</span>' : '已读';
		}

		Loader::view(array('center/message') , array(
			'active' => 'center/message',
			'Message_list' => $Message_list,
			'list_count' => $this->Message_model->get_count(array('uid' => $_SESSION['user']['id']))
		) , 'home');
	}


	/**
	 * 平台动态
	 * @return [type] [description]
	 */
	public function news(){
		$this->load->model('News_model');

		Loader::view(array('center/news') , array(
			'active' => 'center/news',
		) , 'home');
	}


	/**
	 * 银行卡
	 * @return [type] [description]
	 */
	public function card(){

		Loader::view(array('center/card') , array(
			'active' => 'center/card',
		) , 'home');
	}



	/**
	 * 修改密码
	 * @return [type] [description]
	 */
	public function edit_password(){

		Loader::view(array('center/edit_password') , array(
			'active' => 'center/edit_password',
		) , 'home');
	}



	/**
	 * 电子回单
	 * @return [type] [description]
	 */
	public function recharge(){
		Loader::view(array('center/recharge') , array(
			'active' => 'center/recharge',
		) , 'home');
	}



	public function auto_recharge(){
		Loader::view(array('center/auto_recharge') , array(
			'active' => 'center/auto_recharge',
		) , 'home');
	}


	public function withdrawals(){
		Loader::view(array('center/withdrawals') , array(
			'active' => 'center/withdrawals',
		) , 'home');
	}
	public function withdrawals_history(){
		Loader::view(array('center/withdrawals_history') , array(
			'active' => 'center/withdrawals_history',
		) , 'home');
	}

	
	public function lottery_history(){
		Loader::view(array('center/lottery_history') , array(
			'active' => 'center/lottery_history',
		) , 'home');
	}
	
	public function record_history(){
		Loader::view(array('center/record_history') , array(
			'active' => 'center/record_history',
		) , 'home');
	}


}
