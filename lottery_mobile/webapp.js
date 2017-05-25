'use strict';
var webapp = (function(data){
	var config = ({
		cache : false,
		templates_dir : 'templates/',
		component_dir : 'component/',
		loadAnimationTimeout : 200,
	}) , webapp = {};


	var modules = function(webappData){
		webapp.webappData = webappData;
		webapp.url = window.location.hash.replace('#' , '');
		webapp.rand = Math.random();
		webapp.$el = $(webappData.el);
		webapp.$warpper = $(webappData.warpper);
		webapp.componented = 0;
		webapp.componentLength = 0;
		webapp.isFister = true;
		webapp.float = {};
		webapp.floatId = 0;

		webapp.loader(webapp.url);
		window.addEventListener('hashchange', function(e){
			webapp.url = window.location.hash.replace('#' , '');
			webapp.loader(webapp.url);
		}, false);
	};


	




	/**
	 * 加载器
	 * @param  {[type]} url [description]
	 * @return {[type]}     [description]
	 */
	webapp.loader = function(url){
		var urlData = webapp._urlParser(url);
		webapp.controller = webapp.webappData.controller[urlData.name];
		webapp.controller.get = urlData.params;
		webapp.webappData.start();

		if( ! isset(webapp.controller)){
			urlData.error = 'controller not exist';
			webapp.webappData.error(urlData);
			return false;
		}
		webapp.controller.params = webapp.controller.render(urlData.params);


		// 加载首页中注册的组件
		var $component = webapp.$el.find(webapp.webappData.component.join(','));


		webapp._loadComponent($component , function(html , target){
			$(target).html(webapp._parse(html , webapp.controller.params));
			webapp._loadPage();
			return false;
		} , function(componentName){
			webapp._loadPage();
			webapp.webappData.error({error : 'component error' , name : componentName});
		})

		return;
	}


	/**
	 * 注册组件
	 * @param  {[type]} $component [description]
	 * @param  {[type]} success    [description]
	 * @param  {[type]} error      [description]
	 * @return {[type]}            [description]
	 */
	webapp._loadComponent = function($component , success , error){
		webapp.componented = 0;
		webapp.componentLength = $component.length;


		$component.each(function(key , value){
			var componentName = $(value)[0].tagName;
			var localName = componentName + '.component';


			// 是否存在本地缓存
			if(isset(localStorage[localName]) && localStorage[localName] != '' && config.cache == true){
				webapp.componented ++;
				return success(localStorage[localName] , $(value))
			}
			
			// 如果不存在就去获取并缓存到本地
			webapp._loadComponentAjax(componentName , function(html){
				webapp.componented ++;
				if(config.cache == true) localStorage[localName] = html;
				success(html , $(value))
			} , function(){
				webapp.componented ++;
				error(componentName)
			});
		});
	}



	/**
	 * 加载页面
	 * @param  {[type]} controller [description]
	 * @return {[type]}            [description]
	 */
	webapp._loadPage = function(){
		if(webapp.componentLength != webapp.componented) return;
		var localName = webapp.controller.template + '.html';

		// 是否存在本地缓存
		if(isset(localStorage[localName]) && localStorage[localName] != '' && config.cache == true){
			webapp.pageParse(localStorage[localName] , localName);
			return true;
		}

		webapp._loadPageAjax(webapp.controller.template , function(html){
			webapp.pageParse(html , localName);
		} , function(){
			webapp.controller.error = 'page ajax error';
			webapp.webappData.error(webapp.controller)
		})
	}



	/**
	 * 解析页面中的小组件
	 * @param  {[type]} html      [description]
	 * @param  {[type]} localName [description]
	 * @return {[type]}           [description]
	 */
	webapp.pageParse = function(html , localName){
		var $html = $('<div id="webapp-temp">' + webapp._parse(html , webapp.controller.params) + '</div>');

		var $component = $html.find(webapp.webappData.component.join(','));

		if($component.length <= 0){
			if(config.cache == true) localStorage[localName] = $html.html();
			webapp.success($html.html());
			return true;
		}

		webapp._loadComponent($component , function(html , target){
			$html.find(target).html(webapp._parse(html , webapp.controller.params));
			webapp.success($html.html());
			if(config.cache == true) localStorage[localName] = $html.html();
			return false;
		} , function(componentName){
			webappData.error({error : 'component error' , name : componentName});
		});
	}


	/**
	 * 完毕
	 * @param  {[type]} html [description]
	 * @return {[type]}      [description]
	 */
	webapp.success = function(html){
		if(webapp.componentLength == webapp.componented){
			webapp.isFister = false;
			document.documentElement.scrollTop = document.body.scrollTop = 0;
			document.title = webapp.controller.params.title;


			// // 在这里做一些页面的动效
			// if(webapp.controller.get.target == '_blank' && webapp.isFister == false){ // 
				
			// 	webapp.floatId ++;
			// 	webapp.$el.append('<div class="webapp-float-content webapp-float-' + webapp.floatId + '"></div>');
			// 	var $floatWindow = $(".webapp-float-content.webapp-float-" + webapp.floatId);
			// 	$floatWindow.html(html).css({
			// 		left : 0
			// 	});

			// 	webapp.webappData.complete();
			// 	return;
			// }
			$(document).unbind()
			webapp.$warpper.html(html);
			isset(webapp.controller.success) ? webapp.controller.success() : '';
			webapp.webappData.complete();
		}
	}





	/**
	 * 解析数据
	 * @param  {[type]} html [description]
	 * @param  {[type]} data [description]
	 * @return {[type]}      [description]
	 */
	webapp._parse = function(html , data){
		$.each(data , function(key , value){
			html = replaceAll(html , "{" + key + "}" , value);
		});


		
		return html;
	}




	/**
	 * ajax加载组件
	 * @param  {[type]} url     [description]
	 * @param  {[type]} success [description]
	 * @param  {[type]} error   [description]
	 * @return {[type]}         [description]
	 */
	webapp._loadPageAjax = function(url , success , error){
		$.ajax({
			url : config.templates_dir + url.toLowerCase() + '.html?rand=' + webapp.rand,
			success : success,
			error : error
		})
	}


	/**
	 * ajax加载组件
	 * @param  {[type]} url     [description]
	 * @param  {[type]} success [description]
	 * @param  {[type]} error   [description]
	 * @return {[type]}         [description]
	 */
	webapp._loadComponentAjax = function(url , success , error){
		$.ajax({
			url : config.component_dir + url.toLowerCase() + '.component?rand=' + this.rand,
			success : success,
			error : error
		})
	}


	/**
	 * 用于解析url
	 * @param  {[type]} url [description]
	 * @return {[type]}     [description]
	 */
	webapp._urlParser = function(url){
		var temp = {};
		var url = url.substring(0 , 1) === '/' ? url.substring(1 , url.length) : url;
		if(url == '') url = 'home'
		var params = url.substring(url.indexOf('?') + 1, url.length).split('&');
		$.each(params , function(key , value){
			var param = value.split('=');
			temp[param[0]] = param[1];
		});
		return {
			name : url.indexOf('?') != -1 ? url.substring(0 , url.indexOf('?')) : url,
			params : temp
		}
	}



	function isset(context){
		return typeof context != 'undefined';
	}
	function replaceAll(data , s1,s2){   
		return data.replace(new RegExp(s1,"gm"),s2);   
	}

	return modules;
})(Zepto); 