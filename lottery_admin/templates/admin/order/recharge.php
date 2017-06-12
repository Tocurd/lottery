	<style>
		body{min-width: 1400px;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 2 , 'song_active' => 3))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<div class="tools">
			<button class="btn danger"><i class="fa fa-trash-o"></i>删除选中</button>
			<button class="btn fezocms"><i class="fa fa-search"></i>高级筛选</button>
			<button class="btn">取消筛选</button>
		</div>
		<table class="table-list">
			<tr>
				<th limit='order_delete_all'><input type="checkbox" id="js-select-all"></th>
				<th>订单号</th>
				<th>用户名</th>
				<th>提交时间</th>
				<th>充值金额</th>
				<th>充值前金额</th>
				<th>支付方式</th>
				<th>线路</th>
				<th>状态</th>
				<th>操作</th>
			</tr>

			{Recharge_list}
				<tr data-json='{json}'>
					<td limit='order_delete_all'><input type="checkbox"></td>
					<td>{order_id}</td>
					<td>{uid}</td>
					<td>{create_time}</td>
					<td>￥{money}</td>
					<td>￥{remoney}</td>
					<td>线路{branch}</td>
					<td>{pay_type}</td>
					<td>{state}</td>
					
					<td>
						<i data-type='edit' limit='order_success' class="fa fa-check"></i>
						<i data-type='edit' limit='order_delete' class="fa fa-trash-o"></i>
					</td>
				</tr>
			{/Recharge_list}
			<style type="text/css">
				.table-view td {
				    color: #333;
				    padding: 9px 20px;
				    border-top: 1px solid #f5f5f5;
				}
			</style>


			
		</table>
		<?php $this->load->view('admin/template/page.php' , array(
		));?>
	</div>

	<?php $this->load->view($admin_view . '/template/footer.php')?>
	<script type="text/javascript">


		function tableToolsClick(clickType , $this){
			var data = $this.parent().parent().data('json');
			switch(clickType){
				
				case 'check' :
					apiRequestSure({
						title : "您确认执行到账操作吗" , 
						content : "您确认执行到账操作吗",
						apiName : 'Order/Success',
						success : '已到账成功',
						otherParams : {
							id : data.id
						}
					})
				break;
				case 'trash' : 
					apiRequestSure({
						title : "您确认删除吗" , 
						content : "点击确认后将会删除该数据",
						apiName : 'Order/Remove',
						success : '删除成功',
						otherParams : {
							type : 0,
							id : data.id
						}
					})
				break;


			}
		}

	</script>
</body>
</html>