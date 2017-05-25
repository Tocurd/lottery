	<style type="text/css">
		.btn{padding:9px 27px;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 4 , 'song_active' => 1))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<div class="box">
			<h1>添加彩种</h1>
			<table class="table-list setting" api-name='Lottery/Create'>
				<tr>
					
					<td>彩票名称</td>
					<td><input type="text" api-param-name="name" placeholder="请输入彩票名称"></td>
				</tr>
				<tr>
					<td>游戏规则</td>
					<td>
						<select api-param-name="from_group">
							{Game_rule_list}
								<option value="{id}">{name}</option>
							{/Game_rule_list}
						</select>
					</td>
				</tr>
				<tr>
					<td>彩票期数</td>
					<td><input type="text" api-param-name="periods" placeholder="请输入彩票期数"></td>
				</tr>
				<tr>
					<td>停止投注间隔 (秒)</td>
					<td><input type="text" api-param-name="stop_interval" placeholder="请输入停止投注间隔 (秒)"></td>
				</tr>
				<tr>
					<td>开奖间隔 (秒)</td>
					<td><input type="text" api-param-name="open_interval" placeholder="请输入开奖间隔 (秒)"></td>
				</tr>


				


			</table>
			<div class="tools" style="padding:0px 12px;margin-top:26px;">
				<button class='btn fezocms' id="js-save"><i class="fa fa-save"></i> 保存配置项</button>
				<button class='btn '>返回彩种列表</button>
			</div>
		</div>
		

	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
	<script type="text/javascript">
		$("#js-save").click(function(){
			apiRequestItem({
				apiName : 'Lottery/Create',
				success : '保存成功'
			})
		})
	</script>
</body>
</html>