	<style type="text/css">
	
		.warpper{padding:0px 0px 0px 137px;height: 100%;overflow: hidden;}
		.warpper iframe{width: 100%;height:100%;border:none;overflow: hidden;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('song_active' => 2))?>

	<div class="warpper" style="">
		<iframe src="./mywebsql" frameborder="0" scrolling="no"></iframe>
	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
</body>
</html>