</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('song_active' => 0 , 'active' => 1))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>
	<div class="warpper">
		<div class="tools">
			<button class="btn success" onclick="create_user();" limit="admin_user_create"><i class="fa fa-user-plus"></i>创建管理员</button>
			<select>
				{Group_list}
				<option value="">{name}</option>
				{/Group_list}
			</select>
			<span style="float: right;margin:7px 10px 0 0;color:#aaa;">非超级管理员，只能看到同权限组下的用户，且只能编辑自己的账号</span>
		</div>
			<table class="table-list">
				<tr>
					<th width='140'>权限组</th>
					<th width=''>管理员备注</th>
					<th width=''>管理员账号</th>
					<th width=''>注册时间</th>
					<th width=''>最近登录时间</th>
					<th width=''>最近登录IP</th>
					<th width=''>操作日志</th>
					<th width=''>状态</th>
					<th width='150'>操作</th>
				</tr>

				{User_list}
					<tr data-id="{id}" data-data='{"id" : "{id}" , "remarks" : "{remarks}" ,"username" : "{username}" ,"group" : "{group_id}" ,"state" : "{state_id}"}'>
						<td><div class="type {group}">{group_text}</div></td>
						<td>{remarks}</td>
						<td>{username}</td>
						<td>{LostTime}</td>
						<td>{LostTime}</td>
						<td>{LostIp}</td>
						<td>
							<div class="type danger">查看操作日志</div>
						</td>
						<td>
							<div class="type {state}">{state_text}</div>
						</td>
						<td>
							<i class="fa fa-edit"></i>
							<i class="fa fa-trash-o"></i>
						</td>
					</tr>
				{/User_list}

			</table>
			<?php $this->load->view('admin/template/page.php');?>
		
		
	</div>

	<script type="text/dom">
		var admin_user_create = <div api-name='Admin_user/Create' class="admin_user_create">
			<div class="left">
				<input type="text" placeholder="请输入用户名" api-param-name='username' id="js-username">
				<input type="text" placeholder="请输入密码" api-param-name='password' id="js-password">
				<input type="text" placeholder="请输入该用户备注（16字以内）" api-param-name='remarks' id="js-remarks">
				<div class="class">
					<select id="js-group" api-param-name='group'>
						<?php
							foreach ($Group_list as $key => $value) {
								echo '<option value="' . $value['id'] . '">' . $value['name'] . '</option>';
							}
						?>
					</select>
				</div>
				<select id="js-state" api-param-name='state'>
					<option value="0">正常</option>
					<option value="1">限制登录</option>
				</select>
			</div>
		var admin_user_edit = <div api-name='Admin_user/Edit' class="admin_user_create">
			<div class="left">
				<input type="hidden" api-param-name='id' value="{%id%}">
				<input type="text" placeholder="请输入用户名" value="{%username%}" api-param-name='username' id="js-username">
				<input type="text" placeholder="修改用户的密码（如果不修改则留空）" api-param-name='password' id="js-password">
				<input type="text" placeholder="请输入该用户备注（16字以内）" value="{%remarks%}" api-param-name='remarks' id="js-remarks">
				<div class="class">
					<select id="js-group" api-param-name='group' value='{%group%}'>
						<?php
							foreach ($Group_list as $key => $value) {
								echo '<option value="' . $value['id'] . '">' . $value['name'] . '</option>';
							}
						?>
					</select>
				</div>
				<select id="js-state" api-param-name='state' value='{%state%}'>
					<option value="0">正常</option>
					<option value="1">限制登录</option>
				</select>
			</div>
	</script>



	<?php $this->load->view('admin/template/footer');?>
	<script type="text/javascript">
		function create_user(){
			popup.sure({
				title : '创建管理员' , 
				content : dom.get('admin_user_create')
			}).then(function(){
				ApiRequest.push('Admin_user/Create').then(function(){
					popup.toast('管理员创建成功');
					ApiRequest.success();
				} , function(data){
					ajaxError(data , popup)
				})
			});
		}



		/**
		 * 编辑用户的相关信息
		 * @return {[type]}[description]
		 */
		$(".fa-edit").click(function(){
			var data = JSON.parse($(this).parent().parent().attr('data-data'));
			popup.sure({
				title : '编辑管理员' , 
				content : dom.get('admin_user_edit' , {
					'id' : data.id,
					'username' : data.username,
					'remarks' : data.remarks,
					'group' : data.group,
					'state' : data.state,
				})
			}).then(function(){
				ApiRequest.push('Admin_user/Edit').then(function(){
					popup.toast('管理员编辑成功');
					ApiRequest.success();
				} , function(data){
					ajaxError(data , popup)
				})
			});
		})


		$(".fa-trash-o").click(function(){
			var data = JSON.parse($(this).parent().parent().attr('data-data'));
			popup.sure({
				title : '删除管理员' , 
				content : '您确定要删除这个管理员账户吗？删除后该管理员的相关数据都会将被删除'
			}).then(function(){
				ApiRequest.push('Admin_user/Delete' , {
					params : {
						id : data.id
					}
				}).then(function(){
					popup.toast('删除成功');
					ApiRequest.success();
				} , function(data){
					ajaxError(data , popup)
				})
			});
		})

	</script>
</body>
</html>