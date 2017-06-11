	<style type="text/css">
		select{color:#888!important;}
		.popup .popup-sure select{padding:13px 12px !important;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 1, 'song_active' => 4))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>
	<div class="warpper">
		<div class="tools">
			<button limit='qrcode_delete_all' class="btn danger" id="js-trash"><i class="fa fa-trash-o"></i> 删除选中</button>
			<button limit='qrcode_create' class="btn success" id="js-qrcode-create"><i class="fa fa-edit"></i>发送私信</button>
		</div>




		<table class="table-list">
			<tr>
				<th limit='qrcode_delete_all'><input type="checkbox" id="js-select-all" name=""></th>
				<th>用户名</th>
				<th>标题</th>
				<th>内容</th>
				<th>创建时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
			{Collection_list}
			<tr data-json='{json}'>
				<td limit='qrcode_delete_all'><input type="checkbox"></td>
				<td>{uid}</td>
				<td>{title}</td>
				<td>{content}</td>
				<td>{create_time}</td>
				<td>{state}</td>
				<td>
					<i limit="qrcode_delete" class="fa fa-trash-o"></i>
				</td>
			</tr>
			{/Collection_list}
		</table>
		<?php $this->load->view('admin/template/page.php' , array(
		));?>
	
		
	</div>

	



	<?php $this->load->view('admin/template/footer');?>
	<script type="text/dom">
		var qrcode.create = <div class="qrcode.create" api-name="Letter/Create">
			<form id="upload">
				<input type="text" placeholder="请输入接收账号（如果为空则群发）" api-param-name="username">
				<input type="text" placeholder="请输入私信标题" api-param-name='title'>
				<textarea style="height: 150px;" api-param-name='content' placeholder="请输入私信内容"></textarea>
			</form>
		</div>
		<style>
			select{color:#777!important;}
			.upload {position: relative;cursor: pointer;}
			.upload input[type='file']{position: absolute;left:0;top:0;width:100%;height:100%;opacity:0;cursor: pointer;}
		</style>
	</script>
	<script type="text/javascript">
	




		/**
		 * 创建二维码
		 * @param  {[type]} )
		 * @return {[type]}
		 */
		$("#js-qrcode-create").click(function(){
			apiRequestSure({
				title : '发送私信' , 
				content : dom.get('qrcode.create'),
				apiName : 'Letter/Create'
			})
		
		});




		$("#js-trash").click(function(){
			var deleteList = [];
			$(".table-view input[type='checkbox']").each(function(key , value){
				if(value.checked){
					var data = $(value).parent().parent().attr('data-json');
						console.log(data)
					if(typeof data != 'undefined'){
						data = JSON.parse(data);
						deleteList.push(data.id);
					}
				}
			});
			popup.sure({
				title : 'are you sure delete qrcode ??' , 
				content : 'This is an irreversible operation. Are you sure you want to do this? Deleted qrcodes will be permanently unable to retrieve',
				style : {
					width : 500
				}
			}).then(function(){
				_api.admin.qrcode.remove_all({
					id : deleteList
				}).then(function(){
					ajaxSuccess('删除成功' , 1000)
				} , function(error){
					popup.toast(error)
				})
			});
		});


		$("#js-select-all").click(function(){
			$(".table-view input[type='checkbox']").each(function(key , value){
				if( ! value.checked){
					$(value).attr('checked' , true);
				}else{
					$(value).attr('checked' , false);
				}
			});
		});
		
	


		function tableToolsClick(clickType , $this){
			var data = $this.parent().parent().attr('data-json');
			data = $.parseJSON(data);
			switch(clickType){

				case 'trash' : 
					apiRequestSure({
						apiName : 'Letter/Remove',
						title : '您确认删除吗',
						content : '点击确认后将会删除该数据',
						success : '删除成功',
						otherParams : {
							id : data.id
						}
					})
				break;


			}
		}


	</script>
</body>
</html>