	<style>
		body{min-width: 1400px;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 2 , 'song_active' => 0))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<div class="tools">
			<button class="btn danger"><i class="fa fa-trash-o"></i>删除选中</button>
			<button class="btn fezocms"><i class="fa fa-search"></i>高级筛选</button>
			<button class="btn">取消筛选</button>
		</div>
		<table class="table-list">
			<tr>
				<th><input type="checkbox"></th>
				<th>用户名</th>	 
				<th>单号</th>	 
				<th>游戏</th>	 
				<th>玩法</th>	 
				<th>期号</th>	 
				<th>模式</th>	 
				<th>资金</th>	 
				<th>余额</th>	 
				<th>时间</th>	 
				<th>帐变类型</th>	 
			</tr>
			{Detail_list}
			<tr>
				<td><input type="checkbox"></td>
				<td>{uid}</td>
				<td>{order_id}</td>
				<td>{from_lottery}</td>
				<td>{from_game_rule}</td>
				<td>{from_periods}</td>
				<td>{pattern}</td>
				<td>{money}</td>
				<td>{balance}</td>
				<td>{create_time}</td>
				<td><span class="label success">{type}</span></td>
			</tr>
			{/Detail_list}
		</table>

	</div>

	<?php $this->load->view($admin_view . '/template/footer.php')?>
	
</body>
</html>