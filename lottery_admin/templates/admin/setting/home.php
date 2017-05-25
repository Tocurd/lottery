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
					<td>smtp地址</td>
					<td><input type="text" name="" placeholder="请输入smtp地址"></td>
					<td><span class="label">smtpAddress</span></td>
				</tr>
				<tr>
					<td>smtp用户名</td>
					<td><input type="text" name="" placeholder="请输入smtp用户名"></td>
					<td><span class="label">smtpUsername</span></td>
				</tr>
				<tr>
					<td>smtp密码</td>
					<td><input type="text" name="" placeholder="请输入smtp密码"></td>
					<td><span class="label">smtpPassword</span></td>
				</tr>
				<tr>
					<td>最低提现金额</td>
					<td><input type="text" name="" placeholder="请输入最低提现金额"></td>
					<td><span class="label">withdrawalLostMoney</span></td>
				</tr>
				<tr>
					<td>最高提现金额</td>
					<td><input type="text" name="" placeholder="请输入最高提现金额"></td>
					<td><span class="label">withdrawalUpMoney</span></td>
				</tr>
				<tr>
					<td>开始提现的时间</td>
					<td><input type="text" name="" placeholder="请输入开始提现的时间"></td>
					<td><span class="label">withdrawalStartTime</span></td>
				</tr>
				<tr>
					<td>结束提现的时间</td>
					<td><input type="text" name="" placeholder="请输入结束提现的时间"></td>
					<td><span class="label">withdrawalEndTime</span></td>
				</tr>

				<tr>
					<td>允许的充值金额</td>
					<td><input type="text" name="" placeholder="请输入允许的充值金额 (以“,”号分割)"></td>
					<td><span class="label">rechargeAmountList</span></td>
				</tr>

				<tr>
					<td>充值二维码超时时长</td>
					<td><input type="text" name="" placeholder="请输入充值二维码超时时长"></td>
					<td><span class="label">withdrawalOutTime</span></td>
				</tr>
				<tr>
					<td>每日每人最大提现次数</td>
					<td><input type="text" name="" placeholder="请输入每日每人最大提现次数"></td>
					<td><span class="label">withdrawalMaxCount</span></td>
				</tr>

				<tr>
					<td>连续签到积分奖励格式</td>
					<td><input type="text" name="" placeholder="例子（0-5,6-10,11-20）"></td>
					<td><span class="label">signDayList</span></td>
				</tr>
				
				<tr>
					<td>总投注功能开关</td>
					<td><input type="text" placeholder="请输入总投注功能开关"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>代理投注开关</td>
					<td><input type="text" placeholder="请输入代理投注开关"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>上级充值开关</td>
					<td><input type="text" placeholder="请输入上级充值开关"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>中奖排行开关</td>
					<td><input type="text" placeholder="请输入中奖排行开关"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>投注记录开关</td>
					<td><input type="text" placeholder="请输入投注记录开关"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>站内信总开关</td>
					<td><input type="text" placeholder="请输入站内信总开关"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>后台充值声音开关</td>
					<td><input type="text" placeholder="请输入后台充值声音开关"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>后台提现声音开关</td>
					<td><input type="text" placeholder="请输入后台提现声音开关"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>投注模式</td>
					<td><input type="text" placeholder="请输入投注模式"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>前台密码错误</td>
					<td><input type="text" placeholder="请输入前台密码错误"></td>
					<td><span class="label">·····</span></td>
				</tr>
				
				<tr>
					<td>消费赠送开关</td>
					<td><input type="text" placeholder="请输入消费赠送开关"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>消费赠送标准</td>
					<td><input type="text" placeholder="请输入消费赠送标准"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>五分、两分、分分彩利润</td>
					<td><input type="text" placeholder="请输入五分、两分、分分彩利润"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>会员上榜最低中奖金额</td>
					<td><input type="text" placeholder="请输入会员上榜最低中奖金额"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>虚拟上榜会员昵称</td>
					<td><input type="text" placeholder="请输入虚拟上榜会员昵称"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>虚拟上榜中奖金额</td>
					<td><input type="text" placeholder="请输入虚拟上榜中奖金额"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>最大返点限制</td>
					<td><input type="text" placeholder="请输入最大返点限制"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>最大投注限制</td>
					<td><input type="text" placeholder="请输入最大投注限制"></td>
					<td><span class="label">·····</span></td>
				</tr>
				
				<tr>
					<td>清理账号规则</td>
					<td><input type="text" placeholder="请输入清理账号规则"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>清理数据</td>
					<td><input type="text" placeholder="请输入清理数据"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>清理数据 2</td>
					<td><input type="text" placeholder="请输入清理数据"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>充值佣金 活动</td>
					<td><input type="text" placeholder="请输入充值佣金"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>消费佣金 活动</td>
					<td><input type="text" placeholder="请输入消费佣金"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>返点最大值</td>
					<td><input type="text" placeholder="请输入返点最大值"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>上下级返点最小差值</td>
					<td><input type="text" placeholder="请输入上下级返点最小差值"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>积分比例</td>
					<td><input type="text" placeholder="请输入积分比例"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>积分规则</td>
					<td><input type="text" placeholder="请输入积分规则"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>
					<td>客服状态</td>
					<td><input type="text" placeholder="请输入客服状态"></td>
					<td><span class="label">·····</span></td>
				</tr>
				<tr>	
					<td>客服链接</td>
					<td><input type="text" placeholder="请输入客服链接"></td>
					<td><span class="label">·····</span></td>
				</tr>
			</table>
			<div class="tools" style="padding:0px 12px;margin-top:26px;">
				<button class='btn fezocms'><i class="fa fa-save"></i> 保存配置项</button>
				<button class='btn '>恢复默认配置</button>
			</div>
		</div>
		

	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
</body>
</html>