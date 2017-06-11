	<style type="text/css">
		input[type='checkbox'] , input[type='radio']{margin-right: 3px;margin-left:8px;position: relative;top:2px;}
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
					<td>最低提现金额</td>
					<td><input type="text" name="withdrawalLostMoney" value="{withdrawalLostMoney}" placeholder="请输入最低提现金额"></td>
					<td><span class="label">withdrawalLostMoney</span></td>
				</tr>
				<tr>
					<td>最高提现金额</td>
					<td><input type="text" name="withdrawalUpMoney" value="{withdrawalUpMoney}" placeholder="请输入最高提现金额"></td>
					<td><span class="label">withdrawalUpMoney</span></td>
				</tr>
				<tr>
					<td>开始提现的时间</td>
					<td><input type="text" name="withdrawalStartTime" value="{withdrawalStartTime}" placeholder="请输入开始提现的时间"></td>
					<td><span class="label">withdrawalStartTime</span></td>
				</tr>
				<tr>
					<td>结束提现的时间</td>
					<td><input type="text" name="withdrawalEndTime" value="{withdrawalEndTime}" placeholder="请输入结束提现的时间"></td>
					<td><span class="label">withdrawalEndTime</span></td>
				</tr>

				<tr>
					<td>允许的充值金额</td>
					<td><input type="text" name="recharge" value="{recharge}" placeholder="请输入允许的充值金额 (以“,”号分割)"></td>
					<td><span class="label">recharge</span></td>
				</tr>

				<tr>
					<td>充值二维码超时时长</td>
					<td><input type="text" name="out_time" value="{out_time}" placeholder="请输入充值二维码超时时长"></td>
					<td><span class="label">out_time</span></td>
				</tr>
				<tr>
					<td>每日每人最大提现次数</td>
					<td><input type="text" name="withdrawalMaxCount" value="{withdrawalMaxCount}" placeholder="请输入每日每人最大提现次数"></td>
					<td><span class="label">withdrawalMaxCount</span></td>
				</tr>

				<tr>
					<td>客服链接</td>
					<td><input type="text" name="customerServiceLink" value="{customerServiceLink}" placeholder="请输入客服链接"></td>
					<td><span class="label">customerServiceLink</span></td>
				</tr>

				<tr>
					<td>注册初始化返点</td>
					<td><input type="text" name="initializeRebate" value="{initializeRebate}" placeholder="请输入注册初始化返点"></td>
					<td><span class="label">initializeRebate</span></td>
				</tr>
				<tr>
					<td>赔率设置</td>
					<td><input type="text" name="oddsSetting" value="{oddsSetting}" placeholder="请输入赔率设置"></td>
					<td><span class="label">oddsSetting</span></td>
				</tr>


				
			</table>
			<div class="tools" style="padding:0px 12px;margin-top:26px;">
				<button class='btn fezocms' id="js-save"><i class="fa fa-save"></i> 保存配置项</button>
			</div>
		</div>
		

	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
	<script type="text/javascript">
		$("#js-save").click(function(){
			var data = [];
			$(".setting [name]").each(function(key , value){
				var name = $(value).attr('name');
				data[name] = $(value).val();
			});
			apiRequestItem({
				apiName : 'Config/Edit' , 
				otherParams : data,
				success : '编辑成功'
			})
		})
	</script>
</body>
</html>