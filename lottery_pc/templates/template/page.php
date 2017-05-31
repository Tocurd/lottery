<?php
	$page = isset($_GET['page']) ? $_GET["page"] : 1;
	$count = ceil(@$list_count / (isset($count) ? $count : 10));

	unset($_GET['page']);
	$http_build_query = http_build_query($_GET);
	$hot_data = isset($hot_data) ? $hot_data : $http_build_query == '' ? '' : '&' . $http_build_query;



	$active = "class='active'";
	$path = "." . $_SERVER['PATH_INFO'];
	if($count > 1){
?>


<div class="page">
	<div class='fr' style='float:right;margin-top: 28px;margin-right: 10px;font-size: 12px;'>
		总计 <?=$list_count?> 条数据,  共 <?=$count?> 页 , 当前第 <?=$page?> 页   转至
		<input type="text" style="padding: 3px 10px;outline:none;width: 40px;text-align:center;">
		<button style="background: #11B35E;color: #ffffff;border: none;padding: 5px 10px;cursor: pointer;">跳转</button>
	</div>
	<ul class='pagination fl'>
		<?php
			if($page > 1){
		?>
		<li><a href='<?=$path . "?page=1" . $hot_data?>'><</a></li>
		<li><a href='<?=$path . "?page=" . ($page-1) . $hot_data?>'>上一页</a></li>
		<?php
			}
		?>
		<?php
			for ($index = $page - 3 <= 0 ? 1 : $page - 3; $index < $page + 3; $index ++) {
				if($index <= $count){
					$isLost = $index == $count;
					echo "<li ".($index == $page ? $active : "")."><a href='{$path}?page={$index}{$hot_data}'>{$index}</a></li>";
				}else{
					break;
				}
			}
			if(!$isLost){
				echo "<li><a href='javascript:;'>······</a></li>";
				echo "<li><a href='{$path}?page={$count}{$hot_data}'>{$count}</a></li>";
			}
		?>
		<?php
			if($page < $count){
		?>
		<li><a href='<?=$path . "?page=" . ($page + 1) . $hot_data?>'>下一页</a></li>
		<li><a href='<?=$path . "?page={$count}" . $hot_data?>'>></a></li>
		<?php
			}
		?>	
	</ul>
</div>
<?php }?>