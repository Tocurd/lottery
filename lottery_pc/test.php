<?php

// 组三玩法算法
function arrange($arr){
	$new_arr = array();
	$c = count($arr);
	foreach($arr as $key => $vo){
		$lin = $arr;
		array_splice($lin , $key , 1);
		for($l = 0;$l < $c - 1;$l ++){
			$larr = array();
			$larr[] = $lin[$l];
			$larr[] = $vo;
			$larr[] = $vo;
			$new_arr[] = $larr;
		}
	}
	return $new_arr;
}


	// 组六
	function z6($bet){
		if(strpos($bet, ',')===false && !preg_match('/(\d).*\1/', $bet)){
			return C(count(str_split($bet)), 3);
		}else{
			return count(explode(',', $bet));
		}
	}
	function C($n, $m){
		if($n<$m) return false;
		return A($n, $m)/A($m, $m);
	}

function A($n, $m){
		if($n<$m) return false;
		$num=1;
		for($i=0; $i<$m; $i++) $num*=$n-$i;
		return $num;
	}
print_r(z6('012345678'));