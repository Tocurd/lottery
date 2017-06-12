if(typeof menuActive != 'undefined'){
	$('.left-menu li').removeClass('active');
	$('.left-menu li').eq(menuActive).addClass('active');
	$('.song-menu .item').hide();
	$('.song-menu .item').eq(menuActive).show();
	$('.song-menu .item').eq(menuActive).find('li').removeClass('active');
	$('.song-menu .item').eq(menuActive).find('li').eq(menuSongActive).addClass('active');
}



$(document).on('click', ".widget-checkbox", function(event) {
	$(this).toggleClass('active');
});
var ApiRequest = new ApiRequest({


	Card : {
		Remove : {params : {}}
	},
	

	Letter : {
		Create : {params : {
			title : {max : 255 , min : 1 , name : '标题'},
			content : {max : 1024 , min : 1 , name : '标题'},
			username : {max : 100 , min : 0 , name : '用户名'},
		}},
		Remove : {params : {}}
	},


	Config : {
		Edit : {params : {}}
	},
	
	Order : {
		Success : {params : {}},
		Remove : {params : {}},
	},
	Withdrawals : {
		Check : {params : {}},
		Remove : {params : {}},
		Trash : {params : {}},
	},

	Collection : {
		Remove : {params : {}}
	},

	Order_betting : {
		Revoke : {params : {
			id : {max : 11 , min : 1 , name : '索引'},
		}},
		Search : {params : {
			type : {max : 32 , min : 0 , name : 'type'},
			end_time : {max : 32 , min : 0 , name : 'end_time'},
			order_id : {max : 32 , min : 0 , name : 'order_id'},
			periods : {max : 32 , min : 0 , name : 'periods'},
			start_time : {max : 32 , min : 0 , name : 'start_time'},
			username : {max : 32 , min : 0 , name : 'username'},
		}}
	},




































	User : {
		Create : {params : {
			username : {max : 16 , min : 6 , name : '用户名'},
			password : {max : 16 , min : 6 , name : '密码'},
			nickname : {max : 16 , min : 6 , name : '昵称'},
			type : {max : 16 , min : 1 , name : '类型' , is_number : true},
			money : {max : 16 , min : 1 , name : '余额' , is_number : true},
			rebate : {max : 2 , min : 1 , name : '返点' , is_number : true},
		}},


		Edit : {params : {
			username : {max : 16 , min : 6 , name : '用户名'},
			password : {max : 16 , min : 6 , is_null : true , name : '密码'},
			nickname : {max : 16 , min : 6 , name : '昵称'},
			type : {max : 16 , min : 1 , name : '会员类型' , is_number : true},
			money : {max : 16 , min : 0 , name : '余额' , is_number : true},
			rebate : {max : 99 , min : 0 , name : '返点' , is_number : true},
			id : {is_number : true},
			type : {is_number : true},
			state : {is_number : true},
		}},

		Delete : {params : {
			id : {}
		}}
	},







	/**
	 * 彩票种类设置
	 * @type {Object}
	 */
	Lottery : {

		/**
		 * [Create 创建彩票]
		 * @type {Object}
		 */
		Create : {params : {
			name : {max : 16 , min : 2 , name : '彩票名称'},
			from_group : {max : 16 , min : 1 , name : '彩票名称'},
			periods : {max : 16 , min : 1 , name : '彩票期数'},
			stop_interval : {max : 4 , min : 1 , name : '开奖间隔'},
			open_interval : {max : 4 , min : 1 , name : '开奖间隔'},
			allow_number : {max : 100 , min : 1 , name : '允许的号码'},
		}},

		/**
		 * [Edit 编辑彩票]
		 * @type {Object}
		 */
		Edit : {params : {
			id : {},
			name : {max : 16 , min : 2 , name : '彩票名称'},
			from_group : {max : 16 , min : 1 , name : '彩票名称'},
			periods : {max : 16 , min : 1 , name : '彩票期数'},
			stop_interval : {max : 4 , min : 1 , name : '开奖间隔'},
			open_interval : {max : 4 , min : 1 , name : '开奖间隔'},
			allow_number : {max : 100 , min : 1 , name : '允许的号码'},
		}},

	},



	/**
	 * [Lottery_time 彩票开奖时间]
	 * @type {Object}
	 */
	Lottery_time : {

		Edit : {params : {
			id : {},
			time : {max : 5 , min : 5 , name : '开奖时间'}
		}}
	},













	// 后台管理员操作
	Admin_user : {

		Login : {params : {
			username : {max : 16 , min : 5 , name : '用户名'},
			password : {max : 16 , min : 5 , name : '密码'},
		}} ,

		Create : {
			params : {
				username : {max : 16 , min : 5 , name : '用户名'},
				password : {max : 16 , min : 5 , name : '密码'},
				remarks : {max : 16 , min : 0 , name : '备注'},
				group : {max : 4 , min : 1 , name : '管理员类别'},
				state : {max : 1 , min : 1 , name : '管理员状态'},
			}
		} ,

		Edit : {
			params : {
				id : {},
				username : {max : 16 , min : 5 , name : '用户名'},
				password : {max : 16 , min : 0 , name : '密码'},
				remarks : {max : 16 , min : 0 , name : '备注'},
				group : {max : 4 , min : 1 , name : '管理员类别'},
				state : {max : 1 , min : 1 , name : '管理员状态'},
			}
		},

		Delete : {
			params : {
				id : {},
			}
		} ,

	} ,


	Admin_group : {
		
		Create : {
			params : {
				name : {max : 16 , min : 1 , name : '权限组名称'},
				state : {max : 1 , min : 1 , name : '权限组状态'},
			}
		} ,

		Edit : {
			params : {
				id : {},
				name : {max : 16 , min : 1 , name : '权限组名称'},
				state : {max : 1 , min : 1 , name : '权限组状态'},
			}
		} ,

		Delete : {
			params : {
				id : {},
			}
		} ,

	},





	Game_rule : {
		
		Delete : {
			params : {
				id : {},
			}
		} ,

		
		Get_item : {
			params : {
				id : {},
			}
		} ,

		Delete_item : {
			params : {
				id : {},
			}
		} ,

		Save : {
			params : {
				id : {},
				name : {max : 16 , min : 2 , name : '规则名称'},
				count : {max : 2 , min : 1 , name : '规则位数'},
				numberRange : {max : 20 , min : 1 , name : '单位置号码范围'},
			}
		} ,

		Create : {
			params : {
				name : {max : 16 , min : 2 , name : '规则名称'},
				count : {max : 2 , min : 1 , name : '规则位数'},
			}
		} ,






		Edit : {
			params : {
				id : {},
				name : {max : 16 , min : 2 , name : '玩法组名称'},
				from_group : {max : 16 , min : 1 , name : '所属玩法组'},
				description : {max : 300 , min : 2 , name : '玩法描述'},
				winning_description : {max : 300 , min : 2 , name : '中奖规则'},
				rule : {max : 500 , min : 2 , name : '玩法表达式'},
				byid : {max : 120 , min : 2 , name : 'byid'},
				number : {max : 120 , min : 2 , name : '玩法号码'},
				quick : {max : 120 , min : 2 , name : '快捷按钮名称'},
				indexName : {max : 1024 , min : 2 , name : '开奖位置名称'},
			}
		} ,
		Add_item : {
			params : {
				name : {max : 16 , min : 2 , name : '玩法组名称'},
				from_group : {max : 16 , min : 1 , name : '所属玩法组'},
				description : {max : 300 , min : 2 , name : '玩法描述'},
				winning_description : {max : 300 , min : 2 , name : '中奖规则'},
				rule : {max : 500 , min : 2 , name : '玩法表达式'},
				byid : {max : 120 , min : 2 , name : 'byid'},
				number : {max : 120 , min : 2 , name : '玩法号码'},
				quick : {max : 120 , min : 2 , name : '快捷按钮名称'},
				indexName : {max : 1024 , min : 2 , name : '开奖位置名称'},
			}
		} ,
		






		Add_group : {
			params : {
				name : {max : 16 , min : 2 , name : '玩法组名称'},
			}
		} ,


		Edit_item : {
			params : {
				id : {name : '索引'},
				name : {max : 16 , min : 2 , name : '玩法组名称'},
				highest_bonus : {is_null : false , name : '最高奖金'},
				minimum_bonus : {is_null : false , name : '最低奖金'},
				topbet : {is_null : false , name : '最高投注'},
				minimum_money : {is_null : false , name : '最低消费'},
				index : {is_null : false , name : '排序'},
			}
		} ,

		Edit_name : {
			params : {
				id : {},
				name : {max : 16 , min : 2 , name : '玩法组名称'},
			}
		} ,


		Delete_group : {
			params : {
				id : {},
			}	
		}




	},





} , {
	url : base_url + 'api/v1/' + admin_dir + '/',
});


/**
 * 处理API请求失败时
 * @param  {[type]} data [description]
 * @return {[type]}      [description]
 */
function ajaxError(data , popup){
	if(isset(data.data) && data.data.length > 0 && data.data != {}){
		popup.inputToast(data.message , data.data[0].data)
	}else{
		popup.toast(data.message)
	}
}


/**
 * 通用确认框请求
 * @param  {[type]} title 
 * @param  {[type]} domName 
 * @param  {[type]} params 
 * @param  {[type]} otherParams 
 * @param  {[type]} apiName 
 * @param  {[type]} success 
 * @param  {[type]} url 
 * @return {[type]}       [description]
 */
function apiRequestSure(param){
	var popup = new popupWidget();
	popup.sure({
		title : param.title,
		content : (isset(param.domName) ? dom.get(param.domName , param.params) : param.content)
	}).then(function(){

		var other = {};
		if(isset(param.otherParams)) other.params = param.otherParams;

		ApiRequest.push(param.apiName , other).then(function(data){
			if(typeof param.success == 'function'){
				return param.success(data);
			}else{
				popup.toast(param.success);
				ApiRequest.success(isset(param.url) ? param.url : '');
			}
		}, function(data){
			ajaxError(data, popup)
		})
	})
}



/**
 * 通用确认框请求
 * @param  {[type]} title 
 * @param  {[type]} domName 
 * @param  {[type]} params 
 * @param  {[type]} otherParams 
 * @param  {[type]} apiName 
 * @param  {[type]} success 
 * @param  {[type]} url 
 * @return {[type]}       [description]
 */
function apiRequestItem(param){
	var popup = new popupWidget();
	var other = {};
	if(isset(param.otherParams)) other.params = param.otherParams;

	ApiRequest.push(param.apiName , other).then(function(data){

		if(typeof param.success == 'function'){
			return param.success(data);
		}else{
			popup.toast(param.success);
			ApiRequest.success(isset(param.url) ? param.url : '');
		}
	}, function(data){
		ajaxError(data, popup)
	})
}