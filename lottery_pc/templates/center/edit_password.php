	<link rel="stylesheet" href="./assets/css/page/center.css">
	<link rel="stylesheet" href="./assets/bin/font-awesome/font-awesome.min.css">
	<style type="text/css">
		.page-info .page-title {
		    padding: 10px 30px;
		    font-weight: bold;
		    border-bottom: 1px dashed #dddddd;
		}

		.page-info table {
		    width: 96%;
		    margin: 0 auto;
		    margin-top:13px;
		}
		table td{
			border-collapse:collapse; 
		}
		.page-info td.tdtitle {
			width: 20%;
		}
		.page-info table th {
		    border: 1px solid #dddddd;
		    padding: 10px;
		    vertical-align: middle;
		}

		.page-info table td {
		    padding: 10px;
		    vertical-align: middle;
		    line-height:28px;
		}
		.page-info table td span{
		    line-height:28px;
		}
		.pop{
			font-size: 12px;
			text-align: left;
			color:#666;
		}
		input[type='text'] , input[type='password']{
			line-height: 25px;
			outline:none;
			height: 25px;
			position: relative;
			color: #555;
			margin: 0 8px;
			float: left;
			background: #fff;
			padding: 2px 5px 2px 5px;
			border: 1px solid #ccc;
			border-radius: 2px;
			-webkit-border-radius: 2px;
			-moz-border-radius: 2px;
			-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
			box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
			-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
			-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
			transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
		}
		button{
			margin-left:10px;
			float: left;
			cursor: pointer;
			padding:6px 21px;
			transition-duration: 0.3s;
			background: #f18d05;
			color: #ffffff;
			text-shadow: none;
			border: none;
		}
		.pop{
			float: left;
			margin-left: 9px;
		}

	</style>
</head>
<body>
	<?php $this->load->view('\template\top-header.php')?>
	<div class="warpper">
		<div class="title top">
			<i class="fa fa-lock"></i>
			安全中心
		</div>
		<?php $this->load->view('\template\center-left.php')?>
		<div class="right">
			<div class="menu-right">
			    <div class="page-info">
			        <div class="page_list">
			            <div class="page-title">一、修改登录密码</div>
			            <form action="" method="post" name="changepass" onsubmit="return checkform(this)">
			                <table border="0" cellspacing="0" cellpadding="0">
			                    <tbody>

			                    <tr>
			                        <td class="tdtitle">输入旧登录密码: </td>
			                        <td>
			                        	<input type="password" name="oldpass" id="oldpass">
			                        </td>
			                    </tr>
			                    <tr>
			                        <td class="tdtitle">输入新登录密码: </td>
			                        <td>
			                        	<input type="password" name="newpass" id="newpass"><br>
			                        	<span class="pop"><s class="pop-l"></s><span>( 由字母和数字组成6-16个字符；且必须包含数字和字母，不允许连续三位相同，不能和资金密码相同 ) </span>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td class="tdtitle">确认新登录密码: </td>
			                        <td>
			                            <input type="password" name="confirm_newpass" id="confirm_newpass" >
									</td>
								</tr>
								<tr>
									<td></td>
									<td>
			                            <button name="submit" type="submit" class="btn_next btn btn-flat-highlight"><i class="fa fa-send"></i> 提交</button>
			                            <input type="hidden" name="check" value="474">
			                            <input type="hidden" name="flag" value="changepass">
			                            <input type="hidden" name="changetype" value="loginpass">
			                        </td>
			                    </tr>
			                </tbody></table>
			            </form>
			        </div>
			        <div class="clear"></div>
			                <div class="page_list">
			            <div class="page-title">二、修改资金密码</div>
			            <form action="" method="post" name="changepass" onsubmit="return checkform(this)">
			                <table border="0" cellspacing="0" cellpadding="0">
			                  <tbody><tr>
			                        <td class="tdtitle">输入旧资金密码: </td>
			                        <td style="position: relative;">
			                            <input type="password" name="oldpass" id="securityoldpass">
			                    </tr>
			                                        <tr>
			                        <td class="tdtitle">输入新资金密码: </td>
			                        <td style="position: relative;">
			                            <input type="password" name="newpass" id="securitynewpass"><br>
			                            <span class="pop"><s class="pop-l"></s><span>(由字母和数字组成6-16个字符；且必须包含数字和字母，不允许连续三位相同，不能和登录密码相同) </span><s class="pop-r"></s></span>
			                    </tr>
			                    <tr>
			                        <td class="tdtitle">确认新资金密码: </td>
			                        <td style="position: relative;">
			                            <input type="password" name="confirm_newpass" id="confirm_securitynewpass"><div class="keyboard confirm_securitynewpass" style="display: none;"><ul><li class="numkey"><div class="key">1</div><div class="key">2</div><div class="key">3</div><div class="key">4</div><div class="key">5</div><div class="key">6</div><div class="key">7</div><div class="key">8</div><div class="key">9</div><div class="key">0</div></li><div class="clear"></div><li><div class="key charkey">a</div><div class="key charkey">b</div><div class="key charkey">c</div><div class="key charkey">d</div><div class="key charkey">e</div><div class="key charkey">f</div><div class="key charkey">g</div><div class="key charkey">h</div><div class="key charkey">i</div><div class="key charkey">j</div><div class="key charkey">k</div><div class="key charkey">l</div><div class="key charkey">m</div></li><div class="clear"></div><li><div class="key charkey">n</div><div class="key charkey">o</div><div class="key charkey">p</div><div class="key charkey">q</div><div class="key charkey">r</div><div class="key charkey">s</div><div class="key charkey">t</div><div class="key charkey">u</div><div class="key charkey">v</div><div class="key charkey">w</div><div class="key charkey">x</div><div class="key charkey">y</div><div class="key charkey">z</div></li><div class="clear"></div><li class="funtion"><div class="funkey shift">大小写</div><div class="funkey ok">确定</div><div class="funkey cancel">取消</div><div class="funkey back">后退</div><div class="funkey usekey" style="color:red;font-weight:bold;">键盘录入</div></li><div class="clear"></div></ul></div></td></tr><tr><td></td><td>
			                            <button name="submit" type="submit" class="btn_next btn btn-flat-highlight"><i class="fa fa-send"></i> 提交</button>
			                            <input type="hidden" name="check" value="474">
			                            <input type="hidden" name="flag" value="changepass">
			                            <input type="hidden" name="changetype" value="secpass">
			                        </td>
			                    </tr>
			                </tbody></table>
			            </form>
			        </div>
			                <div class="clear"></div>
			                <div class="page_list">
			            <div class="page-title">三、修改登录问候语</div>
			            <form action="" method="post" name="changepass">
			                <table border="0" cellspacing="0" cellpadding="0">
			                    <tbody><tr>
			                        <td class="tdtitle">登录问候语: </td>
			                        <td>
			                            <input type="text" maxlength="50" style="color:#f33;height:25px;line-height:25px;width:360px;padding-left:3px;" name="logmsg" value=""><br>
			                            <span class="pop"><s class="pop-l"></s><span> (在登录界面,输入用户名后,您会看到此处设置的登录问候语,避免仿冒钓鱼网站) </span><s class="pop-r"></s></span>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td></td>
			                        <td>
			                            <button name="submit" type="submit" class="btn_next btn btn-flat-highlight"><i class="fa fa-send"></i> 提交</button>
			                            <input type="hidden" name="check" value="474">
			                            <input type="hidden" name="flag" value="changepass">
			                            <input type="hidden" name="changetype" value="loginmsg">
			                        </td>
			                    </tr>
			                </tbody></table>
			            </form>
			        </div>
			                <div class="clear"></div>
			    </div>
			</div>		
		
		
		
		
		
		
		</div>
	








	</div>
	<?php $this->load->view('\template\footer.php')?>
</body>
</html>