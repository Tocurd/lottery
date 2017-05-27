<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Game_rule extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Admin_group_model');
		$this->load->model('Game_rule_model');
	}
	public function _remap($method){
		Admin::is_login(false , "Game_rule/{$method}");
		$this->$method();
	}

	public function Delete(){
		$params = Autumn::params(array('id'));
		extract($params);
		$Game_rule_data = $this->Game_rule_model->get(array('id' => $id));
		if($Game_rule_data['type'] != '0') Autumn::end(false , '您操作的玩法不是顶级玩法');
		$this->Game_rule_model->remove(array('id' => $id));
		

		$Rule_list = $this->Game_rule_model->get_list(array('from_group' => $id) , 1 , 1 , array() , 'all');
		$Rule_list = $this->Game_rule_model->remove(array('from_group' => $id));
		foreach ($Rule_list as &$value) {
			$this->Game_rule_model->remove(array('from_group' => $value['id']));
		}
		Autumn::end(true);
	}



	public function Save(){
		$params = Autumn::params(array('name' , 'count' , 'id'));
		extract($params);
		$Game_rule_data = $this->Game_rule_model->get(array('id' => $id));
		if($Game_rule_data['type'] != '0') Autumn::end(false , '您操作的玩法不是顶级玩法');
		$this->Game_rule_model->edit(array('id' => $id) , array(
			'name' => $name , 
			'count' => $count,
		));
		Autumn::end(true);
	}

	public function Delete_item(){
		$params = Autumn::params(array('id'));
		extract($params);
		$Game_rule_data = $this->Game_rule_model->get(array('id' => $id));
		if($Game_rule_data['type'] != '2') Autumn::end(false , '您操作的玩法不是最小玩法');
		$this->Game_rule_model->remove(array('id' => $id));
		Autumn::end(true);
	}


	public function Edit(){
		$params = Autumn::params(array('id' , 'from_group' , 'description' , 'winning_description' , 'rule' , 'byid'));
		Rule::check($params , array(
			'from_group' => array('name' => '玩法组' , 'is_number' => true) ,
			'description' => array('max' => 500 , 'min' => 2 , 'name' => '玩法描述') ,
			'winning_description' => array('max' => 500 , 'min' => 2 , 'name' => '中奖规则') ,
			'rule' => array('max' => 500 , 'min' => 2 , 'name' => '玩法名称') ,
		) , true);
		extract($params);

		if( ! $this->Game_rule_model->is_exist(array('id' => $from_group))){
			Autumn::end(false , '您输入的玩法组不存在');
		}

		$this->Game_rule_model->edit(array(
			'id' => $id
		) , array(
			'from_group' => $from_group,
			'description' => $description,
			'winning_description' => $winning_description,
			'rule' => $rule,
			'type' => 2,
			'byid' => $byid,
			'create_time' => date('Y-m-d h:i:s'),
		));
		Autumn::end(true);
	}


	public function Get_item(){
		$params = Autumn::params(array('id'));
		extract($params);
		Autumn::end(true , '' , $this->Game_rule_model->get(array('id' => $id)));
	}


	/**
	 * 删除单个分组
	 */
	public function Delete_group(){
		$params = Autumn::params(array('id'));
		extract($params);
		$this->Game_rule_model->remove(array(
			'id' => $id,
		));
		$this->Game_rule_model->remove(array(
			'from_group' => $id
		));

		Autumn::end(true);
	}


	/**
	 * 修改单个规则的名称
	 * @return [type] [description]
	 */
	public function Edit_name(){
		$params = Autumn::params(array('id','name'));
		Rule::check($params , array(
			'id' => array('name' => '索引' , 'is_number' => true) ,
			'name' => array('max' => 16 , 'min' => 2 , 'name' => '玩法名称') ,
		) , true);
		extract($params);
		$this->Game_rule_model->edit(array('id' => $id) , array(
			'name' => $name ,
		));
		Autumn::end(true , '' , array(
			'name' => $name ,
		));
	}




	/**
	 * 修改单个规则的数据
	 * @return [type] [description]
	 */
	public function Edit_item(){
		$params = Autumn::params(array('id','name','highest_bonus','minimum_bonus','topbet','minimum_money','index'));
		Rule::check($params , array(
			'id' => array('name' => '索引' , 'is_number' => true) ,
		) , true);
		extract($params);
		$this->Game_rule_model->edit(array('id' => $id) , array(
			'name' => $name ,
			'highest_bonus' => $highest_bonus ,
			'minimum_bonus' => $minimum_bonus ,
			'topbet' => $topbet ,
			'minimum_money' => $minimum_money ,
			'index' => $index ,
		));
		Autumn::end(true , '');
	}



	/**
	 * [Add_item 向玩法组内添加一个玩法]
	 * @return [type] [description]
	 */
	public function Add_item(){
		$params = Autumn::params(array('name' , 'from_group' , 'description' , 'winning_description' , 'rule' , 'byid'));
		Rule::check($params , array(
			'name' => array('max' => 16 , 'min' => 2 , 'name' => '玩法名称') ,
			'from_group' => array('name' => '玩法组' , 'is_number' => true) ,
			'description' => array('max' => 500 , 'min' => 2 , 'name' => '玩法描述') ,
			'winning_description' => array('max' => 500 , 'min' => 2 , 'name' => '中奖规则') ,
			'rule' => array('max' => 500 , 'min' => 2 , 'name' => '玩法名称') ,
		) , true);
		extract($params);

		if( ! $this->Game_rule_model->is_exist(array('id' => $from_group))){
			Autumn::end(false , '您输入的玩法组不存在');
		}
		if($this->Game_rule_model->is_exist(array(
			'from_group' => $from_group , 
			'type' => 2 , 
			'name' => $name
		))){
			Autumn::end(false , '您输入的玩法已经存在请勿重复输入');
		}

		$id = $this->Game_rule_model->create(array(
			'name' => $name ,
			'from_group' => $from_group,
			'description' => $description,
			'winning_description' => $winning_description,
			'rule' => $rule,
			'type' => 2,
			'byid' => $byid,
			'create_time' => date('Y-m-d h:i:s'),
		));

		Autumn::end(true , '' , array(
			'id' => $id
		));
	}

	

	/**
	 * 添加一个玩法组
	 * @return 
	 */
	public function Add_group(){
		$params = Autumn::params(array('name' , 'from_group'));
		Rule::check($params , array(
			'name' => array('max' => 16 , 'min' => 2 , 'name' => '规则名称') ,
			'from_group' => array('name' => '父索引' , 'is_number' => true) ,
		) , true);
		extract($params);
		if($this->Game_rule_model->is_exist(array('name' => $name , 'from_group' => (int) $from_group))){
			Autumn::end(false , '您输入的名称已经存在');
		}

		$id = $this->Game_rule_model->create(array(
			'name' => $name ,
			'from_group' => $from_group,
			'create_time' => date('Y-m-d h:i:s'),
			'type' => 1
		));

		Autumn::end(true , '' , array(
			'id' => $id
		));
	}

	/**
	 * 创建游戏规则
	 * @return [type] [description]
	 */
	public function Create(){
		$params = Autumn::params(array('name' , 'count'));
		Rule::check($params , array(
			'name' => array('max' => 16 , 'min' => 2 , 'name' => '规则名称') ,
			'count' => array('max' => 40 , 'min' => 1 , 'name' => '规则开奖位数' , 'is_number' => true) ,
		) , true);
		extract($params);


		$this->Game_rule_model->create(array(
			'name' => $name , 
			'count' => $count , 
			'create_time' => date('Y-m-d h:i:s'),
			'type' => 0
		));

		Autumn::end(true);
	}


}

?>