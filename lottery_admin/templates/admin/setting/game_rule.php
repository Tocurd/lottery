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
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 4 , 'song_active' => 2))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<div class="tools">
			<button class="btn danger fl"><i class="fa fa-trash-o"></i>删除</button>
			<button class="btn fezocms fl" onclick='window.location.href = "./{admin_view}/setting/game_rule/create"'><i class="fa fa-plus"></i>添加游戏规则</button>
		</div>
		<table class="table-list setting">
			<tr>
				<th width="40"><input type="checkbox" name=""></th>
				<th width="">规则名称</th>
				<th width="">规则位数</th>
				<th width="">创建时间</th>
				<th width="200">操作</th>
			</tr>

			{Game_rule_list}
			<tr data-id="{id}">
				<td><input type="checkbox" name=""></td>
				<td><input type="text" value="{name}"></td>
				<td><input type="text" value="{count}"></td>
				<td><input type="text" value="{create_time}"></td>
				
				<td>
					<i class="fa fa-edit"></i>
					<i class="fa fa-trash-o"></i>
				</td>
			</tr>
			{/Game_rule_list}
			
		</table>
		

	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
	<script type="text/javascript">
		$(".fa-edit").click(function(){
			var id = $(this).parent().parent().attr('data-id');
			window.location.href = './{admin_view}/setting/game_rule/edit?id=' + id
		});

		$(".fa-trash-o").click(function(){
			var id = $(this).parent().parent().attr('data-id');
			apiRequestSure({
				title : '删除顶级分类',
				content : '您确定要删除这个顶级分类？' , 
				otherParams : {
					id : id,
				},
				apiName : 'Game_rule/Delete',
				success : "删除成功"
			})
		})
	</script>
</body>
</html>