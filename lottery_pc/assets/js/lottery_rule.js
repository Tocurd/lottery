var lotteryRule = (function(){
	var module = function(){}



	/**
	 * 获取基础规则行数
	 * @return {[type]} [description]
	 */
	module.prototype.line = function(){
		var $selector = $("#lt_selector");
		var byid = $selector.attr('data-byid');
		var defaultRule = {
			count : 1,							 // 每行最少选择多位个注数
			line : $selector.find('.nb').length, // 最少选中多少行
		};



		// 时时彩玩法
		if(Game_rule_data.byid == 'shishicai'){
			switch(byid){
				// 五星定位胆
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




		return defaultRule;
	}














	module.prototype.countNotes = function(number){
		var custom = false;
		var byid = $("#lt_selector").attr('data-byid');
		var noteNumber = 0;


		console.log(Game_rule_data.byid , byid)

		if(Game_rule_data.byid == 'shishicai'){
			switch(byid){

				// 五星_定位胆算注算法
				case 'five_location' :
					$.each(number , function(key , value){
						noteNumber += value.length
					})
				break;


				// 前二算法
				case 'five_location' :
					$.each(number , function(key , value){
						noteNumber += value.length
					})
				break;



				// 后三组六算注算法
				case 'end_three_group_six' :
					noteNumber = combine(number[0] , rule.count).length
				break;


				// 后三组三算注
				case 'end_three_group_three' :
					noteNumber = permutation(number[0] , rule.count).length
				break;


				case '前二_直选跨度' :
					var rule = [10 , 18 , 16 , 14 , 12 , 10 , 8 , 6 , 4 , 2]
					$.each(number[0] , function(key , value){
						noteNumber += rule[value]
					})
				break;


				case '前二_直选和值' :
					var rule = [1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 9 , 8 , 7 , 6 , 5 , 4 , 3 , 2 , 1]
					$.each(number[0] , function(key , value){
						noteNumber += rule[value]
					})
				break;


				default : 
					noteNumber = 1;
					$.each(number , function(index , value){
						noteNumber *= value.length
					})
				break;
			}
		}




	


		return noteNumber;

	}

	return module;
})(jQuery);







//begin***************************************************************************************************************************
//彩种玩法、算法  DAVID 2015-04-09

/* 组合算法*/

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


//计算注数算法集

function tzAllSelect() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length')),
		delimiter = this.attr('delimiter') || "";
	if (this.has('.checked').length != codeLen) throw ('请选' + codeLen + '位数字');
	this.each(function(i) {
		var $code = $('input.code.checked', this);
		if ($code.length == 0) {
			code[i] = '-';
		} else {
			len *= $code.length;
			code[i] = [];
			$code.each(function() {
				code[i].push(this.value);
			});
			code[i] = code[i].join(delimiter);
		}
	});
	return {
		actionData: code.join(','),
		actionNum: len
	};
} /* 排列组选2  除去对子和豹子*/

function tzDesAlgorSelect() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length')),
		delimiter = this.attr('delimiter') || "";
	if (this.has('.checked').length != codeLen) throw ('请选' + codeLen + '位数字');
	this.each(function(i) {
		var $code = $('input.code.checked', this);
		if ($code.length == 0) {
			code[i] = '-';
		} else {
			code[i] = [];
			$code.each(function() {
				code[i].push(this.value);
			});
			code[i] = code[i].join(delimiter);
		}
	});
	code = code.join(',');
	len = DescartesAlgorithm.apply(null, code.split(",").map(function(v) {
		return v.split(delimiter)
	})).map(function(v) {
		return v.join(',');
	}).filter(function(v) {
		return (!isRepeat(v.split(",")))
	}).length;
	return {
		actionData: code,
		actionNum: len
	};
}

function isRepeat(arr) {
	var hash = {};
	for (var i in arr) {
		if (hash[arr[i]]) return true;
		hash[arr[i]] = true;
	}
	return false;
} /*大小单双选号*/

function tzDXDS() {
	var code = [],
		len = 1,
		codeLen = 2;
	if (this.has('.checked').length != codeLen) throw ('请选' + codeLen + '位数字');
	this.each(function(i) {
		var $code = $('input.code.checked', this);
		if ($code.length == 0) {
			code[i] = '-';
		} else {
			len *= $code.length;
			code[i] = [];
			$code.each(function() {
				code[i].push(this.value);
			});
			code[i] = code[i].join("");

		}
	});
	return {
		actionData: code.join(','),
		actionNum: len
	};
} /*大小单双选号*/

function tzDXDSq3h3() {
	var code = [],
		len = 1,
		codeLen = 3;
	if (this.has('.checked').length != codeLen) throw ('请选' + codeLen + '位数字');
	this.each(function(i) {
		var $code = $('input.code.checked', this);
		if ($code.length == 0) {
			code[i] = '-';
		} else {
			len *= $code.length;
			code[i] = [];
			$code.each(function() {
				code[i].push(this.value);
			});
			code[i] = code[i].join("");
		}
	});
	return {
		actionData: code.join(','),
		actionNum: len
	};
} /*趣味选号*/

function qwwf() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	if (this.has('.checked').length != codeLen) throw ('请选' + codeLen + '位数字');
	this.each(function(i) {
		var $code = $('input.code.checked', this);
		if ($code.length == 0) {
			code[i] = '-';
		} else {
			len *= $code.length;
			code[i] = [];
			$code.each(function() {
				code[i].push(this.value);
			});
			code[i] = code[i].join("");
		}
	});
	return {
		actionData: code.join(','),
		actionNum: len
	};
} /*五星定位胆选号*/

function tz5xDwei() {
	var code = [],
		len = 0,
		delimiter = this.attr('delimiter') || "";
	this.each(function(i) {
		var $code = $('input.code.checked', this);
		if ($code.length == 0) {
			code[i] = '-';
		} else {
			len += $code.length;
			code[i] = [];
			$code.each(function() {
				code[i].push(this.value);
			});
			code[i] = code[i].join(delimiter);
		}
	});
	if (!len) throw ('至少选一个号码');
	return {
		actionData: code.join(','),
		actionNum: len
	};
} /*不定胆选号*/

function tz5xBDwei() {
	var code = "",
		len = 0,
		$code = $('input.code.checked', this);
	len = $code.length;
	if (!len) throw ('至少选一个号码');
	$code.each(function() {
		code += this.value;
	});
	return {
		actionData: code,
		actionNum: len
	};
} /* 时时彩录入式投注*/

function tzSscInput() {
	var codeLen = parseInt(this.attr('length')),
		codes = [],
		str = $('#textarea-code', this).val().replace(/[^\d]/g, '');
	if (str.length && str.length % codeLen == 0) {
		if (/[^\d]/.test(str)) throw ('投注有错，不能有数字以外的字符。');
		codes = codes.concat(str.match(new RegExp('\\d{' + codeLen + '}', 'g')));
	} else {
		throw ('输入号码不正确');
	}
	codes = codes.map(function(code) {
		return code.split("").join(',')
	});
	return {
		actionData: codes.join('|'),
		actionNum: codes.length
	}
}

/*11选5录入式投注*/

function tz11x5Input() {
	var codeLen = parseInt(this.attr('length')) * 2,
		codes = [],
		ncode, str = $('#textarea-code', this).val().replace(/[^\d]/g, '');
	if (str.length && str.length % codeLen == 0) {
		if (/[^\d]/.test(str)) throw ('投注有错，不能有数字以外的字符。');
		codes = codes.concat(str.match(new RegExp('\\d{' + codeLen + '}', 'g')));
	} else {
		throw ('输入号码不正确');
	}
	codes = codes.map(function(code) {
		code = code.split("");
		ncode = "";
		code.forEach(function(v, i) {
			if (i % 2 == 0 && ncode) {
				ncode += "," + v;
			} else {
				ncode += v;
			}
		});
		return ncode;
	});
	return {
		actionData: codes.join('|'),
		actionNum: codes.length
	}
}

function tz11x5Inputrxds() {
	var codeLen = parseInt(this.attr('length')) * 2,
		codes = [],
		str = $('#textarea-code', this).val().replace(/[^\d]/g, ''),
		str2 = str;
	str2 = strCut(str2, 2);
	var info = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11'];
	if (isRepeat(str2)) throw ('号码有重复，请重新输入!');
	if (str.length < codeLen) throw ('至少输入' + parseInt(this.attr('length')) + '个号!');
	if (str.length && str.length / codeLen == 1) {
		if (/[^\d]/.test(str)) throw ('投注有错，不能有数字以外的字符!');
		for (var j = 0; j < str2.length; j++) {
			if (info.indexOf(str2[j]) == -1) throw ('号码输入有误，请重新输入!');
		}
		codes = codes.concat(str.match(new RegExp('\\d{' + codeLen + '}', 'g')));
	} else {
		len = 0;
	}
	len = codes.length;
	return {
		actionData: codes.join('|'),
		actionNum: len
	}
} /*时时彩录入式组选投注*/

function tzSscZuInput() {
	var codeLen = parseInt(this.attr('length')),
		codes = [];
	$('#textarea-code', this).val().split(/[\r\n]/).forEach(function(str) {
		if (str.length && str.length % codeLen == 0) {
			if (/[^\d]/.test(str)) throw ('投注有错，不能有数字以外的字符。');
			codes = codes.concat(str.match(new RegExp('\\d{' + codeLen + '}', 'g')));
		} else {
			throw ('输入号码不正确');
		}
	});
	codes.forEach(function(code) {
		if ((new RegExp("^(\\d)\\1{" + (codeLen - 1) + "}$")).test(code)) throw ('组选不能为豹子');
	});
	codes = codes.map(function(code) {
		return code.split("").join(',')
	});
	return {
		actionData: codes.join('|'),
		actionNum: codes.length
	}
} /*时时彩录入式选位数投注*/

function tzSscWeiInput() {
	var codeLen = parseInt(this.attr('length')),
		codes = [],
		weiShu = [],
		str = $('#textarea-code', this).val().replace(/[^\d]/g, '');
	if ($('#wei-shu :checked', this).length != codeLen) throw ('请选' + codeLen + '位数');
	$('#wei-shu :checkbox', this).each(function(i) {
		if (!this.checked) weiShu.push(i);
	});
	if (str.length && str.length % codeLen == 0) {
		if (/[^\d]/.test(str)) throw ('投注有错，不能有数字以外的字符。');
		codes = codes.concat(str.match(new RegExp('\\d{' + codeLen + '}', 'g')));
	} else {
		throw ('输入号码不正确');
	}
	codes = codes.map(function(code) {
		code = code.split("");
		weiShu.forEach(function(v, i) {
			code.splice(v, 0, '-');
		});
		return code.join(',');
	});
	return {
		actionData: codes.join('|'),
		actionNum: codes.length
	}
} /*11选5录入式选位数投注*/

function tz11x5WeiInput() {
	var codeLen = parseInt(this.attr('length')),
		codes = [],
		weiShu = [],
		ncode, str = $('#textarea-code', this).val().replace(/[^\d]/g, '');
	if ($('#wei-shu :checked', this).length != codeLen) throw ('请选' + codeLen + '位数');
	$('#wei-shu :checkbox', this).each(function(i) {
		if (!this.checked) weiShu.push(i);
	});
	codeLen *= 2;
	if (str.length && str.length % codeLen == 0) {
		if (/[^\d]/.test(str)) throw ('投注有错，不能有数字以外的字符。');
		codes = codes.concat(str.match(new RegExp('\\d{' + codeLen + '}', 'g')));
	} else {
		throw ('输入号码不正确');
	}
	codes = codes.map(function(code) {
		code = code.split("");
		ncode = "";
		code.forEach(function(v, i) {
			if (i % 2 == 0 && ncode) {
				ncode += "," + v;
			} else {
				ncode += v;
			}
		});
		ncode = ncode.split(",");
		weiShu.forEach(function(v, i) {
			ncode.splice(v, 0, '-');
		});
		return ncode;
	});
	return {
		actionData: codes.join('|'),
		actionNum: codes.length
	}
} /*时时彩录入式组选位数投注*/

function tzSscZuWeiInput() {
	var codeLen = parseInt(this.attr('length')),
		codes = [],
		weiShu = [],
		str = $('#textarea-code', this).val().replace(/[^\d]/g, '');
	if ($('#wei-shu :checked', this).length != codeLen) throw ('请选' + codeLen + '位数');
	$('#wei-shu :checkbox', this).each(function(i) {
		if (!this.checked) weiShu.push(i);
	});
	if (str.length && str.length % codeLen == 0) {
		if (/[^\d]/.test(str)) throw ('投注有错，不能有数字以外的字符。');
		codes = codes.concat(str.match(new RegExp('\\d{' + codeLen + '}', 'g')));
	} else {
		throw ('输入号码不正确');
	}
	codes.forEach(function(code) {
		if ((new RegExp("^(\\d)\\1{" + (codeLen - 1) + "}$")).test(code)) throw ('组选不能为豹子');
	});
	codes = codes.map(function(code) {
		code = code.split("");
		weiShu.forEach(function(v, i) {
			code.splice(v, 0, '-');
		});
		return code.join(',');
	});
	return {
		actionData: codes.join('|'),
		actionNum: codes.length
	};
} /*组合组选*/

function tzCombineSelect() {
	var codeLen = parseInt(this.attr('length')),
		codes = '',
		$select = $('.checked'),
		len;
	if ($select.length < codeLen) throw ('请选' + codeLen + '位数');
	$select.each(function() {
		codes += this.value;
	});
	len = combine(codes.split(""), codeLen).length;
	return {
		actionData: codes,
		actionNum: len
	};
} /*组合组选2*/

function tzCombineSelect2() {
	var codeLen = parseInt(this.attr('length')),
		codes = '',
		$select = $('.checked'),
		len, fangan = $('#positioninfo').html();
	if ($select.length < codeLen) throw ('请选' + codeLen + '位数');
	$select.each(function() {
		codes += this.value;
	});
	len = combine(codes.split(""), codeLen).length * fangan;
	return {
		actionData: codes,
		actionNum: len
	};
} /*排列组选*/

function tzPermutationSelect() {
	var codeLen = parseInt(this.attr('length')),
		codes = '',
		$select = $('.checked'),
		len;
	if ($select.length < codeLen) throw ('请选' + codeLen + '位数');
	$select.each(function() {
		codes += this.value;
	});
	len = permutation(codes.split(""), codeLen).length;
	return {
		actionData: codes,
		actionNum: len
	};
} /*混合组选录入式投注*/

function tzSscHhzxInput() {
	var codeList = $('#textarea-code').val(),
		played = this.attr('played'),
		z3 = [],
		z6 = [];
	var o = {
		"前": [16, 17],
		"后": [19, 20],
		"任选": [22, 23],
		"混": [59, 60]
	};
	if (played == '任选' && $('#wei-shu :checked', this).length != 3) throw ('请选3位数');
	codeList = codeList.replace(/[^\d]/gm, '');
	if (codeList.length == 0) throw ('请输入号码');
	if (codeList.length % 3) throw ('输入号码不正确');
	codeList.replace(/[^\d]/gm, '').match(/\d{3}/g).forEach(function(code) {
		var reg = /(\d)(.*)\1/;
		if (/(\d)\1{2}/.test(code)) {
			throw ('组选不能为豹子');
		} else if (reg.test(code)) {
			z3.push(code);
		} else {
			z6.push(code);
		}
	});
	if (z3.length && z6.length) {
		return [{
			playedId: o[played][0],
			playedName: played + '三组三',
			actionData: z3.join(','),
			actionNum: z3.length,
			isZ6: false
		}, {
			playedId: o[played][1],
			playedName: played + '三组六',
			actionData: z6.join(','),
			actionNum: z6.length,
			isZ6: true
		}];
	} else if (z3.length) {
		return {
			playedId: o[played][0],
			playedName: played + '三组三',
			actionData: z3.join(','),
			actionNum: z3.length,
			isZ6: false
		};
	} else if (z6.length) {
		return {
			playedId: o[played][1],
			playedName: played + '三组六',
			actionData: z6.join(','),
			actionNum: z6.length,
			isZ6: true
		};
	}
}
/*
* 六合彩玩法 ajax方法  DAVID UPDATE 2015
* 六合彩二中二
*/
function lhc_2z2(){
	var code=[], len=1,codeLen=parseInt(this.attr('length'));
	var $d=$(this).filter(':visible:first'),
		dLen=$('.code.checked', $d).length;
		if(dLen<2){
			throw('至少选2位数');
		}else{
			var dCode=[];
			$('.code.checked', $d).each(function(i,o){
				dCode[i]=o.value;
			});
			len=combine(dCode, codeLen).length;
			return {actionData:dCode.join(' '), actionNum:len};
		}
}

/*
* 六合彩三中三
*/
function lhc_3z3(){
	var code=[], len=1,codeLen=parseInt(this.attr('length'));
	var $d=$(this).filter(':visible:first'),
		dLen=$('.code.checked', $d).length;
		if(dLen<3){
			throw('至少选3位数');
		}else{
			var dCode=[];
			$('.code.checked', $d).each(function(i,o){
				dCode[i]=o.value;
			});
			len=combine(dCode, codeLen).length;
			return {actionData:dCode.join(' '), actionNum:len};
		}
}

/*
* 六合彩特码
*/
function lhctmdx(){
	var code=[],len=1,codeLen=parseInt(this.attr('length'));
	var $d=$(this).filter(':visible:first'),
		dLen=$('.code.checked', $d).length;
		if(dLen!=1){
			throw('请选择一种形态');
		}else{
			var dCode=[];
			$('.code.checked', $d).each(function(i,o){
				dCode[i]=o.value;
			});
			return {actionData:dCode.join(' '), actionNum:len};
		}
}

/*
* 六合五不中
*/
function lhc_5bz(){
	var code=[],len=1,codeLen=parseInt(this.attr('length'));
	var $d=$(this).filter(':visible:first'),
		dLen=$('.code.checked', $d).length;
		if(dLen!=5){
			throw('请选择5个号码');
		}else{
			var dCode=[];
			$('.code.checked', $d).each(function(i,o){
				dCode[i]=o.value;
			});
			return {actionData:dCode.join(' '), actionNum:len};
		}
}
/*
* 六合七不中
*/
function lhc_7bz(){
	var code=[],len=1,codeLen=parseInt(this.attr('length'));
	var $d=$(this).filter(':visible:first'),
		dLen=$('.code.checked', $d).length;
		if(dLen!=7){
			throw('请选择7个号码');
		}else{
			var dCode=[];
			$('.code.checked', $d).each(function(i,o){
				dCode[i]=o.value;
			});
			return {actionData:dCode.join(' '), actionNum:len};
		}
}
/* 六合彩 end*/
function zxhz3d(){
	var code=[], len=1,codeLen=parseInt(this.attr('length'));
	var sele_count= new Array('1','3','6','10','15','21','28','36','45','55','63','69','73','75','75','73','69','63','55','45','36','28','21','15','10','6','3','1');
	var endnum=0;var num;

	var $d=$(this).filter(':visible:first'),
		dLen=$('.code.checked', $d).length;
        
		if(dLen<1){
			throw('至少选择一位！');
		}else{
			var dCode=[];
			$('.code.checked', $d).each(function(i,o){
				dCode[i]=o.value;
			});
		    for (i=0;i<dCode.length;i++){num=dCode[i];endnum=endnum+parseInt(sele_count[num]);} 
			len=endnum;
			return {actionData:dCode.join(','), actionNum:len};
		}
}

/*十一选五任选玩法投注*/

function tz11x5Select() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length')),
		sType = !! $('.dantuo :radio:checked').val();
	if (sType) {
		var $d = $(this).filter(':visible:first'),
			$t = $d.next(),
			dLen = $('.code.checked', $d).length;
		if (dLen == 0) {
			throw ('至少选一位胆码');
		} else if (dLen >= codeLen) {
			throw ('最多只能选择' + (codeLen - 1) + '个胆码');
		} else {
			var dCode = [],
				tCode = [];
			$('.code.checked', $d).each(function(i, o) {
				dCode[i] = o.value;
			});
			$('.code.checked', $t).each(function(i, o) {
				tCode[i] = o.value;
			});
			len = combine(tCode, codeLen - dCode.length).length;
			return {
				actionData: '(' + dCode.join(' ') + ')' + tCode.join(' '),
				actionNum: len
			};
		}
	} else {
		$(':input:visible.code.checked').each(function(i, o) {
			code[i] = o.value;
		});
		if (code.length < codeLen) throw ('至少选择' + codeLen + '位数');
		return {
			actionData: code.join(' '),
			actionNum: combine(code, codeLen).length
		};
	}
}

function ssc_5z_120() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var $d = $(this).filter(':visible:first'),
		dLen = $('.code.checked', $d).length;
	if (dLen < 5) {
		throw ('至少选5位数');
	} else {
		var dCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});
		len = combine(dCode, codeLen).length;
		return {
			actionData: dCode.join(','),
			actionNum: len
		};
	}
}

function ssczx60() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var endnum = 0;
	var num = 0;
	var c;
	var anum = 0;
	var bnum = 0;
	var c;
	var d;
	var sele_count = new Array('0', '0', '0', '1', '4', '10', '20', '35', '56', '84');
	var $d = $(this).filter(':visible:first'),
		$t = $d.next(),
		dLen = $('.code.checked', $d).length;
	tLen = $('.code.checked', $t).length;
	if (dLen == 0) {
		throw ('至少选一位二重号');
	} else if (tLen < 3) {
		throw ('至少选三位单号');
	} else {
		var dCode = [],
			tCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});
		$('.code.checked', $t).each(function(i, o) {
			tCode[i] = o.value;
		});
		num = Sames(dCode, tCode);
		if (tLen - 1 >= 0) {
			c = tLen - 1
		} else {
			c = 0;
		};
		if (num - 1 >= 0) {
			if (dLen - num == 0) {
				anum = sele_count[c] * dLen;
			}
			if (dLen - num > 0) {
				anum = sele_count[tLen] * (dLen - num) + sele_count[c] * num;
			}
		} else {
			anum = sele_count[tLen] * dLen;
		}
		len = parseInt(anum);
		return {
			actionData: dCode.join('') + ',' + tCode.join(''),
			actionNum: len
		};
	}
}

function ssczx30() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var endnum = 0;
	var num = 0;
	var c;
	var anum = 0;
	var bnum = 0;
	var cnum = 0;
	var bnum = 0;
	var c;
	var d;
	var $d = $(this).filter(':visible:first'),
		$t = $d.next(),
		dLen = $('.code.checked', $d).length;
	tLen = $('.code.checked', $t).length;
	if (dLen < 2) {
		throw ('至少选两位二重号');
	} else if (tLen < 1) {
		throw ('至少选一位单号');
	} else {
		var dCode = [],
			tCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});

		$('.code.checked', $t).each(function(i, o) {
			tCode[i] = o.value;
		});
		for (i = 0; i < dLen - 1; i++) {
			d = i + 1;
			for (j = d; j < dLen; j++) {
				for (c = 0; c < tLen; c++) {
					if (dCode[i] - tCode[c] != 0 && dCode[j] - tCode[c] != 0) {
						bnum = bnum + 1;
					}
				}
			}
		}
		len = bnum;
		return {
			actionData: dCode.join('') + ',' + tCode.join(''),
			actionNum: len
		};
	}
}

function ssczx20() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var endnum = 0;
	var num = 0;
	var c;
	var anum = 0;
	var bnum = 0;
	var cnum = 0;
	var bnum = 0;
	var c;
	var d;
	var $d = $(this).filter(':visible:first'),
		$t = $d.next(),
		dLen = $('.code.checked', $d).length;
	tLen = $('.code.checked', $t).length;
	if (dLen < 1) {
		throw ('至少选一位三重号');
		//}else if(tLen<2){
		//throw('至少选两位单号');
	} else {
		var dCode = [],
			tCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});

		$('.code.checked', $t).each(function(i, o) {
			tCode[i] = o.value;
		});
		for (i = 0; i < tLen - 1; i++) {
			d = i + 1;
			for (j = d; j < tLen; j++) {
				for (c = 0; c < dLen; c++) {
					if (dCode[i] - tCode[c] != 0 && dCode[j] - tCode[c] != 0) {
						bnum = bnum + 1;
					}
				}
			}
		}
		len = bnum;
		return {
			actionData: dCode.join('') + ',' + tCode.join(''),
			actionNum: len
		};
	}
}

function ssczx10() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var endnum = 0;
	var num = 0;
	var c;
	var anum = 0;
	var bnum = 0;
	var cnum = 0;
	var bnum = 0;
	var c;
	var d;
	var $d = $(this).filter(':visible:first'),
		$t = $d.next(),
		dLen = $('.code.checked', $d).length;
	tLen = $('.code.checked', $t).length;
	if (dLen < 1) {
		throw ('至少选一位三重号');
	} else if (tLen < 1) {
		throw ('至少选一位二重号');
	} else {
		var dCode = [],
			tCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});
		$('.code.checked', $t).each(function(i, o) {
			tCode[i] = o.value;
		});
		for (i = 0; i < dLen; i++) {
			for (j = 0; j < tLen; j++) {
				if (dCode[i] - tCode[j] != 0) {
					bnum = bnum + 1;
				}
			}
		}
		len = bnum;
		return {
			actionData: dCode.join('') + ',' + tCode.join(''),
			actionNum: len
		};
	}
}

function ssczx5() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var endnum = 0;
	var num = 0;
	var c;
	var anum = 0;
	var bnum = 0;
	var cnum = 0;
	var bnum = 0;
	var c;
	var d;
	var $d = $(this).filter(':visible:first'),
		$t = $d.next(),
		dLen = $('.code.checked', $d).length;
	tLen = $('.code.checked', $t).length;
	if (dLen < 1) {
		throw ('至少选一位四重号');
	} else if (tLen < 1) {
		throw ('至少选一位单号');
	} else {
		var dCode = [],
			tCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});
		$('.code.checked', $t).each(function(i, o) {
			tCode[i] = o.value;
		});
		for (i = 0; i < dLen; i++) {
			for (j = 0; j < tLen; j++) {
				if (dCode[i] - tCode[j] != 0) {
					bnum = bnum + 1;
				}
			}
		}
		len = bnum;
		return {
			actionData: dCode.join('') + ',' + tCode.join(''),
			actionNum: len
		};
	}
}

function ssczx24() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var sele_count = new Array('0', '0', '0', '1', '5', '15', '35', '70', '126', '210');
	var $d = $(this).filter(':visible:first'),
		dLen = $('.code.checked', $d).length;
	if (dLen < 4) {
		throw ('至少选择四位！');
	} else {
		var dCode = [],
			tCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});
		var endnum = 0;
		var num = dCode.length - 1;
		endnum = parseInt(sele_count[num]);
		len = endnum;
		return {
			actionData: dCode.join(','),
			actionNum: len
		};
	}
}

function ssczx12() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var endnum = 0;
	var num = 0;
	var a;
	var b;
	var c;
	var anum = 0;
	var bnum = 0;
	var c;
	var d;
	var sele_count = new Array('0', '1', '3', '6', '10', '15', '21', '28', '36');
	var $d = $(this).filter(':visible:first'),
		$t = $d.next(),
		dLen = $('.code.checked', $d).length;
	tLen = $('.code.checked', $t).length;
	if (dLen < 1) {
		throw ('至少选一位二重号');
	} else if (tLen < 2) {
		throw ('至少选两位单号');
	} else {
		var dCode = [],
			tCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});
		$('.code.checked', $t).each(function(i, o) {
			tCode[i] = o.value;
		});
		num = Sames(dCode, tCode);
		if (tLen - 1 >= 0) {
			c = tLen - 1
		} else {
			c = 0;
		};
		if (tLen - 2 >= 0) {
			d = tLen - 2
		} else {
			d = 0;
		};
		if (num - 1 >= 0) {
			if (dCode.length - num == 0) {
				c = tLen - 2;
				anum = sele_count[c] * dCode.length;
			}
			if (dCode.length - num > 0) {
				c = tLen - 2;
				anum = sele_count[c] * num;
				anum = anum + sele_count[tLen - 1] * (dCode.length - num);
			}
		} else {
			if (tLen - 1 >= 0) {
				c = tLen - 1
			} else {
				c = 0;
			};
			anum = sele_count[c] * dCode.length;
		}
		endnum = parseInt(anum);
		len = endnum;
		return {
			actionData: dCode.join('') + ',' + tCode.join(''),
			actionNum: len
		};
	}
}


function ssczx6() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var sele_count = new Array('0', '0', '1', '3', '6', '10', '15', '21', '28', '36', '45');
	var $d = $(this).filter(':visible:first'),
		dLen = $('.code.checked', $d).length;
	if (dLen < 2) {
		throw ('至少选择两位！');
	} else {
		var dCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});
		var endnum = sele_count[dLen];
		len = endnum;
		return {
			actionData: dCode.join(','),
			actionNum: len
		};
	}
}

function ssczx4() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var endnum = 0;
	var num = 0;
	var a;
	var b;
	var c;
	var d_arr = new Array();
	var anum = 0;
	var bnum = 0;
	var c;
	var d;
	var sele_count = new Array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
	var $d = $(this).filter(':visible:first'),
		$t = $d.next(),
		dLen = $('.code.checked', $d).length;
	tLen = $('.code.checked', $t).length;
	if (dLen < 1) {
		throw ('至少选一位三重号');
	} else if (tLen < 1) {
		throw ('至少选一位单号');
	} else {
		var dCode = [],
			tCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});

		$('.code.checked', $t).each(function(i, o) {
			tCode[i] = o.value;
		});
		for (var e = 0; e < dCode.length; e++) {
			var this_num = dCode[e];
			d_arr = drop_array_lines(tCode, this_num);
			endnum += d_arr.length;
		}
		len = endnum;
		return {
			actionData: dCode.join('') + ',' + tCode.join(''),
			actionNum: len
		};
	}
}

function ssch3zxhz() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var sele_count = new Array('1', '2', '2', '4', '5', '6', '8', '10', '11', '13', '14', '14', '15', '15', '14', '14', '13', '11', '10', '8', '6', '5', '4', '2', '2', '1');
	var endnum = 0;
	var num;

	var $d = $(this).filter(':visible:first'),
		dLen = $('.code.checked', $d).length;

	if (dLen < 1) {
		throw ('至少选择一位！');
	} else {
		var dCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});
		for (i = 0; i < dCode.length; i++) {
			num = dCode[i] - 1;
			endnum = endnum + parseInt(sele_count[num]);
		}
		len = endnum;
		return {
			actionData: dCode.join(','),
			actionNum: len
		};
	}
}

function ssch3ts() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));

	var $d = $(this).filter(':visible:first'),
		dLen = $('.code.checked', $d).length;

	if (dLen < 1) {
		throw ('至少选择一位！');
	} else {
		var dCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});
		len = dLen;
		return {
			actionData: dCode.join(','),
			actionNum: len
		};
	}
}

function ssch3kd() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var sele_count = new Array('10', '54', '96', '126', '144', '150', '144', '126', '96', '54');
	var endnum = 0;
	var num;
	var $d = $(this).filter(':visible:first'),
		dLen = $('.code.checked', $d).length;

	if (dLen < 1) {
		throw ('至少选择一位！');
	} else {
		var dCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});
		for (i = 0; i < dCode.length; i++) {
			num = dCode[i];
			if (num - 1 >= -1) {
				endnum = endnum + parseInt(sele_count[num]);
			}
		}
		len = endnum;
		return {
			actionData: dCode.join(','),
			actionNum: len
		};
	}
}

function sscq3qw2x() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var endnum = 0;
	var num = 0;
	var a;
	var b;
	var c;
	var d_arr = new Array();
	var anum = 0;
	var bnum = 0;
	var c;
	var d;
	var sele_count = new Array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
	var $d = $(this).filter(':visible:first'),
		$t = $d.next(),
		dLen = $('.code.checked', $d).length;
	tLen = $('.code.checked', $t).length;
	if (dLen < 1) {
		throw ('至少选一位三重号');
	} else if (tLen < 1) {
		throw ('至少选一位单号');
	} else {
		var dCode = [],
			tCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});

		$('.code.checked', $t).each(function(i, o) {
			tCode[i] = o.value;
		});
		for (var e = 0; e < dCode.length; e++) {
			var this_num = dCode[e];
			d_arr = drop_array_lines(tCode, this_num);
			endnum += d_arr.length;
		}
		return {
			actionData: dCode.join('') + ',' + tCode.join(''),
			actionNum: endnum
		};
	}
}

function ssc2xh2zxbd() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var endnum = 0;
	var num = 0;
	var a;
	var b;
	var c;
	var anum = 0;
	var bnum = 0;
	var cnum = 0;
	var bnum = 0;
	var c;
	var d;
	var alist = new Array;
	var blist = new Array
	var $d = $(this).filter(':visible:first'),
		dLen = $('.code.checked', $d).length;
	if (dLen < 1) {
		throw ('至少选择一位！');
	} else {
		var dCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});
		var endnum = 0;
		var num = 0;
		var a;
		var b;
		var c;
		var anum = 0;
		var bnum = 0;
		var cnum = 0;
		var bnum = 0;
		var c;
		var d;
		var alist = new Array;
		var blist = new Array
		for (j = 0; j < 10; j++) {
			for (c = j; c < 10; c++) {
				if (j - c != 0) {
					if (dCode - c == 0 || dCode - j == 0) {
						bnum = bnum + 1;
					}
				}
			}
		}
		return {
			actionData: dCode.join(','),
			actionNum: bnum
		};
	}
}

function zxhz3d() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var sele_count = new Array('1', '3', '6', '10', '15', '21', '28', '36', '45', '55', '63', '69', '73', '75', '75', '73', '69', '63', '55', '45', '36', '28', '21', '15', '10', '6', '3', '1');
	var endnum = 0;
	var num;

	var $d = $(this).filter(':visible:first'),
		dLen = $('.code.checked', $d).length;

	if (dLen < 1) {
		throw ('至少选择一位！');
	} else {
		var dCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});
		for (i = 0; i < dCode.length; i++) {
			num = dCode[i];
			endnum = endnum + parseInt(sele_count[num]);
		}
		len = endnum;
		return {
			actionData: dCode.join(','),
			actionNum: len
		};
	}
}

function zuxhz3d() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length'));
	var sele_count = new Array('1', '2', '2', '4', '5', '6', '8', '10', '11', '13', '14', '14', '15', '15', '14', '14', '13', '11', '10', '8', '6', '5', '4', '2', '2', '1');
	var endnum = 0;
	var num;

	var $d = $(this).filter(':visible:first'),
		dLen = $('.code.checked', $d).length;

	if (dLen < 1) {
		throw ('至少选择一位！');
	} else {
		var dCode = [];
		$('.code.checked', $d).each(function(i, o) {
			dCode[i] = o.value;
		});
		for (i = 0; i < dCode.length; i++) {
			num = dCode[i] - 1;
			endnum = endnum + parseInt(sele_count[num]);
		}
		len = endnum;
		return {
			actionData: dCode.join(','),
			actionNum: len
		};
	}
}

/*快乐十分任选玩法投注*/

function tzKLSFSelect() {
	var code = [],
		len = 1,
		codeLen = parseInt(this.attr('length')),
		sType = !! $('.dantuo :radio:checked').val();
	if (sType) {
		var $d = $(this).filter(':visible:first'),
			$t = $d.next(),
			dLen = $('.code.checked', $d).length;

		if (dLen == 0) {
			throw ('至少选一位胆码');
		} else if (dLen >= codeLen) {
			throw ('最多只能选择' + (codeLen - 1) + '个胆码');
		} else {
			var dCode = [],
				tCode = [];
			$('.code.checked', $d).each(function(i, o) {
				dCode[i] = o.value;
			});
			$('.code.checked', $t).each(function(i, o) {
				tCode[i] = o.value;
			});
			len = combine(tCode, codeLen - dCode.length).length;
			return {
				actionData: '(' + dCode.join(' ') + ')' + tCode.join(' '),
				actionNum: len
			};
		}
	} else {
		$(':input:visible.code.checked').each(function(i, o) {
			code[i] = o.value;
		});
		if (code.length < codeLen) throw ('至少选择' + codeLen + '位数');
		return {
			actionData: code.join(' '),
			actionNum: combine(code, codeLen).length
		};
	}
}

function Sames(a, b) {
	var num = 0;
	for (i = 0; i < a.length; i++) {
		var zt = 0;
		for (j = 0; j < b.length; j++) {
			if (a[i] - b[j] == 0) {
				zt = 1;
			}
		}
		if (zt == 1) {
			num += 1;
		}
	}
	return num;
}

function drop_array_lines(arr, num) {
	var drop_arr = new Array();
	for (o = 0; o < arr.length; o++) {
		if (parseInt(arr[o], 10) - parseInt(num, 10) == 0) {

		} else {
			drop_arr.push(arr[o]);
		}
	}
	return drop_arr;
}

/**
 * 时时彩随机投注
 *
 * @params int number		随机投几注，默认为1
 */

function gameActionRandom(number) {
	var $game = $('#num-select .pp');
	if ($game.length <= 1 || $game.attr('action') == 'tz5xDwei') {
		davidInfo('该玩法暂不支持机选，请手动选择号码！');
		return;
	}
	fun = $game.attr('random');
	//len=$game.attr('length');		
	try {
		fun = window[fun];
		if (typeof fun == 'function') {
			gameAddCode(fun.call($game, number));
		}
	} catch (err) {
		alert(err);
	}
}

//机选多注

function genMultiRandom(bet) {
	var $game = $('#num-select .pp');
	if ($game.length <= 1) {
		davidInfo('该玩法暂不支持机选，请手动选择号码！');
		return;
	} else {
		for (var i = 0; i < bet; i++) {
			gameActionRandom(1);
		}
	}
}

function gameActionRemoveCode(isSelected) {
	$('.touzhu-cont tr').remove();
	$('.touzhu-bottom :checkbox[name=zhuiHao]').removeData()[0].checked = false;
	gameCalcAmount();
}

//{{{随机投注函数集

/**
 * 时时彩随机投注函数
 *
 * @params num		投机投几注，默认为1，可以设置为5，选几位数由HTML属性length得
 * @return			要求返回一个对象{actionData:"1,23,4,5,6",actionNum:2}
 *
 */

function sscRandom(num) {
	var i, j, code, codes = [],
		codeLen = parseInt(this.attr('length'));
	if (codeLen == 'undefined' || null == codeLen) return;
	for (i = 0; i < num; i++) {

		code = [];
		for (j = 0; j < codeLen; j++) {
			code.push(Math.floor(Math.random() * 10));
		}

		codes[i] = code;
	}
	return {
		actionData: codes.join('|'),
		actionNum: codes.length
	};
}

//}}}

//随机数 GetRandomNum(1,6)

function GetRandomNum(Min, Max) {
	var Range = Max - Min;
	var Rand = Math.random();
	return (Min + Math.round(Rand * Range));
}

//彩种玩法、算法 DAVID 
//end***************************************************************************************************************************

//提示
function Combination(c, b) {
	b = parseInt(b);
	c = parseInt(c);
	if (b < 0 || c < 0) {
		return false
	}
	if (b == 0 || c == 0) {
		return 1
	}
	if (b > c) {
		return 0
	}
	if (b > c / 2) {
		b = c - b
	}
	var a = 0;
	for (i = c; i >= (c - b + 1); i--) {
		a += Math.log(i)
	}
	for (i = b; i >= 1; i--) {
		a -= Math.log(i)
	}
	a = Math.exp(a);
	return Math.round(a)
}

function strCut(str, len) {
	var strlen = str.length;
	if (strlen == 0) return false;
	var j = Math.ceil(strlen / len);
	var arr = Array();
	for (var i = 0; i < j; i++)
	arr[i] = str.substr(i * len, len)
	return arr;
}

function filterArray(arrs) {
	var k = 0,
		n = arrs.length;
	var arr = new Array();
	for (var i = 0; i < n; i++) {
		for (var j = i + 1; j < n; j++) {
			if (arrs[i] == arrs[j]) {
				arrs[i] = null;
				break;
			}
		}
	}
	for (var i = 0; i < n; i++) {
		if (arrs[i]) {
			arr[k++] = arrs[i]; // arr.push(this[i]);
		}
	}
	return arr;
}