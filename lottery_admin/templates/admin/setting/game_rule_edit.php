	<style type="text/css">
		.btn{padding:9px 27px;}
		.setting .label{margin-right: 11px;padding:6px;}
		.setting td{font-size: 13px;}
		.rule input[type='text']{width: 80px}
		.table-list th{background-color: #eee;font-weight: 400;}
		.table-list th i{margin:0;position: relative;top:0.5px;margin-left: 7px;}
	</style>
</head>
<body>
	<?php $this->load->view($admin_view . '/template/menu.php' , array('active' => 4 , 'song_active' => 2))?>
	<?php $this->load->view($admin_view . '/template/top-header.php')?>

	<div class="warpper">
		<div class="box">
			<h1>基础设置</h1>
			<table class="table-list setting" api-name="Game_rule/Save">
				<tr>
					<td>彩票名称</td>
					<td><input type="text" api-param-name="name" value="{name}" placeholder="请输入彩票名称"></td>
				</tr>
				<tr>
					<td>开奖位数</td>
					<td><input type="text" api-param-name="count" value="{count}" placeholder="请输入开奖位数"></td>
				</tr>
				<tr>
					<td>单位置号码范围</td>
					<td><input type="text" api-param-name="numberRange" value="{numberRange}" placeholder="单位置号码范围 (以逗号分隔)"></td>
				</tr> 

			</table>
			<div class="tools" style="padding:0px 12px;margin-top:26px;">
				<button class='btn fezocms' id="js-save"><i class="fa fa-save"></i> 保存配置项</button>
			</div>

			<h1 style="margin-top:40px;">游戏规则</h1>
			<table class="table-list setting rule" id="js-rule" style="max-width: 1100px!important">
				<?php foreach ($Game_rule_list as $key => $value){ ?>
					<tr>
						<th width="150px;" class="ruleGroupName" data-id="<?=$value['id']?>">
							<b><?=$value['name']?></b>
							<i class="fa fa-edit th-edit"></i>
							<i class="fa fa-trash-o th-trash"></i>
						</th>
						<th>最高奖金</th>
						<th>最低奖金</th>
						<th>最高投注</th>
						<th>最低消费</th>
						<th>总注数</th>
						<th>排序</th>
						<th>操作</th>
					</tr>
					<?php foreach ($value['item_list'] as $item_value){ ?>
						<tr class="game_rule" data-id="<?=$item_value['id']?>">
							<input type="hidden" value="<?=$item_value['id']?>" api-param-name="id">
							<td><input type="text" placeholder="规则名称" api-param-name="name" value="<?=$item_value['name']?>"></td>
							<td><input type="text" placeholder="最高奖金" api-param-name="highest_bonus" value="<?=$item_value['highest_bonus']?>"></td>
							<td><input type="text" placeholder="最低奖金" api-param-name="minimum_bonus" value="<?=$item_value['minimum_bonus']?>"></td>
							<td><input type="text" placeholder="最高投注" api-param-name="topbet" value="<?=$item_value['topbet']?>"></td>
							<td><input type="text" placeholder="最低消费" api-param-name="minimum_money" value="<?=$item_value['minimum_money']?>"></td>
							<td>······</td>
							<td><input type="text" placeholder="排序" api-param-name="index" value="<?=$item_value['index']?>"></td>
							<td>
								<i class="fa fa-edit item-edit"></i>
								<i class="fa fa-trash-o item-trash"></i>
							</td>
						</tr>
					<?php }?>
				<?php }?>
						

			</table>
			<div class="tools" style="margin-top: 10px;">
				<button class="btn" id="js-add-group"><i class="fa fa-plus"></i>添加玩法组</button>
				<button class="btn" id="js-add-rule"><i class="fa fa-plus"></i>添加玩法</button>
			</div>


		</div>
		

	</div>
	
	<?php $this->load->view($admin_view . '/template/footer.php')?>
	<script type="text/dom">
		
		
		var addRuleGroup = <tr>
			<th width="150px;" class="ruleGroupName" data-id="{%id%}">
				<b>{%name%}</b>
				<i class="fa fa-edit th-edit"></i>
				<i class="fa fa-trash-o th-trash"></i>
			</th>
			<th>最高奖金</th>
			<th>最低奖金</th>
			<th>最高投注</th>
			<th>最低消费</th>
			<th>总注数</th>
			<th>排序</th>
			<th>操作</th>
		</tr>
		
		
		var ruleItem = <div api-name='Game_rule/Add_item'>
			<input type="text" api-param-name='name' placeholder="请输入玩法的名称">
			<select api-param-name='from_group'>
				<option value="-1">请选择所属玩法组</option>
				{%select%}
			</select>
			<textarea api-param-name='description' placeholder="请输入玩法描述"></textarea>
			<textarea api-param-name='winning_description' placeholder="请输入中奖规则"></textarea>
		
			<textarea api-param-name='rule' placeholder="请输入玩法表达式"></textarea>
			<input type="text" placeholder="请输入玩法KEY" api-param-name="byid" name="name" />
			<input type="text" placeholder="玩法号码（以逗号分隔）" api-param-name="number" name="name" />
			<input type="text" placeholder="开奖位置名称（以逗号分隔）" api-param-name="indexName" name="name" />
			<textarea api-param-name='quick' placeholder="快捷按钮名称（以逗号分隔）"></textarea>
		</div>



		var ruleItemEdit = <div api-name='Game_rule/Edit'>
			<input type="hidden" api-param-name='id' value="{%id%}">
			<select api-param-name='from_group' value="{%from_group%}">
				<option value="-1">请选择所属玩法组</option>
				{%select%}
			</select>
			<textarea api-param-name='description' placeholder="请输入玩法描述">{%description%}</textarea>
			<textarea api-param-name='winning_description' placeholder="请输入中奖规则">{%winning_description%}</textarea>
			<textarea api-param-name='rule' placeholder="请输入玩法表达式">{%rule%}</textarea>
			<input type="text" placeholder="请输入玩法KEY" api-param-name="byid" name="name" value="{%byid%}"/>
			<input type="text" placeholder="玩法号码（请用，号分隔）" api-param-name="number" value="{%number%}" name="name" />
			<input type="text" placeholder="开奖位置名称（以逗号分隔）" api-param-name="indexName" value="{%indexName%}" name="name" />
			<textarea api-param-name='quick' placeholder="快捷按钮（以逗号分隔）">{%quick%}</textarea>
		</div>
		
		
		var groupEdit = <div api-name='Game_rule/Edit_name'>
			<input type="hidden" api-param-name="id" name="name" value="{%id%}"/>
			<input type="text" placeholder="请输入玩法byid" api-param-name="name" name="name" value="{%value%}"/>
		</div>
	</script>


	<script type="text/javascript">
		$("#js-save").click(function(){
			apiRequestItem({
				apiName : 'Game_rule/Save',
				success : '保存成功',
				otherParams : {
					id : <?=$this->input->get('id')?>
				}
			})
		})


		$(document).on('click' , '.th-edit , .th-trash' , function(){
			var $this = $(this).parent();
			var id = $this.attr('data-id');

			if($(this).hasClass('th-edit')){
				apiRequestSure({
					title : '编辑分组名称',
					domName : 'groupEdit' , 
					params : {
						id : id,
						value : $this.find('b').text()
					},
					apiName : 'Game_rule/Edit_name',
					success : function(data){
						$this.find('b').text(data.result.name)
						popup.toast("编辑成功");
						popup.close();
						return false;
					} 
				})
			}else{
				apiRequestSure({
					title : '删除分组',
					content : '您确定要删除这个分组？' , 
					otherParams : {
						id : id,
					},
					apiName : 'Game_rule/Delete_group',
					success : '删除成功'
				})
			}
		});


		$(".item-edit , .item-trash").click(function(event) {
			var $this = $(this).parent().parent();
			if($(this).hasClass('item-trash')){
				apiRequestSure({
					title : '删除玩法',
					content : '您确认要删除这个玩法吗',
					apiName : 'Game_rule/Delete_item',
					success : '删除成功',
					otherParams : {
						id : $this.attr('data-id')
					}
				})
				return false;
			}

			var ruleNameList = '';
			$('.ruleGroupName').each(function(key , value){
				ruleNameList += '<option value="' + $(value).attr('data-id') + '">' + $(value).text() + '</option>';
			});
			ApiRequest.push("Game_rule/Get_item" , {
				params : {id : $this.attr('data-id')}
			}).then(function(data){
				data.result.id = $this.attr('data-id');
				data.result.select = ruleNameList;

				apiRequestSure({
					title : '编辑玩法',
					domName : 'ruleItemEdit',
					params : data.result,
					apiName : 'Game_rule/Edit',
					success : '编辑成功',
				})
			} , function(data){
				popup.toast(data)
			})
		});





		var timeout = 0;
		$(".game_rule input[type='text']").bind("propertychange input" , function(){
			clearTimeout(timeout);
			var $this = $(this).parent().parent();

			timeout = setTimeout(function(){
				ApiRequest.push('Game_rule/Edit_item' , {
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






		$("#js-add-group").click(function(){
			popup.sure({
				title : '添加玩法组',
				content : '<input type="text" placeholder="请输入玩法组名称" name="name"/>'
			}).then(function(data){
				if(data.fromData.params.name.length < 2 || data.fromData.params.name.length > 10){
					popup.inputToast('名称不能大于10个字，或小于2个字' , data.fromData.target.name)
					return false;
				}
				apiRequestItem({
					apiName : 'Game_rule/Add_group',
					success : '规则创建成功',
					otherParams : {
						name : data.fromData.params.name,
						from_group : <?=$this->input->get('id')?>
					},
					success : function(result){
						$("#js-rule").append(dom.get('addRuleGroup' , {
							name : data.fromData.params.name,
							id : result.result.id
						}));
						popup.close();
					}
				});
			});
		});




		$("#js-add-rule").click(function(){
			var ruleNameList = '';
			$('.ruleGroupName').each(function(key , value){
				ruleNameList += '<option value="' + $(value).attr('data-id') + '">' + $(value).text() + '</option>';
			});


			popup.sure({
				title : '添加玩法规则',
				content : dom.get('ruleItem' , {
					select : ruleNameList
				})
			}).then(function(data){
				apiRequestItem({
					apiName : 'Game_rule/Add_item',
					success : '规则创建成功',
				});

			});
		})
	</script>
</body>
</html>