	<style type="text/css">
		.setting {max-width: 100%!important;}
		.setting td{font-size: 13px;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 4 , 'song_active' => 4))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<div class="tools">
			<select value="<?=$this->input->get('from_lottery')?>" id="js-switch">
				{Lottery_list}
				<option value="{id}">{name}</option>
				{/Lottery_list}
			</select>
		</div>
		<table class="table-list setting">
			<tr>
				<th>彩种名称</th>
				<th>期数</th>
				<th>日期</th>
				<th>开奖数据</th>
				<th>状态</th>
				<th>开奖时间</th>
				<th width="90">订单数</th>
				<th width="90">已派奖</th>
				<th width="90">中奖数</th>
				<th width="90">参与人数</th>
				<th width="90">投注额</th>
				<th width="90">中奖额</th>
				<th width="90">返点额</th>
				<th width="90">盈亏</th>
				<th>操作</th>
			</tr>
			{Lottery_data_list}
			<tr data-id='{id}'>
				<td>{name}</td>
				<td>{periods}</td>
				<td>{day}</td>
				<td>{data}</td>
				<td>{state}</td>
				<td>{lottery_time}</td>
				<td>{order_count}</td>
				<td>{send_lottery_count}</td>
				<td>{winning_count}</td>
				<td>{participate_count}</td>
				<td>{betting_money}</td>
				<td>{winning_money}</td>
				<td>{rebate_money}</td>
				<td>{profit_loss}</td>

				<td>
					<i class="fa fa-edit"></i>
					<i class="fa fa-check"></i>
				</td>
			</tr>
			{/Lottery_data_list}
			
		</table>
		<?php $this->load->view('admin/template/page.php' , array(
			'count' => 14
		));?>

	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
	<script type="text/javascript">
		$("#js-add").click(function(){
			window.location.href = './{admin_view}/setting/lottery_list/create'
		});
		$(".fa-edit").click(function(){
			var id = $(this).parent().parent().attr('data-id');
			window.location.href = './{admin_view}/setting/lottery_list/edit?id=' + id;
		});

		$(".fa-check").click(function(){
			var id = $(this).parent().parent().attr('data-id');
			apiRequestSure({
				title : '您确定要开奖吗',
				content : '该操作无法撤回请谨慎操作，您确定要开奖吗？',
				apiName : 'Lottery_data/Open',
				success : '开奖成功',
				otherParams : {id : id}
			})
		});


		$("#js-switch").change(function(){
			var id = $(this).val();
			window.location.href = './{admin_view}/setting/lottery_time?lottery_data=' + id;
		});
	</script>
</body>
</html>