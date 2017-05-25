	<style type="text/css">
		.setting input[type='text']{
			width: 100%;
		}
		.setting{
			max-width: 100%;
		}
		.setting *{
			font-size: 13px!important;
		}
		.setting th{
			background-color: #fafafa;
			padding:13px 15px;
		}
		.setting td{
			padding:20px 15px!important;
		}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 1 ,'song_active' => 2))?>

	<div class="warpper">
		<div class="tools">
			<button class="btn danger"><i class="fa fa-trash-o"></i>删除选中</button>
			<button class="btn success" id="js-create"><i class="fa fa-plus"></i>创建用户</button>
			<button class="btn"><i class="fa fa-search"></i>高级筛选</button>
			<select name="" id="">
				<option value="">普通会员</option>
				<option value="">代理用户</option>
			</select>
		</div>
		<table class="table-list setting">
			<tr>
				<th><input type="checkbox" name=""></th>
				<th width="200">用户名</th>
				<th width="200">昵称</th>
				<th width="80">积分</th>
				<th width="80">余额</th>
			
				<th width="100">返点%</th>
				<th width="240">注册时间</th>
				<th>注册IP</th>
				<th width="120">地区</th>
				<th width="120">来源</th>
				<th width="90">类型</th>
				<th width="90">状态</th>
				<th width="150">操作</th>
			</tr>
			{User_list}
			<tr data-json='{json}'>
				<input type="hidden" value="{id}" api-param-name='id'>
				<td><input type="checkbox" name=""></td>
				<td><input type="text" value="{username}" api-param-name='username'></td>
				<td><input type="text" value="{nickname}" api-param-name='nickname'></td>
				<td><input type="text" value="{integral}" api-param-name='integral'></td>
				<td><input type="text" value="{money}" api-param-name='money'></td>
				<td><input type="text" value="{rebate}" api-param-name='rebate'></td>
				<td>{reg_time}</td>
				<td>{reg_ip}</td>
				<td>{source}</td>
				<td>{source}</td>
				<td>{type}</td>
				<td>{state}</td>
				<td>
					<i class="fa fa-edit"></i>
					<i class="fa fa-trash-o"></i>
				</td>
			</tr>
			{/User_list}
		</table>
	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
	<script type="text/dom">
		var createUser = <div class="createUser" api-name="User/Create">
			<input type="text" placeholder="请输入用户名" api-param-name="username">
			<input type="text" placeholder="请输入密码" api-param-name="password">
			<input type="text" placeholder="请输入昵称" api-param-name="nickname">
			<select name="" id="" api-param-name="type">
				<option value="0">普通会员</option>
				<option value="1">代理用户</option>
			</select>
			<input type="text" placeholder="请输入余额" api-param-name="money">
			<input type="text" placeholder="请输入用户返点（%）" api-param-name="rebate">
		</div>
		var editUser = <div class="editUser" api-name="User/Edit">
			<input type="text" placeholder="请输入密码(为空则不修改)" api-param-name="password" value="{%password%}">
			<select name="" id="" api-param-name="type" value="{%type%}">
				<option value="0">普通会员</option>
				<option value="1">代理用户</option>
			</select>
			<select name="" id="" api-param-name="state" value="{%state%}">
				<option value="0">正常</option>
				<option value="1">封禁</option>
			</select>

		</div>

	</script>
	<script type="text/javascript">
		$(".fa-edit , .fa-trash-o").click(function(){
			var data = JSON.parse($(this).parent().parent().attr('data-json'));
			if($(this).hasClass('fa-trash-o')){
				apiRequestSure({
					title : '删除用户',
					success : '删除成功',
					content : '您是否要删除该用户呢',
					apiName : 'User/Delete',
					otherParams : {
						id : data.id
					}
				})
				return;
			}
			data.password = '';
			popup.sure({
				title : '编辑用户',
				content : dom.get('editUser' , data)
			}).then(function(){
				apiRequestItem({
					apiName : 'User/Edit',
					success : '编辑成功',
					otherParams : {
						id : data.id
					}
				})
			})
		});
		
		var timeout = 0;
		$(".setting input[type='text']").bind("propertychange input" , function(){
			clearTimeout(timeout);
			var $nowThis = $(this);
			var $this = $(this).parent().parent();
			timeout = setTimeout(function(){
				ApiRequest.push('User/Edit' , {
					target : $this
				}).then(function(data){
					popup.inputToastSuccess('保存成功' , $nowThis)
				} , function(data){
					if(isset(data.data) && data.data.length > 0 && data.data != {}){
						popup.inputToast(data.message , data.data[0].data)
					}else{
						popup.toast(data.message)
					}
				})
			} , 350);
		});

		$("#js-create").click(function(){
			popup.sure({
				title : '创建用户',
				content : dom.get('createUser')
			}).then(function(){
				apiRequestItem({
					success : '添加成功',
					apiName : 'User/Create',
				})
			})
		})
	</script>
</body>
</html>