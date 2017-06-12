<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Collection extends CI_Controller{
	public function __construct(){
		parent::__construct();
	}

	public function index(){
		$this->load->model('Collection_model');
		$Collection_list = $this->Collection_model->get_list(array());
		foreach ($Collection_list as &$value) {
			$value['json'] = json_encode($value);
			if($value['pay_type'] == 'wxpay'){
				$value['pay_type'] = '<div class="type success">微信支付</div>';
			}
			if($value['pay_type'] == 'alipay'){
				$value['pay_type'] = '<div class="type success" style="background:#01aaef">支付宝</div>';
			}
			if($value['pay_type'] == 'card'){
				$value['pay_type'] = '<div class="type danger">银行卡</div>';
			}

			$value['time'] = date('Y-m-d H:i:s' , $value['time']);
			$value['branch'] = $value['branch'] + 1;
		}
		Loader::view(array('collection') , array(
			'Collection_list' => $Collection_list,
			'list_count' => $this->Collection_model->get_count()
		) , 'admin');
	}


}
