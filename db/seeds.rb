# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [
	{ name: '生活', children: [
		{ name: '家居', tags:[
			{ name: '清洁' },
			{ name: '种植' },
			{ name: '睡眠' },
			{ name: '照明' },
			{ name: '收纳' },
			{ name: '工具' },
			{ name: '家纺' },
			{ name: '家饰' },
			{ name: '计时' },
			{ name: '卫浴' },
			{ name: '智能家居' },
			{ name: '衣物护理' },
			{ name: '镜子' },
			{ name: '取暖' },
			{ name: '垃圾桶' },
			{ name: '烟灰缸' }
		] }, 
		{ name: '家具', tags:[
			{ name: '椅子' },
			{ name: '桌子' },
			{ name: '沙发' },
			{ name: '柜子' },
			{ name: '床' },
			{ name: '茶几' },
			{ name: '人体工程学' }
		] }, 
		{ name: '家电', tags:[
			{ name: '电视' },
			{ name: '冰箱' },
			{ name: '洗衣机' },
			{ name: '影音播放' },
			{ name: '空调' },
			{ name: '风扇' },
			{ name: '抽油烟机' },
			{ name: '燃气灶' }
		] },
		{ name: '宠物', tags: [
			{ name: '宠物休息' },
			{ name: '宠物出行' },
			{ name: '宠物玩具' },
			{ name: '宠物饮食' },
			{ name: '宠物健康' },
			{ name: '宠物训练' }
		] }
	]},
	{ name: '个人配饰', children: [
		{ name: '箱包', tags:[
			{ name: '摄影包' },
			{ name: '钱包' },
			{ name: '单肩包' },
			{ name: '双肩包' },
			{ name: '电脑包' },
			{ name: '旅行箱包' },
			{ name: '手包' },
			{ name: '钱包' },
			{ name: '护照夹' },
			{ name: '卡包' },
			{ name: '腰包' },
			{ name: '单肩包' },
			{ name: '公文包' },
			{ name: '手袋' }
		] }, 
		{ name: '手表', tags:[
			{ name: '智能手表' },
			{ name: '石英表' },
			{ name: '创意腕表' },
			{ name: '机械表' },
			{ name: '电子表' },
			{ name: '电波表' }
		] }, 
		{ name: '智能可穿戴', tags:[
			{ name: '智能手表' },
			{ name: '智能手环' },
			{ name: '其他智能配饰' },
			{ name: '运动追踪器' },
			{ name: '智能眼镜' },
			{ name: '智能产品配件' },
			{ name: '智能臂带' }
		] }, 
		{ name: '其他配饰', tags:[
			{ name: '打火机' },
			{ name: '首饰' },
			{ name: '钥匙链' },
			{ name: '伞' },
			{ name: '服饰' },
			{ name: '名片夹' },
			{ name: '腰带' },
			{ name: '手套' }，
			{ name: '个人配刀' },
			{ name: '怀表' },
			{ name: '烟盒' },
			{ name: '酒壶' },
			{ name: '袜子' }
		] }, 
		{ name: '眼镜', tags:[
			{ name: '智能眼镜' },
			{ name: '防辐射眼镜' },
			{ name: '太阳镜' },
			{ name: '眼镜收纳' },
			{ name: '镜框' },
			{ name: '隐形眼镜' },
			{ name: '近视眼镜' }
		] }
	]},
	{ name: '电脑', children: [
		{ name: '电脑配件', tags:[
			{ name: '插座' },
			{ name: '电脑包' },
			{ name: '平板保护套' },
			{ name: '线材收纳' },
			{ name: '电脑支架' },
			{ name: 'USB小工具' },
			{ name: '平板支架' },
			{ name: '电池' },
			{ name: '平板包' },
			{ name: '电脑贴膜' },
			{ name: '内胆包' },
			{ name: '电脑保护套' },
			{ name: '连接线' },
			{ name: '转换器' }
		] }, 
		{ name: '输入设备', tags:[
			{ name: '鼠标' },
			{ name: '键盘' },
			{ name: '手写笔' },
			{ name: '扫描仪' },
			{ name: '摄像头' },
			{ name: '手写板' },
			{ name: '数位板' }
		] }, 
		{ name: '存储产品', tags:[
			{ name: 'U盘' },
			{ name: '外置硬盘' },
			{ name: '移动硬盘' },
			{ name: '读卡器' }
		] }, 
		{ name: '输出设备', tags:[
			{ name: '投影仪' },
			{ name: '打印机' },
			{ name: '显示器' }
		] }, 
		{ name: '网络产品', tags:[
			{ name: '路由器' },
			{ name: '网络盒子' },
			{ name: '网络存储' },
			{ name: '网卡' },
			{ name: '网络配件' }
		] }, 
		{ name: '笔记本电脑', tags:[
			{ name: '轻便本' },
			{ name: '游戏本' },
			{ name: '专业本' },
			{ name: '商务本' },
			{ name: '家用本' }
		] }, 
		{ name: '平板电脑', tags:[
			{ name: 'Android平板' },
			{ name: '电纸书' },
			{ name: 'iOS平板' },
			{ name: 'Windows平板' }
		] }, 
		{ name: 'DIY配件', tags:[
			{ name: '内置硬盘' },
			{ name: '机箱' },
			{ name: '开发板' },
			{ name: 'cpu' },
			{ name: '电源' },
			{ name: '声卡' },
			{ name: '散热器' }
		] }, 
		{ name: '电脑整机', tags:[
			{ name: '家用机' },
			{ name: '工作站' },
			{ name: '服务器' }
		] }
	]},
	{ name: '饮食', children: [
		{ name: '厨房用品', tags:[
			{ name: '餐具' },
			{ name: '厨用小工具' },
			{ name: '厨具' },
			{ name: '冰镇' },
			{ name: '调味罐' },
			{ name: '厨房收纳' },
			{ name: '厨房计量工具' },
			{ name: '厨房刀剪' },
			{ name: '厨房清洁' },
			{ name: '砧板' }
		] }, 
		{ name: '水具', tags:[
			{ name: '办公杯' },
			{ name: '便携杯' },
			{ name: '保温杯' },
			{ name: '冰镇' },
			{ name: '烧水壶' },
			{ name: '滤水器' },
			{ name: '杯垫' },
			{ name: '智能杯' },
			{ name: '冷水壶' },
			{ name: '苏打水机' },
			{ name: '保温壶' }
		] }, 
		{ name: '水具', tags:[
			{ name: '办公杯' },
			{ name: '便携杯' },
			{ name: '保温杯' },
			{ name: '冰镇' },
			{ name: '烧水壶' },
			{ name: '滤水器' },
			{ name: '杯垫' },
			{ name: '智能杯' },
			{ name: '冷水壶' },
			{ name: '苏打水机' },
			{ name: '保温壶' }
		] }, 
		{ name: '厨房电器', tags:[
			{ name: '咖啡机' },
			{ name: '烤箱' },
			{ name: '面包机' },
			{ name: '榨汁机' },
			{ name: '烧烤炉' },
			{ name: '微波炉' },
			{ name: '电饭锅' },
			{ name: '电压力锅' },
			{ name: '豆浆机' },
			{ name: '洗碗机' },
			{ name: '消毒柜' },
			{ name: '电磁炉' },
			{ name: '搅伴机' },
			{ name: '酸奶机' },
			{ name: '蒸煮锅' },
			{ name: '电饼铛' },
			{ name: '三明治机' },
			{ name: '冰淇淋机' },
			{ name: '豆芽机' },
			{ name: '厨师机' },
			{ name: '厨房小电器' },
			{ name: '多士炉' },
			{ name: '炸锅' }
		] }, 
		{ name: '咖啡', tags:[
			{ name: '咖啡机' },
			{ name: '咖啡壶' },
			{ name: '磨豆机' },
			{ name: '打泡器' }
		] }, 
		{ name: '饮酒', tags:[
			{ name: '开瓶器' },
			{ name: '酒杯' },
			{ name: '酒架' },
			{ name: '酒塞' },
			{ name: '酒壶' },
			{ name: '醒酒器' },
			{ name: '酒' },
			{ name: '酒架' },
			{ name: '调酒' },
			{ name: '酒柜' }
		] }, 
		{ name: '饮茶', tags:[
			{ name: '茶具' },
			{ name: '滤茶器' },
			{ name: '茶托' }
		] }, 
		{ name: '食品', tags:[
			{ name: '休闲食品' },
			{ name: '饮料冲调' },
			{ name: '营养保健品' }
		] }
	]},
	{ name: '音乐', children: [
		{ name: '耳机', tags:[
			{ name: '头戴式耳机' },
			{ name: '入耳式耳塞' },
			{ name: '蓝牙耳机' },
			{ name: '运动耳机' },
			{ name: '耳放' },
			{ name: '平头式耳塞' },
			{ name: '耳机配件' },
			{ name: '' },
			{ name: '' },
			{ name: '' },
			{ name: '' },
			{ name: '' }
		] }, 
		{ name: '音箱', tags:[
			{ name: '无线音箱' },
			{ name: '桌面音箱' },
			{ name: '便携音箱' },
			{ name: '播放底座' },
			{ name: '环绕音箱' },
			{ name: 'Hi-Fi音箱' },
			{ name: '监听音箱' },
			{ name: '' },
			{ name: '' },
			{ name: '' }
		] }, 
		{ name: '随身听', tags:[
			{ name: 'MP3播放器' },
			{ name: '收音机' },
			{ name: 'CD播放器' }
		] }, 
		{ name: '乐器', tags:[
			{ name: '键盘乐器' },
			{ name: '弹拨乐器' },
			{ name: '智能乐器' },
			{ name: '创意乐器' },
			{ name: '吹奏乐器' },
			{ name: '管乐器' },
			{ name: '打击乐器' },
			{ name: '' },
			{ name: '' },
			{ name: '' },
			{ name: '' },
			{ name: '' }
		] }, 
		{ name: '音响', tags:[
			{ name: '家庭影院功放' },
			{ name: '桌面音响' },
			{ name: '便携音响' },
			{ name: 'Hi-Fi音响' }
		] }, 
		{ name: '拾音设备', tags:[
			{ name: '录音笔' },
			{ name: '麦克风' }
		] }
	]},
	{ name: '旅行运动', children: [
		{ name: '户外装备', tags:[
			{ name: '户外服装' },
			{ name: '户外鞋' },
			{ name: '户外工具' },
			{ name: '帐篷' },
			{ name: '睡袋' },
			{ name: '野炊用具' },
			{ name: '户外刀具' },
			{ name: '户外背包' },
			{ name: '' },
			{ name: '' },
			{ name: '' },
			{ name: '' }
		] }, 
		{ name: '交通工具', tags:[
			{ name: '骑行' },
			{ name: '电动代步车' },
			{ name: '滑板' },
			{ name: '摩托头盔' }
		] }, 
		{ name: '车载用品', tags:[
			{ name: '行车记录仪' },
			{ name: 'GPS导航仪' },
			{ name: '车载空气净化' },
			{ name: '车载电话' },
			{ name: '车载配件' },
			{ name: '安全座椅' },
			{ name: 'OBD' },
			{ name: '' },
			{ name: '' },
			{ name: '' }
		] }, 
		{ name: '旅行用品', tags:[
			{ name: '旅行箱包' },
			{ name: '睡眠用品' },
			{ name: '整理包' },
			{ name: '护照夹' },
			{ name: '防盗包' },
			{ name: '分装' },
			{ name: '行李牌' }
		] }, 
		{ name: '户外运动', tags:[
			{ name: '极限运动' },
			{ name: '游泳' },
			{ name: '高尔夫球' },
			{ name: '射箭' },
			{ name: '运动臂带' },
			{ name: '羽毛球' },
			{ name: '篮球' },
			{ name: '' },
			{ name: '' }
		] }, 
		{ name: '健身训练', tags:[
			{ name: '跑步机' },
			{ name: '哑铃' },
			{ name: '健身车' },
			{ name: '椭圆训练机' },
			{ name: '腰腹训练器' },
			{ name: '瑜伽综合训练器' },
			{ name: '' },
			{ name: '' },
			{ name: '' },
			{ name: '' },
			{ name: '' }
		] }
	]},
	{ name: '手机通信', children: [
		{ name: '手机充电', tags:[
			{ name: '移动电源' },
			{ name: '充电器' },
			{ name: '数据线' }
		] }, 
		{ name: '手机配件', tags:[
			{ name: '创意配件' },
			{ name: '手机支架' },
			{ name: '防丢器' },
			{ name: '触控笔' }
		] }, 
		{ name: '手机配饰', tags:[
			{ name: '手机壳' },
			{ name: '手机包' },
			{ name: '贴膜' },
			{ name: '防尘塞' }
		] }, 
		{ name: '手机', tags:[
			{ name: 'Android手机' },
			{ name: '创意手机' },
			{ name: '非智能手机' },
			{ name: 'iOS手机' },
			{ name: 'Windows手机' },
			{ name: '电话机' },
			{ name: 'BlackBerry手机' }
		] }, 
		{ name: '手机摄影', tags:[
			{ name: '手机镜头' }
		] }
	]},
	{ name: '文具', children: [
		{ name: '纸本书签', tags:[
			{ name: '纸质笔记本' },
			{ name: '书签' },
			{ name: '便签' },
			{ name: '绘图本' },
			{ name: '纸张' }
		] }, 
		{ name: '桌面用品', tags:[
			{ name: '桌面收纳' },
			{ name: '笔袋' },
			{ name: '桌面摆件' },
			{ name: '镇纸' },
			{ name: '卷笔刀' },
			{ name: '书立' },
			{ name: '笔筒' },
			{ name: '' },
			{ name: '' }
		] }, 
		{ name: '书写工具', tags:[
			{ name: '钢笔' },
			{ name: '圆珠笔' },
			{ name: '铅笔' },
			{ name: '墨水' },
			{ name: '水性笔' },
			{ name: '记号笔' },
			{ name: '毛笔' }
		] }, 
		{ name: '创意文具', tags:[
			{ name: '创意纸本' },
			{ name: '创意笔' },
			{ name: '贴纸' },
			{ name: '礼品套装' },
			{ name: '创意书籍' }
		] }, 
		{ name: '文件处理', tags:[
			{ name: '胶带' },
			{ name: '文件夹' },
			{ name: '订书机' },
			{ name: '印章' },
			{ name: '图钉' },
			{ name: '夹子' },
			{ name: '回形针' },
			{ name: '' },
			{ name: '' },
			{ name: '' },
			{ name: '' }
		] }, 
		{ name: '绘图工具', tags:[
			{ name: '绘图铅笔' },
			{ name: '彩笔' },
			{ name: '尺子' },
			{ name: '颜料' },
			{ name: '马克笔' },
			{ name: '针管笔' },
			{ name: '漫画笔' }
		] }, 
		{ name: '剪裁涂改', tags:[
			{ name: '裁纸刀' },
			{ name: '橡皮' },
			{ name: '剪刀' },
			{ name: '修正带' },
			{ name: '篆刻刀' },
			{ name: '切割器' }
		] }
	]},
	{ name: '玩具', children: [
		{ name: '', tags:[
			{ name: '' },
			{ name: '' }
		] }, 
		{ name: '', tags:[
			{ name: '' },
			{ name: '' }
		] }
	]},
	{ name: '摄影', children: [
		{ name: '', tags:[
			{ name: '' },
			{ name: '' }
		] }, 
		{ name: '', tags:[
			{ name: '' },
			{ name: '' }
		] }
	]},
	{ name: '个护', children: [
		{ name: '', tags:[
			{ name: '' },
			{ name: '' }
		] }, 
		{ name: '', tags:[
			{ name: '' },
			{ name: '' }
		] }
	]},
	{ name: '健康', children: [
		{ name: '', tags:[
			{ name: '' },
			{ name: '' }
		] }, 
		{ name: '', tags:[
			{ name: '' },
			{ name: '' }
		] }
	]},
	{ name: '游戏', children: [
		{ name: '', tags:[
			{ name: '' },
			{ name: '' }
		] }, 
		{ name: '', tags:[
			{ name: '' },
			{ name: '' }
		] }
	]}
]