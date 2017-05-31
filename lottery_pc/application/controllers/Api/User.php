<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class User extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('User_model');
	}



	public function login(){
		Rule::check(Autumn::params(array('username' , 'verification')) , array(
			'username' => array('max' => 16 , 'min' => 4 , 'name' => '用户名') ,
			'verification' => array('max' => 4 , 'min' => 4 , 'name' => '验证码') ,
		) , true);
		extract(Rule::reslut());
		if($verification != $_SESSION['verification']) Autumn::end(false , "您输入的验证码不正确");
		if( ! $this->User_model->is_exist(array('username' => $username))) Autumn::end(false , "您输入的用户名不存在");

		$_SESSION['username'] = $username;
		Autumn::end(true);
	}




	public function goto_login(){
		Rule::check(Autumn::params(array('password')) , array(
			'password' => array('max' => 16 , 'min' => 6 , 'name' => '密码') ,
		) , true);
		extract(Rule::reslut());
		if( ! isset($_SESSION['username'])) Autumn::end(false , "异常操作，请刷新页面后重试");

		$User_data = $this->User_model->get(array('username' => $_SESSION['username']));
		if( ! isset($User_data['id'])){
			unset($_SESSION['username']);
			Autumn::end(false , "您登录的用户不存在");
		}

		$password = md5($password . $User_data['salt']);
		if($password !== $User_data['password']) Autumn::end(false , "您输入的密码不正确");
		$_SESSION['user'] = $User_data;
		unset($_SESSION['username']);
		Autumn::end(true);

	}

}