'use strict';
var webapp = (function(){
	var config = ({
		cache : false,
		templates_dir : 'templates/',
		component_dir : 'component/',
		loadTimeout : 200,
	}) , $el , component = new Array() , webappData = '';

	var componentCount = 0;
	var first = true;




	/**
	 * 核心程序
	 * @param  {[type]} pageData [description]
	 * @return {[type]}          [description]
	 */
	var webapp = function(webappData){
		
		this.webappData = webappData;

		_load(webappData , window.location.hash.replace('#' , ''));

		window.addEventListener('hashchange', function(e) {
			_load(webappData , window.location.hash.replace('#' , ''));
		}, false);
	};





	function isset(context){
		return typeof context !== 'undefined';
	}




	/**
	 * 解析
	 * @param  {[type]} html       [description]
	 * @param  {[type]} $el        [description]
	 * @param  {[type]} controller [description]
	 * @param  {[type]} type 	   [description]
	 * @param  {[type]} target 	   [是否在新页面打开]
	 * @return {[type]}            [description]
	 */
	function parse(html , $el , controller , type){
		var data = $.extend({title : controller.title , template : controller.template} , (
			type == 'page' ? controller.render() : ''
		));
		$.each(data , function(key , value){
			html = replaceAll(html , "{" + key + "}" , value);
		});

		if(window.location.hash.replace('#' , '').indexOf('target=_blank') > 0 && first == false){
			$("#webapp-float-content").html(html).css({
				left : 0
			});
			$el.hide();
			return true;
		}


		$el.html(html)

	}


	/**
	 * 用于加载新的页面
	 * @param  {[type]} webappData [description]
	 * @param  {[type]} url        [description]
	 * @return {[type]}            [description]
	 */
	var _load = function(webappData , url){
		var $el = $(webappData.el);
		$(el).show();

		url = url.indexOf('?') != -1 ? url.substring(0 , url.indexOf('?')) : url;


		$("#webapp-float-content").html('').css({
			left : '100%'
		});

		var showLoader = setInterval(function(){
			$(".loader").show();
		} , config.loadTimeout)
		var componentCount = 0;
		var timeout = 0;
		var rand = Math.random();



		var controller = webappData.controller[url];

		if( ! isset(webappData.controller[url])){
			webappData.error();
			return false;
		}
		var name = 'controller_' + controller.template;
		url = url == '' ? '/' : url;


		// 组件加载过程
		var $target = $(webappData.component.join(','));
		$target.each(function(key , value) {
			var nameItem = $(value)[0].tagName.toLowerCase();
			var componentName = "component_" + $(value)[0].tagName.toLowerCase();

			if( ! isset(localStorage[componentName]) || config.cache == false){
				$.ajax({
					url : config.component_dir + nameItem + '.component?rand=' + rand,
					success : function(data){
						componentCount ++;
						component[value] = data;
						localStorage[componentName] = data;
						parse(data , $(value) , controller , 'component');
						$(value).html(data);
					} ,
				});
			}else{
				componentCount ++;
				parse(localStorage[componentName] , $(value) , controller , 'component');
			}
		});


		var loadInterval = setInterval(function(){
			if($target.length == componentCount){

				if(config.cache == true){
					if(isset(localStorage[name])){
						parse(localStorage[name] , $el , controller , 'page' , target);
						$(".loader").hide();
						webappData.complete();
						clearInterval(showLoader);
						clearInterval(loadInterval);
						return true;
					}
				}
				$.ajax({
					url : config.templates_dir + controller.template + '.html?rand=' + rand,
					success : function(data){
						localStorage[name] = data;
						parse(data , $el , controller , 'page');

						clearInterval(showLoader);
						clearInterval(loadInterval);
						first = false;
						$(".loader").hide();
						webappData.complete();
					},
					error : function(){
						clearInterval(loadInterval);
					}
				})
				clearInterval(loadInterval);
			}else{
				timeout ++;
				if(timeout > 60){
					clearInterval(loadInterval);
					timeout = 0;
					webappData.timeout();
				}
			}
		} , 60)
			

	}



	function replaceAll(data , s1,s2){   
		return data.replace(new RegExp(s1,"gm"),s2);   
	}
	function unset(data , keys) {
		for(var i=0; i<data.length; i++) {
			if(data[i] == keys) {
				data.splice(i, 1);
				break;
			}
		}
		return data;
	}
	return webapp;
})(Zepto); 
