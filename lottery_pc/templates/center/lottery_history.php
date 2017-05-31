	<link rel="stylesheet" href="./assets/css/page/center.css">
	<link rel="stylesheet" href="./assets/bin/font-awesome/font-awesome.min.css">
</head>
<body>
	<?php $this->load->view('\template\top-header.php')?>
	<div class="warpper">

		<div class="title top">
			<i class="fa fa-gamepad"></i>
			投注记录
		</div>
		<?php $this->load->view('\template\center-left.php')?>
		<div class="right">
			<div class="page-info">
		        <div class="page_search">
		            <form action="" method="GET">
		                <input type="hidden" name="isgetdata" value="1">
		                <table border="0" cellspacing="0" cellpadding="0">
		                    <tbody><tr>
		                        <td>
		                            游戏时间：<input type="text" id="starttime" name="starttime" size="16" "="" value="2017-05-31 03:00:00"> <img class="icons_mb4" src="http://swckfj.b0.upaiyun.com/images/comm/t.gif" id="time_min_button" style="cursor:pointer;"> 至
		                            <input type="text" name="endtime" id="endtime" size="16" "="" value="2017-06-01 03:00:00"> <img class="icons_mb4" src="http://swckfj.b0.upaiyun.com/images/comm/t.gif" id="time_min_button" style="cursor:pointer;">&nbsp;&nbsp;
		                            状态:
		                            <select name="status">
		                                <option value="0" selected="selected">全部</option>
		                                <option value="1">已中奖</option>
		                                <option value="2">未中奖</option>
		                                <option value="3">未开奖</option>
		                                <option value="4">已撤单</option>
		                            </select>&nbsp;&nbsp;&nbsp;&nbsp;
		                            交易类型：<select name="ishistory">
		                                <option value="0" selected="">当天记录</option>
		                                <option value="1">历史记录</option>
		                            </select>&nbsp;&nbsp;
		                        <button name="submit" type="submit" width="69" height="26" class="btn_search btn btn-flat-action btn_small"><i class="fa fa-search"></i> 搜索 </button>
		                        </td>

		                    </tr>
		                    <tr>
		                        <td>
		                            游戏名称：<select name="lotteryid" id="lotteryid" style="width:100px;">
		                                <option value="0">所有游戏</option>
		                                                                <option value="1">重庆时时彩</option>
		                                                                <option value="2">十一运夺金</option>
		                                                                <option value="3">北京快乐八</option>
		                                                                <option value="4">上海时时乐</option>
		                                                                <option value="5">新疆时时彩</option>
		                                                                <option value="6">黑龙江时时彩</option>
		                                                                <option value="8">江西多乐彩</option>
		                                                                <option value="9">广东十一选五</option>
		                                                                <option value="11">福彩3D</option>
		                                                                <option value="12">排列三、五</option>
		                                                                <option value="13">江苏快三</option>
		                                                                <option value="14">天津时时彩</option>
		                                                                <option value="15">新蜂五分彩</option>
		                                                                <option value="16">新蜂一分彩</option>
		                                                                <option value="17">新蜂夺金</option>
		                                                                <option value="18">新蜂两分彩</option>
		                                                            </select>
		                            &nbsp;&nbsp;游戏奖期: <select name="issue" id="issue" style="width: 100px;"><option value="0">所有奖期</option></select>
		                            &nbsp;&nbsp;游戏模式:
		                            <select name="modes" id="modes" style="width:100px;">
		                                <option value="0">所有模式</option>
		                                                                <option value="1">元</option>
		                                                                <option value="2">角</option>
		                                                                <option value="3">分</option>
		                                                                <option value="4">厘</option>
		                                                            </select>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td>
		                            注单编号：<input style="width:60px;" type="text" id="projectno" name="projectno" value="">
		                                                        &nbsp;&nbsp;游戏用户：<input style="width:90px;" type="text" name="username" id="username" value="">
		                            &nbsp;&nbsp;范围: <select name="range"><option value="2">全部</option><option selected="" value="6">自己</option><option value="3">直接下级</option><option value="4">所有下级</option></select>                                                        &nbsp;&nbsp;<font color="#009900">温馨提示: 点击注单编号可以查看详细注单信息以及撤单.</font>
		                        </td>
		                    </tr>
		                </tbody></table>
		            </form>
		        </div>
		        <div class="clear"></div>
		        <div class="page_list">
		            <table border="0" cellspacing="0" cellpadding="0">
		                <tbody><tr>
		                    <th>注单编号</th>
		                    <th>用户</th>
		                    <th>投注时间</th>
		                    <th>游戏</th>
		                    <th>玩法</th>
		                    <th>期号</th>
		                    <th>倍数</th>
		                    <th>模式</th>
		                    <th>总金额/奖金</th>
		                    <th>开奖号码</th>
		                    <th>状态</th>
		                </tr>
		                                <tr class="no-records">
		                    <td height="37" colspan="13" align="center"><span>请选择查询条件之后进行查询</span></td>
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