	<link rel="stylesheet" href="./assets/css/page/center.css">
	<link rel="stylesheet" href="./assets/bin/font-awesome/font-awesome.min.css">
</head>
<body>
	<?php $this->load->view('\template\top-header.php')?>
	<div class="warpper">

		<div class="title top">
			<i class="fa fa-cny"></i>
			提现记录
		</div>
		<?php $this->load->view('\template\center-left.php')?>
		<div class="right">
			<div class="page-info">
		        <div class="page_search">
		            <table border="0" cellspacing="0" cellpadding="0">
		                <form action="" method="get" name="search" onsubmit="return checkForm(this)"></form>
		                    <input type="hidden" name="check" value="">
		                    <tbody><tr><td>
		                            提现时间: <input type="text" size="20" name="time_min" id="time_min" value="2017-05-27 03:00:00">
		                            <img class="icons_mb4" src="http://swckfj.b0.upaiyun.com/images/comm/t.gif" id="time_min_button">
		                            &nbsp;至&nbsp;
		                            <input type="text" size="20" name="time_max" id="time_max" value="">
		                            <img class="icons_mb4" src="http://swckfj.b0.upaiyun.com/images/comm/t.gif">&nbsp;&nbsp;<button name="submit" type="submit" class="btn_search btn btn-flat-action" style="position:relative; top:-2px;"><i class="fa fa-search"></i> 搜索 </button>&nbsp;&nbsp;&nbsp;
		                        </td>
		                    </tr>
		                
		            </tbody></table>
		        </div>
		        <div class="clear"></div>
		        <div class="page_list">
		            <table border="0" cellspacing="0" cellpadding="0">
		                <tbody><tr>
		                    <th>提现编号</th>
		                    <th>申请发起时间</th>
		                    <th>提现银行</th>
		                    <th>银行卡尾号</th>
		                    <th>提现金额</th>
		                    <th>手续费</th>
		                    <th>到账金额</th>
		                    <th>排队人数</th>
		                    <th>状态</th>
		                </tr>
		                                <tr align="center"><td colspan="10" class="no-records"><span>暂无数据</span></td></tr>
		                                <tr style="color:#FF3300">
		                    <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;
		                        <font color="#FF3300">合计: </font>&nbsp;&nbsp;</td>
		                    <td align="center"><font color="#FF3300">0.0000</font></td>
		                    <td align="center"><font color="#FF3300">0.0000</font></td>
		                    <td align="center"><font color="#FF3300">0.0000</font></td>
		                    <td></td>
		                    <td></td>
		                </tr>
		                <tr><td class="b" colspan="10" valign="middle"><div style="text-align:right;"><ul class="pager">总计 0 条数据,  共 0 页 , 当前第 0 页  |   | 转至 <script language="JAVASCRIPT">function keepKeyNum(obj,evt){var  k=window.event?evt.keyCode:evt.which; if( k==13 ){ goPage(obj.value);return false; }} function goPage( iPage ){ if( !isNaN(parseInt(iPage)) ) { if(iPage> 0 ){iPage=0;} window.location.href="?check=&action_menuid=33&pn=25&p="+iPage;}}</script><input onkeypress="return keepKeyNum(this,event);" type="TEXT" id="iGotoPage" name="iGotoPage" size="3"> 页  &nbsp;<span class="pagebutton" onclick="javascript:goPage( document.getElementById('iGotoPage').value );return false;">转到</span>&nbsp;&nbsp;</ul></div></td></tr>
		            </tbody></table>
		        </div>
		        <div class="clear"></div>
		    </div>

		</div>
	








	</div>
	<?php $this->load->view('\template\footer.php')?>
</body>
</html>