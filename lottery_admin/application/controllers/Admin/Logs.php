<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Logs extends CI_Controller {
	public function __construct(){
		parent::__construct();
	}
	public function index(){


		Loader::view(array('logs') , array());
	}
}
