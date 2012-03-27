//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class NPCType {

        public static const NonFunction:int = 1;
        public static const ItemShopNPC:int = 2;
        public static const EquiShopNPC:int = 3;
        public static const ArmorShopNPC:int = 4;
        public static const WarehouseNPC:int = 5;
        public static const PartnersNPC:int = 6;
        public static const CardBuyNPC:int = 7;
        public static const ChooseCampNPC:int = 8;
        public static const SalaryNPC:int = 9;
        public static const ActivationKeysNPC:int = 10;
        public static const FateNPC:int = 11;
        public static const LuckyShopNPC:int = 12;
        public static const QuarterMasterNPC:int = 13;
        public static const FactionMangerNPC:int = 14;
        public static const FactionGodNPC:int = 15;
        private static const List:Object = {
            1:[CunZhang, "村长", "可别小看小渔村，我们村可是出了好多修仙者的！", "", 1],
            2:[JiuJianXian, "酒剑仙", "酒里自有仙道，仙道止乎醉梦乡！", "", 1],
            3:[ShuiLing, "水灵", "郎骑竹马来，绕床弄青梅；同居长干里，两小无嫌猜。", "", 1],
            4:[YunNiang, "芸娘", "天下攘攘，皆为利来！", "道具店", 2],
            5:[LiDaNiang, "李大娘", "世界上最醇的美酒就是本大娘酿的逍遥醉！", "伙伴邀请", 6],
            6:[LinTianNan, "林天南", "天下之大，无奇不有，唯有缘之人方能成仙！", "", 1],
            8:[JinXiLi, "金犀利", "犀利的剑让你的敌人永远没有抗拒的余地！", "装备商人", 3],
            9:[LuoTuoGe, "骆驼哥", "东西交给我保管准没错！", "仓库管理员", 5],
            11:[TieSuanPan, "铁算盘", "凡人总希望有个安稳的窝！", "伙伴邀请", 6],
            12:[LiGang, "李纲", "有道官场无情，却不知其中甘味！", "", 1],
            13:[LuWu, "陆吾", "三清化外天外天，九九归一人外人！", "玉牌商人", 7],
            14:[LiuRuYan, "柳如烟", "柳荫直，烟里丝丝弄碧！", "伙伴邀请", 6],
            15:[DuGuYun, "掌门独孤云", "我唯一的心愿就是让蜀山走上巅峰！", "", 1],
            16:[ZhuGeTao, "长老诸葛韬", "老朽不成仙，便化骨！", "", 1],
            17:[ShuShanJieYinDiZi, "蜀山接引弟子", "仙山底下住，延年益寿！", "", 1],
            18:[HuangDongYi, "掌门黄洞一", "百代，千代，万代，世世代代兴旺的秘诀就是人才！", "", 1],
            19:[ZhangQingZhi, "长老张清志", "要知天命，待天运，得道已！", "", 1],
            20:[KunLunJieYinDiZi, "昆仑接引弟子", "我从来不相信有比我更天才的天才！", "", 1],
            21:[FateHunter, "猎命", "猎取好命格，霸者无双！", "猎命", 11],
            22:[YingBoLong, "长老瀛伯龙", "这个世界，实力为尊！", "", 1],
            23:[PengLaiJieYinDiZi, "蓬莱接引弟子", "蓬莱仙岛可是圣地，不是人人都可以来的！", "", 1],
            24:[LunHui, "长老轮回", "循天命而制之，苦等之轮回！", "", 1],
            25:[MuRongYing, "慕容鹰", "那不是天生的宿命，只是没人敢迈出那一步！", "", 1],
            26:[GongSunWuJi, "公孙无忌 ", "退缩的背后就是悬崖！", "", 1],
            27:[SuChen, "苏晨", "飘渺的不是命运，而是大道！", "", 1],
            28:[ShangGuanDangKou, "上官荡寇", "世俗永远是成仙的牵绊，要么成人，要么成仙！", "", 1],
            29:[WuHeng, "无恒", "心本无尘，何故惹凡尘！", "", 1],
            31:[YingXinDaoRen, "迎新道人", "欢迎来到神仙道的世界！", "激活兑换礼券", 10],
            32:[TangHua, "唐华", "刹那芳华般的乐曲总是在苍月的沐浴下响起！", "", 1],
            33:[LiDaoChun, "李道纯", "道极而纯，动之千里。", "", 1],
            34:[LiuXueYan, "柳雪妍", "望着你的时候，总是感觉有点落寞!", "", 1],
            35:[HuangSanFeng, "黄三峰", "无梦仙之缘，何故幻影灭！", "", 1],
            36:[ATai, "阿泰", "那谁都难以企及的高度就是需要拥有一往无前的气势!", "", 1],
            37:[LiQiSi, "莉绮丝", "玄之为玄，道之为道！", "", 1],
            38:[ShenMiShangRen, "神秘商人", "每天可以来本商店刷到各种极品装备！", "神秘商人", 12],
            40:[BangPaiShangRen, "帮派商人", "只有想不到的，没有你买不到的！", "帮派商人", 13],
            41:[BangPaiHuFa, "帮派护法", "为了本帮的繁荣，本护法愿意奉献出一切！", "", 1],
            43:[LaoJun, "老君", "", "帮派祭神", 15],
            44:[ChenXuanQi, "陈玄奇", "苍茫一粟，勘破大道。", "", 1],
            45:[LiXiangYi, "李香怡", "拥有的未必是最美好的。", "", 1],
            47:[LiWenBo, "李文博", "达则兼济天下，穷则独善其身！", "", 1],
            48:[XiuXiu, "秀秀", "等待总是让秀秀难以释怀！", "", 1],
            49:[TuoBaLie1, "拓跋烈", "戎马一生，驰骋千里，只为梦萦！", "", 1],
            50:[TaoYao1, "桃夭", "桃之夭夭，灼灼其华。", "", 1],
            55:[LiYingYu, "李英玉", "黄凤羽归飞鸟雀，杜鹃花开牧牛羊。", "", 1],
            56:[JinJingHao, "金京浩", "天下本无事，庸人自扰之。", "", 1],
            57:[FengBoYuShi1, "风伯雨师", "掌八风消息，通五运之气候！", "", 1],
            58:[YouHen, "幽痕", "你是我不能言说的伤。", "", 1],
            59:[DaMoWang1, "大魔王", "天下之大，唯我独尊。", "", 1]
        };
        public static const CunZhang:String = "CunZhang";
        public static const JiuJianXian:String = "JiuJianXian";
        public static const ShuiLing:String = "ShuiLing";
        public static const YunNiang:String = "YunNiang";
        public static const LiDaNiang:String = "LiDaNiang";
        public static const LinTianNan:String = "LinTianNan";
        public static const JinXiLi:String = "JinXiLi";
        public static const LuoTuoGe:String = "LuoTuoGe";
        public static const TieSuanPan:String = "TieSuanPan";
        public static const LiGang:String = "LiGang";
        public static const LuWu:String = "LuWu";
        public static const LiuRuYan:String = "LiuRuYan";
        public static const DuGuYun:String = "DuGuYun";
        public static const ZhuGeTao:String = "ZhuGeTao";
        public static const ShuShanJieYinDiZi:String = "ShuShanJieYinDiZi";
        public static const HuangDongYi:String = "HuangDongYi";
        public static const ZhangQingZhi:String = "ZhangQingZhi";
        public static const KunLunJieYinDiZi:String = "KunLunJieYinDiZi";
        public static const FateHunter:String = "FateHunter";
        public static const YingBoLong:String = "YingBoLong";
        public static const PengLaiJieYinDiZi:String = "PengLaiJieYinDiZi";
        public static const LunHui:String = "LunHui";
        public static const MuRongYing:String = "MuRongYing";
        public static const GongSunWuJi:String = "GongSunWuJi";
        public static const SuChen:String = "SuChen";
        public static const ShangGuanDangKou:String = "ShangGuanDangKou";
        public static const WuHeng:String = "WuHeng";
        public static const YingXinDaoRen:String = "YingXinDaoRen";
        public static const TangHua:String = "TangHua";
        public static const LiDaoChun:String = "LiDaoChun";
        public static const LiuXueYan:String = "LiuXueYan";
        public static const HuangSanFeng:String = "HuangSanFeng";
        public static const ATai:String = "ATai";
        public static const LiQiSi:String = "LiQiSi";
        public static const ShenMiShangRen:String = "ShenMiShangRen";
        public static const BangPaiShangRen:String = "BangPaiShangRen";
        public static const BangPaiHuFa:String = "BangPaiHuFa";
        public static const LaoJun:String = "LaoJun";
        public static const ChenXuanQi:String = "ChenXuanQi";
        public static const LiXiangYi:String = "LiXiangYi";
        public static const LiWenBo:String = "LiWenBo";
        public static const XiuXiu:String = "XiuXiu";
        public static const TuoBaLie1:String = "TuoBaLie1";
        public static const TaoYao1:String = "TaoYao1";
        public static const LiYingYu:String = "LiYingYu";
        public static const JinJingHao:String = "JinJingHao";
        public static const FengBoYuShi1:String = "FengBoYuShi1";
        public static const YouHen:String = "YouHen";
        public static const DaMoWang1:String = "DaMoWang1";

        public static function getId(_arg1:String):int{
            var _local3:Object;
            var _local2:int;
            for (_local3 in List) {
                if (List[_local3][0] == _arg1){
                    _local2 = (_local3 as int);
                    break;
                };
            };
            return (_local2);
        }
        public static function getName(_arg1:int):String{
            return ((List[_arg1]) ? List[_arg1][1] : "");
        }
        public static function getNameBySign(_arg1:String):String{
            var _local2:Array = getListBySign(_arg1);
            return (((_local2[1]) || ("")));
        }
        private static function getDialog(_arg1:int):String{
            return ((List[_arg1]) ? List[_arg1][2] : "");
        }
        public static function getDialogBySign(_arg1:String):String{
            var _local2:Array = getListBySign(_arg1);
            return (((_local2[2]) || ("")));
        }
        private static function getFeature(_arg1:int):String{
            return ((List[_arg1]) ? List[_arg1][3] : "");
        }
        public static function getFeatureBySign(_arg1:String):String{
            var _local2:Array = getListBySign(_arg1);
            return (((_local2[3]) || ("")));
        }
        public static function getFunction(_arg1:int):int{
            return ((List[_arg1]) ? List[_arg1][4] : 0);
        }
        public static function getFunctionBySign(_arg1:String):int{
            var _local2:Array = getListBySign(_arg1);
            return (((_local2[4]) || (0)));
        }
        private static function getListBySign(_arg1:String):Array{
            var _local2:Object;
            for each (_local2 in List) {
                if (_local2[0] == _arg1){
                    return ((_local2 as Array));
                };
            };
            return ([]);
        }

    }
}//package com.assist.server 
