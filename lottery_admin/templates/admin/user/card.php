	<style type="text/css">
		.fezocms{padding:7px 27px;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 1 , 'song_active' => 3))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<div class="tools">
			<button class="btn success" id="js-create"><i class="fa fa-user-plus"></i>添加绑卡信息</button>
		</div>
		<table class="table-list setting" style="max-width: 100%">
			<tr>
				<th><input type="checkbox"></th>
				<th>用户名</th>
				<th>银行名称</th>
				<th>银行账号</th>
				<th>开户姓名</th>
				<th>开户行</th>
				<th>绑定类型</th>
				<th>支付二维码</th>
				<th>操作</th>
			</tr>
			{Card_list}
			<tr data-json='{json}'>
				<td><input type="checkbox"></td>
				<td>{uid}</td>
				<td>{bankname}</td>
				<td>{account}</td>
				<td>{ownerName}</td>
				<td>{branch}</td>
				<td>{paytype}</td>
				<td><img src="./assets/card-qrcode/{qrcode}" width="50" height="50"></td>
				<td>
					<i class="fa fa-edit"></i>
					<i class="fa fa-trash-o"></i>
				</td>
			</tr>
			{/Card_list}
			
		</table>
	</div>
	


	<script type="text/dom">
		var card.create = <div>
			<form id="upload">
				<input type="text" api-param-name="username" name="username" placeholder="请输入所属用户名"/>
				<select api-param-name="paytype" name="paytype">
					<option value="0">银行卡</option>
					<option value="1">支付宝</option>
					<option value="2">微信</option>
				</select>
				<input type="text" api-param-name="bankname" name="bankname" placeholder="请输入银行名称"/>
				<input type="text" api-param-name="account" name="account" placeholder="请输入银行账号"/>
				<input type="text" api-param-name="ownerName" name="ownerName" placeholder="请输入开户姓名"/>
				<input type="text" api-param-name="branch" name="branch" placeholder="请输入开户行"/>


				<button class="btn upload card-upload">
					<i class="fa fa-upload"></i>
					上传二维码
					<input type="file" id="js-file" name="file">
				</button>
			</form>
		</div>
		<style>
			select{color:#777!important;}
			.upload {display:none;border:1px solid #eee;height:40px;width: 100%;margin-top:10px;position: relative;cursor: pointer;}
			.upload input[type='file']{position: absolute;left:0;top:0;width:100%;height:100%;opacity:0;cursor: pointer;}
		</style>
		var card.edit = <div>
			<form id="upload">
				<input type="text" api-param-name="username" name="username" value="{%username%}" placeholder="请输入所属用户名"/>
				<select api-param-name="paytype" name="paytype" value="{%paytype%}">
					<option value="0">银行卡</option>
					<option value="1">支付宝</option>
					<option value="2">微信</option>
				</select>
				<input type="text" api-param-name="bankname" name="bankname" value="{%bankname%}" placeholder="请输入银行名称"/>
				<input type="text" api-param-name="account" name="account" value="{%account%}" placeholder="请输入银行账号"/>
				<input type="text" api-param-name="ownerName" name="ownerName" value="{%ownerName%}" placeholder="请输入开户姓名"/>
				<input type="text" api-param-name="branch" name="branch" value="{%branch%}" placeholder="请输入开户行"/>


				<button class="btn upload card-upload">
					<i class="fa fa-upload"></i>
					上传二维码
					<input type="file" id="js-file" name="file">
				</button>
			</form>
		</div>
		<style>
			select{color:#777!important;}
			.upload {display:none;border:1px solid #eee;height:40px;width: 100%;margin-top:10px;position: relative;cursor: pointer;}
			.upload input[type='file']{position: absolute;left:0;top:0;width:100%;height:100%;opacity:0;cursor: pointer;}
		</style>

	</script>
	<?php $this->load->view($admin_view . '/template/footer.php')?>
	<script type="text/javascript">
		$("#js-create").click(function(){

			popup.sure({
				title : '添加绑卡' , 
				content : dom.get('card.create'),
				style : {
					width : 500
				}
			}).then(function(){
				$.ajax({
					url: "./api/v1/admin/card/create",
					type: 'POST',
					cache: false,
					data: new FormData($('#upload')[0]),
					processData: false,
					contentType: false
				}).done(function(data){
				
					var data = JSON.parse(data);
					if( ! data.state){
						popup.toast(data.message);
						return false;
					}else{
						popup.toast('创建成功');
						setTimeout(function(){
							window.location.reload()
						} , 1000)
					}
				}).fail(function(res){
					popup.toast(error)
				});
			});

			
			$('[api-param-name="paytype"]').change(function(){
				$('[name="bankname"]').hide()
				$('[name="account"]').hide()
				$('[name="ownerName"]').hide()
				$('[name="branch"]').hide()
				$('.card-upload').show()
				if($('[api-param-name="paytype"]').val() == '0'){
					$('[name="bankname"]').show()
					$('[name="account"]').show()
					$('[name="ownerName"]').show()
					$('[name="branch"]').show()
					$('.card-upload').hide()
				}
			});



			$("#js-file").change(function(){
				popup.toast('上传图片成功');
			})

		});



		function tableToolsClick(target , $this){
			var data = $.parseJSON($this.parent().parent().attr('data-json'))
			if(target == 'trash'){
				apiRequestSure({
					title : '您确定要删除吗',
					content : '您确定要删除吗',
					success : '删除成功',
					apiName : 'Card/Remove',
					otherParams : {
						id : data.id
					}
				})
			}
			if(target == 'edit'){

				popup.sure({
					title : '编辑绑卡' , 
					content : dom.get('card.edit' , data),
					style : {
						width : 500
					}
				}).then(function(){
					$.ajax({
						url: "./api/v1/admin/card/edit",
						type: 'POST',
						cache: false,
						data: new FormData($('#upload')[0]),
						processData: false,
						contentType: false
					}).done(function(data){
					
						var data = JSON.parse(data);
						if( ! data.state){
							popup.toast(data.message);
							return false;
						}else{
							popup.toast('编辑成功');
							setTimeout(function(){
								window.location.reload()
							} , 1000)
						}
					}).fail(function(res){
						popup.toast(error)
					});
				})

				$('[name="bankname"]').hide()
				$('[name="account"]').hide()
				$('[name="ownerName"]').hide()
				$('[name="branch"]').hide()
				$('.card-upload').show()
				if(data.patype == '0'){
					$('[name="bankname"]').show()
					$('[name="account"]').show()
					$('[name="ownerName"]').show()
					$('[name="branch"]').show()
					$('.card-upload').hide()
				}
				$('[api-param-name="paytype"]').change(function(){
					$('[name="bankname"]').hide()
					$('[name="account"]').hide()
					$('[name="ownerName"]').hide()
					$('[name="branch"]').hide()
					$('.card-upload').show()
					if($('[api-param-name="paytype"]').val() == '0'){
						$('[name="bankname"]').show()
						$('[name="account"]').show()
						$('[name="ownerName"]').show()
						$('[name="branch"]').show()
						$('.card-upload').hide()
					}
				});


				$("#js-file").change(function(){
					popup.toast('上传图片成功');
				})
			}
		}
	</script>
</body>
</html>