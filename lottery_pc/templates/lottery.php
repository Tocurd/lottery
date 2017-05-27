	<link href="./assets/css/page/play.css" rel="stylesheet" type="text/css">
	<style type="text/css">body{font-size:12px}</style>
</head>

<body>

	<?php $this->load->view('\template\top-header.php')?>


<div id="rightcon">
	<div class="game_rc">
		<form>
			<div class="-top">
				<div class="gm_con">
					<div class="gm_con_to">
						<div class="gct_l">
							<div class="game-icon2 game_15"></div>
							<p class="time-title">
								离投注截止还有
							</p>


							<div class="gct_time">
								<div class="gct_time_now">
									<div class="gct_time_now_l" id="count_down">
										<span class="leaveh-1">-</span>
										<span class="leaveh-2">-</span>
										<span class="interval">:</span>
										<span class="leavem-1">-</span>
										<span class="leavem-2">-</span>
										<span class="interval">:</span>
										<span class="leaves-1">-</span>
										<span class="leaves-2">-</span>
										<span id="endsound" class="onsound"></span>
									</div>
								</div>
							</div>


							<h3><?=$Lottery_data['name']?></h3>
							<div class="gct_now">
								<strong>
									第&nbsp;&nbsp;<span id="current_issue" class="color-green"><?=$Next_lottery_data['byid']?></span>&nbsp;&nbsp;期
								</strong>
								<br>
								总共:&nbsp;&nbsp;
								<strong><span id="current_sale" class="color-green"><?=$Lottery_data['periods']?></span></strong>
								&nbsp;&nbsp;期
								<br>
								<!-- <a href="http://game.nb15.net/history_code.shtml?id=15&amp;frequencytype=0" target="_blank" class="bt01"><span class="fa fa-bar-chart"></span>
									号码走势
								</a> -->
							</div>
						</div>


						<div id="shownb-box">
							<ul class="box-ul">
								<li><a href="http://game.nb15.net/play_nbwfc.shtml#nb-box1" class="tabulous_active">近一期</a></li>
								<li><a href="http://game.nb15.net/play_nbwfc.shtml#nb-box2">近五期</a></li>
							</ul>
							<div id="tabs_container" style="height: 120px;">
								<div id="nb-box1" style="position: absolute; top: 40px;">
									<p>
										<?=$Lottery_data['name']?>第&nbsp;&nbsp;
										<b>
											<span class="color-green" id="lt_gethistorycode">
												<?=$Now_lottery['byid']?>
											</span>
										</b>
										&nbsp;&nbsp;期
										<span id="lt_opentimebox" style="display: none;">
											&nbsp;&nbsp;
											<span id="waitopendesc">
												开奖倒计时:
											</span>
											&nbsp;
											<span style="color:#F9CE46;" id="lt_opentimeleft">
												00:00
											</span>
										</span>
										<span id="lt_opentimebox2" style="display: none; color: rgb(249, 206, 70);">
											<strong>
												&nbsp;&nbsp;正在开奖
											</strong>
										</span>
									</p>


									<ul class="show-nb1 " id="showcodebox">
										<li flag="normal"><?=$Now_lottery['a']?></li>
										<li flag="normal"><?=$Now_lottery['b']?></li>
										<li flag="normal"><?=$Now_lottery['c']?></li>
										<li flag="normal"><?=$Now_lottery['d']?></li>
										<li flag="normal"><?=$Now_lottery['e']?></li>
									</ul>
								</div>

								<div id="nb-box2" class="hideleft" style="position: absolute; top: 40px;">
									{Lottery_time_data}
										<p>第<span class="nb-box-q">{byid}</span>期开奖号码:&nbsp;&nbsp;<span class="nb-box-h">{a}</span><span class="nb-box-h">{b}</span><span class="nb-box-h">{c}</span><span class="nb-box-h">{d}</span><span class="nb-box-h">{e}</span></p>
									{/Lottery_time_data}
								</div>
							</div>
						</div>
						<div class="clear"></div>
					</div>
				</div>





				<!--奖期基本信息结束-->
				<div class="gm_con">
					<div class="gm_con_to">
						<ul class="game-list">
							<?php
								foreach ($Game_rule_list as $key => $value) {
									echo "<li class='title'><i class='fa fa-bars'></i>{$value['name']}</li>";
									foreach ($value['lottery'] as $lottery_key => $lottery_value) {
										echo "<li class='cqssc'>
											<a href='./lottery?id={$lottery_value['id']}' title='{$lottery_value['name']}'>
												<span class='fa fa-chevron-circle-right fa-lg'></span>
												{$lottery_value['name']}
											</a>
										</li>";
									}
								}
							?>
						</ul>


						<!--投注选号标签开始-->
						<div class="tz_body">
							<div class="unit">
								<div class="unit_title">
									<div class="u_tab_div" id="tabbar-div-s2">
										

										{Game_rule_menu_list}
										<span class="tab-front" value="0" tag="0" default="0">
										<span class="tabbar-left">
											</span>
											<span class="content">
												{name}
											</span>
											<span class="tabbar-right">
											</span>
										</span>
										{/Game_rule_menu_list}



									</div>
								</div>
								<div id="tabCon">
									<?php
										$index = 0;
										foreach ($Game_rule_menu_list as $key => $value) {
											echo '<div class="tabcon_n">';
											foreach ($value['song'] as $song_key => $song_value) {
												echo "<div class='back'><span class='method-tab-back'>{$song_value['name']}</span></div>";
											}
											echo '</div>';
										}
									?>
								</div>
							</div>
							<div class="clear">
							</div>
						</div>
						<!--投注选标签开始-->
						<div class="clear">
						</div>
						<!--投注选号区开始-->
						<div class="tzn_body">
							<div class="tzn_b_n">
								<div class="tbn_top">
									<h5 id="lt_desc">从万位、千位、百位各选一个号码组成一注。</h5>
									<span class="methodexample fa fa-bars" id="lt_example">范例</span>
									<span class="methodhelp fa fa-exclamation-circle" id="lt_help">中奖说明</span>
									<div class="clear">
									</div>
								</div>
								<div class="clear">
								</div>
								<div class="tbn_cen">
									<div class="tbn_c_ft">
									</div>
									<div class="tbn_c_s">
										<div id="lt_selector">
											<div class="nbs">
												<div class="ti">
													万位
												</div>
												<div class="nb">
													<div name="lt_place_0">0</div>
													<div name="lt_place_0">1</div>
													<div name="lt_place_0">2</div>
													<div name="lt_place_0">3</div>
													<div name="lt_place_0">4</div>
													<div name="lt_place_0">5</div>
													<div name="lt_place_0">6</div>
													<div name="lt_place_0">7</div>
													<div name="lt_place_0">8</div>
													<div name="lt_place_0">9</div>
												</div>
												<div class="to">
													<ul>
														<li class="l"></li>
														<li class="dxjoq" name="all">全</li>
														<li class="dxjoq" name="big">大</li>
														<li class="dxjoq" name="small">小</li>
														<li class="dxjoq" name="odd">奇</li>
														<li class="dxjoq" name="even">偶</li>
														<li class="dxjoq" name="clean">清</li>
														<li class="r"></li>
													</ul>
												</div>
											</div>
											<div class="nbs">
												<div class="ti">
													千位
												</div>
												<div class="nb">
													<div name="lt_place_1">
														0
													</div>
													<div name="lt_place_1">
														1
													</div>
													<div name="lt_place_1">
														2
													</div>
													<div name="lt_place_1">
														3
													</div>
													<div name="lt_place_1">
														4
													</div>
													<div name="lt_place_1">
														5
													</div>
													<div name="lt_place_1">
														6
													</div>
													<div name="lt_place_1">
														7
													</div>
													<div name="lt_place_1">
														8
													</div>
													<div name="lt_place_1">
														9
													</div>
												</div>
												<div class="to">
													<ul>
														<li class="l">
														</li>
														<li class="dxjoq" name="all">
															全
														</li>
														<li class="dxjoq" name="big">
															大
														</li>
														<li class="dxjoq" name="small">
															小
														</li>
														<li class="dxjoq" name="odd">
															奇
														</li>
														<li class="dxjoq" name="even">
															偶
														</li>
														<li class="dxjoq" name="clean">
															清
														</li>
														<li class="r">
														</li>
													</ul>
												</div>
											</div>
											<div class="nbs">
												<div class="ti">
													百位
												</div>
												<div class="nb">
													<div name="lt_place_2">
														0
													</div>
													<div name="lt_place_2">
														1
													</div>
													<div name="lt_place_2">
														2
													</div>
													<div name="lt_place_2">
														3
													</div>
													<div name="lt_place_2">
														4
													</div>
													<div name="lt_place_2">
														5
													</div>
													<div name="lt_place_2">
														6
													</div>
													<div name="lt_place_2">
														7
													</div>
													<div name="lt_place_2">
														8
													</div>
													<div name="lt_place_2">
														9
													</div>
												</div>
												<div class="to">
													<ul>
														<li class="l">
														</li>
														<li class="dxjoq" name="all">
															全
														</li>
														<li class="dxjoq" name="big">
															大
														</li>
														<li class="dxjoq" name="small">
															小
														</li>
														<li class="dxjoq" name="odd">
															奇
														</li>
														<li class="dxjoq" name="even">
															偶
														</li>
														<li class="dxjoq" name="clean">
															清
														</li>
														<li class="r">
														</li>
													</ul>
												</div>
											</div>
											<div class="c">
											</div>
										</div>
										<div class="random_sel_button" id="random_sel_button">
										</div>
										<div class="clear">
										</div>
									</div>
									<div class="tbn_c_fb">
									</div>
								</div>
								<div class="tbn_bot">
									<div class="tbn_b_top">
										<div class="tbn_bt_sel">
											您选择了
											<strong>
												<span class="n" id="lt_sel_nums">
													0
												</span>
											</strong>
											注,共
											<strong>
												<span class="n" id="lt_sel_money">
													0
												</span>
											</strong>
											元,倍数:
											<span class="changetime" id="reducetime" title="减少1倍">
												－
											</span>
											<input name="lt_sel_times" type="text" size="4" class="bei" id="lt_sel_times">
											<span class="changetime" id="plustime" title="增加1倍">
												＋
											</span>
											倍
											<ul id="#" class="choose-money">
												<li class="on">
													元
												</li>
												<li class="">
													角
												</li>
												<li class="">
													分
												</li>
												<li class="">
													厘
												</li>
											</ul>
											<span>
												<select name="lt_sel_modes" id="lt_sel_modes" class="cs-select cs-skin-border width-60"
												style="display: none;">
													<option value="1">
														元
													</option>
													<option value="2">
														角
													</option>
													<option value="3">
														分
													</option>
													<option value="4">
														厘
													</option>
												</select>
											</span>
											<span id="lt_sel_prize">
												选择奖金返点:
												<div class="cs-select cs-skin-border" tabindex="0">
													<span class="cs-placeholder">
														1800-7%
													</span>
													<div class="cs-options">
														<ul>
															<li data-option="" data-value="1800|0.07" class="cs-selected">
																<span>
																	1800-7%
																</span>
															</li>
															<li data-option="" data-value="1940|0">
																<span>
																	1940-0%
																</span>
															</li>
														</ul>
													</div>
													<select name="lt_sel_dyprize" id="lt_sel_dyprize" class="cs-select cs-skin-border">
														<option value="1800|0.07">
															1800-7%
														</option>
														<option value="1940|0">
															1940-0%
														</option>
													</select>
												</div>
											</span>
										</div>
										<div class="g_submit" id="lt_sel_insert">
											<span class="fa fa-plus fa-lg">
											</span>
											添加
										</div>
										<div class="clear">
										</div>
									</div>
									<div class="tbn_b_bot">
										<div class="tbn_bb_l">
											<div class="tbn_bg1">
												<div class="tbn_bg2">
												</div>
											</div>
											<div class="tbn_bb_ln">
												<div class="tz_tab_list_box">
													<table cellspacing="0" cellpadding="0" border="0" id="lt_cf_content" class="tz_tab_list">
														<tbody>
															<tr class="nr">
																<td class="tl_li_l" width="4">
																</td>
																<td class="noinfo">
																	暂无投注项
																</td>
																<td class="tl_li_rn" width="4">
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<div class="clear">
										</div>
									</div>
									<div class="tbn_bb_2">
										<span class="tbn_clear" id="lt_random_one" title="点击多次，随机更多">
											随机一注
										</span>
										<span class="tbn_clear" id="lt_random_five" title="点击多次，随机更多">
											随机五注
										</span>
										<span class="tbn_clear" id="lt_cf_clear">
											清除号码
										</span>
										<!--<span class="icons_q1 fa fa-question-circle"id="lt_cf_help"></span>投注项:<span id="lt_cf_count">0</span>-->
									</div>
									<div class="clear">
									</div>
									<div class="tbn_bb_r">
										<div class="sub_txt">
											<div>
												总注数:
												<strong>
													<span class="r" id="lt_cf_nums">
														0
													</span>
												</strong>
												注
											</div>
											<div>
												总金额:
												<strong>
													<span class="r" id="lt_cf_money">
														0
													</span>
												</strong>
												元
											</div>
											<div>
												未来期:
												<span id="lt_issues">
													<select name="lt_issue_start" id="lt_issue_start">
														<option value="170524180">
															170524180(当前期)
														</option>
														<option value="170524181">
															170524181
														</option>
														<option value="170524182">
															170524182
														</option>
														<option value="170524183">
															170524183
														</option>
														<option value="170524184">
															170524184
														</option>
														<option value="170524185">
															170524185
														</option>
														<option value="170524186">
															170524186
														</option>
														<option value="170524187">
															170524187
														</option>
														<option value="170524188">
															170524188
														</option>
														<option value="170524189">
															170524189
														</option>
														<option value="170524190">
															170524190
														</option>
														<option value="170524191">
															170524191
														</option>
														<option value="170524192">
															170524192
														</option>
														<option value="170524193">
															170524193
														</option>
														<option value="170524194">
															170524194
														</option>
														<option value="170524195">
															170524195
														</option>
														<option value="170524196">
															170524196
														</option>
														<option value="170524197">
															170524197
														</option>
														<option value="170524198">
															170524198
														</option>
														<option value="170524199">
															170524199
														</option>
														<option value="170524200">
															170524200
														</option>
														<option value="170524201">
															170524201
														</option>
														<option value="170524202">
															170524202
														</option>
														<option value="170524203">
															170524203
														</option>
														<option value="170524204">
															170524204
														</option>
														<option value="170524205">
															170524205
														</option>
														<option value="170524206">
															170524206
														</option>
														<option value="170524207">
															170524207
														</option>
														<option value="170524208">
															170524208
														</option>
														<option value="170524209">
															170524209
														</option>
														<option value="170524210">
															170524210
														</option>
														<option value="170524211">
															170524211
														</option>
														<option value="170524212">
															170524212
														</option>
														<option value="170524213">
															170524213
														</option>
														<option value="170524214">
															170524214
														</option>
														<option value="170524215">
															170524215
														</option>
														<option value="170524216">
															170524216
														</option>
														<option value="170524217">
															170524217
														</option>
														<option value="170525001">
															170525001
														</option>
														<option value="170525002">
															170525002
														</option>
														<option value="170525003">
															170525003
														</option>
														<option value="170525004">
															170525004
														</option>
														<option value="170525005">
															170525005
														</option>
														<option value="170525006">
															170525006
														</option>
														<option value="170525007">
															170525007
														</option>
														<option value="170525008">
															170525008
														</option>
														<option value="170525009">
															170525009
														</option>
														<option value="170525010">
															170525010
														</option>
														<option value="170525011">
															170525011
														</option>
														<option value="170525012">
															170525012
														</option>
														<option value="170525013">
															170525013
														</option>
														<option value="170525014">
															170525014
														</option>
														<option value="170525015">
															170525015
														</option>
														<option value="170525016">
															170525016
														</option>
														<option value="170525017">
															170525017
														</option>
														<option value="170525018">
															170525018
														</option>
														<option value="170525019">
															170525019
														</option>
														<option value="170525020">
															170525020
														</option>
														<option value="170525021">
															170525021
														</option>
														<option value="170525022">
															170525022
														</option>
														<option value="170525023">
															170525023
														</option>
														<option value="170525024">
															170525024
														</option>
														<option value="170525025">
															170525025
														</option>
														<option value="170525026">
															170525026
														</option>
														<option value="170525027">
															170525027
														</option>
														<option value="170525028">
															170525028
														</option>
														<option value="170525029">
															170525029
														</option>
														<option value="170525030">
															170525030
														</option>
														<option value="170525031">
															170525031
														</option>
														<option value="170525032">
															170525032
														</option>
														<option value="170525033">
															170525033
														</option>
														<option value="170525034">
															170525034
														</option>
														<option value="170525035">
															170525035
														</option>
														<option value="170525036">
															170525036
														</option>
														<option value="170525037">
															170525037
														</option>
														<option value="170525038">
															170525038
														</option>
														<option value="170525039">
															170525039
														</option>
														<option value="170525040">
															170525040
														</option>
														<option value="170525041">
															170525041
														</option>
														<option value="170525042">
															170525042
														</option>
														<option value="170525043">
															170525043
														</option>
														<option value="170525044">
															170525044
														</option>
														<option value="170525045">
															170525045
														</option>
														<option value="170525046">
															170525046
														</option>
														<option value="170525047">
															170525047
														</option>
														<option value="170525048">
															170525048
														</option>
														<option value="170525049">
															170525049
														</option>
														<option value="170525050">
															170525050
														</option>
														<option value="170525051">
															170525051
														</option>
														<option value="170525052">
															170525052
														</option>
														<option value="170525053">
															170525053
														</option>
														<option value="170525054">
															170525054
														</option>
														<option value="170525055">
															170525055
														</option>
														<option value="170525056">
															170525056
														</option>
														<option value="170525057">
															170525057
														</option>
														<option value="170525058">
															170525058
														</option>
														<option value="170525059">
															170525059
														</option>
														<option value="170525060">
															170525060
														</option>
														<option value="170525061">
															170525061
														</option>
														<option value="170525062">
															170525062
														</option>
														<option value="170525063">
															170525063
														</option>
														<option value="170525064">
															170525064
														</option>
														<option value="170525065">
															170525065
														</option>
														<option value="170525066">
															170525066
														</option>
														<option value="170525067">
															170525067
														</option>
														<option value="170525068">
															170525068
														</option>
														<option value="170525069">
															170525069
														</option>
														<option value="170525070">
															170525070
														</option>
														<option value="170525071">
															170525071
														</option>
														<option value="170525072">
															170525072
														</option>
														<option value="170525073">
															170525073
														</option>
														<option value="170525074">
															170525074
														</option>
														<option value="170525075">
															170525075
														</option>
														<option value="170525076">
															170525076
														</option>
														<option value="170525077">
															170525077
														</option>
														<option value="170525078">
															170525078
														</option>
														<option value="170525079">
															170525079
														</option>
														<option value="170525080">
															170525080
														</option>
														<option value="170525081">
															170525081
														</option>
														<option value="170525082">
															170525082
														</option>
														<option value="170525083">
															170525083
														</option>
														<option value="170525084">
															170525084
														</option>
														<option value="170525085">
															170525085
														</option>
														<option value="170525086">
															170525086
														</option>
														<option value="170525087">
															170525087
														</option>
														<option value="170525088">
															170525088
														</option>
														<option value="170525089">
															170525089
														</option>
														<option value="170525090">
															170525090
														</option>
														<option value="170525091">
															170525091
														</option>
														<option value="170525092">
															170525092
														</option>
														<option value="170525093">
															170525093
														</option>
														<option value="170525094">
															170525094
														</option>
														<option value="170525095">
															170525095
														</option>
														<option value="170525096">
															170525096
														</option>
														<option value="170525097">
															170525097
														</option>
														<option value="170525098">
															170525098
														</option>
														<option value="170525099">
															170525099
														</option>
														<option value="170525100">
															170525100
														</option>
														<option value="170525101">
															170525101
														</option>
														<option value="170525102">
															170525102
														</option>
														<option value="170525103">
															170525103
														</option>
														<option value="170525104">
															170525104
														</option>
														<option value="170525105">
															170525105
														</option>
														<option value="170525106">
															170525106
														</option>
														<option value="170525107">
															170525107
														</option>
														<option value="170525108">
															170525108
														</option>
														<option value="170525109">
															170525109
														</option>
														<option value="170525110">
															170525110
														</option>
														<option value="170525111">
															170525111
														</option>
														<option value="170525112">
															170525112
														</option>
														<option value="170525113">
															170525113
														</option>
														<option value="170525114">
															170525114
														</option>
														<option value="170525115">
															170525115
														</option>
														<option value="170525116">
															170525116
														</option>
														<option value="170525117">
															170525117
														</option>
														<option value="170525118">
															170525118
														</option>
														<option value="170525119">
															170525119
														</option>
														<option value="170525120">
															170525120
														</option>
														<option value="170525121">
															170525121
														</option>
														<option value="170525122">
															170525122
														</option>
														<option value="170525123">
															170525123
														</option>
														<option value="170525124">
															170525124
														</option>
														<option value="170525125">
															170525125
														</option>
														<option value="170525126">
															170525126
														</option>
														<option value="170525127">
															170525127
														</option>
														<option value="170525128">
															170525128
														</option>
														<option value="170525129">
															170525129
														</option>
														<option value="170525130">
															170525130
														</option>
														<option value="170525131">
															170525131
														</option>
														<option value="170525132">
															170525132
														</option>
														<option value="170525133">
															170525133
														</option>
														<option value="170525134">
															170525134
														</option>
														<option value="170525135">
															170525135
														</option>
														<option value="170525136">
															170525136
														</option>
														<option value="170525137">
															170525137
														</option>
														<option value="170525138">
															170525138
														</option>
														<option value="170525139">
															170525139
														</option>
														<option value="170525140">
															170525140
														</option>
														<option value="170525141">
															170525141
														</option>
														<option value="170525142">
															170525142
														</option>
														<option value="170525143">
															170525143
														</option>
														<option value="170525144">
															170525144
														</option>
														<option value="170525145">
															170525145
														</option>
														<option value="170525146">
															170525146
														</option>
														<option value="170525147">
															170525147
														</option>
														<option value="170525148">
															170525148
														</option>
														<option value="170525149">
															170525149
														</option>
														<option value="170525150">
															170525150
														</option>
														<option value="170525151">
															170525151
														</option>
														<option value="170525152">
															170525152
														</option>
														<option value="170525153">
															170525153
														</option>
														<option value="170525154">
															170525154
														</option>
														<option value="170525155">
															170525155
														</option>
														<option value="170525156">
															170525156
														</option>
														<option value="170525157">
															170525157
														</option>
														<option value="170525158">
															170525158
														</option>
														<option value="170525159">
															170525159
														</option>
														<option value="170525160">
															170525160
														</option>
														<option value="170525161">
															170525161
														</option>
														<option value="170525162">
															170525162
														</option>
														<option value="170525163">
															170525163
														</option>
														<option value="170525164">
															170525164
														</option>
														<option value="170525165">
															170525165
														</option>
														<option value="170525166">
															170525166
														</option>
														<option value="170525167">
															170525167
														</option>
														<option value="170525168">
															170525168
														</option>
														<option value="170525169">
															170525169
														</option>
														<option value="170525170">
															170525170
														</option>
														<option value="170525171">
															170525171
														</option>
														<option value="170525172">
															170525172
														</option>
														<option value="170525173">
															170525173
														</option>
														<option value="170525174">
															170525174
														</option>
														<option value="170525175">
															170525175
														</option>
														<option value="170525176">
															170525176
														</option>
														<option value="170525177">
															170525177
														</option>
														<option value="170525178">
															170525178
														</option>
														<option value="170525179">
															170525179
														</option>
													</select>
													<input type="hidden" name="lt_total_nums" id="lt_total_nums" value="0">
													<input type="hidden" name="lt_total_money" id="lt_total_money" value="0">
												</span>
											</div>
										</div>
										<div class="g_submit" id="lt_buy">
											<span class="fa fa-check-square-o fa-lg">
											</span>
											确认投注
										</div>
										<div class="lt_trace_box">
											<div class="lt_trace_if">
												<input type="checkbox" name="lt_trace_if" id="lt_trace_if" value="yes">
												<label for="lt_trace_if" name="lt_trace_if">
												</label>
											</div>
											追号
										</div>
										<!--<div class="g_submit"id="lt_buy"><span></span></div>-->
									</div>
								</div>
							</div>
						</div>
						<!--投注选号区结束-->
						<div class="clear">
						</div>
						<div class="zh_body">
							<div class="unit">
								<div class="unit_title">
									<div class="ut_l">
									</div>
									<div class="ut_r">
									</div>
								</div>
								<!--追号区开始-->
								<div id="lt_trace_box" style="display:none" class="trace_box">
									<div class="unit1">
										<div class="unit_title2">
											<div class="u_tab_div" id="tab02">
												<div class="bd">
													<div class="bd2" id="general_txt_100">
														<table class="tabbar-div-s3" width="100%">
															<tbody>
																<tr>
																	<td id="lt_trace_label">
																		<span id="lt_margin" class="tab-front">
																			<span class="tabbar-left">
																			</span>
																			<span class="content">
																				利润率追号
																			</span>
																			<span class="tabbar-right">
																			</span>
																		</span>
																		<span id="lt_sametime" class="tab-back">
																			<span class="tabbar-left">
																			</span>
																			<span class="content">
																				同倍追号
																			</span>
																			<span class="tabbar-right">
																			</span>
																		</span>
																		<span id="lt_difftime" class="tab-back">
																			<span class="tabbar-left">
																			</span>
																			<span class="content">
																				翻倍追号
																			</span>
																			<span class="tabbar-right">
																			</span>
																		</span>
																	</td>
																</tr>
															</tbody>
														</table>
														<div class="bl3p">
														</div>
													</div>
												</div>
											</div>
											<div class="clear">
											</div>
										</div>
										<div class="clear">
										</div>
										<div class="zhlist" id="lt_trace_issues">
											<table width="100%" cellspacing="0" cellpadding="0" border="0" id="lt_trace_issues_table">
												<tbody>
													<tr id="tr_trace_170524180" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524180">
														</td>
														<td>
															170524180
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524180" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524180">
																0.00
															</span>
														</td>
														<td>
															2017-05-24 22:54:55
														</td>
													</tr>
													<tr id="tr_trace_170524181" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524181">
														</td>
														<td>
															170524181
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524181" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524181">
																0.00
															</span>
														</td>
														<td>
															2017-05-24 22:59:55
														</td>
													</tr>
													<tr id="tr_trace_170524182" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524182">
														</td>
														<td>
															170524182
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524182" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524182">
																0.00
															</span>
														</td>
														<td>
															2017-05-24 23:04:55
														</td>
													</tr>
													<tr id="tr_trace_170524183" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524183">
														</td>
														<td>
															170524183
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524183" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524183">
																0.00
															</span>
														</td>
														<td>
															2017-05-24 23:09:55
														</td>
													</tr>
													<tr id="tr_trace_170524184" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524184">
														</td>
														<td>
															170524184
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524184" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524184">
																0.00
															</span>
														</td>
														<td>
															2017-05-24 23:14:55
														</td>
													</tr>
													<tr id="tr_trace_170524185" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524185">
														</td>
														<td>
															170524185
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524185" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524185">
																0.00
															</span>
														</td>
														<td>
															2017-05-24 23:19:55
														</td>
													</tr>
													<tr id="tr_trace_170524186" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524186">
														</td>
														<td>
															170524186
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524186" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524186">
																0.00
															</span>
														</td>
														<td>
															2017-05-24 23:24:55
														</td>
													</tr>
													<tr id="tr_trace_170524187" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524187">
														</td>
														<td>
															170524187
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524187" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524187">
																0.00
															</span>
														</td>
														<td>
															2017-05-24 23:29:55
														</td>
													</tr>
													<tr id="tr_trace_170524188" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524188">
														</td>
														<td>
															170524188
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524188" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524188">
																0.00
															</span>
														</td>
														<td>
															2017-05-24 23:34:55
														</td>
													</tr>
													<tr id="tr_trace_170524189" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524189">
														</td>
														<td>
															170524189
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524189" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524189">
																0.00
															</span>
														</td>
														<td>
															2017-05-24 23:39:55
														</td>
													</tr>
													<tr id="tr_trace_170524190" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524190">
														</td>
														<td>
															170524190
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524190" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524190">
																0.00
															</span>
														</td>
														<td>
															2017-05-24 23:44:55
														</td>
													</tr>
													<tr id="tr_trace_170524191" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524191">
														</td>
														<td>
															170524191
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524191" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524191">
																0.00
															</span>
														</td>
														<td>
															2017-05-24 23:49:55
														</td>
													</tr>
													<tr id="tr_trace_170524192" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524192">
														</td>
														<td>
															170524192
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524192" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524192">
																0.00
															</span>
														</td>
														<td>
															2017-05-24 23:54:55
														</td>
													</tr>
													<tr id="tr_trace_170524193" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524193">
														</td>
														<td>
															170524193
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524193" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524193">
																0.00
															</span>
														</td>
														<td>
															2017-05-24 23:59:55
														</td>
													</tr>
													<tr id="tr_trace_170524194" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524194">
														</td>
														<td>
															170524194
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524194" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524194">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 00:04:55
														</td>
													</tr>
													<tr id="tr_trace_170524195" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524195">
														</td>
														<td>
															170524195
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524195" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524195">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 00:09:55
														</td>
													</tr>
													<tr id="tr_trace_170524196" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524196">
														</td>
														<td>
															170524196
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524196" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524196">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 00:14:55
														</td>
													</tr>
													<tr id="tr_trace_170524197" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524197">
														</td>
														<td>
															170524197
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524197" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524197">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 00:19:55
														</td>
													</tr>
													<tr id="tr_trace_170524198" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524198">
														</td>
														<td>
															170524198
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524198" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524198">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 00:24:55
														</td>
													</tr>
													<tr id="tr_trace_170524199" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524199">
														</td>
														<td>
															170524199
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524199" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524199">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 00:29:55
														</td>
													</tr>
													<tr id="tr_trace_170524200" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524200">
														</td>
														<td>
															170524200
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524200" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524200">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 00:34:55
														</td>
													</tr>
													<tr id="tr_trace_170524201" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524201">
														</td>
														<td>
															170524201
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524201" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524201">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 00:39:55
														</td>
													</tr>
													<tr id="tr_trace_170524202" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524202">
														</td>
														<td>
															170524202
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524202" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524202">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 00:44:55
														</td>
													</tr>
													<tr id="tr_trace_170524203" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524203">
														</td>
														<td>
															170524203
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524203" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524203">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 00:49:55
														</td>
													</tr>
													<tr id="tr_trace_170524204" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524204">
														</td>
														<td>
															170524204
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524204" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524204">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 00:54:55
														</td>
													</tr>
													<tr id="tr_trace_170524205" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524205">
														</td>
														<td>
															170524205
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524205" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524205">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 00:59:55
														</td>
													</tr>
													<tr id="tr_trace_170524206" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524206">
														</td>
														<td>
															170524206
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524206" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524206">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 01:04:55
														</td>
													</tr>
													<tr id="tr_trace_170524207" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524207">
														</td>
														<td>
															170524207
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524207" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524207">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 01:09:55
														</td>
													</tr>
													<tr id="tr_trace_170524208" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524208">
														</td>
														<td>
															170524208
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524208" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524208">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 01:14:55
														</td>
													</tr>
													<tr id="tr_trace_170524209" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524209">
														</td>
														<td>
															170524209
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524209" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524209">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 01:19:55
														</td>
													</tr>
													<tr id="tr_trace_170524210" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524210">
														</td>
														<td>
															170524210
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524210" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524210">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 01:24:55
														</td>
													</tr>
													<tr id="tr_trace_170524211" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524211">
														</td>
														<td>
															170524211
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524211" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524211">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 01:29:55
														</td>
													</tr>
													<tr id="tr_trace_170524212" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524212">
														</td>
														<td>
															170524212
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524212" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524212">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 01:34:55
														</td>
													</tr>
													<tr id="tr_trace_170524213" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524213">
														</td>
														<td>
															170524213
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524213" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524213">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 01:39:55
														</td>
													</tr>
													<tr id="tr_trace_170524214" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524214">
														</td>
														<td>
															170524214
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524214" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524214">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 01:44:55
														</td>
													</tr>
													<tr id="tr_trace_170524215" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524215">
														</td>
														<td>
															170524215
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524215" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524215">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 01:49:55
														</td>
													</tr>
													<tr id="tr_trace_170524216" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524216">
														</td>
														<td>
															170524216
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524216" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524216">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 01:54:55
														</td>
													</tr>
													<tr id="tr_trace_170524217" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170524217">
														</td>
														<td>
															170524217
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170524217" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170524217">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 01:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525001" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525001">
														</td>
														<td>
															170525001
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525001" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525001">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 07:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525002" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525002">
														</td>
														<td>
															170525002
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525002" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525002">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 08:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525003" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525003">
														</td>
														<td>
															170525003
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525003" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525003">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 08:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525004" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525004">
														</td>
														<td>
															170525004
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525004" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525004">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 08:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525005" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525005">
														</td>
														<td>
															170525005
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525005" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525005">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 08:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525006" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525006">
														</td>
														<td>
															170525006
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525006" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525006">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 08:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525007" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525007">
														</td>
														<td>
															170525007
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525007" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525007">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 08:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525008" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525008">
														</td>
														<td>
															170525008
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525008" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525008">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 08:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525009" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525009">
														</td>
														<td>
															170525009
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525009" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525009">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 08:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525010" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525010">
														</td>
														<td>
															170525010
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525010" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525010">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 08:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525011" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525011">
														</td>
														<td>
															170525011
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525011" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525011">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 08:49:55
														</td>
													</tr>
													<tr id="tr_trace_170525012" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525012">
														</td>
														<td>
															170525012
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525012" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525012">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 08:54:55
														</td>
													</tr>
													<tr id="tr_trace_170525013" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525013">
														</td>
														<td>
															170525013
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525013" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525013">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 08:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525014" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525014">
														</td>
														<td>
															170525014
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525014" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525014">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 09:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525015" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525015">
														</td>
														<td>
															170525015
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525015" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525015">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 09:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525016" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525016">
														</td>
														<td>
															170525016
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525016" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525016">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 09:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525017" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525017">
														</td>
														<td>
															170525017
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525017" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525017">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 09:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525018" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525018">
														</td>
														<td>
															170525018
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525018" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525018">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 09:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525019" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525019">
														</td>
														<td>
															170525019
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525019" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525019">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 09:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525020" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525020">
														</td>
														<td>
															170525020
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525020" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525020">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 09:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525021" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525021">
														</td>
														<td>
															170525021
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525021" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525021">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 09:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525022" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525022">
														</td>
														<td>
															170525022
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525022" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525022">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 09:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525023" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525023">
														</td>
														<td>
															170525023
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525023" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525023">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 09:49:55
														</td>
													</tr>
													<tr id="tr_trace_170525024" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525024">
														</td>
														<td>
															170525024
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525024" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525024">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 09:54:55
														</td>
													</tr>
													<tr id="tr_trace_170525025" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525025">
														</td>
														<td>
															170525025
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525025" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525025">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 09:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525026" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525026">
														</td>
														<td>
															170525026
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525026" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525026">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 10:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525027" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525027">
														</td>
														<td>
															170525027
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525027" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525027">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 10:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525028" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525028">
														</td>
														<td>
															170525028
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525028" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525028">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 10:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525029" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525029">
														</td>
														<td>
															170525029
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525029" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525029">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 10:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525030" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525030">
														</td>
														<td>
															170525030
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525030" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525030">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 10:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525031" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525031">
														</td>
														<td>
															170525031
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525031" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525031">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 10:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525032" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525032">
														</td>
														<td>
															170525032
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525032" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525032">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 10:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525033" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525033">
														</td>
														<td>
															170525033
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525033" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525033">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 10:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525034" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525034">
														</td>
														<td>
															170525034
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525034" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525034">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 10:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525035" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525035">
														</td>
														<td>
															170525035
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525035" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525035">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 10:49:55
														</td>
													</tr>
													<tr id="tr_trace_170525036" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525036">
														</td>
														<td>
															170525036
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525036" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525036">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 10:54:55
														</td>
													</tr>
													<tr id="tr_trace_170525037" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525037">
														</td>
														<td>
															170525037
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525037" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525037">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 10:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525038" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525038">
														</td>
														<td>
															170525038
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525038" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525038">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 11:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525039" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525039">
														</td>
														<td>
															170525039
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525039" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525039">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 11:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525040" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525040">
														</td>
														<td>
															170525040
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525040" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525040">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 11:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525041" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525041">
														</td>
														<td>
															170525041
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525041" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525041">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 11:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525042" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525042">
														</td>
														<td>
															170525042
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525042" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525042">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 11:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525043" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525043">
														</td>
														<td>
															170525043
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525043" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525043">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 11:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525044" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525044">
														</td>
														<td>
															170525044
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525044" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525044">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 11:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525045" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525045">
														</td>
														<td>
															170525045
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525045" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525045">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 11:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525046" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525046">
														</td>
														<td>
															170525046
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525046" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525046">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 11:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525047" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525047">
														</td>
														<td>
															170525047
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525047" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525047">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 11:49:55
														</td>
													</tr>
													<tr id="tr_trace_170525048" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525048">
														</td>
														<td>
															170525048
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525048" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525048">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 11:54:55
														</td>
													</tr>
													<tr id="tr_trace_170525049" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525049">
														</td>
														<td>
															170525049
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525049" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525049">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 11:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525050" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525050">
														</td>
														<td>
															170525050
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525050" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525050">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 12:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525051" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525051">
														</td>
														<td>
															170525051
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525051" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525051">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 12:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525052" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525052">
														</td>
														<td>
															170525052
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525052" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525052">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 12:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525053" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525053">
														</td>
														<td>
															170525053
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525053" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525053">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 12:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525054" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525054">
														</td>
														<td>
															170525054
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525054" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525054">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 12:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525055" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525055">
														</td>
														<td>
															170525055
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525055" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525055">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 12:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525056" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525056">
														</td>
														<td>
															170525056
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525056" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525056">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 12:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525057" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525057">
														</td>
														<td>
															170525057
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525057" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525057">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 12:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525058" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525058">
														</td>
														<td>
															170525058
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525058" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525058">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 12:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525059" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525059">
														</td>
														<td>
															170525059
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525059" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525059">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 12:49:55
														</td>
													</tr>
													<tr id="tr_trace_170525060" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525060">
														</td>
														<td>
															170525060
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525060" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525060">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 12:54:55
														</td>
													</tr>
													<tr id="tr_trace_170525061" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525061">
														</td>
														<td>
															170525061
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525061" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525061">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 12:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525062" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525062">
														</td>
														<td>
															170525062
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525062" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525062">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 13:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525063" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525063">
														</td>
														<td>
															170525063
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525063" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525063">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 13:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525064" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525064">
														</td>
														<td>
															170525064
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525064" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525064">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 13:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525065" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525065">
														</td>
														<td>
															170525065
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525065" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525065">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 13:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525066" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525066">
														</td>
														<td>
															170525066
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525066" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525066">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 13:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525067" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525067">
														</td>
														<td>
															170525067
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525067" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525067">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 13:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525068" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525068">
														</td>
														<td>
															170525068
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525068" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525068">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 13:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525069" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525069">
														</td>
														<td>
															170525069
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525069" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525069">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 13:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525070" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525070">
														</td>
														<td>
															170525070
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525070" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525070">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 13:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525071" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525071">
														</td>
														<td>
															170525071
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525071" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525071">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 13:49:55
														</td>
													</tr>
													<tr id="tr_trace_170525072" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525072">
														</td>
														<td>
															170525072
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525072" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525072">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 13:54:55
														</td>
													</tr>
													<tr id="tr_trace_170525073" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525073">
														</td>
														<td>
															170525073
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525073" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525073">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 13:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525074" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525074">
														</td>
														<td>
															170525074
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525074" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525074">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 14:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525075" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525075">
														</td>
														<td>
															170525075
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525075" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525075">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 14:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525076" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525076">
														</td>
														<td>
															170525076
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525076" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525076">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 14:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525077" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525077">
														</td>
														<td>
															170525077
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525077" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525077">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 14:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525078" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525078">
														</td>
														<td>
															170525078
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525078" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525078">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 14:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525079" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525079">
														</td>
														<td>
															170525079
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525079" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525079">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 14:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525080" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525080">
														</td>
														<td>
															170525080
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525080" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525080">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 14:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525081" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525081">
														</td>
														<td>
															170525081
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525081" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525081">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 14:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525082" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525082">
														</td>
														<td>
															170525082
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525082" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525082">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 14:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525083" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525083">
														</td>
														<td>
															170525083
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525083" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525083">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 14:49:55
														</td>
													</tr>
													<tr id="tr_trace_170525084" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525084">
														</td>
														<td>
															170525084
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525084" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525084">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 14:54:55
														</td>
													</tr>
													<tr id="tr_trace_170525085" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525085">
														</td>
														<td>
															170525085
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525085" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525085">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 14:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525086" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525086">
														</td>
														<td>
															170525086
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525086" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525086">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 15:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525087" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525087">
														</td>
														<td>
															170525087
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525087" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525087">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 15:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525088" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525088">
														</td>
														<td>
															170525088
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525088" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525088">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 15:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525089" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525089">
														</td>
														<td>
															170525089
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525089" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525089">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 15:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525090" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525090">
														</td>
														<td>
															170525090
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525090" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525090">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 15:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525091" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525091">
														</td>
														<td>
															170525091
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525091" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525091">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 15:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525092" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525092">
														</td>
														<td>
															170525092
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525092" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525092">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 15:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525093" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525093">
														</td>
														<td>
															170525093
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525093" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525093">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 15:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525094" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525094">
														</td>
														<td>
															170525094
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525094" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525094">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 15:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525095" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525095">
														</td>
														<td>
															170525095
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525095" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525095">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 15:49:55
														</td>
													</tr>
													<tr id="tr_trace_170525096" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525096">
														</td>
														<td>
															170525096
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525096" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525096">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 15:54:55
														</td>
													</tr>
													<tr id="tr_trace_170525097" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525097">
														</td>
														<td>
															170525097
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525097" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525097">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 15:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525098" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525098">
														</td>
														<td>
															170525098
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525098" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525098">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 16:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525099" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525099">
														</td>
														<td>
															170525099
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525099" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525099">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 16:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525100" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525100">
														</td>
														<td>
															170525100
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525100" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525100">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 16:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525101" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525101">
														</td>
														<td>
															170525101
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525101" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525101">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 16:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525102" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525102">
														</td>
														<td>
															170525102
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525102" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525102">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 16:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525103" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525103">
														</td>
														<td>
															170525103
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525103" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525103">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 16:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525104" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525104">
														</td>
														<td>
															170525104
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525104" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525104">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 16:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525105" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525105">
														</td>
														<td>
															170525105
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525105" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525105">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 16:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525106" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525106">
														</td>
														<td>
															170525106
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525106" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525106">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 16:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525107" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525107">
														</td>
														<td>
															170525107
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525107" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525107">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 16:49:55
														</td>
													</tr>
													<tr id="tr_trace_170525108" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525108">
														</td>
														<td>
															170525108
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525108" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525108">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 16:54:55
														</td>
													</tr>
													<tr id="tr_trace_170525109" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525109">
														</td>
														<td>
															170525109
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525109" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525109">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 16:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525110" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525110">
														</td>
														<td>
															170525110
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525110" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525110">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 17:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525111" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525111">
														</td>
														<td>
															170525111
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525111" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525111">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 17:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525112" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525112">
														</td>
														<td>
															170525112
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525112" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525112">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 17:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525113" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525113">
														</td>
														<td>
															170525113
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525113" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525113">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 17:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525114" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525114">
														</td>
														<td>
															170525114
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525114" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525114">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 17:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525115" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525115">
														</td>
														<td>
															170525115
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525115" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525115">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 17:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525116" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525116">
														</td>
														<td>
															170525116
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525116" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525116">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 17:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525117" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525117">
														</td>
														<td>
															170525117
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525117" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525117">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 17:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525118" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525118">
														</td>
														<td>
															170525118
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525118" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525118">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 17:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525119" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525119">
														</td>
														<td>
															170525119
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525119" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525119">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 17:49:55
														</td>
													</tr>
													<tr id="tr_trace_170525120" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525120">
														</td>
														<td>
															170525120
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525120" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525120">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 17:54:55
														</td>
													</tr>
													<tr id="tr_trace_170525121" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525121">
														</td>
														<td>
															170525121
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525121" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525121">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 17:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525122" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525122">
														</td>
														<td>
															170525122
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525122" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525122">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 18:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525123" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525123">
														</td>
														<td>
															170525123
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525123" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525123">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 18:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525124" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525124">
														</td>
														<td>
															170525124
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525124" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525124">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 18:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525125" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525125">
														</td>
														<td>
															170525125
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525125" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525125">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 18:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525126" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525126">
														</td>
														<td>
															170525126
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525126" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525126">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 18:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525127" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525127">
														</td>
														<td>
															170525127
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525127" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525127">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 18:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525128" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525128">
														</td>
														<td>
															170525128
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525128" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525128">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 18:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525129" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525129">
														</td>
														<td>
															170525129
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525129" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525129">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 18:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525130" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525130">
														</td>
														<td>
															170525130
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525130" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525130">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 18:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525131" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525131">
														</td>
														<td>
															170525131
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525131" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525131">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 18:49:55
														</td>
													</tr>
													<tr id="tr_trace_170525132" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525132">
														</td>
														<td>
															170525132
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525132" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525132">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 18:54:55
														</td>
													</tr>
													<tr id="tr_trace_170525133" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525133">
														</td>
														<td>
															170525133
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525133" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525133">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 18:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525134" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525134">
														</td>
														<td>
															170525134
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525134" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525134">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 19:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525135" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525135">
														</td>
														<td>
															170525135
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525135" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525135">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 19:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525136" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525136">
														</td>
														<td>
															170525136
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525136" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525136">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 19:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525137" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525137">
														</td>
														<td>
															170525137
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525137" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525137">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 19:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525138" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525138">
														</td>
														<td>
															170525138
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525138" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525138">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 19:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525139" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525139">
														</td>
														<td>
															170525139
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525139" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525139">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 19:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525140" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525140">
														</td>
														<td>
															170525140
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525140" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525140">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 19:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525141" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525141">
														</td>
														<td>
															170525141
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525141" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525141">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 19:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525142" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525142">
														</td>
														<td>
															170525142
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525142" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525142">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 19:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525143" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525143">
														</td>
														<td>
															170525143
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525143" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525143">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 19:49:55
														</td>
													</tr>
													<tr id="tr_trace_170525144" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525144">
														</td>
														<td>
															170525144
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525144" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525144">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 19:54:55
														</td>
													</tr>
													<tr id="tr_trace_170525145" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525145">
														</td>
														<td>
															170525145
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525145" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525145">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 19:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525146" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525146">
														</td>
														<td>
															170525146
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525146" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525146">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 20:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525147" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525147">
														</td>
														<td>
															170525147
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525147" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525147">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 20:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525148" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525148">
														</td>
														<td>
															170525148
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525148" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525148">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 20:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525149" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525149">
														</td>
														<td>
															170525149
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525149" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525149">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 20:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525150" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525150">
														</td>
														<td>
															170525150
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525150" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525150">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 20:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525151" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525151">
														</td>
														<td>
															170525151
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525151" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525151">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 20:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525152" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525152">
														</td>
														<td>
															170525152
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525152" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525152">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 20:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525153" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525153">
														</td>
														<td>
															170525153
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525153" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525153">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 20:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525154" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525154">
														</td>
														<td>
															170525154
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525154" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525154">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 20:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525155" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525155">
														</td>
														<td>
															170525155
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525155" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525155">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 20:49:55
														</td>
													</tr>
													<tr id="tr_trace_170525156" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525156">
														</td>
														<td>
															170525156
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525156" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525156">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 20:54:55
														</td>
													</tr>
													<tr id="tr_trace_170525157" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525157">
														</td>
														<td>
															170525157
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525157" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525157">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 20:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525158" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525158">
														</td>
														<td>
															170525158
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525158" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525158">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 21:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525159" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525159">
														</td>
														<td>
															170525159
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525159" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525159">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 21:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525160" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525160">
														</td>
														<td>
															170525160
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525160" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525160">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 21:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525161" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525161">
														</td>
														<td>
															170525161
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525161" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525161">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 21:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525162" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525162">
														</td>
														<td>
															170525162
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525162" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525162">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 21:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525163" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525163">
														</td>
														<td>
															170525163
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525163" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525163">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 21:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525164" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525164">
														</td>
														<td>
															170525164
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525164" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525164">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 21:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525165" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525165">
														</td>
														<td>
															170525165
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525165" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525165">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 21:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525166" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525166">
														</td>
														<td>
															170525166
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525166" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525166">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 21:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525167" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525167">
														</td>
														<td>
															170525167
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525167" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525167">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 21:49:55
														</td>
													</tr>
													<tr id="tr_trace_170525168" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525168">
														</td>
														<td>
															170525168
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525168" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525168">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 21:54:55
														</td>
													</tr>
													<tr id="tr_trace_170525169" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525169">
														</td>
														<td>
															170525169
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525169" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525169">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 21:59:55
														</td>
													</tr>
													<tr id="tr_trace_170525170" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525170">
														</td>
														<td>
															170525170
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525170" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525170">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 22:04:55
														</td>
													</tr>
													<tr id="tr_trace_170525171" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525171">
														</td>
														<td>
															170525171
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525171" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525171">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 22:09:55
														</td>
													</tr>
													<tr id="tr_trace_170525172" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525172">
														</td>
														<td>
															170525172
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525172" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525172">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 22:14:55
														</td>
													</tr>
													<tr id="tr_trace_170525173" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525173">
														</td>
														<td>
															170525173
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525173" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525173">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 22:19:55
														</td>
													</tr>
													<tr id="tr_trace_170525174" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525174">
														</td>
														<td>
															170525174
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525174" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525174">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 22:24:55
														</td>
													</tr>
													<tr id="tr_trace_170525175" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525175">
														</td>
														<td>
															170525175
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525175" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525175">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 22:29:55
														</td>
													</tr>
													<tr id="tr_trace_170525176" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525176">
														</td>
														<td>
															170525176
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525176" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525176">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 22:34:55
														</td>
													</tr>
													<tr id="tr_trace_170525177" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525177">
														</td>
														<td>
															170525177
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525177" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525177">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 22:39:55
														</td>
													</tr>
													<tr id="tr_trace_170525178" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525178">
														</td>
														<td>
															170525178
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525178" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525178">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 22:44:55
														</td>
													</tr>
													<tr id="tr_trace_170525179" class="">
														<td class="r1">
															<input type="checkbox" name="lt_trace_issues[]" value="170525179">
														</td>
														<td>
															170525179
														</td>
														<td class="nosel">
															<input name="lt_trace_times_170525179" type="text" class="r2" value="0"
															disabled="">
															倍
														</td>
														<td>
															￥
															<span id="lt_trace_money_170525179">
																0.00
															</span>
														</td>
														<td>
															2017-05-25 22:49:55
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<input type="hidden" name="lotteryid" id="lotteryid" value="15">
										<input type="hidden" name="flag" id="flag" value="save">
										<div class="zhgen">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tbody>
													<tr>
														<td>
															追号期数:
															<select id="lt_trace_qissueno">
																<option value="">
																	请选择
																</option>
																<option value="5">
																	5期
																</option>
																<option value="10" selected="">
																	10期
																</option>
																<option value="15">
																	15期
																</option>
																<option value="20">
																	20期
																</option>
																<option value="25">
																	25期
																</option>
																<option value="all">
																	全部
																</option>
															</select>
															总期数:
															<span class="y" id="lt_trace_count">
																0
															</span>
															期追号总金额:
															<span class="y" id="lt_trace_hmoney">
																0
															</span>
															元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;追号计划:
															<span id="lt_trace_labelhtml">
																<span id="lt_margin_html">
																	起始倍数&nbsp;
																	<input name="lt_trace_times_margin" type="text" id="lt_trace_times_margin"
																	value="1" size="3">
																	&nbsp;&nbsp;最低收益率&nbsp;
																	<input name="lt_trace_margin" type="text" id="lt_trace_margin" value="50"
																	size="3">
																	%&nbsp;&nbsp;
																</span>
																<span id="lt_sametime_html" style="display:none;">
																	起始倍数&nbsp;
																	<input name="lt_trace_times_same" type="text" id="lt_trace_times_same"
																	value="1" size="3">
																</span>
																<span id="lt_difftime_html" style="display:none;">
																	隔&nbsp;
																	<input name="lt_trace_diff" type="text" id="lt_trace_diff" value="1" size="3">
																	&nbsp;期&nbsp;&nbsp;倍×
																	<input name="lt_trace_times_diff" type="text" id="lt_trace_times_diff"
																	value="2" size="3">
																</span>
																&nbsp;&nbsp;追号期数&nbsp;
																<input name="lt_trace_count_input" type="text" id="lt_trace_count_input"
																style="width:36px" value="10" size="3">
																<input type="hidden" id="lt_trace_money" name="lt_trace_money" value="0">
																<input type="hidden" id="lt_trace_alcount" value="217">
															</span>
														</td>
														<td rowspan="2" valign="bottom" align="right">
															<div class="g_submit" id="lt_trace_ok" style="display: none;">
																<span>
																</span>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
											<div class="g_submit" id="lt_buy_trace">
												<span class="fa fa-check-square-o fa-lg">
												</span>
												确认投注
											</div>
											<span>
												<label class="tbn_clear02" for="lt_trace_if" name="lt_trace_if" title="取消追号">
													取消
												</label>
											</span>
											<label class="zh_continue" name="lt_trace_stop">
												<input type="checkbox" name="lt_trace_stop" id="lt_trace_stop" disabled="disabled"
												value="yes">
												中奖后停止追号
											</label>
										</div>
									</div>
								</div>
								<!--追号区结束-->
							</div>
							<div class="clear">
							</div>
							<!--游戏记录开始-->
							<div class="gm_con">
								<div class="gm_con_to">
									<div class="yx_body">
										<div class="unit">
											<div class="unit_title">
												<div class="ut_l">
												</div>
												<h4>
													<label class="yx_title">
														游戏记录
													</label>
												</h4>
												<div class="ut_r">
												</div>
											</div>
										</div>
										<div class="yx_box">
											<div class="yxlist">
												<table width="100%" border="0" cellspacing="0" cellpadding="0">
													<tbody>
														<tr>
															<th>
																注单编号
															</th>
															<th>
																投注时间
															</th>
															<th>
																玩法
															</th>
															<th>
																期号
															</th>
															<th>
																投注内容
															</th>
															<th>
																倍数
															</th>
															<th>
																模式
															</th>
															<th>
																总金额(元)
															</th>
															<th>
																奖金(元)
															</th>
															<th>
																状态
															</th>
														</tr>
													</tbody>
													<tbody class="projectlist">
														<tr class="no-records">
															<td height="37" colspan="10" align="center">
																没有找到指定条件的投注记录
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--游戏记录结束-->
						</div>
					</div>
				</div>
			</div>

	<?php $this->load->view('\template\footer.php')?>
	<script type="text/javascript">
		var lotteryId = <?=$this->input->get('id' , true)?>;
		var nextLotteryTime = <?=$Next_lottery_time?>;
	</script>
	<script type="text/javascript" src="./assets/js/lottery.js"></script>
</body>
</html>