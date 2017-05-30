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
	}


} , {
	url : 'api/'
})