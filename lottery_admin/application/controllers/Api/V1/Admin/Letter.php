<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Letter extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Letter_model');
	}
	public function _remap($method){
		Admin::is_login(false , "Letter/{$method}");
		$this->$method();
	}


	public function create(){
		$params = Autumn::params(array('username' , 'title' , 'content'));
		Rule::check($params , array(
			'username' => array('max' => 16 , 'min' => 0 , 'name' => '用户名'),
			'title' => array('max' => 255 , 'min' => 1 , 'name' => '标题'),
			'content' => array('max' => 1024 , 'min' => 1 , 'name' => '内容'),
		) , true);
		extract($params);

		if($username != ''){
			$User_data = $this->User_model->get(array('username' => $username));
			if( ! isset($User_data['id'])) Autumn::end(false , '您输入的用户名不存在');
			$uid = $User_data['id'];
		}else{
			$uid = -1;
		}

		$this->Letter_model->create(array(
			'uid' => $uid,
			'title' => $title ,
			'content' => $content ,
			'create_time' => date('Y-m-d H:i:s'),
		));

		Autumn::end(true);
	}
}

?>