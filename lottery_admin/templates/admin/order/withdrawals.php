	<style>
		body{min-width: 1400px;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 2 , 'song_active' => 1))?>
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
				<th>订单号</th>
				<th>用户名</th>
				<th>提交时间</th>
				<th>提现金额</th>
				<th>提现状态</th>
				<th>操作</th>
			</tr>

			
			{Withdrawals_list}
			<tr data-id="{id}">
				<td><input type="checkbox"></td>
				<td>{order_id}</td>
				<td>{uid}</td>
				<td>{create_time}</td>
				<td>￥{money}</td>
				<td>{state}</td>
				<td>
					<i class="fa fa-check"></i>
					<i class="fa fa-trash-o"></i>
				</td>
			</tr>
			{/Withdrawals_list}
		</table>
	</div>

	<?php $this->load->view($admin_view . '/template/footer.php')?>
	
</body>
</html>