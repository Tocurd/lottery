<?php
/**
 * Admin 用于后台相关
 * Create Time : 2016年10月29日 09:40:15
 * Update Time : 2016年10月29日 09:40:30
 */
class Admin{
	static public $CI;
	public function __construct(){
		self::$CI = & get_instance();
	}

	static public function is_login($type = true , $jurisdiction = ''){
		if( ! isset($_SESSION['admin_user']['id'])){
			if($type){
				$admin_dir = self::$CI->config->item('seeting');
				$admin_dir = $admin_dir['base_url'] . $admin_dir['admin_view'];
				header('HTTP/1.1 302 Moved Permanently');
				header("Location: {$admin_dir}/login");
			}else{
				Autumn::end(false , '您还没有登陆，无法进行操作');
			}
		}
	}
}