<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Help extends CI_Controller {
	public function __construct(){
		parent::__construct();
		
		if( ! isset($_SESSION['user']['id'])) header("Location: ./login"); 
	}
	public function index(){

		Loader::view(array('help') , array() , 'home');
	}
}
