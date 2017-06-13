<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Card extends CI_Controller {
	public function __construct(){
		parent::__construct();
	}
	public function index(){
		$this->load->model('Card_model');
		$this->load->model('User_model');
		$Card_list = $this->Card_model->get_list(array());
		foreach ($Card_list as &$value) {

			$User_data = $this->User_model->get(array('id' => $value['uid']));
			$value['username'] = $User_data['username'];

			$value['json'] = json_encode($value);
			if($value['paytype'] == 0){
				$value['qrcode'] = 'bai.jpg';
			}
			$value['paytype'] = array(
				'<span class="label danger">银行卡</span>',
				'<span class="label success">微信</span>',
				'<span class="label blue">支付宝</span>',
			)[$value['paytype']];

			$value['uid'] = $User_data['username'];
		}


		Loader::view(array('user/card') , array(
			'Card_list' => $Card_list
		));
	}
}
