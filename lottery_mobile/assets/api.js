
/**
 * 通用API请求接口
 * @param  {Object}
 * @param  {Object} ApiRequestList [description]
 * @return {[type]}                [description]
 */
var ApiRequest = (function(){
	var modules = function(){} , 
		ApiRequestList = {} ,
		apiParams = {} ,
		selectApi = {} , 
		self = this;
	modules.prototype.create = function(ApiRequestList){
		this.ApiRequestList = ApiRequestList;
	}




	/**
	 * 在此进行请求预准备
	 * @param  {[type]} api    [API名称]
	 * @param  {[type]} commit [是否自动提交]
	 * @param  {[type]} target [自定义API的名称]
	 * @return {[type]}        [description]
	 */
	modules.prototype.push = function(api , commit , target){
		var apiSplit = api.split('/'); 
		this.selectApi = this.ApiRequestList;

		for(var index = 0;index < apiSplit.length;index ++){
			this.selectApi = this.selectApi[apiSplit[index]];
		}
		if(typeof this.selectApi == 'undefined') return reslut(false , '0001' , '未能找到定义好的API');


		this.apiParams = getFrom(target != '' ? api : target , this.selectApi);
		if(typeof this.apiParams['code'] != 'undefined' && this.apiParams['code'] == false){
			return reslut(false , '0002' , this.apiParams['error']);
		}




		// 如果不自动提交则反馈回去相关数据
		if(commit === false) return reslut(true , 'ready' , {
			apiName : api,
			apiParams : this.apiParams ,
			selectApi : this.selectApi,
		});

		return modules.prototype.commit(this.selectApi , this.apiParams);
	}



	/**
	 * 提交处理好的请求
	 * @param  {[type]} api    [description]
	 * @param  {[type]} target [description]
	 */
	modules.prototype.commit = function(selectApi , params){
		var promise = $.Deferred();
		doAjax({
			url : selectApi.url,
			data : params , 
			promise: promise,
		});
		return promise;
	}





	/**
	 * 获取页面中的api参数内容
	 * @param  {[type]} aWpiName [description]
	 * @return {[type]}          [description]
	 */
	var getFrom = function(apiName , selectApi){
		var apiParamsTemp = {};
		$("[api-name='" + apiName + "']").each(function(key , value){
			apiParamsTemp[$(value).attr('api-params-name')] = $(value).val()
		});
		var paramsRule = new ruleWidget();

		//开始检测用户输入的参数


		var reslut = paramsRule.check(apiParamsTemp , selectApi.params);
		if(reslut == false){
			return {
				code : false , 
				error : paramsRule.reslut()
			};
		}

		return apiParamsTemp;
	}




	/**
	 * 向后端发送处理请求
	 * @param  {[type]} options [description]
	 * @param  {[type]} isfile  [description]
	 * @return {[type]}         [description]
	 */
	var doAjax = function(options){
		$.ajax({
			url : options.url , 
			data : options.data , 
			cache: false,
			type: "POST",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType: "JSON",
			timeOut : 5000 , 
			content : window,
			success : function(data){
				if(data.state){
					options.promise.resolve(data);
				}else{
					options.promise.reject(data.message);
				}
			},
			error : function(data){
				try{
					var error = JSON.parse(data.responseText);
					options.promise.reject(error.message);
				}catch (e){
					options.promise.reject("请求出现异常，服务器繁忙或出现问题无法处理您的请求，请稍候再试！");
				}
			},
			complete : function(){
				isRequest = true;
			}
		});
	}


	/**
	 * 用于反馈给用户的一个结果
	 * @param  {[type]} static  [description]
	 * @param  {[type]} code    [description]
	 * @param  {[type]} message [description]
	 * @return {[type]}         [description]
	 */
	var reslut = function(static , code , message){
		then = function(success , error){
			if(static){
				if(typeof success == 'function'){
					var returnStatic = success({
						code : code ,
						message : message ,
					});

					// 用户手动提交反馈结果
					if(code == 'ready' && returnStatic == true){
						success({
							code : 'commit' ,
							message : modules.prototype.commit() ,
						})
					}


				}
			}else{
				if(typeof error == 'function') error({
					code : code ,
					message : message ,
				})
			}
		}
		return this;
	}
	return modules;
})();