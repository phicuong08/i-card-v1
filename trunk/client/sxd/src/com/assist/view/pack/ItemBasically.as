//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.pack {
    import com.assist.view.map.*;
    import com.assist.server.*;
    import com.lang.client.com.assist.view.pack.*;

    public class ItemBasically {

        private static var starNames:Array = [""];
        public static var empty:ItemBasically = new ItemBasically(0);
;
        private static var ShopIdxList:Array = [0, 2, 6, 1, 3, 5, 4];
        private static var cache:Array = [empty];

        private var color:int;
        private var name:String = "";
        public var desList:Array;
        public var quality:int;
        public var max:int;
        public var item_id:int = 0;
        public var type_id:int = 0;
        public var card_id:int;
        public var card_num:int;
        public var card_name:String;
        public var ingot:int = 0;
        public var price:int;
        public var require:int;
        public var jobs:String;
        public var jobArr:Array;
        public var jobId:int;
        public var strength:int;
        public var agile:int;
        public var intellect:int;
        private var Health:int;
        private var Health_up:int;
        private var PAttack:int;
        private var PAttack_up:int;
        private var PDefense:int;
        private var PDefense_up:int;
        private var SAttack:int;
        private var SAttack_up:int;
        private var SDefense:int;
        private var SDefense_up:int;
        private var MAttack:int;
        private var MAttack_up:int;
        private var MDefense:int;
        private var MDefense_up:int;

        public function ItemBasically(_arg1:int):void{
            var _local4:int;
            this.jobArr = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            super();
            if (_arg1 == 0){
                return;
            };
            if (starNames.length == 1){
                starNames[1203] = "";
                starNames[1204] = ItemBasicallyLang.Star2;
                starNames[1205] = ItemBasicallyLang.Star3;
                starNames[1206] = ItemBasicallyLang.Star4;
                starNames[1207] = ItemBasicallyLang.Star5;
                starNames[1208] = ItemBasicallyLang.Star6;
                starNames[1209] = ItemBasicallyLang.Star7;
                starNames[1210] = ItemBasicallyLang.Star8;
                starNames[1211] = ItemBasicallyLang.Star9;
            };
            var _local2:Object = ItemType.getItemAllDatas(_arg1);
            this.item_id = _arg1;
            this.type_id = _local2.type_id;
            this.name = _local2.name;
            this.quality = _local2.quality;
            this.require = _local2.require_level;
            this.price = _local2.price;
            this.ingot = _local2.ingot;
            this.desList = _local2.descriptionList;
            this.card_id = _local2.item_card_id;
            this.card_num = _local2.item_card_num;
            this.Health = _local2.health;
            this.Health_up = _local2.health_up;
            this.PAttack = _local2.attack;
            this.PAttack_up = _local2.attack_up;
            this.PDefense = _local2.defense;
            this.PDefense_up = _local2.defense_up;
            this.SAttack = _local2.stunt_attack;
            this.SAttack_up = _local2.stunt_attack_up;
            this.SDefense = _local2.stunt_defense;
            this.SDefense_up = _local2.stunt_defense_up;
            this.MAttack = _local2.magic_attack;
            this.MAttack_up = _local2.magic_attack_up;
            this.MDefense = _local2.magic_defense;
            this.MDefense_up = _local2.magic_defense_up;
            this.strength = _local2.strength;
            this.agile = _local2.agile;
            this.intellect = _local2.intellect;
            this.color = ItemType.getItemColor(this.item_id);
            this.max = ItemType.getMaxRepeatNum(this.type_id);
            this.card_name = ItemType.getName(this.card_id);
            if (this.type_id == ItemType.ValuableItems){
                (this.type_id == ItemType.ZaWu);
            };
            var _local3:Array = ItemType.getEquipJob(this.item_id);
            this.jobId = int(_local3[0]);
            if ((((_local3.length == 0)) || ((_local3.length >= 5)))){
                this.jobs = ItemBasicallyLang.NotLimited;
                this.jobArr = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
            } else {
                this.jobs = "";
                for each (_local4 in _local3) {
                    this.jobs = ((this.jobs + RoleType.getJobName(_local4)) + " ");
                    this.jobArr[_local4] = 1;
                };
            };
        }
        public static function getBasic(_arg1:int):ItemBasically{
            if ((cache[_arg1] is ItemBasically)){
                return (cache[_arg1]);
            };
            var _local2:ItemBasically = (cache[_arg1] = new ItemBasically(_arg1));
            return (_local2);
        }

        public function getImgUrl(_arg1:int):String{
            if (this.item_id == 0){
                return (null);
            };
            if (_arg1 == 0){
                return (((MapStatic.FolderItemIcon + this.item_id) + ".png"));
            };
            return (((MapStatic.FolderItemIcon + this.item_id) + "_g.png"));
        }
        public function get isEquip():Boolean{
            return (ItemType.isEquip(this.type_id));
        }
        public function get isStack():Boolean{
            return ((this.max > 1));
        }
        public function get isQuest():Boolean{
            return ((this.type_id == ItemType.RenWuWuPin));
        }
        public function get isBrand():Boolean{
            return ((this.type_id == ItemType.YuPai));
        }
        public function get isPackage():Boolean{
            return ((((((this.type_id == ItemType.ChengZhangLiBao)) || ((this.type_id == ItemType.HuoDongLiBao)))) || ((this.type_id == ItemType.SuperLiBao))));
        }
        public function get isMounts():Boolean{
            return ((this.type_id == ItemType.ZuoJi));
        }
        public function get isDanYao():Boolean{
            return ((((((this.type_id == ItemType.WuLiDan)) || ((this.type_id == ItemType.JueJiDan)))) || ((this.type_id == ItemType.FaShuDan))));
        }
        public function get isJuanZhou():Boolean{
            return ((((this.type_id == ItemType.LianDanJuanZhou)) || ((this.type_id == ItemType.LianQiJuanZhou))));
        }
        public function get isSkill():Boolean{
            return ((this.type_id == ItemType.skill));
        }
        public function get isChangeAttack():Boolean{
            return ((this.type_id == ItemType.ChangeAttackItem));
        }
        public function get isGoldOil():Boolean{
            return ((this.type_id == ItemType.GoldOil));
        }
        public function get isZaWu():Boolean{
            return ((((this.type_id == ItemType.ZaWu)) || ((this.type_id == ItemType.ValuableItems))));
        }
        public function get isBianShen():Boolean{
            return ((this.type_id == ItemType.BianShen));
        }
        public function get isCanUseing():Boolean{
            var _local1:Boolean;
            switch (this.type_id){
                case ItemType.ZaWu:
                case ItemType.RenWuWuPin:
                case ItemType.LingPai:
                case ItemType.YuPai:
                case ItemType.ValuableItems:
                    _local1 = false;
                    break;
            };
            return (_local1);
        }
        public function getItemName(_arg1:int):String{
            if (this.isEquip == false){
                return (this.name);
            };
            return ((this.name + ((starNames[_arg1]) || (""))));
        }
        public function getItemColor(_arg1:int):int{
            if ((((_arg1 == 0)) || ((this.isEquip == false)))){
                return (this.color);
            };
            return (0xFFF200);
        }
        public function getHealthValue(_arg1:int, _arg2:int=0):int{
            if (this.Health == 0){
                return (0);
            };
            var _local3:int = this.Health_up;
            if (_arg2 != 0){
                _local3 = (_local3 + GoldOilType.getOilAttr(_arg2, this.type_id).healthUp);
            };
            return ((this.Health + ((_arg1 - 1) * _local3)));
        }
        public function getHealth(_arg1:int, _arg2:int=0):String{
            if (this.Health == 0){
                return ("");
            };
            return ((("\n" + ItemBasicallyLang.AddLifeLimited) + this.getHealthValue(_arg1, _arg2)));
        }
        public function getPAttackValue(_arg1:int, _arg2:int=0):int{
            if (this.PAttack == 0){
                return (0);
            };
            var _local3:int = this.PAttack_up;
            if (_arg2 != 0){
                _local3 = (_local3 + GoldOilType.getOilAttr(_arg2, this.type_id).attackUp);
            };
            return ((this.PAttack + ((_arg1 - 1) * _local3)));
        }
        public function getPAttack(_arg1:int, _arg2:int=0):String{
            if (this.PAttack == 0){
                return ("");
            };
            return ((("\n" + ItemBasicallyLang.AddNormalAttack) + this.getPAttackValue(_arg1, _arg2)));
        }
        public function getPDefenseValue(_arg1:int, _arg2:int=0):int{
            if (this.PDefense == 0){
                return (0);
            };
            var _local3:int = this.PDefense_up;
            if (_arg2 != 0){
                _local3 = (_local3 + GoldOilType.getOilAttr(_arg2, this.type_id).defenseUp);
            };
            return ((this.PDefense + ((_arg1 - 1) * _local3)));
        }
        public function getPDefense(_arg1:int, _arg2:int=0):String{
            if (this.PDefense == 0){
                return ("");
            };
            return ((("\n" + ItemBasicallyLang.AddCommonDefense) + this.getPDefenseValue(_arg1, _arg2)));
        }
        public function getSAttackValue(_arg1:int, _arg2:int=0):int{
            if (this.SAttack == 0){
                return (0);
            };
            var _local3:int = this.SAttack_up;
            if (_arg2 != 0){
                _local3 = (_local3 + GoldOilType.getOilAttr(_arg2, this.type_id).stuntAttackUp);
            };
            return ((this.SAttack + ((_arg1 - 1) * _local3)));
        }
        public function getSAttack(_arg1:int, _arg2:int=0):String{
            if (this.SAttack == 0){
                return ("");
            };
            return ((("\n" + ItemBasicallyLang.AddStuntAttack) + this.getSAttackValue(_arg1, _arg2)));
        }
        public function getSDefenseValue(_arg1:int, _arg2:int=0):int{
            if (this.SDefense == 0){
                return (0);
            };
            var _local3:int = this.SDefense_up;
            if (_arg2 != 0){
                _local3 = (_local3 + GoldOilType.getOilAttr(_arg2, this.type_id).stuntDefenseUp);
            };
            return ((this.SDefense + ((_arg1 - 1) * _local3)));
        }
        public function getSDefense(_arg1:int, _arg2:int=0):String{
            if (this.SDefense == 0){
                return ("");
            };
            return ((("\n" + ItemBasicallyLang.AddStuntDefense) + this.getSDefenseValue(_arg1, _arg2)));
        }
        public function getMAttackValue(_arg1:int, _arg2:int=0):int{
            if (this.MAttack == 0){
                return (0);
            };
            var _local3:int = this.MAttack_up;
            if (_arg2 != 0){
                _local3 = (_local3 + GoldOilType.getOilAttr(_arg2, this.type_id).magicAttackUp);
            };
            return ((this.MAttack + ((_arg1 - 1) * _local3)));
        }
        public function getMAttack(_arg1:int, _arg2:int=0):String{
            if (this.MAttack == 0){
                return ("");
            };
            return ((("\n" + ItemBasicallyLang.AddMagicAttack) + this.getMAttackValue(_arg1, _arg2)));
        }
        public function getMDefenseValue(_arg1:int, _arg2:int=0):int{
            if (this.MDefense == 0){
                return (0);
            };
            var _local3:int = this.MDefense_up;
            if (_arg2 != 0){
                _local3 = (_local3 + GoldOilType.getOilAttr(_arg2, this.type_id).magicDefenseUp);
            };
            return ((this.MDefense + ((_arg1 - 1) * _local3)));
        }
        public function getMDefense(_arg1:int, _arg2:int=0):String{
            if (this.MDefense == 0){
                return ("");
            };
            return ((("\n" + ItemBasicallyLang.AddMagicDefense) + this.getMDefenseValue(_arg1, _arg2)));
        }

    }
}//package com.assist.view.pack 
