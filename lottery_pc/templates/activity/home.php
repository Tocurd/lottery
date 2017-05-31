	<link rel="stylesheet" href="./assets/css/page/center.css">
	<link rel="stylesheet" href="./assets/bin/font-awesome/font-awesome.min.css">
	<style type="text/css">
		input[type='button']{
			transition-duration: 0.3s;
			background: #00a1cb;
			color: #ffffff;
			text-shadow: none;
			border: none;
			padding:8px;
			float: left;
			margin-right: 10px;
		}
		.right:after{
			left:0;
			right:0;
			margin:0 auto;
		}
	</style>
</head>
<body>
	<?php $this->load->view('\template\top-header.php')?>
	<div class="warpper">

		<div class="title top">
			<i class="fa fa-credit-card"></i>
			活动中心
		</div>
		<div class="right" style="width: 100%;">
			

		</div>
	

	</div>
	<?php $this->load->view('\template\footer.php')?>
</body>
</html>