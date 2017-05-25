	<style type="text/css">
		.fezocms{padding:7px 27px;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 1 , 'song_active' => 3))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		
		<table class="table-list">
			<tr>
				<th><input type="checkbox"></th>
				<th>用户名</th>
				<th>银行名称</th>
				<th>银行账号</th>
				<th>开户姓名</th>
				<th>开户行</th>
				<th>操作</th>
			</tr>
			
		</table>
	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
</body>
</html>