	<style type="text/css">
		select{color:#888!important;}
		.popup .popup-sure select{padding:13px 12px !important;}
		table{font-size: 14px;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 4, 'song_active' => 5))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>
	<div class="warpper">
		<div class="tools">
			<button limit='qrcode_delete_all' class="btn danger" id="js-trash"><i class="fa fa-trash-o"></i> 删除选中</button>
			<button limit='qrcode_create' class="btn success" id="js-qrcode-create"><i class="fa fa-edit"></i>创建收款账号</button>
		</div>

		<table class="table-list">
			<tr>
				<th limit='qrcode_delete_all'><input type="checkbox" id="js-select-all" name=""></th>
				<th>所属账号</th>
				<th>设定金额</th>
				<th>支付类型</th>
				<th>二维码</th>
				<th>创建时间</th>
				<th>线路</th>
				<th>所属银行</th>
				<th>所属开户行</th>
				<th>所属姓名</th>
				<th>操作</th>
			</tr>
			{Collection_list}
			<tr data-json='{json}'>
				<td limit='qrcode_delete_all'><input type="checkbox"></td>
				<td>{form_pay_name}</td>
				<td>{money}</td>
				<td>{pay_type}</td>
				<td>
					<a href="./assets/qrcode/{qrocde_file_url}">
						<img src="./assets/qrcode/{qrocde_file_url}" width="40" height="40">
					</a>
				</td>
				<td>{time}</td>
				<td>线路{branch}</td>
				<td>{card_opening}</td>
				<td>{card_name}</td>
				<td>{card_from}</td>
				<td>
					<i limit="qrcode_delete" class="fa fa-trash-o"></i>
				</td>
			</tr>
			{/Collection_list}
		</table>
		<style type="text/css">
			.table-list td {
			    padding: 9px 20px;
			}
		</style>
		<?php $this->load->view('admin/template/page.php' , array(
		));?>
	
		
	</div>

	



	<?php $this->load->view('admin/template/footer');?>
	<script type="text/dom">
		var qrcode.create = <div class="qrcode.create">
			<form id="upload">
				<select name="branch" placeholder="请选择线路">
					<option value="0">线路1</option>
					<option value="1">线路2</option>
					<option value="2">线路3</option>
					<option value="3">线路4</option>
					<option value="4">线路5</option>
					<option value="5">线路6</option>
					<option value="6">线路7</option>
					<option value="7">线路8</option>
					<option value="8">线路9</option>
					<option value="9">线路10</option>
					<option value="10">线路11</option>
				</select>
				<input type="text" placeholder="请输入所属账号" name="fromPayName">
				<select name="payType" id="js-paytype" placeholder="请选择收款类型">
					<option value="-1">请选择收款类型</option>
					<option value="alipay">支付宝</option>
					<option value="wxpay">微信</option>
					<option value="card">银行卡</option>
				</select>
				<input type="text" placeholder="请输入所属金额" id='js-money' name="money">
				<input type="text" placeholder="请输入收款银行卡开户行" style="display: none" id='js-card-opening' name="card_opening">
				<input type="text" placeholder="请输入收款银行卡所属人姓名" style="display: none" id='js-card-name' name="card_name">
				<input type="text" placeholder="请输入收款银行卡所属银行" style="display: none" id='js-card-from' name="card_from">


				<button class="btn upload" style="border:1px solid #eee;height:40px;width: 100%;margin-top:10px;">
					<i class="fa fa-upload"></i>
					上传二维码
					<input type="file" id="js-file" name="file">
				</button>
			</form>
		</div>
		<style>
			select{color:#777!important;}
			.upload {position: relative;cursor: pointer;}
			.upload input[type='file']{position: absolute;left:0;top:0;width:100%;height:100%;opacity:0;cursor: pointer;}
		</style>
	</script>
	<script type="text/javascript">
		$(document).on('change' , '#js-paytype' , function(){
			var value = $(this).val();
			if(value == 'card'){
				$("#js-money").hide();
				$("#js-card-opening , #js-card-name , #js-card-from").show();
			}else{
				$("#js-money").show();
				$("#js-card-opening , #js-card-name , #js-card-from").hide();
			}

		});





		/**
		 * 创建二维码
		 * @param  {[type]} )
		 * @return {[type]}
		 */
		$("#js-qrcode-create").click(function(){
			popup.sure({
				title : '创建收款' , 
				content : dom.get('qrcode.create'),
				style : {
					width : 500
				}
			}).then(function(){
				$.ajax({
					url: "./api/v1/admin/collection/create",
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
						popup.toast('上传成功');
						setTimeout(function(){
							window.location.reload()
						} , 1000)
					}
				}).fail(function(res){
					popup.toast(error)
				});
			});
			$("#js-file").change(function(){
				popup.toast('上传图片成功');
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
						apiName : 'Collection/Remove',
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