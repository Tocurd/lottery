<?php
$config['seeting'] = array(
	'base_url' => 'http://127.168.0.1:8080/lottery_admin/',
	'api_url' => 'http://api.tocurd.com/',

	'admin_view' => 'admin',
	'home_view' => 'home'
);


// 彩种规则
$config['lottery_rules'] = array(
	array(
		'name' => '时时彩',
		'data' => 'shishi',
		'max_count' => 5,
		'rules' => array(



			array(
				'name' => '五星',
				'rules' => array(
					array(
						'name' => '五星复式',
						'data' => 'five_stars',
						'rule' => '1=a&&2=b&&3=c&&4=d&&5=e'
					) ,
					array(
						'name' => '五星单式',
						'data' => 'five_star',
						'rule' => '1=a&&2=b&&3=c&&4=d&&5=e'
					) ,
				)
			) ,



			array(
				'name' => '四星',
				'rules' => array(
					array(
						'name' => '前四复式',
						'data' => 'start_four_stars',
						'rule' => '1=a&&2=b&&3=c&&4=d'
					) ,
					array(
						'name' => '前四单式',
						'data' => 'start_four_star',
						'rule' => '1=a&&2=b&&3=c&&4=d'
					) ,
					array(
						'name' => '后四复式',
						'data' => 'end_four_stars',
						'rule' => '2=b&&3=c&&4=d&&5=e'
					) ,
					array(
						'name' => '后四单式',
						'data' => 'end_four_star',
						'rule' => '2=b&&3=c&&4=d&&5=e'
					) ,
				)
			) ,






			array(
				'name' => '三星',
				'rules' => array(
					array(
						'name' => '前三复式',
						'data' => 'start_three_stars',
						'rule' => '1=a&&2=b&&3=c'
					) ,
					array(
						'name' => '前三单式',
						'data' => 'start_three_star',
						'rule' => '1=a&&2=b&&3=c'
					) ,
					array(
						'name' => '中三复式',
						'data' => 'center_three_stars',
						'rule' => '2=b&&3=c&&4=d'
					) ,
					array(
						'name' => '中三单式',
						'data' => 'center_three_star',
						'rule' => '2=b&&3=c&&4=d'
					) ,
					array(
						'name' => '后三复式',
						'data' => 'end_three_stars',
						'rule' => '3=c&&4=d&&5=e'
					) ,
					array(
						'name' => '后三单式',
						'data' => 'end_three_star',
						'rule' => '3=c&&4=d&&5=e'
					) ,
					array(
						'name' => '后三组三',
						'data' => 'end_three_group_three',
						'rule' => ''
					) ,
					array(
						'name' => '后三组六',
						'data' => 'end_three_group_six',
						'rule' => ''
					) ,
				)
			) ,

			array(
				'name' => '二星',
				'rules' => array(
					array(
						'name' => '前二复式',
						'data' => 'start_two_stars',
						'rule' => '1=a&&2=b'
					) ,
					array(
						'name' => '前二单式',
						'data' => 'start_two_star',
						'rule' => '1=a&&2=b'
					) ,
					array(
						'name' => '后二复式',
						'data' => 'end_two_stars',
						'rule' => '4=d&&5=e'
					) ,
					array(
						'name' => '后二单式',
						'data' => 'end_two_star',
						'rule' => '4=d&&5=e'
					) ,
					
				)
			) ,


			array(
				'name' => '定位胆',
				'rules' => array(
					array(
						'name' => '五星定位胆',
						'data' => 'five_location',
						'rule' => '1=a||2=b||3=c||4=d||5=e'
					) ,
				)
			) ,

		)
	),
	// array(
	// 	'name' => '北京赛车',
	// 	'data' => 'beijingcat',
	// 	'max_count' => 10,
	// 	'rules' => array(
	// 		array(
	// 			'name' => '猜冠军',
	// 			'rules' => array(
	// 				array(
	// 					'name' => '猜冠军',
	// 					'data' => 'five_stars',
	// 					'rule' => '1=a||2=b||3=c||4=d||5=e||6=f||7=g||8=h||9=i||10=j'
	// 				) ,
	// 			)
	// 		) ,

	// 		array(
	// 			'name' => '猜冠亚军',
	// 			'rules' => array(
	// 				array(
	// 					'name' => '猜冠亚军',
	// 					'data' => 'five_stars',
	// 					'rule' => '1=a||2=b||3=c||4=d||5=e||6=f||7=g||8=h||9=i||10=j'
	// 				) ,
	// 			)
	// 		) ,

	// 	)

	// )
);
