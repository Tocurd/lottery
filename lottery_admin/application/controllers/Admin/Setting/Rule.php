<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Rule extends CI_Controller {
	public function __construct(){
		parent::__construct();
	}
	public function index(){

		Loader::view(array('setting/rule') , array());
	}
}
