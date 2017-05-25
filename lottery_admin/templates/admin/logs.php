	<style type="text/css">
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('song_active' => 3))?>

	<div class="warpper">
		<table class="table-list">
			<tr>
				<th><input type="checkbox" name=""></th>
				<th>编号</th>
				<th>操作人</th>
				<th>操作类型</th>
				<th width="600">操作内容</th>
				<th>操作时间</th>
				<th width="150">操作可否撤回</th>
				<th width="150">数据位置</th>
				<th width="150">操作</th>
			</tr>
			<tr>
				<td><input type="checkbox" name=""></td>
				<td>10</td>
				<td>admin</td>
				<td>用户管理</td>
				<td>删除了“浪剑走天涯”用户，并将其IP永久性拉入黑名单</td>
				<td>2017年4月24日17:07:59</td>
				<td><span class="label danger">无法撤回</span></td>
				<td><span class="label success">回收站</span></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" name=""></td>
				<td>10</td>
				<td>admin</td>
				<td>用户管理</td>
				<td>删除了“浪剑走天涯”用户，并将其IP永久性拉入黑名单</td>
				<td>2017年4月24日17:07:59</td>
				<td><span class="label danger">无法撤回</span></td>
				<td><span class="label success">回收站</span></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" name=""></td>
				<td>10</td>
				<td>admin</td>
				<td>用户管理</td>
				<td>删除了“浪剑走天涯”用户，并将其IP永久性拉入黑名单</td>
				<td>2017年4月24日17:07:59</td>
				<td><span class="label danger">无法撤回</span></td>
				<td><span class="label success">回收站</span></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" name=""></td>
				<td>10</td>
				<td>admin</td>
				<td>用户管理</td>
				<td>删除了“浪剑走天涯”用户，并将其IP永久性拉入黑名单</td>
				<td>2017年4月24日17:07:59</td>
				<td><span class="label danger">无法撤回</span></td>
				<td><span class="label success">回收站</span></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" name=""></td>
				<td>10</td>
				<td>admin</td>
				<td>用户管理</td>
				<td>删除了“浪剑走天涯”用户，并将其IP永久性拉入黑名单</td>
				<td>2017年4月24日17:07:59</td>
				<td><span class="label danger">无法撤回</span></td>
				<td><span class="label success">回收站</span></td>
				<td></td>
			</tr>
		</table>

	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
</body>
</html>