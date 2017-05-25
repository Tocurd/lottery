	<style type="text/css">
		.btn{padding:9px 27px;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 4 , 'song_active' => 0))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<div class="box">
			<h1>基础设置</h1>
			<table class="table-list setting">
				<tr>
					<th width="190">配置项名称</th>
					<th width="350">配置项值</th>
					<th width="220">调用方法</th>
				</tr>
				<tr>
					<td>平台名称</td>
					<td><input type="text" name="" placeholder="请输入smtp地址"></td>
					<td><span class="label">name</span></td>
				</tr>
				<tr>
					<td>smtp用户名</td>
					<td><input type="text" name="" placeholder="请输入smtp用户名"></td>
					<td><span class="label">smtpUsername</span></td>
				</tr>
				
			</table>
			<div class="tools" style="padding:0px 12px;margin-top:26px;">
				<button class='btn fezocms'><i class="fa fa-save"></i> 保存配置项</button>
				<button class='btn '>恢复默认配置</button>
			</div>
		</div>
		<div class="box">
			<h1>设置</h1>
		</div>
		

	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
</body>
</html>