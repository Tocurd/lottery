	<style>
		body{min-width: 1400px;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 2 , 'song_active' => 2))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<table class="table-list">
			<tr>
				<th><input type="checkbox"></th>
				<th>订单号</th>
				<th>用户名</th>
				<th>提交时间</th>
				<th>提现金额</th>
				<th>提现状态</th>
				<th>二维码</th>
				<th>操作</th>
			</tr>

			
			{Withdrawals_list}
			<tr data-json='{json}' data-id='{id}'>
				<td><input type="checkbox"></td>
				<td>{order_id}</td>
				<td>{uid}</td>
				<td>{create_time}</td>
				<td>￥{money}</td>
				<td>{state}</td>
				<td><a id="js-qrcode" data-href="./assets/upload/{name_qrcode}.jpg" target="_blank"><img src="./assets/upload/{name_qrcode}.jpg" width="30" height="30" alt=""></a></td>
				<td>
					<i data-target='check' class="fa fa-check"></i>
					<i data-target='remove' class="fa fa-remove"></i>
					<i data-target='trash' class="fa fa-trash-o"></i>
				</td>
			</tr>
			{/Withdrawals_list}
		</table>


	</div>
	<?php $this->load->view($admin_view . '/template/footer.php')?>
	<script type="text/javascript">
		$(".table-list").on('click' , '.fa' , function(key , value){
			var json = $.parseJSON($(this).parent().parent().attr('data-json'))
			console.log(json);
		});


		function tableToolsClick(data , thisd){
			var id = $(thisd).parent().parent().attr('data-id');
			switch(data){
				case 'check' :
					apiRequestSure({
						title : "审核通过" , 
						content : "您确定要同意这个提现吗？",
						apiName : 'Withdrawals/Check',
						success : '审核通过',
						otherParams : {
							type : 0,
							id : id
						}
					})
				break;

				case 'remove' :
					apiRequestSure({
						title : "审核不通过" , 
						content : "您确定要拒绝这个提现吗？",
						apiName : 'Withdrawals/Check',
						success : '审核不通过',
						otherParams : {
							type : 1,
							id : id
						}

					})
				break;

				case 'trash' :
					apiRequestSure({
						title : "删除用户" , 
						content : "您确定要删除这个用户吗？",
						apiName : 'Withdrawals/Trash',
						success : '删除成功',
						otherParams : {id : id}
					})
				break;
			}

		}

		$(document).on('click' , "#js-qrcode" , function(){
			var id = $(this).parent().parent().attr('data-id');
			console.log(id)

			var imageSrc = $(this).attr('data-href')
			popup.sure({
				title : '扫描二维码' ,
				style : {width:450},
				content : '<img src="' + imageSrc + '" style="width:100%;" alt="">'
			}).then(function(){
				apiRequestSure({
					title : "审核通过" , 
					content : "您确定要同意这个提现吗？",
					apiName : 'Withdrawals/Check',
					success : '审核通过',
					otherParams : {
						type : 0,
						id : id
					}
				})
			} , function(){
				apiRequestSure({
					title : "审核不通过" , 
					content : "您确定要拒绝这个提现吗？",
					apiName : 'Withdrawals/Check',
					success : '审核不通过',
					otherParams : {
						type : 1,
						id : id
					}
				})
				return false;
			})
		})
	</script>
</body>
</html>