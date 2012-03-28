//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class ItemType {

        public static const QuestItemTypeId:int = 10004;
        public static const TouKui:int = 1;
        public static const WuQi:int = 2;
        public static const HunQi:int = 3;
        public static const YiFu:int = 4;
        public static const HuFu:int = 5;
        public static const XieZi:int = 6;
        public static const ZuoJi:int = 7;
        public static const LianDanJuanZhou:int = 1001;
        public static const LianQiJuanZhou:int = 1002;
        public static const HongYao:int = 10001;
        public static const ZaWu:int = 10003;
        public static const RenWuWuPin:int = 10004;
        public static const BianShen:int = 10005;
        public static const YuPai:int = 10006;
        public static const ChengZhangLiBao:int = 10007;
        public static const HuoDongLiBao:int = 10009;
        public static const SuperLiBao:int = 10010;
        public static const WuLiDan:int = 11001;
        public static const JueJiDan:int = 11002;
        public static const FaShuDan:int = 11003;
        public static const LingPai:int = 11004;
        public static const skill:int = 12000;
        public static const RedEnvelopes:int = 13000;
        public static const ChangeAttackItem:int = 14000;
        public static const GoldOil:int = 15000;
        public static const ValuableItems:int = 16000;
        public static const Ingot:int = 99998;
        public static const Coin:int = 99999;

        private static var reg:RegExp = /\[(.+?)\]/g;
        private static var _Types:Object = null;
        private static var _Items:Object = null;
        private static var _Qualitys:Object = null;
        private static var _EquipJob:Object = null;
        private static var _AvatarItemMonster:Object = null;
        private static var _ItemUpgrade:Object = null;
        private static var colors:Object = {
            1:0xFFFFFF,
            2:2272312,
            3:44783,
            4:0xFF00FF,
            5:0xFFF100
        };

        public static function getItemAllDatas(_arg1:int):Object{
            var _local4:int;
            var _local2:Array = ((Items[_arg1]) || (["", 0, "", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]));
            var _local3:Array = [];
            if (_local2[3] != ""){
                _local2[3] = _local2[3].split("[-n]").join("\n");
                _local3 = _local2[3].split("[--]");
                _local4 = _local3.length;
                while (_local4 > 0) {
                    _local4--;
                    _local3[_local4] = _local3[_local4].replace(reg, regMsg);
                };
                _local2[3] = _local3[0];
            };
            return ({
                name:_local2[0],
                type_id:_local2[1],
                description:_local2[3],
                descriptionList:_local3,
                quality:_local2[4],
                require_level:_local2[5],
                attack:_local2[6],
                attack_up:_local2[7],
                defense:_local2[8],
                defense_up:_local2[9],
                stunt_attack:_local2[10],
                stunt_attack_up:_local2[11],
                stunt_defense:_local2[12],
                stunt_defense_up:_local2[13],
                magic_attack:_local2[14],
                magic_attack_up:_local2[15],
                magic_defense:_local2[16],
                magic_defense_up:_local2[17],
                health:_local2[18],
                health_up:_local2[19],
                strength:_local2[20],
                agile:_local2[21],
                intellect:_local2[22],
                price:_local2[23],
                ingot:_local2[24],
                item_card_id:_local2[25],
                item_card_num:_local2[26]
            });
        }
        private static function regMsg(... _args):String{
            var _local2:Array = _args[1].split(",");
            var _local3:String = _local2.pop();
            return ((((("<font color='#" + _local3) + "'>") + _local2.join(",")) + "</font>"));
        }
        public static function get Types():Object{
            if (_Types == null){
                throw (new Error("还未赋值！"));
            };
            return (_Types);
        }
        public static function set Types(_arg1:Object):void{
            if (_Types != null){
                throw (new Error("非法赋值"));
            };
            _Types = _arg1;
        }
        public static function get Items():Object{
            if (_Items == null){
                throw (new Error("还未赋值！"));
            };
            return (_Items);
        }
        public static function set Items(_arg1:Object):void{
            if (_Items != null){
                throw (new Error("非法赋值"));
            };
            _Items = _arg1;
        }
        public static function get Qualitys():Object{
            if (_Qualitys == null){
                throw (new Error("还未赋值！"));
            };
            return (_Qualitys);
        }
        public static function set Qualitys(_arg1:Object):void{
            if (_Qualitys != null){
                throw (new Error("非法赋值"));
            };
            _Qualitys = _arg1;
        }
        public static function get EquipJob():Object{
            if (_EquipJob == null){
                throw (new Error("还未赋值！"));
            };
            return (_EquipJob);
        }
        public static function set EquipJob(_arg1:Object):void{
            if (_EquipJob != null){
                throw (new Error("非法赋值"));
            };
            _EquipJob = _arg1;
        }
        public static function get AvatarItemMonster():Object{
            if (_AvatarItemMonster == null){
                throw (new Error("还未赋值！"));
            };
            return (_AvatarItemMonster);
        }
        public static function set AvatarItemMonster(_arg1:Object):void{
            if (_AvatarItemMonster != null){
                throw (new Error("非法赋值"));
            };
            _AvatarItemMonster = _arg1;
        }
        public static function get ItemUpgrade():Object{
            if (_ItemUpgrade == null){
                throw (new Error("还未赋值！"));
            };
            return (_ItemUpgrade);
        }
        public static function set ItemUpgrade(_arg1:Object):void{
            if (_ItemUpgrade != null){
                throw (new Error("非法赋值"));
            };
            _ItemUpgrade = _arg1;
        }
        public static function getItemIdByName(_arg1:String):int{
            var _local2:String;
            for (_local2 in Items) {
                if (Items[_local2][0] == _arg1){
                    return (parseInt(_local2));
                };
            };
            return (0);
        }
        public static function getMaxRepeatNum(_arg1:int):int{
            return ((Types[_arg1]) ? Types[_arg1][1] : 0);
        }
        public static function getItemQualityById(_arg1:int):int{
            return ((((Items[_arg1]) ? Items[_arg1][4] : 0) || (0)));
        }
        public static function getItemQualityByName(_arg1:String):int{
            var _local3:String;
            var _local2:int;
            for (_local3 in Items) {
                if (Items[_local3][0] == _arg1){
                    _local2 = Items[_local3][4];
                    break;
                };
            };
            return (_local2);
        }
        public static function getItemQualityNameById(_arg1:int):String{
            return ((((Items[_arg1]) ? Qualitys[getItemQualityById(_arg1)] : "") || ("")));
        }
        public static function getItemQualityNameByName(_arg1:String):String{
            var _local2:int;
            var _local3:String;
            for (_local3 in Items) {
                if (Items[_local3][0] == _arg1){
                    _local2 = parseInt(_local3);
                    break;
                };
            };
            return (getItemQualityNameById(_local2));
        }
        public static function getRequireLevel(_arg1:int):int{
            return ((Items[_arg1]) ? Items[_arg1][5] : 0);
        }
        public static function getTypeId(_arg1:int):int{
            return ((Items[_arg1]) ? Items[_arg1][1] : 0);
        }
        public static function getItemAttr(_arg1:int):Object{
            var _local2:Array = Items[_arg1];
            return ({
                attack:((_local2[6]) || (0)),
                attackUp:((_local2[7]) || (0)),
                defense:((_local2[8]) || (0)),
                defenseUp:((_local2[9]) || (0)),
                stuntAttack:((_local2[10]) || (0)),
                stuntAttackUp:((_local2[11]) || (0)),
                stuntDefense:((_local2[12]) || (0)),
                stuntDefenseUp:((_local2[13]) || (0)),
                magicAttack:((_local2[14]) || (0)),
                magicAttackUp:((_local2[15]) || (0)),
                magicDefense:((_local2[16]) || (0)),
                magicDefenseUp:((_local2[17]) || (0)),
                health:((_local2[18]) || (0)),
                healthUp:((_local2[19]) || (0)),
                strength:((_local2[20]) || (0)),
                agile:((_local2[21]) || (0)),
                intellect:((_local2[22]) || (0))
            });
        }
        public static function getEquipJob(_arg1:int):Array{
            return (((EquipJob[_arg1]) || ([])));
        }
        public static function getName(_arg1:int):String{
            return ((Items[_arg1]) ? Items[_arg1][0] : "");
        }
        public static function getDescription(_arg1:int):String{
            var _local2:String = (Items[_arg1]) ? Items[_arg1][3] : "";
            if (_local2 != ""){
                _local2 = _local2.replace(reg, regMsg);
            };
            return (_local2);
        }
        public static function getMonsterId(_arg1:int):int{
            return (((AvatarItemMonster[_arg1]) || (0)));
        }
        public static function getItemUpgrade(_arg1:int):String{
            return (((ItemUpgrade[_arg1]) || ("")));
        }
        public static function getItemColor(_arg1:int):uint{
            var _local2:int = getItemQualityById(_arg1);
            return ((_local2) ? colors[_local2] : 0xFFFFFF);
        }
        public static function isEquip(_arg1:int):Boolean{
            return ((((((((((((TouKui == _arg1)) || ((WuQi == _arg1)))) || ((HunQi == _arg1)))) || ((YiFu == _arg1)))) || ((HuFu == _arg1)))) || ((XieZi == _arg1))));
        }
        public static function isMoney(_arg1:int):Boolean{
            return ((((_arg1 == Coin)) || ((_arg1 == Ingot))));
        }
        public static function isStack(_arg1:int):Boolean{
            return ((_arg1 > 10000));
        }
        public static function getItemSuffix(_arg1:int):String{
            var _local2:String = "";
            var _local3:int = getTypeId(_arg1);
            if (_local3 != YiFu){
                return ("");
            };
            var _local4:int = getRequireLevel(_arg1);
            var _local5:int = getItemQualityById(_arg1);
            if (_local5 >= 3){
                if (_local4 < 40){
                    _local4 = 1;
                } else {
                    if (_local4 < 60){
                        _local4 = 2;
                    } else {
                        if (_local4 < 70){
                            _local4 = 3;
                        } else {
                            if (_local4 < 100){
                                _local4 = 4;
                            } else {
                                _local4 = 5;
                            };
                        };
                    };
                };
                _local2 = ((("T" + _local4) + "Q") + 3);
            };
            return (_local2);
        }

    }
}//package com.assist.server 
