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
	</style>
</head>
<body>
	<?php $this->load->view('\template\top-header.php')?>
	<div class="warpper">

		<div class="title top">
			<i class="fa fa-credit-card"></i>
			我的银行卡
		</div>
		<?php $this->load->view('\template\center-left.php')?>
		<div class="right">
			<div class="help">
                <h4 class="fa fa-exclamation-circle"><span>使用提示</span></h4>
                <p>1. 银行卡绑定成功后, 平台任何区域都 <span class="redts redtsb">不会</span> 出现您的完整银行账号, 开户姓名等信息。</p>
                <p>2. 每个游戏账号最多绑定<span class="redts redtsb">3</span> 张银行卡, 您已成功绑定<span class="redts redtsb">1</span> 张。</p>
                <p>3. 新绑定的提款银行卡需要绑定时间超过<span class="redts redtsb">6</span> 小时才能正常提款。</p>
                <p>4. 一个账户只能绑定同一个开户人姓名的银行卡。</p>
            </div>
			<table border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<th>银行名称</th>
						<th>卡号</th>
						<th>绑定时间</th>
						<th>操作</th>
					</tr>
					<tr align="center">
						<td>中国建设银行</td>
						<td>***************1872</td>
						<td>2017-05-24 22:16:57</td>
						<td><a href="./account_carddel.shtml?id=KAML7P">解绑</a></td>
						</tr>
						<tr>
						<td colspan="4">
						<input name="addcard" type="button" value="绑定银行卡" onclick="window.location.href = './account_cardadd.shtml?check=474'" class="btn_normal btn btn-tiny btn-flat-primary">
						&nbsp;&nbsp;<input name="addcard" type="button" value="锁定银行卡" onclick="window.location.href = './account_cardlock.shtml?check=474'" class="btn_normal btn btn-tiny btn-flat-primary">
						</td>
					</tr>
				</tbody>
			</table>

		</div>
	








	</div>
	<?php $this->load->view('\template\footer.php')?>
</body>
</html>