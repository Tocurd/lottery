<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Admin_user extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Admin_user_model');
		$this->load->model('Admin_group_model');
	}
	public function _remap($method){
		if($method != 'login') Admin::is_login(false , "Admin_user/{$method}");
		$this->$method();
	}


	/**
	 * 删除管理员
	 * @return [type] [description]
	 */
	public function delete(){
		extract(Autumn::params(array('id')));
		$User_data = $this->Admin_user_model->get(array('id' => $id));
		if($User_data['group'] == '1') Autumn::end(false , '您没有权限删除超级管理员组的账户');

		$this->Admin_user_model->remove(array('id' => $id));
		Autumn::end(true);
	}


	/**
	 * 编辑用户信息
	 * @param  $username [<用户名>]
	 * @param  $password [<密码>]
	 * @param  $remarks [<用户描述>]
	 * @param  $group [<用户所在权限组>]
	 * @param  $state [<是否限制用户的登陆状态>]
	 * @return [type] [description]
	 */
	public function edit(){
		$params = Autumn::params(array('username' , 'password' , 'remarks' , 'group' , 'state' , 'id'));
		Rule::check($params , array(
			'username' => array('max' => 16 , 'min' => 5 , 'name' => '用户名') ,
			'password' => array('max' => 16 , 'min' => 5 , 'name' => '密码' , 'is_null' => false) ,
			'remarks' => array('max' => 16 , 'min' => 0 , 'name' => '描述') ,
			'group' => array('max' => 6 , 'min' => 1 , 'name' => '用户所在权限组') ,
			'state' => array('max' => 1 , 'min' => 1 , 'name' => '登陆状态') ,
		) , true);
		extract($params);
		
		
		if( ! $this->Admin_user_model->is_exist(array('id' => $id))) Autumn::end(false , '您要修改的用户不存在');
		$User_data = $this->Admin_user_model->get(array('id' => $id));
		if($User_data['group'] == '1' && $group != '1'){
			Autumn::end(false , '您无法将用户从超级管理员中移动出去');
		}

		if($User_data['group'] !== '1' && $group == '1'){
			Autumn::end(false , '您不能创建超级管理员账户');
		}

		if($this->Admin_user_model->is_exist(array(
			'id !=' => $id,
			'username' => $username,
		))) Autumn::end(false , '您输入的用户名已经存在');

		if( ! $this->Admin_group_model->is_exist(array('id' => $group))){
			Autumn::end(false , '您选中的用户权限组不存在');
		}

		$New_user_data = array(
			'username' => $username , 
			'remarks' => $remarks,
			'group' => $group ,
			'state' => $state == '0' ? 0 : 1 ,
		);
		if($password !== ''){
			$New_user_data['password'] = md5($User_data['salt'] . $password);
		}
		$this->Admin_user_model->edit(array('id' => $id) , $New_user_data);
		Autumn::end(true);
	}



	/**
	 * 创建管理员账户
	 * @param  $username [<用户名>]
	 * @param  $password [<密码>]
	 * @param  $remarks [<用户描述>]
	 * @param  $group [<用户所在权限组>]
	 * @param  $state [<是否限制用户的登陆状态>]
	 * @return [type] [description]
	 */
	public function create(){
		$params = Autumn::params(array('username' , 'password' , 'remarks' , 'group' , 'state'));
		Rule::check($params , array(
			'username' => array('max' => 16 , 'min' => 5 , 'name' => '用户名') ,
			'password' => array('max' => 16 , 'min' => 5 , 'name' => '密码' , 'is_null' => false) ,
			'remarks' => array('max' => 16 , 'min' => 0 , 'name' => '描述') ,
			'group' => array('max' => 6 , 'min' => 1 , 'name' => '用户所在权限组') ,
			'state' => array('max' => 1 , 'min' => 1 , 'name' => '登陆状态') ,
		) , true);
		extract($params);


		if($this->Admin_user_model->is_exist(array('username' => $username))){
			Autumn::end(false , '您输入的用户名已经存在');
		}
		if( ! $this->Admin_group_model->is_exist(array('id' => $group))){
			Autumn::end(false , '您选中的用户权限组不存在');
		}
		if($group == '1'){
			Autumn::end(false , '您不能创建超级管理员账户');
		}


		$salt = rand(100000 , 999999);
		$password = md5($salt . $password);

		$this->Admin_user_model->create(array(
			'username' => $username , 
			'password' => $password , 
			'salt' => $salt ,
			'remarks' => $remarks,
			'group' => $group ,
			'state' => $state == '0' ? 0 : 1 ,
			'createTime' => time()
		));
		Autumn::end(true);
	}




	/**
	 * 登陆后台管理员账户
	 * @param username [<description>]
	 * @param password [<description>]
	 * @return [type] [description]
	 */
	public function Login(){
		extract(Autumn::params(array('username' , 'password')));
		
		$User_data = $this->Admin_user_model->get(array('username' => $username));
		if( ! isset($User_data['username'])) Autumn::end(false , '您输入的用户名不存在');

		$password = md5($password . $User_data['salt']);
		if($User_data['password'] == $password){
			$_SESSION['admin_user'] = $User_data;
			if($User_data['state'] == '1') Autumn::end(false , '您的账户已经被管理员禁止登陆');

			$_SESSION['limit'] = json_decode($this->Admin_group_model->get(array(
				'id' => $_SESSION['admin_user']['group']
			))['limit'] , true);


			$this->Admin_user_model->edit(array('id' => $User_data['id']) , array(
				'newTime' => time() ,
				'newIp' => @$_SERVER['SERVER_ADDR'] ,
				'lostTime' => $User_data['newTime'] ,
				'lostIp' => $User_data['newIp'] ,
			));
			Autumn::end(true);
		}else{
			Autumn::end(false , '您输入的账户密码错误');
		}
	}
}
