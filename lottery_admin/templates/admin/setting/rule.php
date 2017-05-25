	<style type="text/css">
		.btn{padding:9px 27px;}
		h1 select{
			font-size: 14px;
			border:1px solid #eee;
			cursor: pointer;
			border-radius: 5px;
			position: relative;
			top:-2px;
			margin-left: 5px;
			outline: none;
			padding:2px 4px;
		}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 4 , 'song_active' => 2))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<div class="box">
			<h1>玩法设置 <select name="" >
				<option value="">option</option>
			</select></h1>
			<table class="table-list setting">
				<tr>
					<th>五星玩法</th>
				</tr>
				<tr>
					<td>彩票名称</td>
					<td><input type="text" name="" placeholder="请输入彩票名称"></td>
				</tr>
				<tr>
					<td>彩票简称</td>
					<td><input type="text" name="" placeholder="请输入彩票简称"></td>
				</tr>
				<tr>
					<td>游戏规则</td>
					<td>
						<select name="">
							<option value="">时时彩</option>
							<option value="">十一选五</option>
							<option value="">北京赛车</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>彩票期数</td>
					<td><input type="text" name="" placeholder="请输入彩票期数"></td>
				</tr>
				<tr>
					<td>停止投注间隔 (秒)</td>
					<td><input type="text" name="" placeholder="请输入停止投注间隔 (秒)"></td>
				</tr>
				<tr>
					<td>开奖间隔 (秒)</td>
					<td><input type="text" name="" placeholder="请输入开奖间隔 (秒)"></td>
				</tr>
				<tr>
					<td>允许选择的号码</td>
					<td><input type="text" name="" placeholder="请输入允许选择的号码"></td>
				</tr>



			</table>
			<div class="tools" style="padding:0px 12px;margin-top:26px;">
				<button class='btn fezocms'><i class="fa fa-save"></i> 保存配置项</button>
				<button class='btn '>返回彩种列表</button>
			</div>
		</div>
		

	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
</body>
</html>