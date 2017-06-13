</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('song_active' => 1 , 'active' => 1))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<div class="tools">
			<button class="btn fezocms" limit="group_create" onclick="admin_group_create();"><i class="fa fa-server"></i>创建权限组</button>
		</div>
		<table class="table-list">
			<tr>
				<th width="150px">权限组名称</th>
				<th width="50%">权限列表</th>
				<th>所属权限人数</th>
				<th>所属权限状态</th>
				<th>操作</th>
			</tr>
			{Group_list}
			<tr id="{id}" data-data='{"id" : "{id}" , "name" : "{name}" , "limit" : {limit}}'>
				<td><div class="type {group_state}">
					{name}
				</div></td>
				<td>{limit_trun}</td>
				<td>1人</td>
				<td><div class="type {state}">
					{state_text}
				</div></td>
				<td>
					<i class="fa fa-edit" limit='group_edit'></i>
					<i class="fa fa-trash-o" limit='group_remove'></i>
				</td>
			</tr>		
			{/Group_list}		

		</table>
		<?php $this->load->view('admin/template/page.php');?>
	
		
	</div>


	<script type="text/dom">
		<!-- 管理员用户组创建 -->
		var admin_group_create = <div class="admin_group_create" api-name='Admin_group/Create'>
		<div class="left">
			<input type="text" placeholder="请输入权限组名称" api-param-name='name' id="js-groupName">
		
			<select id="js-state" api-param-name='state'>
				<option value="0">正常</option>
				<option value="1">封禁</option>
			</select>
			<div class="limit">
				<?php
					$Jurisdiction = $this->config->item('Jurisdiction');
					foreach ($Jurisdiction as $key => $value) {
						echo '<h2>' . $key . '</h2>';
						foreach ($value as $song_key => $song_value) {
							echo '<label class="checkbox" for="' . $song_value . '"><div class="widget-checkbox two2" name="' . $song_value . '" id="' . $song_value . '"></div><span>' . $song_key . '</span></label>';
						}
					}
				?>
			</div>
		</div>

		var admin_group_edit = <div class="admin_group_create" api-name='Admin_group/Edit'>
		<div class="left">
			<input type="text" value="{%groupName%}" placeholder="请输入权限组名称" api-param-name='name' id="js-groupName">
		
			<select id="js-state" api-param-name='state'>
				<option value="0">正常</option>
				<option value="1">封禁</option>
			</select>
			<div class="limit">
				<?php
					$Jurisdiction = $this->config->item('Jurisdiction');
					foreach ($Jurisdiction as $key => $value) {
						echo '<h2>' . $key . '</h2>';
						foreach ($value as $song_key => $song_value) {
							echo '<label class="checkbox" for="' . $song_value . '"><div class="widget-checkbox two2" name="' . $song_value . '" id="' . $song_value . '"></div><span>' . $song_key . '</span></label>';
						}
					}
				?>
			</div>
		</div>


	</script>





	<?php $this->load->view('admin/template/footer');?>
	<script type="text/javascript">

		$(".fa-trash-o").click(function(){
			var data = JSON.parse($(this).parent().parent().attr('data-data'));

			popup.sure({
				title : "删除权限组" ,
				content : '您确定要删除这个权限组吗？' ,
			}).then(function(target){
				ApiRequest.push('Admin_group/Delete' , {
					params : {
						id : data.id
					}
				}).then(function(){
					popup.toast('权限组编辑成功');
					ApiRequest.success();
				} , function(data){
					ajaxError(data , popup)
				})
			});
		});

		$(".fa-edit").click(function(){
			var data = JSON.parse($(this).parent().parent().attr('data-data'));

			popup.sure({
				title : "编辑权限组" ,
				content : dom.get('admin_group_edit' , {
					groupName : data.name,
					state : data.state,
				}) ,
			}).then(function(target){
				var limit = new Array();
				target.popup.find(".limit .widget-checkbox").each(function(index, el) {
					if($(el).is('.active')){
						limit.push($(el).attr('name'))
					}
				});
				ApiRequest.push('Admin_group/Edit' , {
					params : {
						limit : limit,
						id : data.id
					}
				}).then(function(){
					popup.toast('权限组编辑成功');
					ApiRequest.success();
				} , function(data){
					ajaxError(data , popup)
				})
			});

			$.each(data.limit , function(key , value){
				$("#" + value).addClass('active');
			})
		});



		function admin_group_create(){
			popup.sure({
				title : "创建权限组" ,
				style : {width : 500} , 
				content : dom.get('admin_group_create') ,
			}).then(function(target){

				var limit = new Array();
				target.popup.find(".limit .widget-checkbox").each(function(index, el) {
					if($(el).is('.active')){
						limit.push($(el).attr('name'))
					}
				});
				ApiRequest.push('Admin_group/Create' , {
					params : {
						limit : limit
					}
				}).then(function(){
					popup.toast('权限组创建成功');
					ApiRequest.success();
				} , function(data){
					ajaxError(data , popup)
				})
			})
		}

	</script>

</body>
</html>