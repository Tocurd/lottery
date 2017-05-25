	<style type="text/css">
		.btn{padding:9px 27px;}
		.setting .label{margin-right: 11px;padding:6px;}
		.setting td{font-size: 13px;}
		.rule input[type='text']{width: 80px}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 4 , 'song_active' => 2))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<div class="box">
			<h1>基础设置</h1>
			<table class="table-list setting" api-name='Game_rule/Create'>
				<tr>
					<td>游戏规则名称</td>
					<td><input type="text" api-param-name='name' placeholder="请输入游戏规则名称"></td>
				</tr>
				<tr>
					<td>最大开奖位数</td>
					<td><input type="text" api-param-name='count' placeholder="请输入开奖位数"></td>
				</tr>
				<div class="menu">
					<div class="item"></div>
				</div>
			</table>

			<div class="tools" style="padding:0px 12px;margin-top:26px;">
				<button class='btn fezocms' id="js-save"><i class="fa fa-save"></i> 创建游戏规则</button>
				<button class='btn'>返回规则列表</button>
			</div>
		</div>
		

	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
	<script type="text/javascript">
		$("#js-save").click(function(){
			apiRequestItem({
				apiName : 'Game_rule/Create',
				success : '规则创建成功',
			})
		})
	</script>
</body>
</html>