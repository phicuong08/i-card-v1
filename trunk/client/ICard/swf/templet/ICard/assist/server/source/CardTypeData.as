﻿//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.server.source {



			
    public class CardTypeData {
				
        public static const HeroCards:Object = {
						20000:["编号","英雄  ",	     "阵营  ","种族  ","费用  ","血量  ","能力  "],
						20001:[20001,"亮须波瑞斯"  ,"阵营","种族", 0,  26,"X，翻转亮须波瑞斯→波瑞斯对目标英雄或盟军治疗X点<br>伤害。此能力只能在你的回合中使用。"],
						20002:[20002,"迪兹莫娜"    ,"阵营","种族", 0,  28,"③，翻转迪兹莫娜，在她身上放置X点伤害→迪兹莫娜对<br>目标盟盟军造成X点暗影伤害。此能力只能在你的回合中使用。"],
						20003:[20003,"艾伦德尔"    ,"阵营","种族", 0,  28,"①，翻转艾伦德尔→你的远程武器本回合得到+3攻击力。"],
						20004:[20004,"格拉库斯"    ,"阵营","种族", 0,  29,"③，翻转格拉库斯→防止本回合将对目标英雄或盟军接下<br>来的3点伤害。"],
						20005:[20005,"燃霜莉特瑞"  ,"阵营","种族", 0,  25,"②，翻转燃霜莉特瑞→目标英雄或盟军本回合不能攻击。"]
        };
        public static const SkillCards:Object = {
				50000:["编号",	"法术  ",	    "阵营  ",	  "种族  ",	"费用  ",	"能力  "],
        		50001:[50001,"纠缠根须"    ,"中立","种族", 2,             "结附目标盟军，将其横置。持续：被结附的盟军在其操<br>控者重置步骤中不能被重置。"],
        		50002:[50002,"治疗之触"    ,"中立","种族", 3,             "你的英雄对目标英雄或盟军治疗10点伤害。"],
        		50003:[50003,"自然选择"    ,"中立","种族", 3,             "选择一项：你的英雄对目标英雄或盟军造成3点自然伤害；<br>或你的英雄对目标英雄或盟军治疗3点伤害。"],
        		50004:[50004,"愈合"        ,"中立","种族", 1,             "结附目标盟军，你的英雄对其治疗2点伤害。持续：在每<br>个回合结束时，你的英雄对被结附盟军治疗1点伤害。"],
        		50005:[50005,"瞄准射击"    ,"中立","种族", "1+X",         "你的英雄对目标英雄或盟军造成X点远程伤害。"],
        		50006:[50006,"奥术射击"    ,"中立","种族", 2,             "你的英雄对目标英雄或盟军造成1点奥术伤害。装一张牌。"],
        		50007:[50007,"死亡标记"    ,"中立","种族", 2,             "结附目标对方英雄或盟军。持续：你队伍中的盟军攻击<br>被结附者时得到+1攻击力。"],
        		50008:[50008,"多重射击"    ,"中立","种族", 5,             "你的英雄对最多三个目标英雄或盟军各造成2点远程伤害。"],
        		50009:[50009,"魔法反制"    ,"中立","种族", 2,             "打断目标技能。"]
        };
     		public static const TaskCards:Object = {
     			40000:["编号",	"任务  ",       "阵营  ","种族  ", "费用  ",  "能力  "],
				40001:[40001,"迪菲亚兄弟会"   ,"中立","种族",    1,         "当你队伍中有四个或以上的盟军时，支付①完成此任务。<br>奖励：抓两张牌"],
        		40002:[40002,"人马无双"       ,"中立","种族",    3,         "当对方任一队伍中的盟军数比你队伍的盟军数多时，<br>支付③完成此任务。奖励：抓两张牌。"],
        		40003:[40003,"为部落而战"     ,"中立","种族",    1,         "支付①完成此任务。奖励：你队伍中的部落盟军本回合<br>攻击时得到+1攻击力。"],
        		40004:[40004,"托雷克的突袭"   ,"中立","种族",    1,         "如果任一对方英雄本回合曾受到你队伍中的任一盟军造<br>成的伤害时，支付①完成此任务。奖励：抓一张牌"],
        		40005:[40005,"达隆郡的战斗"   ,"中立","种族",　  1,         "将你坟墓场中三张盟军牌移出游戏并支付①完成此任务。<br>奖励：抓一张牌。"],
        		40006:[40006,"王牌猎人"    	  ,"中立","种族",    2,         "支付②完成此任务。奖励：展示你牌库顶四张牌，将一张<br>被展示的装备牌置于你手上并将其余牌置于你牌库底。"],
        		40007:[40007,"蓝叶薯"         ,"中立","种族",    2,         "支付②完成此任务。奖励：将你的坟墓场洗入你的牌库。"],
        		40008:[40008,"捐献毛料"       ,"中立","种族",    1,         "支付①完成此任务。奖励：抓一张牌，然后弃一张牌。"],
        		40009:[40009,"在梦中"         ,"中立","种族",    8,         "支付⑧完成此任务。奖励：抓三张牌。"],
        		40010:[40010,"深入疯狂之口"   ,"中立","种族",    1,         "消灭深入疯狂之口完成此任务。奖励：抓一张牌。"]
     		};
     		public static const DefCards:Object = {
     			31000:["编号","防具  ",	      "阵营  ",    "种族  ","费用  ","防御  ","能力  "],
	       		31001:[31001,"多彩披风"       ,"中立","种族",   4,   0,   "若你的英雄将使用技能造成伤害时，改为它造成同等数量+1的伤害。"],
        		31002:[31002,"死灵胸甲"       ,"中立","种族",   3,   1,   "你的武器得到+2攻击力。"],
        		31003:[31003,"龙人之盾"       ,"中立","种族",   4,   4,   "你的英雄具有护卫。"],
        		31004:[31004,"剑师护手"       ,"中立","种族",   3,   1,   "你使用武器打击时少支付①。"],
        		31005:[31005,"雷德之眼"       ,"中立","种族",　 1,   0,   "你的武器得到+1攻击力。"],
        		31006:[31006,"乌瑟尔的腰带"   ,"中立","种族",   4,   2,   "④，横置→重置你的英雄和你一件近战武器"],
        		31007:[31007,"石颅头盔"       ,"中立","种族",   3,   3,   ""]
        };
        public static const WeaponCards:Object = {
        		30000:["编号","武器  ",	           "阵营  ", "种族  ", "费用  ",	"使用费用  ",	"攻击  ",    "能力"],
				30001:[30001,"上古骨弓"        ,"中立","种族",   3,   2,       2,     "当你使用上古骨弓进行打击时，你的英雄在此次战斗中具<br>有远程攻击（防御者不会对你造成战斗伤害）。"],
        		30002:[30002,"歼灭者"          ,"中立","种族",   2,   2,       3,     "你得英雄使用歼灭者造成的战斗伤害不能被防御"],
        		30003:[30003,"奥金斧"          ,"中立","种族",   7,   0,       5,     ""],
        		30004:[30004,"酒吧凶器"        ,"中立","种族",   2,   2,       2,     "当你英雄攻击任一横置英雄或盟军时，酒吧凶器得到+2攻击力。"],
        		30005:[30005,"碎灵"            ,"中立","种族",　 4,   2,       3,     "当你的英雄使用碎灵对任一英雄造成战斗伤害时，该英雄<br>操控者弃一张牌。"],
        		30006:[30006,"提米的手"        ,"中立","种族",   5,   3,       2,     "当你的英雄使用提米的手对任一英雄造成战斗伤害时，该<br>英雄操控者消灭他的一个资源"],
        		30007:[30007,"命运"            ,"中立","种族",   3,   2,       1,     "当你的英雄使用命运造成战斗伤害时，在命运上放置一个<br>力量示物。命运上每有一个力量示物，他便得到+1攻击力。"]
        };
        public static const SoldierCards:Object = {
        		21000:["编号  ",	"盟军  ",	      "阵营  ",    "种族  ",  "费用  ","血量  ","攻击  ","能力  "],
   				21001:[21001,"血爪"           ,"中立",   "DPS",   1,   2,       1,     "不可被指定"],
        		21002:[21002,"怒虎"           ,"中立",   "DPS",   2,   2,       3,     ""],
        		21003:[21003,"老骨头"         ,"中立",   "DPS",   2,   2,       2,     "潜行，横置-英雄或盟军获得潜行"],
        		21004:[21004,"老兵伯顿"       ,"中立",   "DPS",   2,   2,       3,     "不可被指定"],
        		21005:[21005,"铁炉堡守卫"     ,"中立",   "DPS",　 2,   1,       2,     "潜行"],
        		21006:[21006,"少校杜费拉"     ,"中立",   "DPS",   5,   1,       3,     "远程，隐遁"],
        		21007:[21007,"无情的米罗"     ,"中立",   "DPS",   6,   3,       4,     "远程，"],
        		21008:[21008,"缝合憎恶"       ,"中立",   "DPS",   4,   0,       0,     "在你的坟墓场每有一张盟军牌，缝合憎恶得到+1攻击力和<br>+1生命值。当缝合憎恶被造成伤害时，将你墓地中与伤害同等数量的盟军牌移出游戏。然后，每将一个盟军移出游戏，则在缝合憎恶身上移去1点伤害。"],
        		21009:[21009,"锤火艾扎"       ,"中立",   "DPS",   3,   2,       3,     "在每个回合的开始时，锤火艾扎对每个英雄各造成1点火焰伤害"],
				
				22000:["编号  ",	"盟军  ",	      "阵营  ",    "种族  ",  "费用  ","血量  ","攻击  ","能力  "],
				22001:[22001,"夜风夏琳"       ,"中立",   "TANK",   1,   1,       1,     "你每操控一件装备，该单位得到+1攻击和+1生命"],
        		22002:[22002,"哨兵格奎恩"     ,"中立",   "TANK",   4,   4,       3,     ""],
        		22003:[22003,"树歌"           ,"中立",   "TANK",   3,   3,       2,     ""],
        		22004:[22004,"血卫玛瓦尼"     ,"中立",   "TANK",   2,   3,       1,     ""],
        		22005:[22005,"维尔巴"         ,"中立",   "TANK",　 3,   2,       3,     "被消灭时，敌军一同消灭"],
        		22006:[22006,"追迹者格伦"     ,"中立",   "TANK",   2,   2,       2,     "处于防御时被敌军消灭，则对方也被消灭"],
        		22007:[22007,"长者莫佛"       ,"中立",   "TANK",   8,   4,       9,     "敌军攻击时，敌军会被消灭"],
        		22008:[22008,"剥夺者彦"       ,"中立",   "TANK",   4,   2,       2,     "当剥夺者彦进场时，你可以消灭目标武器"],
        		22009:[22009,"导师凯迪姆"     ,"中立",   "TANK",   6,   5,       5,     "护卫，潜行"],
				    22010:[22010,"祭司乔汉娜"     ,"中立",   "TANK",   3,   3,       3,     "牺牲-横置英雄或盟军"],
        		22011:[22011,"噬灵卡尔"       ,"中立",   "TANK",   5,   4,       5,     "其它盟军+1攻击和+1生命"],
        		22012:[22012,"大地守卫库岚"   ,"中立",   "TANK",   5,   5,       3,     "护卫"],
        		22013:[22013,"酋长萨尔"       ,"中立",   "TANK",   5,   5,       5,     "3-牺牲-消灭费用7以上目标"],
        		22014:[22014,"奥格瑞玛步兵"   ,"中立",   "TANK",　 1,   2,       1,     "你使用武器打击时少支付①。"],
				
				    23000:["编号",	"盟军  ",	      "阵营  ",    "种族  ",  "费用  ","血量  ","攻击  ","能力  "],
        		23001:[23001,"督军高图斯"     ,"中立"    ,"Healer",   4,   5,       1,     "１－横置-治疗目标所有伤害"],
        		23002:[23002,"克罗米"         ,"中立"    ,"Healer",   3,   3,       1,     "4-对敌方造成一点伤害，并弃张牌到坟"],
        		23003:[23003,"天怒拉克"       ,"中立"    ,"Healer",   3,   3,       3,     "伤害无法阻止"],
        		23004:[23004,"远射兰铎"       ,"中立"    ,"Healer",   6,   4,       5,     "进场时，能从坟取一张费用小于等于２的牌入手"],
				23005:[23005,"厄运守卫"       ,"中立"    ,"Healer",   2,   1,       2,     "进场时，目标盟军攻击力减3本轮"],
        		23006:[23006,"毒蛇"           ,"中立"    ,"Healer",   1,   2,       1,     "横置-防止对英雄或盟军1点伤害"],
        		23007:[23007,"铁骨切巴"       ,"中立"    ,"Healer",   6,   3,       3,     "横置-对敌4点伤害，对我方4点治疗"],
        		23008:[23008,"金色月亮"       ,"中立"    ,"Healer",   1,   2,       1,     "当拉奇进场时，可以为目标盟军或英雄治疗两点伤害"],
				23009:[23009,"罗特姐妹"       ,"中立"    ,"Healer",   5,   2,       5,     "当罗特姐妹上场时，你可以消灭目标技能"],
        		23010:[23010,"拉奇"           ,"中立"    ,"Healer",   2,   1,       2,     "当拉奇进场时，可以为目标盟军或英雄治疗1点伤害"],
				23011:[23011,"森林之王伊"     ,"中立"    ,"Healer",   2,   3,       1,     "横置-治疗目标所有伤害"]
				};
		public static const UseCard:Object={
							//ID    费用　目标数　我方英雄　我方盟军　敌方英雄　　敌方盟军　　　
							//英雄
							20001:["X",  1,      1,       1,        0,          0],	
							20002:[3,    1,      0,       0,        1,          1],
							20004:[3,    1,      1,       1,        0,          0],
							20005:[2,    1,      0,       0,        1,          1],
							//武器
							30001:[2,    1,      0,       0,        1,          1],
							30002:[2,    1,      0,       0,        1,          1],
							30003:[0,    1,      0,       0,        1,          1],
							30004:[2,    1,      0,       0,        1,          1],
							30005:[2,    1,      0,       0,        1,          1],
							30006:[3,    1,      0,       0,        1,          1],
							30007:[2,    1,      0,       0,        1,          1],
							//任务
							
							50001:[2,    1,      0,       0,        0,          1],
							50002:[3,    1,      1,       1,        0,          0],
							50003:[3,    1,      1,       1,        1,          1],
							50004:[1,    1,      0,       1,        0,          0],
							50005:["X",  1,      0,       0,        1,          1],
							50006:[2,    1,      0,       0,        1,          1],
							50007:[2,    1,      0,       0,        1,          1],
							50008:[5,    3,      0,       0,        1,          1],
							50009:[2,    1,      0,       0,        0,          0]
							
				};
				public static const CardAbility:Object={
				
							200010	:["WHEN_USE"					,"WHICH_MY"						,"DO_HEAL"							,-1		,"OP_AND"	,-1		,"LOOP_MY"	,1],
							200020	:["WHEN_USE"					,"WHICH_MYHERO"				,"DO_DAMAGE"						,-1		,"OP_AND"	,3		,"LOOP_MY"	,2],
							200020	:["WHEN_USE"					,"WHICH_YOURSOLDIER"	,"DO_DAMAGE"						,-1		,"OP_AND"	,3		,"LOOP_MY"	,2],
							200030	:["WHEN_USE"					,"WHICH_MYWEAPON"			,"BUF_ATK_ADD"					,3		,"OP_AND"	,1		,"LOOP_ONE"	,1],
							200040	:["WHEN_USE"					,"WHICH_MY"						,"BUF_SHIELD"						,3		,"OP_AND"	,3		,"LOOP_ONE"	,1],
							200050	:["WHEN_USE"					,"WHICH_YOUR"					,"BUF_ATK_UNABLE"				,0		,"OP_AND"	,2		,"LOOP_ONE"	,1],

							210010	:["WHEN_ALL"					,"WHICH_I"						,"BUF_POINT_UNABLE"			,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							210030	:["WHEN_ALL"					,"WHICH_I"						,"BUF_LATENT"						,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							210031	:["WHEN_USE"					,"WHICH_MY"						,"BUF_LATENT"						,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							210040	:["WHEN_ALL"					,"WHICH_I"						,"BUF_POINT_UNABLE"			,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							210050	:["WHEN_ALL"					,"WHICH_I"						,"BUF_LATENT"						,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							210060	:["WHEN_ALL"					,"WHICH_I"						,"BUF_ATK_DIST"					,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							210061	:["WHEN_ALL"					,"WHICH_I"						,"BUF_HIDDEN"						,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							210070	:["WHEN_ALL"					,"WHICH_I"						,"BUF_ATK_DIST"					,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							210090	:["WHEN_MY_LOOP_BEGIN"			,"WHICH_YOURHERO"				,"DO_DAMAGE"					,1						,"OP_AND"	,0		,"LOOP_ALL"	,99],
							
							220010	:["WHEN_ALL"					,"WHICH_I"						,"BUF_ATK_WITH_EQUIP"		,1		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							220011	:["WHEN_ALL"					,"WHICH_I"						,"BUF_HP_WITH_EQUIP"		,1		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							220050	:["WHEN_DEAD"					,"WHICH_SRC"					,"DO_KILL"							,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							220060	:["WHEN_DEF_DEAD"			,"WHICH_SRC"					,"DO_KILL"							,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							220070	:["WHEN_ATKED"				,"WHICH_SRC"					,"DO_KILL"							,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							220080	:["WHEN_ENTER"				,"WHICH_YOURWEAPON"		,"DO_KILL"							,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							220090	:["WHEN_ALL"					,"WHICH_I"						,"BUF_GUIDE"						,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							220091	:["WHEN_ALL"					,"WHICH_I"						,"BUF_LATENT"						,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							220100	:["WHEN_SACRIFICE"		,"WHICH_YOUR"					,"DO_SIDE"							,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							220120	:["WHEN_ALL"					,"WHICH_I"						,"BUF_GUIDE"						,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							220130	:["WHEN_SACRIFICE"		,"WHICH_YOURSOLDIER"	,"DO_KILL_COST_UP"			,7		,"OP_AND"	,3		,"LOOP_ONE"	,1],
							220140	:["WHEN_ALL"					,"WHICH_MYHERO"				,"BUF_STRIKE_COST_ADD"	,1		,"OP_AND"	,0		,"LOOP_ALL"	,1],
				
							230010	:["WHEN_USE"					,"WHICH_MY"						,"DO_HEAL"							,99		,"OP_AND"	,1		,"LOOP_ONE"	,1],
							230020	:["WHEN_USE"					,"WHICH_YOUR"					,"DO_DAMAGE"						,1		,"OP_AND"	,4		,"LOOP_ONE"	,1],
							230020	:["WHEN_USE"					,"WHICH_YOUR"					,"DO_DROP_HAND_CARD"		,1		,"OP_AND"	,4		,"LOOP_ONE"	,1],
							230030	:["WHEN_ALL"					,"WHICH_I"						,"BUF_DAMAGE_UNSTOP"		,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							230050	:["WHEN_ENTER"				,"WHICH_YOURSOLDIER"	,"BUF_ATK_ADD"					,-3		,"OP_AND"	,0		,"LOOP_ONE"	,1],
							230060	:["WHEN_USE"					,"WHICH_MY"						,"BUF_SHIELD"						,1		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							230070	:["WHEN_USE"					,"WHICH_MY"						,"DO_HEAL"							,4		,"OP_OR"	,0		,"LOOP_ONE"	,1],
							230071	:["WHEN_USE"					,"WHICH_YOUR"					,"DO_DAMAGE"						,4		,"OP_OR"	,0		,"LOOP_ONE"	,1],
							230080	:["WHEN_ENTER"				,"WHICH_MY"						,"DO_HEAL"							,2		,"OP_AND"	,0		,"LOOP_ONE"	,1],
							230090	:["WHEN_ENTER"				,"WHICH_SKILL"				,"DO_KILL"							,0		,"OP_AND"	,0		,"LOOP_ONE"	,1],
							230100	:["WHEN_ENTER"				,"WHICH_MY"						,"DO_HEAL"							,1		,"OP_AND"	,0		,"LOOP_ONE"	,1],
							230110	:["WHEN_USE"					,"WHICH_MY"						,"DO_HEAL"							,99		,"OP_AND"	,0		,"LOOP_ONE"	,1],

							300010	:["WHEN_USE"					,"WHICH_MYHERO"				,"BUF_ATK_DIST"					,0		,"OP_AND"	,2		,"LOOP_ONE"	,1],
							300020	:["WHEN_USE"					,"WHICH_DES"					,"BUF_DEF_UNABLE"				,0		,"OP_AND"	,3		,"LOOP_ONE"	,1],
							300040	:["WHEN_USE"					,"WHICH_YOUR"					,"DO_ATK_SIDE_ADD"			,2		,"OP_AND"	,2		,"LOOP_ONE"	,1],
							300050	:["WHEN_USE"					,"WHICH_YOURHERO"			,"DO_DROP_HAND_CARD"		,1		,"OP_AND"	,3		,"LOOP_ONE"	,1],
							300060	:["WHEN_ATK_DAMAGE"		,"WHICH_YOURHERO"			,"DO_DROP_RES"					,1		,"OP_AND"	,2		,"LOOP_ONE"	,1],
							300070	:["WHEN_ATK_DAMAGE"		,"WHICH_I"						,"BUF_ATK_ADD"					,1		,"OP_AND"	,1		,"LOOP_ALL"	,1],
			
							310010	:["WHEN_USE_SKILL"		,"WHICH_DES"					,"BUF_CURE"							,1		,"OP_AND"	,0		,"LOOP_ONE"	,1],
							310020	:["WHEN_ALL"					,"WHICH_MYHERO"				,"BUF_STRIKE_DAMAGE_ADD",2		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							310030	:["WHEN_ALL"					,"WHICH_MYHERO"				,"BUF_GUIDE"						,0		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							310040	:["WHEN_ALL"					,"WHICH_MYHERO"				,"BUF_STRIKE_COST_ADD"	,-1		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							310050	:["WHEN_ALL"					,"WHICH_MYHERO"				,"BUF_STRIKE_DAMAGE_ADD",1		,"OP_AND"	,0		,"LOOP_ALL"	,1],
							310060	:["WHEN_USE"					,"WHICH_MYHERO"				,"DO_RESET"							,0		,"OP_AND"	,4		,"LOOP_ONE"	,1],
							310061	:["WHEN_USE"					,"WHICH_MYWEAPON"			,"DO_RESET"							,0		,"OP_AND"	,4		,"LOOP_ONE"	,1],
			
							500010	:["WHEN_USE"					,"WHICH_YOURSOLDIER"	,"DO_SIDE"							,0		,"OP_AND"	,2		,"LOOP_ALL"	,1],
							500011	:["WHEN_USE"					,"WHICH_YOURSOLDIER"	,"BUF_SIDE"							,0		,"OP_AND"	,2		,"LOOP_ALL"	,1],
							500020	:["WHEN_USE"					,"WHICH_MY"						,"DO_HEAL"							,10		,"OP_AND"	,3		,"LOOP_ONE"	,1],
							500030	:["WHEN_USE"					,"WHICH_MY"						,"DO_HEAL"							,3		,"OP_OR"	,3		,"LOOP_ONE"	,1],
							500031	:["WHEN_USE"					,"WHICH_YOUR"					,"DO_DAMAGE"						,3		,"OP_OR"	,3		,"LOOP_ONE"	,1],
							500040	:["WHEN_USE"					,"WHICH_MYSOLDIER"		,"DO_HEAL"							,2		,"OP_AND"	,1		,"LOOP_ONE"	,1],
							500041	:["WHEN_MY_LOOP_END"	,"WHICH_MYSOLDIER"		,"BUF_HEAL"							,1		,"OP_AND"	,1		,"LOOP_ALL"	,1],
							500050	:["WHEN_USE"					,"WHICH_YOUR"					,"DO_DAMAGE"						,-1		,"OP_AND"	,-1		,"LOOP_ONE"	,1],
							500060	:["WHEN_USE"					,"WHICH_YOUR"					,"DO_DAMAGE"						,1		,"OP_AND"	,2		,"LOOP_ONE"	,1],
							500061	:["WHEN_USE"					,"WHICH_I"						,"DO_DROP_HAND_CARD"		,1		,"OP_AND"	,2		,"LOOP_ONE"	,1],
							500070	:["WHEN_USE"					,"WHICH_YOUR"					,"BUF_CURE"							,1		,"OP_AND"	,2		,"LOOP_ALL"	,1],
							500080	:["WHEN_USE"					,"WHICH_YOUR"					,"DO_DAMAGE"						,2		,"OP_AND"	,5		,"LOOP_ONE"	,3],
							500090	:["WHEN_USE"					,"WHICH_SKILL"				,"DO_BREAK_SKILL"				,0		,"OP_AND"	,2		,"LOOP_ONE"	,1]



				};
    }
}//package com.assist.server.source 
