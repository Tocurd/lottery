    <title>新蜂娱乐-用户登录</title>
    <link rel="stylesheet" type="text/css" href="./assets/login/css/login.css"/>
    <link rel="stylesheet" type="text/css" href="./assets/login/css/dialog.css"/>
    <link rel="stylesheet" type="text/css" href="./assets/bin/font-awesome/font-awesome.min.css"/>
</head>
<body class="login_bg">
<div id="xf_login_container">
    <img src="./assets/images/logo.png" alt="新蜂娱乐" class="logo">
</div>


	<?php if( ! isset($_SESSION['username'])) {?>
    <div id="xf_login_mid">
        <div class="xf_mid_center">
            <h2>登录</h2>
            <div class="center_box" api-name='User/Login'>
                <div class="login_form_user">
                    <input api-param-name='username' class="chang user_input" type="text" name="username" id="username" value=""
                           spellcheck="false" maxlength="500" title="由0-9,a-z,A-Z组成的6-16个字符" placeholder="账号"/>
                </div>
                <div class="login_form_veri">
                    <input api-param-name='verification' class="duan veri_input" aria-label="验证码：" type="text" name="validcode_source"
                           id="validcode_source" value="" spellcheck="false" maxlength="4" title="请输入右边图片中的数字"
                           placeholder="验证码"/>
                </div>
                <div class="veri_pic">
                    <img src="./base/verification?rand=<?=time()?>" style="cursor: pointer;" name="validate" id="validate" onclick="refreshimg()" />
                </div>
                <div class="xf_login_butt">
                    <input type="button" value="下一步" id="js-login" style="outline: none;" class="login_a">
                    <!-- <a href="/default_getpass.shtml" class="xf_login_butt2">找回密码>></a> -->
                </div>
            </div>
        </div>
	</div>
	<?php }?>
	

	<?php if(isset($_SESSION['username'])) {?>
	<div id="xf_login_mid" api-name='User/Goto_login'>
	    <div class="xf_mid_center">
	        <h2>登录</h2>
	        <div class="center_box">
	            <div class="center_text">账户名: <b><?=$_SESSION['username']?></b></div>
	            <div class="center_text">
	                问候语:<span class="loginnwarring">您还没有设置问候语，为了您的安全，请尽快设置！</span>
	            </div>
	            <div><span class="loginnotice">如果问候语与您预设不一致，则为仿冒！不要输入密码！</span></div>
	            <div class="login_form_password">
	                <input class="chang password_input" aria-label="密码：" type="password" api-param-name="password"
	                       id="loginpass_source" value="" spellcheck="false" maxlength="16" title="由6至16个字符组成"
	                       placeholder="密码"/>
	            </div>
	            <div class="xf_login_butt">
	                <input type="button" value="登录" class="login_a" id="js-goto">
	                <a href="/default_getpass.shtml" class="xf_login_butt2" target="_blank">忘记密码>></a>
	            </div>
	        </div>
	    </div>
	</div>
	<?php }?>


<script type="text/dom">
	var popup_toast = <div class="toast" class="toast" id="js-toast">
		<p></p>
	</div>
	var popup_input_toast = <div class="input-toast" id="js-input-toast">
		<div class="input-toast-up">
			<i id="js-i" class="fa fa-sort-asc"></i>
		</div>
		<p></p>
	</div>
	var popup_input_toast_success = <div class="input-toast success" id="js-input-toast">
		<div class="input-toast-up">
			<i id="js-i" class="fa fa-sort-asc"></i>
		</div>
		<p></p>
	</div>

	var popup_sure = <div class="popup-opacity" id="js-popup-sure">
		<div class="popup-sure">
			<div class="popup-sure-header">
				<h1></h1>
				<div class="close" id="js-close"><i class="fa fa-power-off"></i></div>
			</div>
			<div class="popup-sure-content">
			</div>
			<div class="popup-sure-bottom">
				<button class="btn fezocms">确认</button>
				<button class="btn" id="js-close">取消</button>
			</div>
		</div>
	</div>
</script>
<script type="text/javascript">
	var base_url = '{base_url}';
	var admin_dir = '{admin_view}';
</script>
<script type="text/javascript" src="./assets/bin/jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="./assets/bin/rule/rule.js"></script>
<script type="text/javascript" src="./assets/js/api.js"></script>
<script type="text/javascript" src="./assets/js/app.js"></script>
<script type="text/javascript" src="./assets/bin/dom/dom.js"></script>
<script type="text/javascript" src="./assets/bin/popup/popup.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/Chart.js/2.5.0/Chart.bundle.min.js"></script>
<script type="text/javascript">
	var popup = new popupWidget();
	var dom = new Dom();
	var rule = new ruleWidget();
	$('select').each(function(key , value){
		var selectValue = $(value).attr('value');
		$(value).find('option[value="' + selectValue + '"]').attr('selected' , true)
	});

	function refreshimg(){
		$("#validate").attr('src' , './base/verification?rand=' + Math.random())
	}
	$("#js-login").click(function(){
		ApiRequest.push('User/Login').then(function(data){
			window.location.reload();
		} , function(data){
			$("#validate").attr('src' , './base/verification?rand=' + Math.random())
			popup.toast(data.message)
		})
	});
	$("#js-goto").click(function(){
		ApiRequest.push('User/Goto_login').then(function(data){
			popup.toast('登录成功')
			ApiRequest.success('./');
		} , function(data){
			popup.toast(data.message)
		})
	});

</script>


        <!-- end.xf_center -->
        <!-- end.xf_login_mid -->
<!-- <div class="download">
    <div class="download_box_l">
        <h3>客户端</h3>
        <ul class="download-box">
            <li><a class="windows" href=""><span class="fa fa-windows fa-2x"></span>Windows</a></li>
            <li><a class="mac" href=""><span class="fa fa-apple fa-2x"></span>MAC</a></li>
            <li><a class="android" href="#" target="_blank"><span class="fa fa-android fa-2x"></span>Android</a></li>
            <li><a class="iphone" href="" target="_blank"><span class="fa fa-mobile fa-2x"></span>iphone</a></li>
        </ul>
    </div>
    <div class="download_box_r">
        <h3>客服中心</h3>
        <ul class="download-box">
            <li><a class="iphone" href="" target="_blank"><span class="fa fa-apple fa-2x"></span>IOS</a></li>
            <li><a class="android" href="" target="_blank"><span class="fa fa-android fa-2x"></span>Android</a></li>
        </ul>
    </div>
</div> -->

<!-- end.xf_login_container -->
</body>
</html>