<div class="left-menu">
	<div class="header-image">
		<img src="http://qlogo4.store.qq.com/qzone/1137716847/1137716847/50?1458033117">
	</div>
	<div class="menu">
		<ul>
			<li><a href="./{admin_view}/"><i class="fa fa-home"></i> <div class="title">首页</div></a></li>
			<li><a href="./{admin_view}/admin_user"><i class="fa fa-user-o"></i> <div class="title">用户管理</div></a></li>
			<li><a href="./{admin_view}/order"><i class="fa fa-file-text-o"></i> <div class="title">业务流水</div></a></li>
			<li><a href="3"><i class="fa fa-photo"></i> <div class="title">其他设置</div></a></li>
			<li><a href="./{admin_view}/setting"><i class="fa fa-cog"></i> <div class="title">其他设置</div></a></li>
		</ul>
	</div>
	<div class="song-menu">
		<div class="header-user-data">
			后台管理系统<br>
			<span>tocurd.com</span>
		</div>
		<div class="item">
			<ul>
				<li><a href="./admin"><i class="fa fa-home"></i>后台首页</a></li>
				<li><a href="./{admin_view}/garbage"><i class="fa fa-ravelry" style="margin-left:2px;margin-right: 8px"></i>垃圾检测</a></li>
				<li><a href="./{admin_view}/mywebsql"><i class="fa fa-newspaper-o" style="margin-right:8px;position: relative;left:0px;"></i>数据管理</a></li>
				<li><a href="./{admin_view}/logs"><i class="fa fa-calculator"></i>操作日志</a></li>
				<li><a href="3"><i class="fa fa-folder-o" style="margin-right: 9px;position: relative;left:1px;"></i>文件管理</a></li>
				<li><a href="3"><i class="fa fa-envelope-o" style="margin-right: 9px;position: relative;left:1px;"></i>内部邮件</a></li>
				<li><a href="3"><i class="fa fa-bell-o" style="margin-right: 9px;position: relative;left:1px;"></i>消息通知</a></li>
				<li><a href="3"><i class="fa fa-refresh" style="margin-right: 9px;position: relative;left:1px;"></i>缓存管理</a></li>
				<li><a href="3"><i class="fa fa-calculator"></i>系统日志</a></li>
				<li><a href="3"><i class="fa fa-bell-o"></i>系统警告</a></li>
			</ul>
		</div>
		<div class="item">
			<ul>
				<li><a href="./{admin_view}/admin_user"><i class="fa fa-user"></i>管理列表</a></li>
				<li><a href="./{admin_view}/admin_user/group"><i class="fa fa-list"></i>管理权组</a></li>
				<li><a href="./{admin_view}/user"><i class="fa fa-users"></i>用户列表</a></li>
				<li><a href="./{admin_view}/card"><i class="fa fa-list"></i>银行绑定</a></li>
			</ul>
		</div>
		<div class="item">
			<ul>
				<li><a href="./{admin_view}/order"><i class="fa fa-list"></i>充值订单</a></li>
				<li><a href="./{admin_view}/order/withdrawals"><i class="fa fa-list"></i>提现请求</a></li>
				<li><a href="./{admin_view}/order/betting"><i class="fa fa-list"></i>投注订单</a></li>
				<li><a href="./{admin_view}/order/detail"><i class="fa fa-list"></i>帐变明细</a></li>
			</ul>
		</div>
		<div class="item">
			<ul>
				<li><a href="./admin"><i class="fa fa-home"></i>后台首页</a></li>
			</ul>
		</div>
		<div class="item">
			<ul>
				<li><a href="./{admin_view}/setting"><i class="fa fa-cog"></i>基础设置</a></li>
				<li><a href="./{admin_view}/setting/lottery_list"><i class="fa fa-building-o"></i>彩种设置</a></li>
				<li><a href="./{admin_view}/setting/game_rule"><i class="fa fa-building-o"></i>游戏规则</a></li>
				<li><a href="./{admin_view}/setting/lottery_time"><i class="fa fa-building-o"></i>开奖时间</a></li>
				<li><a href="./{admin_view}/setting/lottery_data"><i class="fa fa-building-o"></i>开奖数据</a></li>
			</ul>
		</div>


		<script type="text/javascript">
			var menuActive = <?=isset($active) ? $active : 0?>;
			var menuSongActive = <?=isset($song_active) ? $song_active : 0?>;
		</script>
	</div>

</div>