var loaderTime;
new webapp({
	el : "#webapp-main",
	warpper : "#webapp-content",


	component : ['app-header' , 'app-footer' , 'app-test' , 'banner'] ,

	controller : {


		home : {
			template : 'home' ,
			render : function(data){
				console.log(data)
				return {title : '首页'}
			}
		} ,

		shop : {
			template : 'shop' ,
			render : function(){
				return {title : '购彩'}
			}
		} ,

		
		me : {
			template : 'me' ,
			render : function(data){
				console.log(data)
				return {title : '我的'}
			}
		},


		
		find : {
			template : 'find' ,
			render : function(){
				return {
					title : '发现'
				}
			} , 
			success : function(){
				console.log($(".images"))
			}
		} ,


		'lottery_item' : {
			template : 'lottery_item_shop' ,
			render : function(){
				return {
					title : '发现'
				}
			} , 
			success : function(){
				
			}
		} ,


	} ,
	start : function(){
		loaderTime = setTimeout(function(){
			$(".loader").show()
		} , 200)
	} ,
	complete : function(){
		clearTimeout(loaderTime);
		$(".loader").hide()
	} ,

	error : function(data){
		console.log(data)
	} ,

	timeout : function(){

	}
});

// window.history.pushState({},0,'http://'+window.location.host+'/lottery/#/home');   
// window.onpopstate=function()
// {
// // 获得存储在该历史记录点的json对象
// var json=window.history;
// console.log(json)
// // 点击一次回退到：http://www.qingdou.me/index.html
// // 获得的json为null
// // 再点击一次前进到：http://www.qingdou.me/post-1.html
// // 获得json为{time:1369647895656}
// }