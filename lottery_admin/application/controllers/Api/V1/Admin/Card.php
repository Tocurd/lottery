<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Card extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Card_model');
		$this->load->model('User_model');
	}
	public function _remap($method){
		Admin::is_login(false , "Card/{$method}");
		$this->$method();
	}

	public function edit(){
		$params = Autumn::params(array('username' , 'paytype' , 'bankname' , 'account' , 'ownerName' , 'branch' ));
		extract($params);

		$User_data = $this->User_model->get(array('username' => $username));
		if( ! isset($User_data['id'])) Autumn::end(false , '您输入的用户不存在');

		unset($params['username']);
		$params['uid'] = $User_data['id'];



		if($paytype == 0){
			$this->Card_model->edit(array('uid' => $User_data['id']) , $params);
			Autumn::end(true);
		}


		if(isset($_FILES['file']['name']) && $_FILES['file']['name'] != ''){
			$config['upload_path']      = FCPATH . 'assets\\card-qrcode';
	        $config['allowed_types']    = 'jpg|png|bmp|gif|jpeg';
	        $config['max_size']     	= 1024 * 3;
	        $config['file_name']     	= md5($User_data['id'] . $User_data['username']);
	        $config['overwrite'] = true;
        	$this->load->library('upload', $config);
	        if( ! $this->upload->do_upload('file')){
				Autumn::end(false , $this->upload->display_errors());
			}
			$params['qrcode'] = $this->upload->data()['file_name'];
		}else{
			Autumn::end(false , '您还未上传二维码');
		}


		$this->Card_model->edit(array('uid' => $User_data['id']) , $params);
		Autumn::end(true);
	}

	public function create(){
		$params = Autumn::params(array('username' , 'paytype' , 'bankname' , 'account' , 'ownerName' , 'branch' ));
		extract($params);

		$User_data = $this->User_model->get(array('username' => $username));
		if( ! isset($User_data['id'])) Autumn::end(false , '您输入的用户不存在');
		if($this->Card_model->is_exist(array('uid' => $User_data['id']))){
			Autumn::end(false , '您输入的用户已经绑卡');
		}

		unset($params['username']);
		$params['uid'] = $User_data['id'];



		if($paytype == 0){
			$this->Card_model->create($params);
			Autumn::end(true);
		}


		if(isset($_FILES['file']['name']) && $_FILES['file']['name'] != ''){
			$config['upload_path']      = FCPATH . 'assets\\card-qrcode';
	        $config['allowed_types']    = 'jpg|png|bmp|gif|jpeg';
	        $config['max_size']     	= 1024 * 3;
	        $config['file_name']     	= md5($User_data['id'] . $User_data['username']);
	        $config['overwrite'] = true;
        	$this->load->library('upload', $config);
	        if( ! $this->upload->do_upload('file')){
				Autumn::end(false , $this->upload->display_errors());
			}
			$params['qrcode'] = $this->upload->data()['file_name'];
		}else{
			Autumn::end(false , '您还未上传二维码');
		}


		$this->Card_model->create($params);
		Autumn::end(true);
	}


	public function remove(){
		$params = Autumn::params(array('id'));
		extract($params);
		$Card_data = $this->Card_model->get(array('id' => $id));
		if( ! isset($Card_data['id'])) Autumn::end(false , '您要删除的数据不存在');
		$this->Card_model->remove(array('id' => $id));
		@unlink(FCPATH . 'assets/card-qrcode/' . $Card_data['qrcode']);
		Autumn::end(true);
	}

}

?>