<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Admin_group extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Admin_group_model');
	}
	public function _remap($method){
		Admin::is_login(false , "Admin_user/{$method}");
		$this->$method();
	}


	/**
	 * 删除权限组
	 * @return [type] [description]
	 */
	public function delete(){
		extract(Autumn::params(array('id')));
		if($id == 1) Autumn::end(false , '您无法删除超级管理员权限组');
		$this->Admin_group_model->remove(array('id' => $id));
		Autumn::end(true);
	}


	/**
	 * 创建管理员权限组
	 * @return [type] [description]
	 */
	public function create(){
		$params = Autumn::params(array('name' , 'state'));
		Rule::check($params , array(
			'name' => array('max' => 16 , 'min' => 1 , 'name' => '管理员权限组') ,
			'state' => array('max' => 1 , 'min' => 1 , 'name' => '登陆状态') ,
		) , true);
		extract($params);
		$limit = $this->input->post('limit');
		if(count($limit) <= 0) Autumn::end(false , '错误的数据');

		$this->Admin_group_model->create(array(
			'name' => $name ,
			'state' => $state == '0' ? '0' : '1',
			'limit' => json_encode($limit)
		));

		Autumn::end(true);
	}


	/**
	 * 编辑管理员权限组
	 * @return [type] [description]
	 */
	public function edit(){
		$params = Autumn::params(array('name' , 'state' , 'id'));
		Rule::check($params , array(
			'name' => array('max' => 16 , 'min' => 1 , 'name' => '管理员权限组') ,
			'state' => array('max' => 1 , 'min' => 1 , 'name' => '登陆状态') ,
		) , true);
		extract($params);
		$limit = $this->input->post('limit');
		if($id == '1') Autumn::end(false , '您无法编辑超级管理员权限组');
		if(count($limit) <= 0) Autumn::end(false , '错误的数据');


		$this->Admin_group_model->edit(array('id' => $id) , array(
			'name' => $name ,
			'state' => $state == '0' ? '0' : '1',
			'limit' => json_encode($limit)
		));

		Autumn::end(true);
	}
}

?>