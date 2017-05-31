	<link rel="stylesheet" href="./assets/css/page/center.css">
	<link rel="stylesheet" href="./assets/bin/font-awesome/font-awesome.min.css">
</head>
<body>
	<?php $this->load->view('\template\top-header.php')?>
	<div class="warpper">

		<div class="title top">
			<i class="fa fa-envelope"></i>
			我的消息
		</div>
		<?php $this->load->view('\template\center-left.php')?>
		<div class="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th>消息标题</th>
						<th>时间</th>
						<th>类型</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					{Message_list}
					<tr data-id="{id}">
						<td>{title}</td>
						<td>{time}</td>
						<td>{type}</td>
						<td>{state}</td>
						<td><i class="fa fa-trash-o"></i></td>
					</tr>
					{/Message_list}
				</tbody>
			</table>
			<?php $this->load->view('\template\page.php' , array('list_count' => 200))?>

		</div>
	








	</div>
	<?php $this->load->view('\template\footer.php')?>
</body>
</html>