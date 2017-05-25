<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class User extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Admin_group_model');
		$this->load->model('Lottery_time_model');
		$this->load->model('User_model');
	}
	public function _remap($method){
		Admin::is_login(false , "Admin_user/{$method}");
		$this->$method();
	}



	/**
	 * 删除用户
	 * @return [type] [description]
	 */
	public function delete(){
		$params = Autumn::params(array('id'));
		Rule::check($params , array(
			'id' => array('is_number' => true , 'name' => 'id'),
		) , true);
		extract($params);
		$this->User_model->remove(array('id' => $id));
		Autumn::end(true);
	}


	/**
	 * 编辑用户信息
	 * @return [type] [description]
	 */
	public function edit(){
		if(isset($_POST['password'])){
			$params = Autumn::params(array('id','password','type','state'));
			Rule::check($params , array(
				'password' => array('max' => 16 , 'min' => 5 , 'is_null' => true , 'name' => '密码'),
				'type' => array('max' => 1 , 'min' => 0 , 'name' => '用户类型' , 'is_number' => true),
				'state' => array('max' => 1 , 'min' => 0 , 'name' => '用户状态' , 'is_number' => true),
			) , true);
			extract($params);

			if($password != ''){
				$User_data = $this->User_model->get(array('id' => $id));
				$params['password'] = md5($params['password'] . $User_data['salt']);
			}else{
				unset($params['password']);
			}

			$this->User_model->edit(array('id' => $id) , $params);
			Autumn::end(true);
		}
		$params = Autumn::params(array('id','username','nickname','integral','money','rebate'));
		Rule::check($params , array(
			'username' => array('max' => 16 , 'min' => 6 , 'name' => '用户名'),
			'nickname' => array('max' => 16 , 'min' => 6 , 'name' => '昵称'),
			'password' => array('max' => 16 , 'min' => 6 , 'name' => '密码'),
			'money' => array('min' => 0 , 'name' => '余额' , 'is_number' => true),
			'integral' => array('min' => 0 , 'name' => '积分' , 'is_number' => true),
			'rebate' => array('max' => 99 , 'min' => 0 , 'name' => '返点' , 'is_number' => true),
		) , true);
		extract($params);




		$where = "(`nickname` = '{$nickname}' or `username` = '{$username}') and `id` != {$id}";
		if($this->User_model->is_exist($where)) Autumn::end(false , '您输入的昵称或者是用户名已存在');
		$this->User_model->edit(array('id' => $id) , $params);
		Autumn::end(true);
	}


	/**
	 * 编辑开奖时间
	 * @return [type] [description]
	 */
	public function create(){
		$params = Autumn::params(array('username','nickname','type','money','rebate','password'));
		Rule::check($params , array(
			'username' => array('max' => 16 , 'min' => 6 , 'name' => '用户名'),
			'nickname' => array('max' => 16 , 'min' => 6 , 'name' => '昵称'),
			'password' => array('max' => 16 , 'min' => 6 , 'name' => '密码'),
			'type' => array('max' => 1 , 'min' => 0 , 'name' => '类型' , 'is_number' => true),
			'money' => array('min' => 0 , 'name' => '余额' , 'is_number' => true),
			'rebate' => array('max' => 99 , 'min' => 0 , 'name' => '返点' , 'is_number' => true),
		) , true);
		extract($params);

		$this->User_model->or_where(array('nickname' => $nickname));
		$this->User_model->or_where(array('username' => $username));
		if($this->User_model->is_exist()) Autumn::end(false , '您输入的昵称或者是用户名已存在');

		$params['salt'] = rand(100000 , 999999);
		$params['password'] = md5($params['password'] . $params['salt']);
		$params['reg_time'] = date('Y-m-d h:i:s');
		$params['reg_ip'] = 'localhost';
		$params['reg_ip'] = 'localhost';
		$this->load->model('User_model');
		$this->User_model->create($params);
		Autumn::end(true);
	}
}

?>