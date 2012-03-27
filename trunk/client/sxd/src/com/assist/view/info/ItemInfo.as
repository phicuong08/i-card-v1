//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.info {
    import com.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.assist.view.pack.*;
    import com.lang.client.com.assist.view.info.*;

    public class ItemInfo {

        public static var playerlv:int;
        public static var roleLv:int = 0;
        public static var roleJobId:int = 0;

        private var _tipSP1:ItemTipSprite;
        private var _tipSP2:ItemTipSprite;
        private var _seeType:int;
        public var gridId:int = 0;
        public var playerItemId:int = 0;
        public var itemId:int;
        public var typeId:int;
        public var quality:int;
        public var ingot:int = 0;
        public var num:int = 0;
        public var goldId:int = 0;
        public var isCardBuy:Boolean = false;
        public var upgradeLevel:int = 0;
        public var price:int = 0;
        public var totalprice:int = 0;
        public var useing:int = 0;
        public var basic:ItemBasically;
        public var propertyAdd:int = 0;
        public var nameTip:String;
        public var desTipList:Array;
        public var addTip:String;
        public var lastTip:String;
        public var name:String;
        public var iconUrl:String;
        public var color:int;

        public function ItemInfo(){
            this.reset();
        }
        public function reset():void{
            this.isCardBuy = false;
            this.playerItemId = (this.itemId = (this.num = (this.totalprice = (this.goldId = (this.price = (this.typeId = (this.useing = (this.quality = (this.ingot = (this.color = 0))))))))));
            this.basic = ItemBasically.empty;
            this.upgradeLevel = 1;
            this.nameTip = (this.name = (this.iconUrl = (this.addTip = (this.lastTip = ""))));
            this.desTipList = [];
        }
        private function get reqTip():String{
            var _local3:uint;
            var _local4:uint;
            var _local5:uint;
            var _local1:String = "";
            var _local2:int = this.basic.require;
            if (this.basic.isEquip){
                _local3 = ((((roleLv == 0)) || ((roleLv >= _local2)))) ? 0xEEEEEE : 0xFF0000;
                _local4 = ((this.basic.jobArr[roleJobId])==1) ? 0xEEEEEE : 0xFF0000;
                _local1 = htmlFormat(ItemInfoLang.EquipReq, 12, 0xEEEEEE);
                _local1 = ((_local1 + "\n") + htmlFormat(Lang.sprintf(ItemInfoLang.EquipRoleLV, _local2), 12, _local3));
                _local1 = ((_local1 + "\n") + htmlFormat(Lang.sprintf(ItemInfoLang.EquipJob, this.basic.jobs), 12, _local4));
            } else {
                if (this.basic.type_id == ItemType.ChengZhangLiBao){
                    _local5 = ((playerlv)>=_local2) ? 0xEB6100 : 0xFF0000;
                    _local1 = htmlFormat(Lang.sprintf(ItemInfoLang.ItemRoleLv, _local2), 12, _local5);
                };
            };
            return (_local1);
        }
        public function getTipsSprite1(_arg1:String, _arg2:String):ItemTipSprite{
            this._tipSP1 = ((this._tipSP1) || (new ItemTipSprite()));
            this._tipSP1.topString = _arg1;
            this._tipSP1.bottomString = _arg2;
            this.updateTipSprite(this._tipSP1);
            return (this._tipSP1);
        }
        public function getTipsSprite2(_arg1:String, _arg2:String):ItemTipSprite{
            this._tipSP2 = ((this._tipSP2) || (new ItemTipSprite()));
            this._tipSP2.topString = _arg1;
            this._tipSP2.bottomString = _arg2;
            this.updateTipSprite(this._tipSP2);
            return (this._tipSP2);
        }
        private function updateTipSprite(_arg1:ItemTipSprite):void{
            if (_arg1 == null){
                return;
            };
            _arg1.basic = this.basic;
            _arg1.playerItemId = this.playerItemId;
            _arg1.goldId = this.goldId;
            var _local2:Array = [];
            if (this.addTip != ""){
                _local2.push(this.addTip);
            };
            if (this.reqTip != ""){
                _local2.push(this.reqTip);
            };
            _local2 = _local2.concat(this.desTipList);
            if (this.lastTip != ""){
                _local2.push(this.lastTip);
            };
            _arg1.updateTip(this.nameTip, _local2);
        }
        private function resetTipSprite(_arg1:ItemTipSprite):void{
            if (_arg1 == null){
                return;
            };
            _arg1.reset();
        }
        public function parseShop(_arg1:int, _arg2:int=1, _arg3:Boolean=false):void{
            this.reset();
            this.itemId = _arg1;
            this._seeType = 2;
            this.num = 1;
            this.upgradeLevel = _arg2;
            this.isCardBuy = _arg3;
            this.parse();
        }
        public function parseRecycle(_arg1:Array):void{
            this.reset();
            this.playerItemId = _arg1[0];
            this.itemId = _arg1[1];
            this.upgradeLevel = _arg1[2];
            this.price = _arg1[3];
            this.num = _arg1[4];
            this.goldId = _arg1[6];
            this.totalprice = (this.price * this.num);
            this._seeType = 3;
            this.parse();
        }
        public function parseSee(_arg1:int, _arg2:int=1, _arg3:int=0):void{
            this.reset();
            this.itemId = _arg1;
            this._seeType = 4;
            this.upgradeLevel = _arg2;
            this.goldId = _arg3;
            this.parse();
        }
        public function parsePack(_arg1:Array):void{
            this.reset();
            this.playerItemId = _arg1[0];
            this.itemId = _arg1[1];
            this.gridId = _arg1[2];
            this.upgradeLevel = _arg1[3];
            this.price = _arg1[4];
            this.num = _arg1[5];
            this.useing = _arg1[6];
            this.goldId = _arg1[7];
            this.totalprice = (this.price * this.num);
            this._seeType = 1;
            this.parse();
        }
        private function parse():void{
            var _local1:String;
            var _local2:String;
            this.resetTipSprite(this._tipSP1);
            this.resetTipSprite(this._tipSP2);
            if (this.itemId == 0){
                this.reset();
                return;
            };
            this.basic = ItemBasically.getBasic(this.itemId);
            this.typeId = this.basic.type_id;
            this.quality = this.basic.quality;
            this.ingot = this.basic.ingot;
            if (this._seeType == 2){
                this.totalprice = (this.price = this.basic.price);
            };
            this.desTipList = [];
            for each (_local1 in this.basic.desList) {
                this.desTipList.push(htmlFormat(_local1, 12, 0xEEEEEE));
            };
            this.name = this.basic.getItemName(this.goldId);
            this.color = this.basic.getItemColor(this.goldId);
            this.iconUrl = this.basic.getImgUrl(this.goldId);
            this.nameTip = htmlFormat(this.name, 16, this.color, true);
            if (this.basic.isEquip){
                this.addTip = Lang.sprintf(ItemInfoLang.EquipStrengthenLv, ItemType.getItemUpgrade(this.upgradeLevel));
                this.addTip = (this.addTip + this.basic.getPAttack(this.upgradeLevel, this.goldId));
                this.addTip = (this.addTip + this.basic.getPDefense(this.upgradeLevel, this.goldId));
                this.addTip = (this.addTip + this.basic.getSAttack(this.upgradeLevel, this.goldId));
                this.addTip = (this.addTip + this.basic.getSDefense(this.upgradeLevel, this.goldId));
                this.addTip = (this.addTip + this.basic.getMAttack(this.upgradeLevel, this.goldId));
                this.addTip = (this.addTip + this.basic.getMDefense(this.upgradeLevel, this.goldId));
                this.addTip = (this.addTip + this.basic.getHealth(this.upgradeLevel, this.goldId));
                this.addTip = htmlFormat(this.addTip, 12, 0xEB6100);
            } else {
                if (this.basic.isDanYao){
                    if (this.basic.strength != 0){
                        this.addTip = (ItemInfoLang.AddWuLi + ((this.propertyAdd) || (this.basic.strength)));
                    } else {
                        if (this.basic.agile != 0){
                            this.addTip = (ItemInfoLang.AddJueJi + ((this.propertyAdd) || (this.basic.agile)));
                        } else {
                            if (this.basic.intellect != 0){
                                this.addTip = (ItemInfoLang.AddFaShu + ((this.propertyAdd) || (this.basic.intellect)));
                            };
                        };
                    };
                    this.addTip = htmlFormat(this.addTip, 12, 0xEB6100);
                };
            };
            if (this.isCardBuy){
                this.lastTip = htmlFormat(((this.basic.card_name + ": ") + this.basic.card_num), 12, 14077494);
            } else {
                if (this.basic.isQuest){
                    _local2 = ((this.desTipList.pop() + "\n") + htmlFormat(ItemInfoLang.ItemQuest, 12, 14077494));
                    this.desTipList.push(_local2);
                } else {
                    if (this.totalprice > 0){
                        if (((((((this.basic.isZaWu) || (this.basic.isDanYao))) || (this.basic.isBianShen))) || (this.basic.isMounts))){
                            _local2 = ((this.desTipList.pop() + "\n") + htmlFormat(((ItemInfoLang.Prace + ": ") + this.totalprice), 12, 14077494));
                            this.desTipList.push(_local2);
                            if (this.basic.isDanYao){
                                this.desTipList[0] = ((this.addTip + "\n") + this.desTipList[0]);
                                this.addTip = "";
                            };
                        } else {
                            this.lastTip = htmlFormat(((ItemInfoLang.Prace + ": ") + this.totalprice), 12, 14077494);
                        };
                    };
                };
            };
            this.updateTipSprite(this._tipSP1);
            this.updateTipSprite(this._tipSP2);
        }
        public function get easyMsg():String{
            return ((((this.nameTip + "\n") + this.addTip) + ((this.desTipList[0])==null) ? "" : ("\n" + this.desTipList[0])));
        }
        public function get addSum():int{
            var _local1:int;
            _local1 = (_local1 + this.basic.getPAttackValue(this.upgradeLevel, this.goldId));
            _local1 = (_local1 + this.basic.getPDefenseValue(this.upgradeLevel, this.goldId));
            _local1 = (_local1 + this.basic.getSAttackValue(this.upgradeLevel, this.goldId));
            _local1 = (_local1 + this.basic.getSDefenseValue(this.upgradeLevel, this.goldId));
            _local1 = (_local1 + this.basic.getMAttackValue(this.upgradeLevel, this.goldId));
            _local1 = (_local1 + this.basic.getMDefenseValue(this.upgradeLevel, this.goldId));
            _local1 = (_local1 + this.basic.getHealthValue(this.upgradeLevel, this.goldId));
            return (_local1);
        }
        public function clone():ItemInfo{
            var _local1:ItemInfo = new ItemInfo();
            _local1.parseSee(this.itemId, this.upgradeLevel, this.goldId);
            _local1.playerItemId = this.playerItemId;
            _local1.gridId = this.gridId;
            return (_local1);
        }

    }
}//package com.assist.view.info 
