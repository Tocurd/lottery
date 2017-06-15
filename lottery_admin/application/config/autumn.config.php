<?php
$config['seeting'] = array(
	'base_url' => 'http://127.168.0.1/lottery/lottery_admin/',
	'api_url' => 'http://api..com/',

	'admin_view' => 'admin',
	'home_view' => 'home'
);

$config['actype'] = array('投注');

$config['betting_state'] = array(
	'betting_state' => array('未开奖' , '摇奖中' , '已开奖'),
	'winning_state' => array('未中奖' , '已中奖'),
	'sendprize_state' => array('未派奖' , '已派奖'),
);
