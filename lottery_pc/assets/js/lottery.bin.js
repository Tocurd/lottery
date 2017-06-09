var lotteryBin = (function(){

	var lotteryData = [];
	var lotteryTempList = [];

	var module = function(data){
		lotteryTempList = [];
		data.rule = data.songData['rule'].split(/[&&||]/);
		for(var i = 0 ;i < data.rule.length;i++){  
			if(data.rule[i] == "" || typeof(data.rule[i]) == "undefined"){  
				data.rule.splice(i,1);  
				i = i - 1;  
			}else{
				data.rule[i] = data.rule[i].split('=')
			}
		}
		lotteryData = data;
		lotteryData.songData.number = lotteryData.songData.number.split(',');


		lotteryData.line = lotteryRule.line();
		lotteryData.line.line = lotteryData.rule.length;
	}

	module.prototype.getData = function(){
		return lotteryData
	}



	/**
	 * 将彩票加入候选区
	 * @return {[type]} [description]
	 */
	module.prototype.addAreaLottery = function(){

	}





	/**
	 * 将彩票加入缓冲区
	 * @return {[type]} [description]
	 */
	module.prototype.addLotteryTemp = function(data){

		if(data.length < lotteryData.line.line) return false;
		for(value in data){
			if(data[value].length < lotteryData.line.count) return false;
			for(char in data[value]){
				if($.inArray(data[value][char] , lotteryData.songData.number) == -1) return false;
			}
		}

		lotteryTempList.push(data);
		return this;
	}



	/**
	 * 计算彩票的注数
	 * @return {[type]} [description]
	 */
	module.prototype.notes = function(data){
		var noteNumber = 0;
		if(lotteryTempList.length <= 0) return false;

		$.each(lotteryTempList , function(key , value) {
			noteNumber += lotteryRule.countNotes(value)
		});

		return noteNumber;
	}





	/**
	 * 清空缓冲区
	 * @return {[type]} [description]
	 */
	module.prototype.clearLotteryTemp = function(){
		lotteryTempList = [];
	}








	return module;
})(jQuery);
