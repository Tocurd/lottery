	<style type="text/css">
		.footer .btn{padding:9px 27px;}
		.setting{max-width: 100%;}
		.tools{margin-top:3px;}
		.setting input[type='text']{width: 100%;}
		.setting th{background-color: #f7f7f7;}
		.setting select{border:1px solid #eee;border-radius:10px;padding:5px;cursor: pointer;outline: none;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 4 , 'song_active' => 3))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<div class="tools">
			<select value="<?=$this->input->get('from_lottery')?>" id="js-switch">
				{Lottery_list}
				<option value="{id}">{name}</option>
				{/Lottery_list}
			</select>
		</div>
		<table class="table-list setting">
			<tr>
				<th width="320">彩种名称</th>
				<th width="320">期数</th>
				<th width="">开奖时间</th>
			</tr>
			{Lottery_time_list}
			<tr data-id='{id}'>
				<td><?=$Lottery_data['name']?></td>
				<td>{periods}</td>
				<input type="hidden" api-param-name="id" value="{id}">
				<td><input type="text" api-param-name="time" value="{time}"></td>
			</tr>
			{/Lottery_time_list}
		</table>
		<?php $this->load->view('admin/template/page.php' , array(
			'count' => 20
		));?>
		

	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
	<script type="text/javascript">
		$("#js-add").click(function(){
			window.location.href = './{admin_view}/setting/lottery_list/create'
		});
		$(".fa-edit").click(function(){
			var id = $(this).parent().parent().attr('data-id');
			window.location.href = './{admin_view}/setting/lottery_list/edit?id=' + id;
		});
		$("#js-switch").change(function(){
			var id = $(this).val();
			window.location.href = './{admin_view}/setting/lottery_time?from_lottery=' + id;
		});


		var timeout = 0;
		$("input[type='text']").bind("propertychange input" , function(){
			clearTimeout(timeout);
			var $this = $(this).parent().parent();
			timeout = setTimeout(function(){
				ApiRequest.push('Lottery_time/Edit' , {
					target : $this
				}).then(function(data){
					console.log('保存成功');
				} , function(data){
					if(isset(data.data) && data.data.length > 0 && data.data != {}){
						popup.inputToast(data.message , data.data[0].data)
					}else{
						popup.toast(data.message)
					}
				})
			} , 450);
		});

	</script>
</body>
</html>