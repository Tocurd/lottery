	<style>
		body{min-width: 1400px;}
		.sheng{width:80px;display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}
		.table-list *{font-size: 13px!important;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 2 , 'song_active' => 2))?>
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
				<th>单号</th>
				<th>用户名</th>
				<th>投注时间</th>
				<th>彩种</th>
				<th>玩法</th>
				<th>期号</th>
				<th>倍数</th>
				<th>注数</th>
				<th>模式</th>
				<th>投注号码</th>
				<th>投注金额</th>
				<th>中奖金额</th>
				<th>返点</th>
				<th>状态</th>
				<th>操作</th>
			</tr>

			{Betting_list}
			<tr>
				<td><input type="checkbox"></td>
				<td>{order_id}</td>
				<td>{uid}</td>
				<td>{create_time}</td>
				<td>{from_lottery}</td>
				<td>{from_game_rule}</td>
				<td>{from_periods}</td>
				<td>{multiple}</td>
				<td>{notes}</td>
				<td>{pattern}</td>
				<td><span class="sheng">{number}</span></td>
				<td>{money}</td>
				<td>{winning_money}</td>
				<td>{rebate}</td>
				<td>{state}</td>
				<td>
					<i class="fa fa-check"></i>
					<i class="fa fa-trash-o"></i>
				</td>
			</tr>
			{/Betting_list}
		</table>
		</div>

	<?php $this->load->view($admin_view . '/template/footer.php')?>
	
</body>
</html>