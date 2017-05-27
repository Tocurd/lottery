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


	console.log(index)
	$("#nb-box1 , #nb-box2").removeClass('make_transist').removeClass('showleft').addClass('hideleft');
	$("#nb-box" + index).removeClass('hideleft').addClass('make_transist').addClass('showleft');
	return false;
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