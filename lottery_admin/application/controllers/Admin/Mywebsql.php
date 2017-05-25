<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Mywebsql extends CI_Controller {
	public function __construct(){
		parent::__construct();
	}
	public function index(){


		Loader::view(array('Mywebsql/home') , array());
	}

}
