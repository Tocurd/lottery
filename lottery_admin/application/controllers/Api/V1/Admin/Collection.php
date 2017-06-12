<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Collection extends CI_Controller{
	public function __construct(){
		parent::__construct();
		$this->load->model('User_model');
		$this->load->model('Config_model');
		$this->load->model('Collection_model');
	}



	/**
	 * 批量删除二维码
	 * @return [type] [description]
	 */
	public function remove_all(){
		extract(Autumn::params(array('id')));
		foreach ($id as $key => $value) {
			$Qrcode_data = $this->Collection_model->get(array('id' => $value));
			$this->Collection_model->remove(array('id' => $value));

			@unlink(FCPATH . 'assets\\qrcode\\' . $Qrcode_data['qrocde_file_url']);
		}
		Autumn::end(true);
	}


	/**
	 * 删除单个二维码数据
	 * @return [type] [description]
	 */
	public function remove(){

		extract(Autumn::params(array('id')));
		$Qrcode_data = $this->Collection_model->get(array('id' => $id));
		$this->Collection_model->remove(array('id' => $id));

		@unlink(FCPATH . 'assets\\qrcode\\' . $Qrcode_data['qrocde_file_url']);
		Autumn::end(true);
	}






	public function create(){
		extract(Autumn::params(array('fromPayName' , 'payType' , 'money' , 'branch' , 'card_opening' , 'card_name' , 'card_from')));



		if($payType == 'card'){
			$this->Collection_model->create(array(
				'form_pay_name' => $fromPayName,
				'pay_type' => $payType,
				'money' => $money,
				'branch' => $branch,
				'card_opening' => $card_opening,
				'card_name' => $card_name,
				'card_from' => $card_from,
				'time' => time(),
			));


			Autumn::end(true);
		}







		$this->load->model('Config_model');
		$money_floor = floor($money);
		$recharge_list = explode(',' , $this->Config_model->get(array('name' => 'recharge'))['value']);
		if( ! in_array($money_floor, $recharge_list)){
			Autumn::end(false , '您输入的金额不符合规范');
		}


		if($payType != 'wxpay' && $payType != 'alipay'){
			Autumn::end(false , '请选择二维码类型');
		}

		if($this->Collection_model->is_exist(array(
			'pay_type' => $payType,
			'money' => $money,
			'branch' => $branch
		))){
			Autumn::end(false , '该金额已经上传，请勿重复传递');
		}

		if(isset($_FILES['file']['name']) && $_FILES['file']['name'] != ''){
			$config['upload_path']      = FCPATH . 'assets\\qrcode';
	        $config['allowed_types']    = 'jpg|png|bmp|gif|jpeg';
	        $config['max_size']     	= 1024 * 3;
	        $config['file_name']     	= md5($payType . $money);
	        $config['overwrite'] = true;

        	$this->load->library('upload', $config);
	        if( ! $this->upload->do_upload('file')){
				Autumn::end(false , $this->upload->display_errors());
			}
		}else{
			Autumn::end(false , '您还未上传二维码');
		}

		$this->load->model('Collection_model');
		$this->Collection_model->create(array(
			'form_pay_name' => $fromPayName,
			'pay_type' => $payType,
			'money' => $money,
			'time' => time(),
			'qrocde_file_url' => $this->upload->data()['file_name'] 
		));
		Autumn::end(true);
	}
}
