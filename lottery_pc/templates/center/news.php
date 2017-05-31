	<link rel="stylesheet" href="./assets/css/page/center.css">
	<link rel="stylesheet" href="./assets/bin/font-awesome/font-awesome.min.css">
	<style type="text/css">
		.news .item{
			float: left;
			width: 100%;
			padding: 0 40px;
			line-height: 38px;
			border-bottom: 1px #e1e1e1 dashed;
			color: #000;
		}
		.news .item .time{
			float: right;
			color: #ccc;
		}
		.news .item:hover{
			background-color: #f5dcca;
			transition: all .3s ease-in-out;
			-moz-transition: all .3s ease-in-out;
			-webkit-transition: all .3s ease-in-out;
			-o-transition: all .3s ease-in-out;
			-ms-transition: all .3s ease-in-out
		}
	</style>
</head>
<body>
	<?php $this->load->view('\template\top-header.php')?>
	<div class="warpper">

		<div class="title top">
			<i class="fa fa-volume-up"></i>
			平台动态
		</div>
		<?php $this->load->view('\template\center-left.php')?>
		<div class="right news">
			<a href="">
				<div class="item">
					<span>{title}</span>
					<span class="time">{time}</span>
				</div>
			</a>


		</div>
	








	</div>
	<?php $this->load->view('\template\footer.php')?>
</body>
</html>