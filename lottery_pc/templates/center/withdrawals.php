	<link rel="stylesheet" href="./assets/css/page/center.css">
	<link rel="stylesheet" href="./assets/bin/font-awesome/font-awesome.min.css">
</head>
<body>
	<?php $this->load->view('\template\top-header.php')?>
	<div class="warpper">

		<div class="title top">
			<i class="fa fa-cny"></i>
			平台提现
		</div>
		<?php $this->load->view('\template\center-left.php')?>
		<div class="right">
			<div class="page_list">
	            <div class="help">
	                <h4 class="fa fa-exclamation-circle"><span>提现须知</span></h4>
	                <p>1.每天限提&nbsp;<font style="font-size:16px;color:#e61414;font-weight:bold;">5</font>&nbsp;次，今天您已经成功发起了&nbsp;<font style="font-size:16px;color:#690;font-weight:bold;">0</font>&nbsp;次提现申请;</p>
	                <p>2.每天的提现处理时间为：<font style="font-size:16px;color:#e61414;font-weight:bold;">早上 10:00 至 次日凌晨2:10</font>;</p>
	                <p>3.<font color="#0066FF">新绑定的提款银行卡需要绑定时间超过&nbsp;<font style="font-size:16px;color:#e61414;font-weight:bold;">6</font>&nbsp;小时才能正常提款。</font><font color="#e61414">（新）</font>;</p>
	            </div>
	            <table border="0" cellspacing="0" cellpadding="0">
	                <form action="" method="post" name="drawform" id="drawform" onsubmit="return checkForm(this)"></form>
	                    <input type="hidden" name="flag" value="confirm">
	                    <input type="hidden" name="money" value="">
	                    <input type="hidden" name="transferfee" id="transferfee" value="">
	                    <tbody><tr>
	                        <td class="tdtitle" width="150" style="padding-top: 9px;">可提现金额：</td>
	                        <td>&nbsp;&nbsp;&nbsp;0.00</td>
	                    </tr>
	                    <tr>
	                        <td class="tdtitle">收款银行卡信息：</td>
	                        <td>
	                            <select name="bankinfo" id="bankinfo" onchange="changeBankInfo(this)">
	                                <option value="">请选择银行卡...</option>
	                                                                <option value="KAML7P">中国建设银行 | 银行卡尾号: 1872 </option>
	                                                            </select>&nbsp;&nbsp;<span style="color:red;"></span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="tdtitle">提现金额：</td>
	                        <td><span><input type="text" name="real_money" id="real_money" onkeyup="showPaymentFee(this.value);" placeholder="输入提现金额"></span>&nbsp;&nbsp;<span> ( 单笔提现限额：最低：&nbsp;<font style="color:#FF3300" id="min_money">100</font>&nbsp;元，最高：&nbsp;<font style="color:#FF3300" id="max_money">50000</font>&nbsp;元 ) </span></td>
	                    </tr>
	                    <tr>
	                        <td class="tdtitle" style="padding-top: 9px;">提现金额(大写)：</td>
	                        <td>&nbsp;<span id="chineseMoney"></span><input type="hidden" id="hiddenchinese"></td>
	                    </tr>
	                    <tr>
	                        <td class="tdtitle"></td>
	                        <td height="30"><br><button name="submit" type="submit" class="btn_next btn btn-flat-highlight"><i class="fa fa-chevron-right"></i> 下一步</button><br><br></td>
	                    </tr>
	                
	            </tbody></table>
	            <div class="clear"></div>
	        </div>

		</div>
	








	</div>
	<?php $this->load->view('\template\footer.php')?>
</body>
</html>