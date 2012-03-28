//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {
    import com.haloer.net.*;
    import com.adobe.serialization.json.*;
    import com.assist.*;

    public class RoleType {

        private static const Roles:Object = {
            1:[JianLingNan, "剑灵男", 2],
            2:[JianLingNv, "剑灵女", 2],
            3:[WuShengNan, "武圣男", 1],
            4:[WuShengNv, "武圣女", 1],
            5:[FeiYuNan, "飞羽男", 3],
            6:[FeiYuNv, "飞羽女", 3],
            8:[JiangChen, "将臣", 5],
            9:[ChuChu, "楚楚", 2],
            10:[JinMingCheng, "金明成", 3],
            11:[TianQi, "天泣", 2],
            12:[JuMang, "句芒", 3],
            13:[ChengXianKuang, "程仙狂", 6],
            14:[XiaoShiMei, "小师妹", 1],
            15:[MoWangXingTian, "魔王刑天", 2],
            16:[MoNvYeMei, "魔女夜魅", 5],
            17:[MoJiangWuLuo, "魔将武罗", 1],
            18:[YaoRao, "妖娆", 6],
            19:[YingLong, "应龙", 6],
            20:[MengPo, "孟婆", 6],
            22:[ZhangMaZi, "张麻子", 2],
            23:[XiaoXianTong, "小仙童", 6],
            24:[NieXiaoQian, "聂小倩", 6],
            25:[NingCaiChen, "宁采臣", 6],
            26:[WanYaoHuang, "万妖皇", 5],
            27:[CaiShen, "财神", 6],
            28:[JiuXianWeng, "酒仙翁", 6],
            29:[AKuan, "阿宽", 1],
            30:[RanKui, "燃魁", 1],
            31:[LuoChaJianShen, "罗刹剑神", 2],
            32:[XiaoLongNv, "小龙女", 6],
            33:[WuDaoJiangJun, "五道将军", 5],
            34:[LeiZhenZi, "雷震子", 3],
            35:[YangJian, "杨戬", 5],
            36:[LuoHuWang, "罗虎王", 1],
            37:[MeiYingYaoShu, "魅影", 6],
            38:[ShiRenMoZuZhang, "龅牙", 5],
            39:[HeiYiFeiYu, "黑羽", 3],
            40:[SaFeiLuoSi, "萨菲罗斯", 2],
            41:[JiuFeng, "九凤", 2],
            42:[DaDaDaoZhang, "达达道长", 6],
            43:[ShuShengXian, "书生贤", 6],
            44:[HuaShiYan, "画师燕", 6],
            45:[MuTingTao, "大魔王", 1],
            46:[JiaLinXianRen, "加林仙人", 3],
            47:[ZhiLinXianRen, "志林仙人", 2],
            48:[MuDanXianZi, "牡丹仙子", 6],
            49:[HeBo, "河伯", 6],
            50:[HongHaiEr, "红孩儿", 5],
            51:[TieShanGongZhu, "铁扇公主", 6],
            52:[NiuMoWang, "牛魔王", 5],
            53:[ABo, "阿波", 1],
            54:[JuLingShen, "巨灵神", 5],
            55:[GongBenWuZang, "宫本武藏", 2],
            56:[BiLinXianRen, "毕林仙人", 1],
            57:[AFei, "阿飞", 2],
            58:[QiTianDaSheng, "齐天大圣", 5],
            59:[HouYi, "后羿", 3],
            60:[ChangE, "嫦娥", 6]
        };
        public static const JianLingNan:String = "JianLingNan";
        public static const JianLingNv:String = "JianLingNv";
        public static const WuShengNan:String = "WuShengNan";
        public static const WuShengNv:String = "WuShengNv";
        public static const FeiYuNan:String = "FeiYuNan";
        public static const FeiYuNv:String = "FeiYuNv";
        public static const JiangChen:String = "JiangChen";
        public static const ChuChu:String = "ChuChu";
        public static const JinMingCheng:String = "JinMingCheng";
        public static const TianQi:String = "TianQi";
        public static const JuMang:String = "JuMang";
        public static const ChengXianKuang:String = "ChengXianKuang";
        public static const XiaoShiMei:String = "XiaoShiMei";
        public static const MoWangXingTian:String = "MoWangXingTian";
        public static const MoNvYeMei:String = "MoNvYeMei";
        public static const MoJiangWuLuo:String = "MoJiangWuLuo";
        public static const YaoRao:String = "YaoRao";
        public static const YingLong:String = "YingLong";
        public static const MengPo:String = "MengPo";
        public static const ZhangMaZi:String = "ZhangMaZi";
        public static const XiaoXianTong:String = "XiaoXianTong";
        public static const NieXiaoQian:String = "NieXiaoQian";
        public static const NingCaiChen:String = "NingCaiChen";
        public static const WanYaoHuang:String = "WanYaoHuang";
        public static const CaiShen:String = "CaiShen";
        public static const JiuXianWeng:String = "JiuXianWeng";
        public static const AKuan:String = "AKuan";
        public static const RanKui:String = "RanKui";
        public static const LuoChaJianShen:String = "LuoChaJianShen";
        public static const XiaoLongNv:String = "XiaoLongNv";
        public static const WuDaoJiangJun:String = "WuDaoJiangJun";
        public static const LeiZhenZi:String = "LeiZhenZi";
        public static const YangJian:String = "YangJian";
        public static const LuoHuWang:String = "LuoHuWang";
        public static const MeiYingYaoShu:String = "MeiYingYaoShu";
        public static const ShiRenMoZuZhang:String = "ShiRenMoZuZhang";
        public static const HeiYiFeiYu:String = "HeiYiFeiYu";
        public static const SaFeiLuoSi:String = "SaFeiLuoSi";
        public static const JiuFeng:String = "JiuFeng";
        public static const DaDaDaoZhang:String = "DaDaDaoZhang";
        public static const ShuShengXian:String = "ShuShengXian";
        public static const HuaShiYan:String = "HuaShiYan";
        public static const MuTingTao:String = "MuTingTao";
        public static const JiaLinXianRen:String = "JiaLinXianRen";
        public static const ZhiLinXianRen:String = "ZhiLinXianRen";
        public static const MuDanXianZi:String = "MuDanXianZi";
        public static const HeBo:String = "HeBo";
        public static const HongHaiEr:String = "HongHaiEr";
        public static const TieShanGongZhu:String = "TieShanGongZhu";
        public static const NiuMoWang:String = "NiuMoWang";
        public static const ABo:String = "ABo";
        public static const JuLingShen:String = "JuLingShen";
        public static const GongBenWuZang:String = "GongBenWuZang";
        public static const BiLinXianRen:String = "BiLinXianRen";
        public static const AFei:String = "AFei";
        public static const QiTianDaSheng:String = "QiTianDaSheng";
        public static const HouYi:String = "HouYi";
        public static const ChangE:String = "ChangE";
        private static const Jobs:Object = {
            1:[WuSheng, "武圣"],
            2:[JianLing, "剑灵"],
            3:[FeiYu, "飞羽"],
            5:[JiangXing, "将星"],
            6:[ShuShi, "术士"],
            7:[FangShi, "方士"],
            8:[MT, "MT"],
            9:[DPS, "DPS"],
            10:[FaShu, "法术"],
            11:[GongJian, "弓箭"]
        };
        public static const WuSheng:String = "WuSheng";
        public static const JianLing:String = "JianLing";
        public static const FeiYu:String = "FeiYu";
        public static const JiangXing:String = "JiangXing";
        public static const ShuShi:String = "ShuShi";
        public static const FangShi:String = "FangShi";
        public static const MT:String = "MT";
        public static const DPS:String = "DPS";
        public static const FaShu:String = "FaShu";
        public static const GongJian:String = "GongJian";
        public static const Nan:String = "Nan";
        public static const Nv:String = "Nv";

        private static var _jobLevelData:Object;

        public static function loadJobLevelData(_arg1:Function, _arg2:Function=null):void{
            var callback:* = _arg1;
            var error:Function = _arg2;
            if (_jobLevelData){
                callback();
                return;
            };
            var url:* = (URI.assetsUrl + "templet/role/role_job_level_data.txt");
            url = (url + ("?v=" + URI.getVersion(url)));
            var http:* = new HTTP();
            http.onComplete = function (_arg1:String):void{
                formatData(com.adobe.serialization.json.JSON.decode(_arg1));
                callback();
            };
            http.load(url);
        }
        private static function formatData(_arg1:Object):void{
            _jobLevelData = _arg1;
        }
        public static function getJobExp(_arg1:int, _arg2:int):int{
            return ((_jobLevelData[_arg1]) ? ((_jobLevelData[_arg1][(_arg2 - 1)]) || (0)) : 0);
        }
        public static function getJobMaxLevel(_arg1:int):int{
            var _local2:int = (_jobLevelData[_arg1]) ? _jobLevelData[_arg1].length : 0;
            return (_local2);
        }
        public static function getRoleIdByMix(_arg1:String, _arg2:String):int{
            var _local3:String = (_arg2 + _arg1);
            return (getRoleId(_local3));
        }
        public static function getRoleId(_arg1:String):int{
            var _local2:Object;
            for (_local2 in Roles) {
                if (Roles[_local2][0] == _arg1){
                    return ((_local2 as int));
                };
            };
            return (0);
        }
        public static function getRoleSign(_arg1:int):String{
            if (Roles[_arg1]){
                return (Roles[_arg1][0]);
            };
            return ("");
        }
        public static function getRoleSigns(_arg1:Array):Array{
            var _local3:Object;
            var _local4:String;
            var _local2:Array = [];
            for each (_local3 in _arg1) {
                _local4 = getRoleSign((_local3 as int));
                if (_local4){
                    _local2.push(_local4);
                };
            };
            return (_local2);
        }
        public static function getRoleName(_arg1:int):String{
            return ((Roles[_arg1]) ? Roles[_arg1][1] : "");
        }
        public static function getRoleNameByRoleSign(_arg1:String):String{
            var _local3:Array;
            var _local2:String = "";
            for each (_local3 in Roles) {
                if (_local3[0] == _arg1){
                    return (_local3[1]);
                };
            };
            return (_local2);
        }
        public static function getRoleSignByRoleName(_arg1:String):String{
            var _local2:Array;
            for each (_local2 in Roles) {
                if (_local2[1] == _arg1){
                    return (_local2[0]);
                };
            };
            return ("");
        }
        public static function getJobIdByRoleId(_arg1:int):int{
            return ((Roles[_arg1]) ? Roles[_arg1][2] : 0);
        }
        public static function getJobSign(_arg1:int):String{
            return ((Jobs[_arg1]) ? Jobs[_arg1][0] : "");
        }
        public static function getJobSignByRoleId(_arg1:int):String{
            var _local2:int = getJobIdByRoleId(_arg1);
            return (getJobSign(_local2));
        }
        public static function getJobName(_arg1:int):String{
            return ((Jobs[_arg1]) ? Jobs[_arg1][1] : "");
        }
        public static function getJobIdByRoleSign(_arg1:String):int{
            var _local2:int = getRoleId(_arg1);
            return (getJobIdByRoleId(_local2));
        }
        public static function getJobIdByJobSign(_arg1:String):int{
            var _local2:Object;
            for (_local2 in Jobs) {
                if (Jobs[_local2][0] == _arg1){
                    return ((_local2 as int));
                };
            };
            return (0);
        }
        public static function getJobNameByRoleSign(_arg1:String):String{
            var _local2:int = getJobIdByRoleSign(_arg1);
            return (getJobName(_local2));
        }
        public static function isMainRole(_arg1:String):Boolean{
            return ((((((((((((JianLingNan == _arg1)) || ((JianLingNv == _arg1)))) || ((WuShengNan == _arg1)))) || ((WuShengNv == _arg1)))) || ((FeiYuNan == _arg1)))) || ((FeiYuNv == _arg1))));
        }
        public static function getRoleGender(_arg1:int):String{
            var _local2:String = getRoleSign(_arg1);
            return ((/Nan$/.test(_local2)) ? Nan : Nv);
        }

    }
}//package com.assist.server 
