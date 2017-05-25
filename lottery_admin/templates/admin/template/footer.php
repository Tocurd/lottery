<script type="text/dom">
	var popup_toast = <div class="toast" class="toast" id="js-toast">
		<p></p>
	</div>
	var popup_input_toast = <div class="input-toast" id="js-input-toast">
		<div class="input-toast-up">
			<i id="js-i" class="fa fa-sort-asc"></i>
		</div>
		<p></p>
	</div>
	var popup_input_toast_success = <div class="input-toast success" id="js-input-toast">
		<div class="input-toast-up">
			<i id="js-i" class="fa fa-sort-asc"></i>
		</div>
		<p></p>
	</div>

	var popup_sure = <div class="popup-opacity" id="js-popup-sure">
		<div class="popup-sure">
			<div class="popup-sure-header">
				<h1></h1>
				<div class="close" id="js-close"><i class="fa fa-power-off"></i></div>
			</div>
			<div class="popup-sure-content">
			</div>
			<div class="popup-sure-bottom">
				<button class="btn fezocms">确认</button>
				<button class="btn" id="js-close">取消</button>
			</div>
		</div>
	</div>
</script>
<script type="text/javascript">
	var base_url = '{base_url}';
	var admin_dir = '{admin_view}';
</script>
<script type="text/javascript" src="./assets/bin/jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="./assets/bin/rule/rule.js"></script>
<script type="text/javascript" src="./assets/admin/js/api.js"></script>
<script type="text/javascript" src="./assets/js/app.js"></script>
<script type="text/javascript" src="./assets/bin/dom/dom.js"></script>
<script type="text/javascript" src="./assets/bin/popup/popup.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/Chart.js/2.5.0/Chart.bundle.min.js"></script>
<script type="text/javascript">
	var popup = new popupWidget();
	var dom = new Dom();
	var rule = new ruleWidget();
	$('select').each(function(key , value){
		var selectValue = $(value).attr('value');
		$(value).find('option[value="' + selectValue + '"]').attr('selected' , true)
	});
</script>