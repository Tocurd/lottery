	<style type="text/css">
		.footer .btn{padding:9px 27px;}
		.setting{max-width: 100%;}
		.tools{margin-top:3px;}
		.setting input[type='text']{width: 100%;}
		.setting th{background-color: #f7f7f7;}
		.setting select{border:1px solid #eee;border-radius:10px;padding:5px;cursor: pointer;outline: none;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 4 , 'song_active' => 1))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<div class="tools">
			<button class="btn danger fl"><i class="fa fa-trash-o"></i>删除</button>
			<button class="btn fezocms fl" id="js-add"><i class="fa fa-plus"></i>添加彩票种类</button>
		</div>
		<table class="table-list setting">
			<tr>
				<th width="40"><input type="checkbox" name=""></th>
				<th width="200">彩种名称</th>
				<th width="">彩种简称</th>
				<th width="">游戏规则</th>
				<th>停止投注间隔 (秒)</th>
				<th width="">开奖间隔 (秒)</th>
				<th width="200">操作</th>
			</tr>
			{Lottery_list}
			<tr data-id='{id}'>
				<td><input type="checkbox" name=""></td>
				<td>{name}</td>
				<td>{name}</td>
				<td>{from_group}</td>
				<td><input type="text" name="" value="30"></td>
				<td><input type="text" name="" value="600"></td>
				<td>
					<i class="fa fa-edit"></i>
					<i class="fa fa-trash-o"></i>
				</td>
			</tr>
			{/Lottery_list}
			
		</table>
		

	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
	<script type="text/javascript">
		$("#js-add").click(function(){
			window.location.href = './{admin_view}/setting/lottery_list/create'
		});
		$(".fa-edit").click(function(){
			var id = $(this).parent().parent().attr('data-id');
			window.location.href = './{admin_view}/setting/lottery_list/edit?id=' + id;
		})
	</script>
</body>
</html>