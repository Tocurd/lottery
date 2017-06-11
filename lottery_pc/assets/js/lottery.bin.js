var lotteryBin = (function(){

	var lotteryData = [];
	var lotteryTempList = [];
	var lotteryAreaList = [];

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
			
		lotteryData.songData.number = 
			typeof lotteryData.songData.number == 'object' ? 
			lotteryData.songData.number :  
			lotteryData.songData.number.split(',');

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
		if(lotteryTempList.length <= 0) return false;
		var lotteryAreaList = [];

		$.each(lotteryTempList , function(temp_key , temp_vlaue){
			var line = [];
			var itemIndex = 0;
			for(var index = 0;index < Game_rule_data.count;index ++){
				var temp = [];
				$.each(lotteryData.rule , function(key , value){
					if(index + 1 == value[0]){
						temp.push(temp_vlaue.number[itemIndex]);
						itemIndex++;
					}
				});
				if(temp.length <= 0) temp.push()
				line.push(temp);
			}
			lotteryAreaList.push(line)
		})
		return lotteryAreaList;
	}





	/**
	 * 将彩票加入缓冲区
	 * @return {[type]} [description]
	 */
	module.prototype.addLotteryTemp = function(data , option){
		if(data.length < lotteryData.line.line) return false;
		for(value in data){
			if(data[value].length < lotteryData.line.count) return false;
			for(char in data[value]){
				if($.inArray(data[value][char] , lotteryData.songData.number) == -1) return false;
			}
		}
		lotteryTempList.push({
			number : data,
			multiple : option.multiple,
			chooseMoney : option.chooseMoney,
			chooseMoneyLost : option.chooseMoneyLost,
		});
		return this;
	}



	/**
	 * 计算彩票的总注数
	 * @return {[type]} [description]
	 */
	module.prototype.notes = function(){
		var noteNumber = 0;
		if(lotteryTempList.length <= 0) return false;
		$.each(lotteryTempList , function(key , value) {
			lotteryTempList[key].noteNumber = lotteryRule.countNotes(value.number);
			noteNumber += lotteryTempList[key].noteNumber;
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
