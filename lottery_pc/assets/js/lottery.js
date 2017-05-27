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
	var songIndex = $(".tabCon").eq(topIndex).find('.item').index(this);
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
	rule(Game_rule_data.Game_rule_menu_list[eq].song[conEq])
}

/**
 * 进行规则的检索
 * @return {[type]} [description]
 */
function rule(data){
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
	var reslut = '<div class="nbs"><div class="ti">' + name + '</div><div class="nb">';
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



/**
 * 计算当前的注数
 * @return {[type]} [description]
 */
var reslut = [];
function notes(){
	reslut = [];
	var $this = $("#lt_selector");
	var byid = $this.attr('data-byid');

	var option = {
		row : 1 , 
		type : 'default'
	};
	var effective = {row : 0};
	var notes = {count : 0}

	$this.find('.nbs .nb').each(function(index, el) {
		var row = [];
		$(el).find('[name="lt_place_0"].on').each(function(key , value) {
			row.push($(value).text());
			switch(option.type){
				case 'dan':
					notes.count ++;
				break;
			}
		});

		if(option.type == 'default'){
			if(index == 0){
				notes.count = row.length
			}else{
				if(row.length > 0) notes.count *= row.length
			}
		}
		if(row.length != 0) effective.row ++;
		reslut.push(row);
	});

	console.log(notes)

	if(effective.row < option.row){
		$("#lt_sel_nums").text('0');
		$("#lt_sel_money").text('0');
		return false;
	}



	switch(Game_rule_data.byid){
		case 'shishicai' :
			switch(byid){
				case 'five_location' :

				break;
			}
		break;
	}
}



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