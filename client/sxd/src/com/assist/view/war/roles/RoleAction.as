//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.war.roles {
    import com.assist.server.*;

    public class RoleAction {

        public static const LEFT:String = "left";
        public static const RIGHT:String = "right";
        public static const bothEffect:Object = [RoleStunt.ChengTianZaiWu, RoleStunt.YingXi, RoleStunt.ZhenSheShu, RoleStunt.QiShiErBian];

        private static var _list:Object = {};
        private static var _faces:Object = {};
        private static var _addonEffects:Object = {};
        private static var _sameStunts:Object = {};
        private static var _owns:Object = {};
        private static var _regPoints:Object = {};
        private static var _middleTriggers:Array = [];

        public static function get stuntList():Array{
            var _local2:String;
            var _local1:Array = [];
            for (_local2 in _list) {
                if ((((((((MonsterType.BossChiYanShou == _local2)) || ((MonsterType.BossDaoBaTu == _local2)))) || ((MonsterType.BossQingTianMu == _local2)))) || (("WorldBossMomentum" == _local2)))){
                } else {
                    _local1.push(_local2);
                };
            };
            return (_local1);
        }
        public static function isStunt(_arg1:String):Boolean{
            return (!((_list[_arg1] == null)));
        }
        public static function isBMD(_arg1:String):Boolean{
            return ((_list[_arg1] == 1));
        }
        public static function isMC(_arg1:String):Boolean{
            return ((_list[_arg1] == 0));
        }
        public static function isExists(_arg1:String):void{
            if (_list[_arg1] == null){
                throw (new Error((_arg1 + "不存在！")));
            };
        }
        public static function face(_arg1:String):String{
            return (((_faces[_arg1]) || ("")));
        }
        public static function addonEffect(_arg1:String):String{
            return (((_addonEffects[_arg1]) || ("")));
        }
        public static function sameStunt(_arg1:String):String{
            return (((_sameStunts[_arg1]) || (_arg1)));
        }
        public static function isOwn(_arg1:String):Boolean{
            return (((_owns[_arg1]) || (false)));
        }
        public static function isRegPoint(_arg1:String):Boolean{
            return (((_regPoints[_arg1]) || (false)));
        }
        public static function isMiddleTrigger(_arg1:String):Boolean{
            return ((_middleTriggers.indexOf(_arg1) > -1));
        }
        public static function affectSelf(_arg1:String):Boolean{
            return ((((((((((((isOwn(_arg1) == true)) && (!((RoleStunt.KuangBao == _arg1))))) && (!((RoleStunt.ZiBao == _arg1))))) && (!((RoleStunt.HuiChun == _arg1))))) && (!((RoleStunt.YinShen == _arg1))))) || ((RoleStunt.GuWuShu == _arg1))));
        }
        public static function init():void{
            addBMD(RoleStunt.YuJianShu, RoleStunt.MengJi, RoleStunt.BengJing, RoleStunt.FeiYuJian);
            addMC(RoleStunt.AXiuLuoBaWangQuan, RoleStunt.BaiLianHengJiang, RoleStunt.BaoYanLiuXingQun, RoleStunt.BeiCi, RoleStunt.BingJingZhou, RoleStunt.ChaNaFangHua, RoleStunt.ChangHongGuanRi, RoleStunt.ChengTianZaiWu, RoleStunt.ChuiMian, RoleStunt.DaHuoYanZhou, RoleStunt.DingShenZhou, RoleStunt.DuWu, RoleStunt.DuZhou, RoleStunt.ErDuanJi, RoleStunt.FengHuoLiaoYuan, RoleStunt.FengJuanCanYun, RoleStunt.FengJuanChenSheng, RoleStunt.FengShenJian, RoleStunt.FengXueBingTian, RoleStunt.FengZhou, RoleStunt.HongLianQiang, RoleStunt.HuaiZhongBaoMeiSha, RoleStunt.HuanYing, RoleStunt.HuoYanZhou, RoleStunt.HunDunZhiLi, RoleStunt.HunLuan, RoleStunt.JianLiuYun, RoleStunt.JingLeiShan, RoleStunt.JiuTianShenLei, RoleStunt.JueDuiFangYu, RoleStunt.JueDuiLingDu, RoleStunt.LeiTingJue, RoleStunt.LeiTingYiJi, RoleStunt.LeiZhou, RoleStunt.LingBao, RoleStunt.LingBaoDanMu, RoleStunt.LuoXingShi, RoleStunt.MoYingAnMie, RoleStunt.GuangMangWanZhang, RoleStunt.GuWuShu, RoleStunt.HuanMing, RoleStunt.HuanShu, RoleStunt.HuiChun, RoleStunt.JiuSiYiSheng, RoleStunt.JuHun, RoleStunt.KuangBao, RoleStunt.LiZhiBaTi, RoleStunt.MengPoTang, RoleStunt.NianYa, RoleStunt.NiShuiHan, RoleStunt.QianBeiBuZui, RoleStunt.QianJunNuJi, RoleStunt.QiShiErBian, RoleStunt.Reel, RoleStunt.NuYanLianTao, RoleStunt.SanMeiZhenHuo, RoleStunt.SanQianShiJie, RoleStunt.SenLuoWanXiang, RoleStunt.ShiFangJieSha, RoleStunt.ShiHun, RoleStunt.ShuiMuTianHua, RoleStunt.SiYao, RoleStunt.TaiJi, RoleStunt.TianHuoLiaoYuan, RoleStunt.TianJian, RoleStunt.TianJiangHengCai, RoleStunt.TianShiFuFa, RoleStunt.TianShuangQuan, RoleStunt.TianXuanWuYin, RoleStunt.TianZhiBaTi, RoleStunt.TuiMoJi, RoleStunt.TuZhou, RoleStunt.WuZhiBaTi, RoleStunt.TianMoWangSheng, RoleStunt.XingYun, RoleStunt.XiXue, RoleStunt.XuanYinJian, RoleStunt.YeManChongZhuang, RoleStunt.YeQiuQuan, RoleStunt.YeWuFeiRen, RoleStunt.YingXi, RoleStunt.YingZhiBaTi, RoleStunt.YinShen, RoleStunt.YiShan, RoleStunt.YueShi, RoleStunt.YueShiMark, RoleStunt.YunShiLieDi, RoleStunt.ZhenSheShu, RoleStunt.ZhenYeQiuQuan, RoleStunt.ZhiLiao, RoleStunt.ZhiSheng, RoleStunt.ZiBao, RoleStunt.ZiDianShenGuang, MonsterType.BossChiYanShou, MonsterType.BossQingTianMu, MonsterType.BossDaoBaTu, "WorldBossMomentum");
            addFace(RoleStunt.AXiuLuoBaWangQuan, RIGHT, RoleStunt.BaiLianHengJiang, LEFT, RoleStunt.BeiCi, LEFT, RoleStunt.BengJing, RIGHT, RoleStunt.BaoYanLiuXingQun, RIGHT, RoleStunt.ChangHongGuanRi, LEFT, RoleStunt.DaHuoYanZhou, LEFT, RoleStunt.ErDuanJi, LEFT, RoleStunt.FengHuoLiaoYuan, LEFT, RoleStunt.FengShenJian, RIGHT, RoleStunt.FengZhou, LEFT, RoleStunt.GuangMangWanZhang, RIGHT, RoleStunt.HongLianQiang, LEFT, RoleStunt.JianLiuYun, RIGHT, RoleStunt.JiuSiYiSheng, RIGHT, RoleStunt.JueDuiFangYu, RIGHT, RoleStunt.LuoXingShi, RIGHT, RoleStunt.MengPoTang, RIGHT, RoleStunt.NiShuiHan, LEFT, RoleStunt.NuYanLianTao, RIGHT, RoleStunt.QiShiErBian, LEFT, RoleStunt.QianBeiBuZui, RIGHT, RoleStunt.SanQianShiJie, RIGHT, RoleStunt.ShaShengJian, RIGHT, RoleStunt.TianJian, RIGHT, RoleStunt.TuiMoJi, RIGHT, RoleStunt.ShiFangJieSha, RIGHT, RoleStunt.SiYao, LEFT, RoleStunt.TianShuangQuan, RIGHT, RoleStunt.XuanYinJian, RIGHT, RoleStunt.YeManChongZhuang, LEFT, RoleStunt.YingXi, LEFT, RoleStunt.YiShan, LEFT, RoleStunt.ZhenYeQiuQuan, LEFT, RoleStunt.ZhiSheng, RIGHT);
            addAddonEffect(RoleStunt.BeiCi, RoleStunt.Reel, RoleStunt.BingJingZhou, RoleStunt.Reel, RoleStunt.DongJie, RoleStunt.Reel, RoleStunt.FengHuoLiaoYuan, RoleStunt.Reel, RoleStunt.FengJuanChenSheng, RoleStunt.Reel, RoleStunt.FengZhou, RoleStunt.Reel, RoleStunt.FengXueBingTian, RoleStunt.Reel, RoleStunt.JianLiuYun, RoleStunt.Reel, RoleStunt.JingLeiShan, RoleStunt.Reel, RoleStunt.JiuTianShenLei, RoleStunt.Reel, RoleStunt.KuangFengJianJue, RoleStunt.Reel, RoleStunt.LeiDongJiuTian, RoleStunt.Reel, RoleStunt.LeiTingJue, RoleStunt.Reel, RoleStunt.LeiZhou, RoleStunt.Reel, RoleStunt.LuoShi, RoleStunt.Reel, RoleStunt.MengPoTang, RoleStunt.Reel, RoleStunt.ShanDian, RoleStunt.Reel, RoleStunt.TianJiangHengCai, RoleStunt.Reel, RoleStunt.TianLeiHong, RoleStunt.Reel, RoleStunt.TianShuangQuan, RoleStunt.Reel, RoleStunt.TuZhou, RoleStunt.Reel, RoleStunt.XuanFeng, RoleStunt.Reel, RoleStunt.XingChenDiDong, RoleStunt.Reel, RoleStunt.YeManChongZhuang, RoleStunt.Reel, RoleStunt.YingXi, RoleStunt.Reel, RoleStunt.DuZhou, RoleStunt.DuWu, RoleStunt.SiYao, RoleStunt.DuWu, RoleStunt.XiXue, RoleStunt.ZhiLiao, RoleStunt.TianJingZhou, RoleStunt.ChuiMian, RoleStunt.MengYin, RoleStunt.ChuiMian, RoleStunt.LingBaoDanMu, RoleStunt.ChuiMian, RoleStunt.YueShi, RoleStunt.YueShiMark);
            addSameStunts(RoleStunt.BaFangBaoLie, RoleStunt.BaiLianHengJiang, RoleStunt.FengJuanChenSheng, RoleStunt.FengZhou, RoleStunt.LeiDongJiuTian, RoleStunt.LeiZhou, RoleStunt.LianYuHuoHai, RoleStunt.HuoYanZhou, RoleStunt.XingChenDiDong, RoleStunt.TuZhou, RoleStunt.LuoShi, RoleStunt.TuZhou, RoleStunt.ShanDian, RoleStunt.LeiZhou, RoleStunt.XuanFeng, RoleStunt.FengZhou, RoleStunt.HuoZhu, RoleStunt.HuoYanZhou, RoleStunt.DongJie, RoleStunt.BingJingZhou, RoleStunt.DuWu, RoleStunt.DuZhou, RoleStunt.LingHeBao, RoleStunt.LingBao, RoleStunt.LingLiChongJi, RoleStunt.LingBao, RoleStunt.LeiQie, RoleStunt.LeiZhou, RoleStunt.DaFengZhou, RoleStunt.FengZhou, RoleStunt.HuXiao, RoleStunt.TuiMoJi, RoleStunt.KongHe, RoleStunt.ZhenSheShu, RoleStunt.KuangFengJianJue, RoleStunt.FengJuanChenSheng, RoleStunt.JiuYinJiuYang, RoleStunt.XuanYinJian, RoleStunt.MengYin, RoleStunt.LingBaoDanMu, RoleStunt.ShaShengJian, RoleStunt.TianJian, RoleStunt.TianJingZhou, RoleStunt.FengXueBingTian, RoleStunt.TianLeiHong, RoleStunt.LeiTingJue, RoleStunt.XueShenZuZhou, RoleStunt.TianMoWangSheng, RoleStunt.ZhuoReChongJi, RoleStunt.SanMeiZhenHuo);
            addOwn(RoleStunt.HuanMing, RoleStunt.HuanYing, RoleStunt.HuiChun, RoleStunt.JueDuiFangYu, RoleStunt.KuangBao, RoleStunt.YinShen, RoleStunt.ZhiLiao, RoleStunt.ZiBao);
            addToRegPoint(RoleStunt.BaiLianHengJiang, RoleStunt.BaoYanLiuXingQun, RoleStunt.ChaNaFangHua, RoleStunt.ChengTianZaiWu, RoleStunt.DaHuoYanZhou, RoleStunt.DuZhou, RoleStunt.FengHuoLiaoYuan, RoleStunt.FengJuanCanYun, RoleStunt.FengJuanChenSheng, RoleStunt.FengXueBingTian, RoleStunt.FengZhou, RoleStunt.GuWuShu, RoleStunt.HongLianQiang, RoleStunt.HuaiZhongBaoMeiSha, RoleStunt.HuoYanZhou, RoleStunt.HuanMing, RoleStunt.HuanShu, RoleStunt.HuanYing, RoleStunt.HuiChun, RoleStunt.HunDunZhiLi, RoleStunt.HunLuan, RoleStunt.JingLeiShan, RoleStunt.JiuSiYiSheng, RoleStunt.JiuTianShenLei, RoleStunt.JueDuiFangYu, RoleStunt.JueDuiLingDu, RoleStunt.JuHun, RoleStunt.LeiTingJue, RoleStunt.LeiTingYiJi, RoleStunt.LeiZhou, RoleStunt.LiZhiBaTi, RoleStunt.LuoXingShi, RoleStunt.MengPoTang, RoleStunt.MoYingAnMie, RoleStunt.NianYa, RoleStunt.NiShuiHan, RoleStunt.NuYanLianTao, RoleStunt.QianBeiBuZui, RoleStunt.QianJunNuJi, RoleStunt.QiShiErBian, RoleStunt.SanMeiZhenHuo, RoleStunt.SanQianShiJie, RoleStunt.SenLuoWanXiang, RoleStunt.ShiHun, RoleStunt.ShuiMuTianHua, RoleStunt.TaiJi, RoleStunt.TianHuoLiaoYuan, RoleStunt.TianJian, RoleStunt.TianJiangHengCai, RoleStunt.TianMoWangSheng, RoleStunt.TianXuanWuYin, RoleStunt.TianZhiBaTi, RoleStunt.TuiMoJi, RoleStunt.TuZhou, RoleStunt.WuZhiBaTi, RoleStunt.XingYun, RoleStunt.YeManChongZhuang, RoleStunt.YeWuFeiRen, RoleStunt.YingXi, RoleStunt.YingZhiBaTi, RoleStunt.YinShen, RoleStunt.YiShan, RoleStunt.YueShi, RoleStunt.YunShiLieDi, RoleStunt.ZhenSheShu, RoleStunt.ZhenYeQiuQuan, RoleStunt.ZhiLiao, RoleStunt.ZhiSheng, RoleStunt.ZiDianShenGuang);
            _middleTriggers = [RoleStunt.JiuSiYiSheng, RoleStunt.TianShiFuFa, RoleStunt.QianBeiBuZui, RoleStunt.XingYun, RoleStunt.YeManChongZhuang, RoleStunt.YeQiuQuan];
        }
        private static function addBMD(... _args):void{
            addRole(1, _args);
        }
        private static function addMC(... _args):void{
            addRole(0, _args);
        }
        private static function addRole(_arg1:int, _arg2:Array):void{
            var _local3:int = _arg2.length;
            var _local4:int;
            while (_local4 < _local3) {
                _list[_arg2[_local4]] = _arg1;
                _local4++;
            };
        }
        private static function addFace(... _args):void{
            addKeyValue(_args, _faces);
        }
        private static function addAddonEffect(... _args):void{
            addKeyValue(_args, _addonEffects);
        }
        private static function addSameStunts(... _args):void{
            addKeyValue(_args, _sameStunts);
        }
        private static function addKeyValue(_arg1:Array, _arg2:Object):void{
            if ((_arg1.length % 2) != 0){
                throw (new Error("参数数目不对。"));
            };
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _arg2[_arg1[_local4]] = _arg1[(_local4 + 1)];
                _local4 = (_local4 + 2);
            };
        }
        private static function addOwn(... _args):void{
            var _local2:int = _args.length;
            var _local3:int;
            while (_local3 < _local2) {
                _owns[_args[_local3]] = true;
                _local3++;
            };
        }
        private static function addToRegPoint(... _args):void{
            var _local2:int = _args.length;
            var _local3:int;
            while (_local3 < _local2) {
                _regPoints[_args[_local3]] = true;
                _local3++;
            };
        }

        init();
    }
}//package com.assist.view.war.roles 
