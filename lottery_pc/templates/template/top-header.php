<div class="top-header">
	<div class="warpper">

		<div id="dd" class="header-nav-game" tabindex="1"><span class="nav-game-bt">全部游戏</span>
			<dl class="dropdown">
				<?php
					// 左侧导航栏
					$CI = & get_instance();
					$CI->load->model('Lottery_model');
					$CI->load->model('Game_rule_model');
					$Game_rule_list = $CI->Game_rule_model->get_list(array('type' => 0) , 1 , 1 , array() , 'all');
					foreach($Game_rule_list as &$value) {
						$value['lottery'] = $CI->Lottery_model->get_list(array('from_group' => $value['id']) , 1 , 1 , array() , 'all');
					}


					foreach ($Game_rule_list as $key => $value) {
						echo "<dt><i class='fa fa-bars'></i>{$value['name']}</dt>";
						foreach ($value['lottery'] as $lottery_key => $lottery_value) {
							echo "<dd><a href='./lottery?id={$lottery_value['id']}' title='{$lottery_value['name']}'><span class='fa fa-chevron-circle-right fa-lg'></span>{$lottery_value['name']}</a></dd>";
						}
					}
				?>
			</dl>
		</div>

		<ul class="header-nav-user">
			<li>
				<a class="account_autosave" href="http://game.nb15.net/account_autosave.shtml">
					<div class="fa fa-cny fa-2x"></div>
					<span>充值提现</span>
				</a>
			</li>
			<li>
				<a class="users_info" href="http://game.nb15.net/users_message.shtml">
					<div class="fa fa-user fa-2x"></div>
					<span>账户中心</span>
				</a>
			</li>
			<li>
				<a class="promotion_center" href="http://game.nb15.net/promotion_center.shtml">
					<div class="fa fa-bullhorn fa-2x"></div>
					<span>活动中心</span>
				</a>
			</li>
			<li>
				<a class="help_general" href="http://game.nb15.net/help_general.shtml">
					<div class="fa fa-question fa-2x"></div>
					<span>常见问题</span>
				</a>
			</li>
			<li>
				<a class="history_playlist" href="http://game.nb15.net/download/">
					<div class="fa fa-cloud-download fa-2x"></div>
					<span>客户端</span>
				</a>
			</li>
		</ul>
	</div>
</div>