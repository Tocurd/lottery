var ApiRequest = new ApiRequest({



	Lottery : {
		Now : {params : {
			lottery_id : {is_number : true}
		}} ,

		ReloadPeriods : {params : {
			lottery_id : {is_number : true}
		}},

		Betting : {params : {
			byid : {is_number : true},
			data : {},
		}}
	},


	User : {
		Login : {params : {
			username : {max : 16 , min : 6 , name : '用户名'},
			verification : {max : 4 , min : 4 , name : '验证码'}
		}} ,

		Goto_login : {params : {
			password : {max : 16 , min : 6 , name : '密码'}
		}}
	}


} , {
	url : 'api/'
})