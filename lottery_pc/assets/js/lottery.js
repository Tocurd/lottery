var passLotteryIntervalId;
var $count_down = $("#count_down span");
var is_draw = false;
updateLotterTime();
setInterval(updateLotterTime , 1000)
function updateLotterTime(){
	nextLotteryTime --;
	var formatSecond = formatSeconds_array(nextLotteryTime);

	$count_down.eq(0).text(formatSecond.hour[0]);
	$count_down.eq(1).text(formatSecond.hour[1]);
	$count_down.eq(3).text(formatSecond.minute[0]);
	$count_down.eq(4).text(formatSecond.minute[1]);
	$count_down.eq(6).text(formatSecond.second[0]);
	$count_down.eq(7).text(formatSecond.second[1]);

	if(nextLotteryTime <= 0){
		nextLotteryTime = 0;
		ApiRequest.push('Lottery/Now' , {params : {
			lottery_id : lotteryId
		}}).then(function(data){
			nextLotteryTime = data.result.Next_lottery_time;
			$("#current_issue").text(data.result.byid);
			draw();
			reloadPeriods();
		});
	}

}

/**
 * 摇奖程序
 * @return {[type]} [description]
 */
draw();
function draw(){
	if(is_draw) return;
	is_draw = true;
	var drawTime = 0;
	start();

	var drawIntervalId = setInterval(function(){

		ApiRequest.push('Lottery/Now' , {params : {
			lottery_id : lotteryId
		}}).then(function(data){
			drawTime = data.result.Now_lottery.time;
			$('#lt_gethistorycode').text(data.result.Now_lottery.byid);


			if(drawTime <= 0){
				if(data.result.Now_lottery.data != ''){
					$("#lt_opentimebox").hide();
					$("#lt_opentimebox2").hide();
					clearInterval(drawIntervalId);
					
					// 可以将开奖结果展示到前台
					stop();
					var $showcode = $("#showcodebox li") , index = 0;

					setTimeout(function(){
						$showcode.each(function(){
							$(this).text(data.result.Now_lottery.data[index])
							index ++;
						})
					} , 50)

					is_draw = false;
				}else{
					$("#lt_opentimebox").hide();
					$("#lt_opentimebox2").show();
				}
			}

			if(drawTime > 0){
				var time = formatSeconds_array(drawTime);
				$("#lt_opentimeleft").html(time.minute + ":" + time.second);

				$("#lt_opentimebox").show();
				$("#lt_opentimebox2").hide();
				var drawId = setInterval(function(){
					drawTime --;

					time = formatSeconds_array(drawTime);
					$("#lt_opentimeleft").html(time.minute + ":" + time.second)
					if(drawTime <= 0){
						drawTime = 0;
						clearInterval(drawId);
						is_draw = false;
						draw();
					}
				} , 1000)
				clearInterval(drawIntervalId);
			}
		});

	} , 1000);




}



var is_close = false;
function start(){
	is_close = false;
	var $showcodebox = $("#showcodebox");
	var passLotteryIntervalId = setInterval(function(){
		$showcodebox.find('li').each(function(){
			var int = parseInt($(this).text()) + 1;
			if(typeof $(this).attr('data-number') == 'undefined'){
				$(this).attr('data-number' , int);
			}
			if(int >= 9) int = 0;
			$(this).text(int)
			if(is_close){
				clearInterval(passLotteryIntervalId);
				return;
			}
		})
		if(is_close){
			clearInterval(passLotteryIntervalId);
			return;
		}
	} , 20);
}
function stop(){
	is_close = true;
	clearInterval(passLotteryIntervalId);
}








// 切换第一期或者是第五期
$("#shownb-box .box-ul a").click(function(){
	var index = $("#shownb-box .box-ul a").index(this) + 1;
	$("#shownb-box .box-ul a").removeClass('tabulous_active')
	$(this).addClass('tabulous_active');

	$("#nb-box1 , #nb-box2").removeClass('make_transist').removeClass('showleft').addClass('hideleft');
	$("#nb-box" + index).removeClass('hideleft').addClass('make_transist').addClass('showleft');
	return false;
})




// 切换标签获取规则
var topIndex = 0;
var songIndex = 0;
$("#tabbar-div-s2 .tab-header").click(function(){
	topIndex = $("#tabbar-div-s2 .tab-header").index(this);
	switchTab(topIndex , 0);
});
$(".tabCon .item").click(function(){
	songIndex = $(".tabCon").eq(topIndex).find('.item').index(this);
	switchTab(topIndex , songIndex);
});


switchTab(0 , 0);
function switchTab(eq , conEq){
	$("#tabbar-div-s2 .tab-header").removeClass('tab-front').addClass('tab-back');
	$(".tabCon").hide();
	$("#tabbar-div-s2 .tab-header").eq(eq).removeClass('tab-back').addClass('tab-front');
	var id = $("#tabbar-div-s2 .tab-header").eq(eq).attr('data-id');
	$(".tabCon").find('.item').removeClass('act').addClass('back');
	$(".tabCon[data-id='" + id + "']").show()
	.find('.item').eq(conEq).removeClass('back').addClass('act');
	rule(Game_rule_data.Game_rule_menu_list[eq].song[conEq]);
	$("#lt_sel_nums , #lt_sel_money").text('0');
	$("#lt_sel_times").val('1')
}

/**
 * 进行规则的检索
 * @return {[type]} [description]
 */
function rule(data){
	console.log(data)
	var reslut = [] , html = '';
	var indexName = {
		'全' : 'all',
		'单' : 'dan',
		'双' : 'double',
		'大' : 'big',
		'小' : 'small',
		'奇' : 'odd',
		'偶' : 'even',
		'清' : 'clean'
	};

	var quick = [];
	$.each(data.quick.split(',') , function(key , value){
		quick.push({
			name : value , 
			byid : indexName[value]
		})
	})
	var rule = {
		name : data.indexName.split(','),
		number : data.number.split(','),
		quick : quick,
	};

	$("#lt_selector").attr('data-byid' , data.byid)
	var data = data.rule.split(/[&&||]/);
	for(var i = 0 ;i < data.length;i++){  
		if(data[i] == "" || typeof(data[i]) == "undefined"){  
			data.splice(i,1);  
			i = i - 1;  
		} 
	}

	// 循环的将号码转换成HTML
	$.each(data , function(key , value){
		var split = value.split('=');
		html += parse(rule.name[split[0] - 1] , rule.number , split[0] , quick);
	});
	$("#lt_selector").html(html).attr('data-byid')

}


function parse(name , data , index , quick){
	var reslut = '<div class="nbs" data-index="' + index + '"><div class="ti">' + name + '</div><div class="nb">';
	$.each(data , function(key , value){
		reslut += '<div name="lt_place_0" data-index="' + index + '">' + value + '</div>';
	});
	reslut += '</div><div class="to"><ul><li class="l"></li>' ;
	$.each(quick , function(key , value){
		reslut += '<li class="dxjoq" name="' + value.byid + '">' + value.name + '</li>';
	});

	reslut += '<li class="r"></li></ul></div>';
	reslut += '</div></div>';
	return reslut;	
}



/**
 * 点击注数后的响应事件
 * @param  {[type]} ){	$(this).toggleClass('on');} [description]
 * @return {[type]}                                  [description]
 */
$("#lt_selector").on('click' , "[name='lt_place_0']" , function(){
	$(this).toggleClass('on');
	$(this).parent().parent().find(".to .dxjoq").removeClass('on');
	notes();
});

// '全' : 'all',
// '单' : 'dan',
// '双' : 'double',
// '大' : 'big',
// '小' : 'small',
// '奇' : 'odd',
// '偶' : 'even',
// '清' : 'clean'
$("#lt_selector").on('click' , '.to .dxjoq' , function(){
	$(this).parent().parent().find(".dxjoq").removeClass('on')
	$(this).toggleClass('on');
	var name = $(this).attr('name');
	var $data = $(this).parent().parent().parent().find('.nb [name="lt_place_0"]');
	var number = [];

	$data.removeClass('on')
	$data.each(function(){
		switch(name){
			case 'all' :
				$(this).addClass('on')
			break;
			case 'big' :
				$(this).text() >= 5 ? $(this).addClass('on') : '';
			break;
			case 'small' :
				$(this).text() < 5 ? $(this).addClass('on') : '';
			break;
			case 'odd' :
				$(this).text() % 2 == 1 ? $(this).addClass('on') : '';
			break;
			case 'even' :
				$(this).text() % 2 == 0 ? $(this).addClass('on') : '';
			break;
			case 'dan' :
				$(this).text() % 2 == 1 ? $(this).addClass('on') : '';
			break;
			case 'double' :
				$(this).text() % 2 == 0 ? $(this).addClass('on') : '';
			break;
		}
	})

	notes();
})



function getRule(){
	var rule = {
		line : $("#lt_selector").find('.nb').length,	// 最少选中多少行
		count : 1,							// 每行最少选择多位个注数
	};
	var byid = $("#lt_selector").attr('data-byid');

	// 时时彩定位胆，五星定位胆格式
	if(Game_rule_data.byid == 'shishicai'){
		switch(byid){
			case 'five_location' : 
				rule.line = 1;
				rule.count = 1;
			break;
			case 'end_three_group_three' : 
				rule.line = 1;
				rule.count = 2;
			break;
			case 'end_three_group_six' : 
				rule.line = 1;
				rule.count = 3;
			break;
		}
	}
	return rule;
}

/**
 * 计算当前的注数
 * @return {[type]} [description]
 */
var reslut = [];
var number = [];
var is_add = false;
function notes(data){
	$("#lt_sel_nums").text('0');
	$("#lt_sel_money").text('0');
	is_add = false;
	var $this = $("#lt_selector");
	var byid = $this.attr('data-byid');
	var line = 0;

	var rule = getRule();



	// 将数据整理集合出来
	if(typeof data == 'undefined'){
		number = [];
		$this.find('.nbs .nb').each(function(index, el) {
			var row = [];
			$(el).find('[name="lt_place_0"].on').each(function(key , value) {
				row.push($(value).text());
			});

			if(row.length >= rule.count) line ++;
			number.push(row);
		});
	}else{
		number = data;
	}




	// 如果没有达到选中的要求就返回
	if(line < rule.line) return false;
	is_add = true;


	var noteNumber = 0;
	var custom = false;



	// 时时彩定位胆，五星定位胆算注算法
	if(Game_rule_data.byid == 'shishicai' && byid == 'five_location'){
		custom = true;
		$.each(number , function(key , value){
			noteNumber += value.length
		})
	}

	// 时时彩定位胆，后三组六算注算法
	if(Game_rule_data.byid == 'shishicai' && byid == 'end_three_group_six'){
		custom = true;
		noteNumber = combine(number[0] , rule.count).length
	}


	// 时时彩定位胆，后三组三胆算注算法
	if(Game_rule_data.byid == 'shishicai' && byid == 'end_three_group_three'){
		custom = true;
		noteNumber = permutation(number[0] , rule.count).length
	}




	// 默认算法
	if(custom == false){
		noteNumber = 1;
		$.each(number , function(index , value){
			noteNumber *= value.length
		})
	}


	// 获得用户选的什么玩法方式
	var chooseMoney = [2 , 0.2 , 0.02 , 0.002];
	var chooseMoneyLost = [0 , 2 , 2 , 3];
	var index = $(".choose-money li").index($(".choose-money .on"));
	$('#lt_sel_nums').text(noteNumber)
	$('#lt_sel_money').text(((noteNumber * chooseMoney[index]) * $("#lt_sel_times").val()).toFixed(chooseMoneyLost[index]));


	if(typeof data != 'undefined'){
		return {
			times : chooseMoneyLost[index],
			chooseMoney : $(".choose-money .on").text(),
			noteNumber : noteNumber,
			Money : ((noteNumber * chooseMoney[index]) * $("#lt_sel_times").val()).toFixed(chooseMoneyLost[index]),
		}
	}
}

/**
 * 添加
 * @param  {[type]} ){	$(".tz_tab_list_box").} [description]
 * @return {[type]}                              [description]
 */
var reslutItem = 0;
var nowNotes = [];
var index = 0;
$("#lt_sel_insert").click(function(){
	var popup = new popupWidget();

	if(is_add == false){
		popup.sure({
			title : '温馨提示',
			content : '号码选择不完整，请重新选择'
		}).then(function(){popup.close()});
		return false;
	}
	


	var rule = getRule();
	var $this = $("#lt_selector");
	number = [];
	for(var countIndex = 0;countIndex < Game_rule_data.count;countIndex ++){
		var row = [];
		$this.find('.nbs[data-index="' + (countIndex + 1) +  '"] .nb').each(function(index, el) {
			$(el).find('[name="lt_place_0"].on').each(function(key , value) {
				row.push($(value).text());
			});
		});
		number.push(row.length > 0 ? row : [])
	}
	console.log(number);

	

	var data = '';
	$.each(number , function(key , value){
		data += value.join('') + ',';
	});
	data = data.substr(0 , data.length - 1);




	var is_identical = false;
	$.each(nowNotes , function(key , value){
		if( ! is_identical){
			if(value.data == data){
				is_identical = true
				return false;
			}
		}
	})

	if(is_identical){
		popup.sure({
			title : '温馨提示',
			content : '确认区有相同的投注内容'
		}).then(function(){
			$("[name='lt_place_0']").removeClass('on');
			$(".dxjoq").removeClass('on')
			popup.close()
		});
		return false;
	}
	if(reslutItem == 0){
		$("#lt_cf_content tbody").html('')
	}

	reslutItem ++;
	index ++;
	var rule = Game_rule_data.Game_rule_menu_list[topIndex];
	var song = rule.song[songIndex];
	
	data = {
		index : index,
		topIndex : rule.id,
		songIndex : song.id,
		name : rule.name + "_" + song.name,
		data : data,
		type : $(".choose-money .on").text(),
		lt_sel_nums : parseInt($("#lt_sel_nums").text()),
		lt_sel_money : parseInt($("#lt_sel_money").text()),
		lt_sel_times : parseInt($("#lt_sel_times").val()),
	};
	nowNotes.push(data);
	$("[name='lt_place_0']").removeClass('on');
	$(".dxjoq").removeClass('on')
	$("#lt_cf_content tbody").append("<tr data-index='" + index + "' style='cursor:pointer;' class='><td class='tl_li_l' width='4'></td><td><span style='display:block;width:240px;overflow: hidden;overflow: hidden;padding-right:20px;text-overflow:ellipsis;white-space: nowrap;'>[" + data.name + "] " + data.data + "</span></td><td width='25'>" + data.type + "</td><td width='80' class='r' style='min-width:100px;'>" + data.lt_sel_nums + "注</td><td width='80' class='r'>" + data.lt_sel_times + "倍</td><td width='120' class='r'>" + data.lt_sel_money + "元</td><td class='c tl_li_r' width='16' title='删除'></td></tr>")		
	$("#lt_sel_nums").text('0')
	$("#lt_sel_money").text('0')
	$("#lt_sel_times").val('1')





	$.each(nowNotes , function(key , value){
		$("#lt_cf_nums").text(parseInt($("#lt_cf_nums").text()) + value.lt_sel_nums);
		$("#lt_cf_money").text(parseInt($("#lt_cf_money").text()) + value.lt_sel_money);
	})
});


$(document).on('click' , '.tl_li_r' , function(){
	var index = $(this).parent().attr('data-index');
	$(this).parent().remove().empty();
	$.each(nowNotes , function(key , value){
		if(value.index == index) nowNotes.splice(key, 1);
	});
})


// 倍数点击按钮及元角分厘按钮
$(".choose-money li").click(function(){
	$(".choose-money li").removeClass('on');
	$(this).addClass('on');
	notes()
});
$("#plustime").click(function(){
	$("#lt_sel_times").val(parseInt($("#lt_sel_times").val()) + 1)
	notes()
});
$("#reducetime").click(function(){
	if($("#lt_sel_times").val() - 1 <= 0) return;
	$("#lt_sel_times").val(parseInt($("#lt_sel_times").val()) - 1)
	notes()
});




// 未来期数操作
function reloadPeriods(){
	$("#lt_issue_start").html('');
	ApiRequest.push('Lottery/ReloadPeriods' , {params : {lottery_id : lotteryId}}).then(function(data){
		$.each(data.result.Periods_list , function(key , value){
			$("#lt_issue_start").append("<option value=''>" + value.byid  + (key == 0 ? '(当前期)' : '') + "</option>")
		})
	})
}
reloadPeriods();




// 随机注数
function random(numberLength){
	var rule = getRule();
	var $lt_selector = $("#lt_selector .nbs .nb");
	var song = Game_rule_data.Game_rule_menu_list[topIndex].song[songIndex];

	
	var data = song.rule.split(/[&&||]/);
	for(var i = 0 ;i < data.length;i++){  
		if(data[i] == "" || typeof(data[i]) == "undefined"){  
			data.splice(i,1);  
			i = i - 1;  
		} 
	}


	// 时时彩定位胆，五星定位胆格式
	var byid = $("#lt_selector").attr('data-byid');
	if(Game_rule_data.byid == 'shishicai' && byid == 'five_location'){
		rule.line = 5;
	}



	



	var reslut = [];
	var number = '';
	for(var countIndex = 0;countIndex < Game_rule_data.count;countIndex ++){
		number = '';
		// 循环的将号码转换成HTML
		$.each(data , function(key , value){
			var split = value.split('=');
			if(split[0] == countIndex + 1){
				number = arrayRandom(song.number.split(',') , rule.count);
			}
		});
		reslut.push(number != '' ? number : '');
	}

	

}
function arrayRandom(arr , len){
	var reslut = '';
	for(var index = 0;index < len;index++){
		reslut += arr[randNum(0 , arr.length)]
	}
	return reslut;
}
function randNum(minnum , maxnum){
    return Math.floor(minnum + Math.random() * (maxnum - minnum));
}
$("#lt_random_five").click(function(){random(5)})
$("#lt_random_one").click(function(){random(1)})
$("#lt_cf_clear").click(function(){
	nowNotes = [];
	reslutItem = 0;
	$("#lt_cf_nums , #lt_cf_money").text('0')
	$(".tz_tab_list_box table").html('<tbody><tr class="nr"><td class="tl_li_l" width="4"></td><td class="noinfo">暂无投注项</td><td class="tl_li_rn" width="4"></td></tr></tbody>')
})














function formatSeconds_array(value) { 
	var theTime = parseInt(value);// 秒 
	var theTime1 = 0;// 分 
	var theTime2 = 0;// 小时 
	var time = {};
	// alert(theTime); 
	if(theTime > 60) { 
		theTime1 = parseInt(theTime / 60); 
		theTime = parseInt(theTime % 60); 
		if(theTime1 > 60) { 
			theTime2 = parseInt(theTime1 / 60); 
			theTime1 = parseInt(theTime1 % 60); 
		} 
	} 
	time.second = (theTime < 10 ? "0" + theTime : theTime).toString();
	if(theTime1 > 0) { 
		time.minute = (theTime1 < 10 ? "0" + theTime1 : theTime1).toString();
	}else{
		time.minute = '00';
	}
	if(theTime2 > 0) { 
		time.hour = (theTime2 < 10 ? "0" + theTime2 : theTime2).toString();
	}else{
		time.hour = '00';
	}
	return time; 
} 


/**
 * 各种彩种玩法、算法
 * DAVID 2015-04-09
 * *****************************
 * *****************************
 * *****************************
 */

function combine(arr, num) {
	var r = [];
	(function f(t, a, n) {
		if (n == 0) return r.push(t);
		for (var i = 0, l = a.length; i <= l - n; i++) {
			f(t.concat(a[i]), a.slice(i + 1), n - 1);
		}
	})([], arr, num);
	return r;
} /* 排列算法*/


/* 组合算法*/
function permutation(arr, num) {
	var r = [];
	(function f(t, a, n) {
		if (n == 0) return r.push(t);
		for (var i = 0, l = a.length; i < l; i++) {
			f(t.concat(a[i]), a.slice(0, i).concat(a.slice(i + 1)), n - 1);
		}
	})([], arr, num);
	return r;
}