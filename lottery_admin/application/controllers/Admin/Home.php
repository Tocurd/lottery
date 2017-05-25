<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Home extends CI_Controller {
	public function __construct(){
		parent::__construct();
		Admin::is_login();
	}
	public function index(){

		Loader::view(array('home') , array());
	}
}
