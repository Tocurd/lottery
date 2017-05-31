	<link rel="stylesheet" href="./assets/css/page/center.css">
	<link rel="stylesheet" href="./assets/bin/font-awesome/font-awesome.min.css">
</head>
<body>
	<?php $this->load->view('\template\top-header.php')?>
	<div class="warpper">

		<div class="title top">
			<i class="fa fa-list-alt"></i>
			电子回单
		</div>
		<?php $this->load->view('\template\center-left.php')?>
		<div class="right news">
			<div class="page-info">
		        <div class="page_head">
		            <table border="0" cellspacing="0" cellpadding="0">
		                <tbody><tr>
		                    <td class="child_menu">
		                        <span class="tab-front">
		                            <span class="content"><a class="title_menu1 act fa fa-align-right" href="/account_ebilllist.shtml"><span>电子回单列表</span></a></span>
		                        </span>
		                        <span class="tab-back">
		                            <span class="content"><a class="title_menu act fa fa-file-text-o" href="/account_ebill.shtml"><span>电子回单</span></a></span>
		                        </span>
		                    </td>
		                </tr>
		            </tbody></table>
		        </div>
		        <div class="clear"></div>
		        <div class="page_search">
		            <form action="" method="GET" name="searchForm">
		                <table border="0" cellspacing="0" cellpadding="0">
		                    <input type="hidden" name="isrequery" value="1">
		                    <tbody><tr>
		                        <td>
		                            <img src="http://swckfj.b0.upaiyun.com/images/comm/icon_search.gif" width="26" height="22" border="0" title="SEARCH">
		                            时间:
		                            <input type="text" name="starttime" id="starttime" value="2017-05-31 03:00:00" size="20">
		                            <img class="icons_mb4" src="http://swckfj.b0.upaiyun.com/images/comm/t.gif">
		                            &nbsp;&nbsp;至&nbsp;&nbsp;
		                            <input type="text" name="endtime" id="endtime" value="2017-06-01 03:00:00" size="20">
		                            <img class="icons_mb4" src="http://swckfj.b0.upaiyun.com/images/comm/t.gif">
		                            <button name="submit" type="submit" class="btn_search btn btn-tiny btn-flat-action"><i class="fa fa-search"></i> 搜索 </button>
		                        </td>
		                    </tr>
		                    <!--<tr>-->
		                        <!--<td>-->
		                            <!--<div id="report_desc">-->
		                                <!--说明：查询日期不是自然日期<br>-->
		                                <!--&nbsp;&nbsp;&nbsp;&nbsp;1)查询时间固定为开始日期的03:00:00到结束日期的03:00:00,只能修改查询日期<br>-->
		                            <!--</div>-->
		                        <!--</td>-->
		                    <!--</tr>-->
		                </tbody></table>
		            </form>
		        </div>
		        <div class="clear"></div>
		        <div class="page_list">
		            <table border="0" cellspacing="0" cellpadding="0">
		                <tbody><tr>
		                    <th>用户名</th>
		                    <th>电子回单</th>
		                    <th>指令序号</th>
		                    <th>附言</th>
		                    <th>状态</th>
		                    <th>充值状态</th>
		                    <th>提交时间</th>
		                </tr>
		                                <tr class="no-records">
		                    <td colspan="7"><span>没有相关的记录</span></td>
		                </tr>
		                            </tbody></table>
		        </div>
		        <div class="clear"></div>
		    </div>


		</div>
	








	</div>
	<?php $this->load->view('\template\footer.php')?>
</body>
</html>