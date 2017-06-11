<?php
/**
 * SpeedFrame 框架全局常用通用函数集合
 * Create Time : 2016年10月29日 09:40:15
 * Update Time : 2016年10月29日 09:40:30
 */
class Autumn{
	static public $CI;
	public function __construct(){
		self::$CI = & get_instance();
	}
	

	static public function getRealIp(){
		$ip = false;
		if(!empty($_SERVER["HTTP_CLIENT_IP"])){
			$ip = $_SERVER["HTTP_CLIENT_IP"];
		}
		if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
			$ips = explode (", ", $_SERVER['HTTP_X_FORWARDED_FOR']);
		if ($ip) { array_unshift($ips, $ip); $ip = FALSE; }
		for ($i = 0; $i < count($ips); $i++) {
		if (!eregi ("^(10│172.16│192.168).", $ips[$i])) {
		$ip = $ips[$i];
		break;
		}
		}
		}
		return ($ip ? $ip : $_SERVER['REMOTE_ADDR']);
	}




	/**
	 * 网站通用参数获取函数
	 * @param  array  $params [description]
	 * @param  string $method [description]
	 * @return [type]         [description]
	 */
	static public function params($params = array() , $method = 'POST'){
		$params_list = strtoupper($method) === 'POST' ? self::$CI->input->post(NULL , TRUE) : self::$CI->input->get(NULL , TRUE);
		foreach ($params as $key => $value){
			$params_value = is_numeric($key) ? $value : $key;
			if( ! isset($params_list[$params_value])) self::end(false , '您输入的参数不完全，请检查您输入的数据');

			$return_params[$params_value] = !is_numeric($key) & $value == false ? $params_list[$params_value] : @htmlspecialchars($params_list[$params_value]);
		}
		return $params_list;
	}



	/**
	 * 网站通用请求结束接口
	 * @param  boolean $state     [description]
	 * @param  [type]  $errorCode [description]
	 * @return [type]             [description]
	 */
	static public function end($state = true , $message = '' , $other = array()){
		exit(json_encode(array(
			'state' => $state , 
			'message' => $message ,
			'requestTime' => time() , 
			'result' => $other ,
		)));
	}
}