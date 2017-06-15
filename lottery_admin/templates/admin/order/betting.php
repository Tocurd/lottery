	<style>
		body{min-width: 1400px;}
		.sheng{width:300px;display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}
		.table-list *{font-size: 13px!important;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 2 , 'song_active' => 1))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<div class="tools">
			<button class="btn fezocms" id="js-search"><i class="fa fa-search"></i>高级筛选</button>
			<button class="btn" id="js-re-search">取消筛选</button>
		</div>
		<table class="table-list">
			<tr>
				<th>单号</th>
				<th>用户名</th>
				<th>投注时间</th>
				<th>彩种</th>
				<th>玩法</th>
				<th>期号</th>
				<th>倍数</th>
				<th>注数</th>
				<th>模式</th>
				<th>投注号码</th>
				<th>投注金额</th>
				<th>中奖金额</th>
				<th>返点</th>
				<th>状态</th>
				<th>操作</th>
			</tr>

			{Betting_list}
			<tr data-json='{json}'>
				<td>{order_id}</td>
				<td>{uid}</td>
				<td>{create_time}</td>
				<td>{from_lottery}</td>
				<td>{from_game_rule}</td>
				<td>{from_periods}</td>
				<td>{multiple}</td>
				<td>{notes}</td>
				<td>{pattern}</td>
				<td><span class="sheng">{number}</span></td>
				<td>{money}</td>
				<td>{winning_money}</td>
				<td>{rebate}</td>
				<td>{state}</td>
				<td>
					{revoke}
				</td>
			</tr>
			{/Betting_list}
		</table>
		</div>


	

	<script type="text/dom">
		var search = <div class="search" api-name='Order_betting/Search'>
			<input type="text" api-param-name='periods' value='<?=$this->input->get('periods');?>' placeholder="请输入彩票期号">
			<input type="text" api-param-name='order_id' value='<?=$this->input->get('order_id');?>' placeholder="请输入单号">
			<input type="text" api-param-name='username' value='<?=$this->input->get('username');?>' placeholder="请输入会员姓名">
			<input type="text" api-param-name='start_time' value='<?=$this->input->get('start_time');?>' placeholder="请输入投注开始时间">
			<input type="text" api-param-name='end_time' value='<?=$this->input->get('end_time');?>' placeholder="请输入投注结束时间">
			<select api-param-name='type' value='<?=$this->input->get('type');?>'>
				{Game_rule_list}
				<option value="{id}">{name}</option>
				{/Game_rule_list}
			</select>
		</div>
	</script>


	<?php $this->load->view($admin_view . '/template/footer.php')?>
	<script type="text/javascript">
		$("#js-re-search").click(function(){
			window.location.href = './{admin_view}/order/betting'
		})
		$("#js-search").click(function(){
			popup.sure({
				title : "高级筛选",
				content : dom.get('search')
			}).then(function(){
				var search = '';
				ApiRequest.push("Order_betting/Search" , { autoCommit : false }).then(function(data){
					$.each(data.data.params.apiParams , function(key , value){
						if(value != '') search += "&" + key + "=" + value
					})
					if(search == ''){
						popup.toast('您还没有输入内容');
						return false;
					}
					search = search.substr(1 , search.length - 1);
					window.location.href = './{admin_view}/order/betting?' + search
				} , function(error){
					ajaxError(error , popup)
				})
			})
		})
		$(".fa-reply-all").click(function(){
			$this = $.parseJSON($(this).parent().parent().attr('data-json'));
			popup.sure({
				title : "您确定要撤单吗？",
				content : "您确定要撤单吗？该操作确认后将无法撤回，请您谨慎操作"
			}).then(function(){
				ApiRequest.push("Order_betting/Revoke" , {params : {
					id : $this.id
				}}).then(function(){
					popup.toast('您操作撤单成功')
					ApiRequest.success();
				} , function(error){
					popup.toast(error.message);
				})
			})
		})
	</script>
</body>
</html>