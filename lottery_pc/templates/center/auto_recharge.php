	<link rel="stylesheet" href="./assets/css/page/center.css">
	<link rel="stylesheet" href="./assets/bin/font-awesome/font-awesome.min.css">
</head>
<body>
	<?php $this->load->view('\template\top-header.php')?>
	<div class="warpper">

		<div class="title top">
			<i class="fa fa-cny"></i>
			自动充值
		</div>
		<?php $this->load->view('\template\center-left.php')?>
		<div class="right">

			<div class="menu-right">
			    <div class="padding">
			      <div class="page-info">
			        <div class="tabs">
			          <ul class="tabulous">
			                                                <li><a href="#tabs-100" class="tabulous_active">快捷充值一</a></li><span class="tabulousclear"></span>
			                                  </ul>
			          <div id="tabs_container" style="height: 592px;">                                     <div id="tabs-100" style="z-index: 9; position: absolute; top: 40px;">
			              <ul id="breadcrumbs-one">
			                <li><a href="javascript:;" class="tabulous_active">1.选择银行并填写金额</a></li>
			                <li><a href="javascript:;">2.跳转至三方充值平台</a></li>
			                <li><a href="javascript:;">3.登录网上银行汇款</a></li><span class="tabulousclear"></span>
			              </ul>
			              <table width="100%" class="ct" border="0" cellspacing="0" cellpadding="0">
			                <form action="" method="post" name="drawform" id="drawform100" onsubmit="return checkForm(this)"></form>
			                  <input type="hidden" name="flag" value="confirm">
			                  <input type="hidden" name="validcode" id="hiddenvalidcode100" value="">
			                  <input type="hidden" name="bankinfo" value="finaway" class="bankinfo100">
			                                    <tbody><tr>
			                    <td class="nl">充值银行:</td>
			                    <input type="hidden" id="checkbank100" value="1">
			                    <td style="height:60px;">                                             <input type="radio" name="bank" id="ICBC100" class="bank100" value="ICBC">
			                      &nbsp;
			                      <label for="ICBC100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/ICBC.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                                                                  <input type="radio" name="bank" id="CMBC100" class="bank100" value="CMBC">
			                      &nbsp;
			                      <label for="CMBC100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/CMBC.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                                                                  <input type="radio" name="bank" id="CMB100" class="bank100" value="CMB">
			                      &nbsp;
			                      <label for="CMB100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/CMB.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                                            <br>
			                      <br>
			                                            <input type="radio" name="bank" id="ABC100" class="bank100" value="ABC">
			                      &nbsp;
			                      <label for="ABC100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/ABC.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                                                                  <input type="radio" name="bank" id="CCB100" class="bank100" value="CCB">
			                      &nbsp;
			                      <label for="CCB100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/CCB.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                                                                  <input type="radio" name="bank" id="PSBC100" class="bank100" value="PSBC">
			                      &nbsp;
			                      <label for="PSBC100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/PSBC.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                                            <br>
			                      <br>
			                                            <input type="radio" name="bank" id="BCOM100" class="bank100" value="BCOM">
			                      &nbsp;
			                      <label for="BCOM100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/BCOM.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                                                                  <input type="radio" name="bank" id="BOC100" class="bank100" value="BOC">
			                      &nbsp;
			                      <label for="BOC100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/BOC.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                                                                  <input type="radio" name="bank" id="CIB100" class="bank100" value="CIB">
			                      &nbsp;
			                      <label for="CIB100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/CIB.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                                            <br>
			                      <br>
			                                            <input type="radio" name="bank" id="CEBB100" class="bank100" value="CEBB">
			                      &nbsp;
			                      <label for="CEBB100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/CEBB.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                                                                  <input type="radio" name="bank" id="SPDB100" class="bank100" value="SPDB">
			                      &nbsp;
			                      <label for="SPDB100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/SPDB.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                                                                  <input type="radio" name="bank" id="GDB100" class="bank100" value="GDB">
			                      &nbsp;
			                      <label for="GDB100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/GDB.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                                            <br>
			                      <br>
			                                            <input type="radio" name="bank" id="ECITIC100" class="bank100" value="ECITIC">
			                      &nbsp;
			                      <label for="ECITIC100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/ECITIC.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                                                                  <input type="radio" name="bank" id="HXB100" class="bank100" value="HXB">
			                      &nbsp;
			                      <label for="HXB100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/HXB.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                                                                  <input type="radio" name="bank" id="SPABANK100" class="bank100" value="SPABANK">
			                      &nbsp;
			                      <label for="SPABANK100"><img style="cursor:pointer;" src="http://swckfj.b0.upaiyun.com/images/banks/fastpay/SPABANK.gif"></label>
			                      &nbsp;&nbsp;&nbsp;
			                       </td>
			                  </tr>
			                                    <tr>
			                    <td class="nl">充值金额: </td>
			                    <td style="height:66px;"><input type="text" size="12" placeholder="填写金额" name="real_money" id="real_money100" maxlength="10" onkeyup="showPaymentFee();">
			                      （单笔充值限额，最低：<font style="color:#FF3300" id="loadmin100">&nbsp;50</font>元，最高：<font style="color:#FF3300" id="loadmax100">&nbsp;19999</font>元。
			                                         ）</td>
			                  </tr>
			                  <tr>
			                    <td class="nl">充值金额(大写): </td>
			                    <td style="height:60px;">&nbsp;<span id="chineseMoney100"></span>
			                      <input type="hidden" id="hiddenchinese100"></td>
			                  </tr>
			                  <tr>
			                    <td class="nl">验证码: </td>
			                    <td style="height:60px;"><input type="text" name="validcode_source" maxlength="4" value="" id="randnum100" placeholder="验证码" size="8" class="text">
			                      <img src="/?useValid=0.23420397234732304" name="validate" align="absbottom" id="validcode_source100" style="margin-left:6px;cursor:pointer; border: 1px solid #999" title="点击刷新" onclick="refreshimg(this)" valign="bottom"></td>
			                  </tr>
			                  <tr>
			                    <td colspan="2" height="30" align="center">
			                    <input name="submit" type="submit" value="下一步" width="69" height="26" class="btn_next"><br>
			                    <span id="msg_notice" style="color: red"></span>
			                  </td></tr>
			                
			              </tbody></table>
			            </div>
			                         </div>
			        </div>
			      </div>
			    </div>
			  </div>


		</div>
	








	</div>
	<?php $this->load->view('\template\footer.php')?>
</body>
</html>