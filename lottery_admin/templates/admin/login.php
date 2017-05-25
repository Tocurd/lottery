	<link rel="stylesheet" href="./assets/css/admin/page/login.css">
</head>
<body style="background-color: #333">

	<!-- <img src="./assets/images/background.jpg"> -->
	<div class="login">
		<div class="left">
			<h1>autumn</h1>
			<span>Autumn to the flowers laugh birds</span>
		</div>
		<!-- <img src="./assets/images/background.jpg" class="fl" width="340"> -->
		<div class="form" api-name='Admin_user/Login'>
			<h1>登录管理后台</h1>
			<div class="input">
				<span><i class="fa fa-user"></i></span>
				<input type="text" api-param-name="username" maxlength="16" id="js-username" placeholder="请输入登录用户名">
			</div>
			<div class="input">
				<span><i class="fa fa-lock"></i></span>
				<input type="password" api-param-name="password" maxlength="16" id="js-password" placeholder="请输入登录密码">
			</div>
			<button class="btn fezocms" id="js-login">点击登录</button>
		</div>
	</div>


	<?php $this->load->view('admin/template/footer');?>
	<script type="text/javascript">
		var popup = new popupWidget();
		$("#js-login").click(function(){
			var $this = $(this);
			$this.attr('disabled' , true);
			ApiRequest.push("Admin_user/Login").then(function(reslut){
				popup.toast("登陆成功，正在跳转")
				ApiRequest.success('./' + admin_dir);
			} , function(data){
				$this.removeAttr('disabled');
				ajaxError(data , popup)
			});
		})
	</script>
</body>
</html>