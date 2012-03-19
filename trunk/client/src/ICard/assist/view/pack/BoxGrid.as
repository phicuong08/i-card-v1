//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.pack {
    import flash.events.*;
    import flash.display.*;
    import flash.utils.*;
    import flash.geom.*;
    import ICard.assist.view.interfaces.*;
    import ICard.assist.view.info.*;
    import ICard.assist.view.interfaces.item.*;
    import ICard.haloer.display.*;
    import ICard.assist.*;
    import ICard.lang.client.com.assist.view.pack.*;
    import flash.filters.*;

    public class BoxGrid {

        public static const idPack:int = 1;
        public static const idRole:int = 201;
        public static const idWareHouse:int = 101;
        public static const typePack:int = 1;
        public static const typeRole:int = 2;
        public static const typeWareHouse:int = 3;
        public static const typeShop:int = 4;

        private static var emptyFun:Function = new Function();
        private static var cf:ColorMatrixFilter = new ColorMatrixFilter([0.2, 0.2, 0.2, 0, 0, 0.2, 0.2, 0.2, 0, 0, 0.2, 0.2, 0.2, 0, 0, 0, 0, 0, 1, 1]);
        public static var itip:ITip;
        private static var _emptyItem:ItemInfo;
        public static var dragLayer:Sprite = new Sprite();
        protected static var _focusBox:BoxGrid;
        protected static var _dragIcon:Sprite = new Sprite();
        public static var eqList:Array;
        public static var isOpenShop:Boolean = false;
        public static var isOpenWareHouse:Boolean = false;
        public static var isOpenRole:Boolean = false;
        public static var isOpenRecycle:Boolean = false;

        public var id:int = 0;
        public var boxType:int = 0;
        protected var _item:ItemInfo;
        public var can:Array;
        public var onDrag:Function;
        public var onDoubleClick:Function;
        public var onClick:Function;
        public var defaultTips:String = null;
        public var iBox:IBoxUI;
        private var _content:Sprite;
        private var _icon:Sprite;
        public var isLock:Boolean = false;
        private var _mouseDownTime:int = 0;
        private var _mouseUpTime:int = 0;
        private var _downX:int = 0;
        private var _downY:int = 0;

        public function BoxGrid(_arg1:int, _arg2:int, _arg3:IBoxUI){
            this.can = [];
            super();
            this.iBox = _arg3;
            this.id = _arg1;
            this.boxType = _arg2;
            this.iBox.num = "";
            this.iBox.itemName = "";
            this._icon = this.iBox.icon;
            this._content = this.iBox.content;
            this._content.addEventListener(MouseEvent.MOUSE_OVER, this.boxOverHandler);
            this._content.addEventListener(MouseEvent.MOUSE_OUT, this.boxOutHandler);
            this._content.addEventListener(MouseEvent.MOUSE_DOWN, this.boxDownHandler);
            this._content.addEventListener(MouseEvent.MOUSE_UP, this.boxUpHandler);
            this._item = _emptyItem;
            this.onDrag = (this.onDoubleClick = (this.onClick = emptyFun));
        }
        private static function findBoxPack(_arg1:Array):IBoxPack{
            var _local2:DisplayObject;
            while (_arg1.length) {
                _local2 = (_arg1.pop() as DisplayObject);
                if ((_local2 is IBoxPack)){
                    return ((_local2 as IBoxPack));
                };
                while (_local2.parent) {
                    _local2 = _local2.parent;
                    if ((_local2 is IBoxPack)){
                        return ((_local2 as IBoxPack));
                    };
                };
            };
            return (null);
        }
        public static function initStatic():void{
            _emptyItem = new ItemInfo();
            _dragIcon.mouseChildren = false;
            _dragIcon.mouseEnabled = false;
            _dragIcon.graphics.beginFill(0, 0.1);
            _dragIcon.graphics.drawRect(0, 0, 40, 40);
        }
        private static function getAddtip(_arg1:int, _arg2:ItemInfo):String{
            var _local3 = "";
            if (_arg1 == BoxGrid.typeShop){
                _local3 = (isOpenShop) ? BoxGridLang.ClickBuy : BoxGridLang.ClickRebuy;
                if (((isOpenShop) && (_arg2.isCardBuy))){
                    _local3 = ((_local3 + "\n") + BoxGridLang.JoinGetJade);
                };
            } else {
                if (_arg1 == BoxGrid.typeWareHouse){
                    _local3 = BoxGridLang.ClickGet;
                } else {
                    if (_arg1 == BoxGrid.typeRole){
                        _local3 = BoxGridLang.ClickUnGet;
                    } else {
                        if (_arg1 == BoxGrid.typePack){
                            if (((isOpenShop) || (isOpenRecycle))){
                                if (_arg2.basic.isBrand){
                                    _local3 = BoxGridLang.NoSellJade;
                                } else {
                                    if (_arg2.basic.isPackage){
                                        _local3 = BoxGridLang.NoSellGift;
                                    } else {
                                        if (_arg2.basic.isDanYao){
                                            _local3 = BoxGridLang.NoSellImmortality;
                                        } else {
                                            if (_arg2.useing){
                                                _local3 = BoxGridLang.NoSellInUse;
                                            } else {
                                                if (_arg2.basic.ingot > 0){
                                                    _local3 = BoxGridLang.NoSellItem;
                                                } else {
                                                    if (_arg2.basic.price == 0){
                                                        _local3 = BoxGridLang.NoSellItem;
                                                    } else {
                                                        _local3 = BoxGridLang.ClickSell;
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            } else {
                                if (isOpenWareHouse){
                                    if (_arg2.useing){
                                        _local3 = BoxGridLang.NoIntoWarehouse;
                                    } else {
                                        _local3 = BoxGridLang.ClickIntoWarehouse;
                                    };
                                } else {
                                    if (_arg2.basic.isEquip){
                                        _local3 = BoxGridLang.ClickEquip;
                                    } else {
                                        if (_arg2.basic.isMounts){
                                            _local3 = BoxGridLang.ClickRide;
                                        } else {
                                            if (_arg2.basic.isCanUseing){
                                                _local3 = BoxGridLang.ClickUse;
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            if (_local3 != ""){
                _local3 = htmlFormat(_local3, 12, 0x888888, false, false);
            };
            return (_local3);
        }

        public function set lockLight(_arg1:Boolean):void{
            this.iBox.lockLight = _arg1;
        }
        public function get item():ItemInfo{
            return (this._item);
        }
        public function set item(_arg1:ItemInfo):void{
            this._item = ((_arg1) || (_emptyItem));
            this.iBox.lock = (this.isLock = (_arg1 == null));
            this.updateShow();
        }
        public function get itemId():int{
            return (this._item.itemId);
        }
        public function get itemType():int{
            return (this._item.basic.type_id);
        }
        public function get playerItemId():int{
            return (this._item.playerItemId);
        }
        public function get itemName():String{
            return (this._item.name);
        }
        public function get isPackBox():Boolean{
            return ((this.boxType == typePack));
        }
        public function get isRoleBox():Boolean{
            return ((this.boxType == typeRole));
        }
        public function get isWareHouseBox():Boolean{
            return ((this.boxType == typeWareHouse));
        }
        public function get isShopBox():Boolean{
            return ((this.boxType == typeShop));
        }
        public function hideItem():void{
            this.clearIcon(this._icon);
            this.iBox.num = "";
            itip.removeTarget(this._content);
        }
        protected function updateShow():void{
            this.iBox.id = this._item.itemId;
            this._content.filters = [];
            this.clearIcon(this._icon);
            itip.removeTarget(this._content);
            if (this._item.itemId == 0){
                this.iBox.num = "";
                this.iBox.itemName = "";
                this.iBox.itemPrice = "";
                if (this.defaultTips != null){
                    itip.addTarget(this._content, this.defaultTips);
                };
            } else {
                this._icon.addChild(this.getImg(this._item.iconUrl, true));
                this.iBox.num = (this._item.num + "");
                this.iBox.itemName = htmlFormat(this._item.name, 13, this._item.color);
                this.iBox.itemPrice = "";
                this.updateItemPrice();
                this.updateTips();
                if ((((this._item.basic.isStack == false)) || ((((this.boxType == typeShop)) && (isOpenShop))))){
                    this.iBox.num = "";
                };
            };
        }
        private function updateItemPrice():void{
            if (this._item.isCardBuy){
                this.iBox.itemPrice = ((this._item.basic.card_name + " ") + this._item.basic.card_num);
            } else {
                if (this._item.basic.ingot > 0){
                    this.iBox.itemPrice = ((("<font color='#fff200'>" + BoxGridLang.Ingot) + this._item.basic.ingot) + "</font>");
                } else {
                    this.iBox.itemPrice = (BoxGridLang.Coin + this._item.totalprice);
                };
            };
        }
        public function updateTips():void{
            var _local2:BoxGrid;
            var _local3:Sprite;
            var _local1:Sprite = this._item.getTipsSprite1("", getAddtip(this.boxType, this._item));
            if (((((this._item.basic.isEquip) && (this.isPackBox))) && (eqList))){
                _local2 = eqList[this._item.basic.type_id];
                if (_local2.itemId != 0){
                    _local3 = _local2.item.getTipsSprite2(htmlFormat(BoxGridLang.CurrentEquip, 12, 8623050, false, false), "");
                    itip.addTargetMoreTips(this._content, _local1, _local3);
                    return;
                };
            };
            itip.addTarget(this._content, _local1);
        }
        public function addFilters():void{
            this._content.filters = [cf];
        }
        public function removeFilters():void{
            this._content.filters = [];
        }
        private function boxOverHandler(_arg1:Event):void{
            _focusBox = this;
            this.iBox.light = true;
        }
        private function boxOutHandler(_arg1:Event):void{
            if (_focusBox == this){
                _focusBox = null;
            };
            this.iBox.light = false;
        }
        public function set eqUpdateVisible(_arg1:Boolean):void{
            if ((this.iBox is IBoxUpdateUI)){
                (this.iBox as IBoxUpdateUI).updateVisible = _arg1;
            };
        }
        public function set onEqUpdate(_arg1:Function):void{
            var box:* = null;
            var fun:* = _arg1;
            box = this;
            if ((this.iBox is IBoxUpdateUI)){
                (this.iBox as IBoxUpdateUI).btnUpdate.addEventListener(MouseEvent.CLICK, function ():void{
                    fun(box);
                });
            };
        }
        public function set onGold(_arg1:Function):void{
            var box:* = null;
            var fun:* = _arg1;
            box = this;
            if ((this.iBox is IBoxUpdateUI)){
                (this.iBox as IBoxUpdateUI).btnGold.addEventListener(MouseEvent.CLICK, function ():void{
                    fun(box);
                });
            };
        }
        public function get btnUpdate():DisplayObject{
            return ((this.iBox as IBoxUpdateUI).btnUpdate);
        }
        private function boxUpHandler(_arg1:Event):void{
            this._content.removeEventListener(MouseEvent.MOUSE_MOVE, this.boxMoveHandler);
            if (this._mouseDownTime == 0){
                return;
            };
            var _local2:int = getTimer();
            var _local3:int = (_local2 - this._mouseUpTime);
            this._mouseUpTime = _local2;
            if ((((_local3 > 50)) && ((_local3 < 350)))){
                this._mouseUpTime = 0;
                if (this._item.itemId != 0){
                    this.onDoubleClick(this);
                };
            } else {
                setTimeout(this.checkClick, 200, this._mouseDownTime);
            };
        }
        private function checkClick(_arg1:int):void{
            if ((((this._mouseDownTime == _arg1)) && (((!((this._item.itemId == 0))) || (this.isLock))))){
                this.onClick(this);
            };
        }
        protected function boxDownHandler(_arg1:Event):void{
            this._mouseDownTime = getTimer();
            this._downX = this._content.mouseX;
            this._downY = this._content.mouseY;
            this._content.addEventListener(MouseEvent.MOUSE_MOVE, this.boxMoveHandler);
            itip.hideOpened();
        }
        private function boxMoveHandler(_arg1:MouseEvent):void{
            if (_arg1.buttonDown == false){
                this._content.removeEventListener(MouseEvent.MOUSE_MOVE, this.boxMoveHandler);
                return;
            };
            var _local2:int = (this._content.mouseX - this._downX);
            var _local3:int = (this._content.mouseY - this._downY);
            if (_local2 < 0){
                _local2 = -(_local2);
            };
            if (_local3 < 0){
                _local3 = -(_local3);
            };
            if ((_local2 + _local3) < 6){
                return;
            };
            this._content.removeEventListener(MouseEvent.MOUSE_MOVE, this.boxMoveHandler);
            this._mouseDownTime = 0;
            if (this._item.itemId == 0){
                return;
            };
            this.addFilters();
            var _local4:Number = this._content.mouseX;
            var _local5:Number = this._content.mouseY;
            dragLayer.addChild(_dragIcon);
            this.clearIcon(_dragIcon);
            _dragIcon.addChild(this.getImg(this._item.iconUrl, true));
            _dragIcon.x = (dragLayer.mouseX - 22);
            _dragIcon.y = (dragLayer.mouseY - 22);
            _dragIcon.startDrag();
            this._content.stage.addEventListener(MouseEvent.MOUSE_UP, this.stageMouseUpHandler);
        }
        private function stageMouseUpHandler(_arg1:Event):void{
            var _local6:Array;
            var _local7:IBoxPack;
            var _local2:Stage = (_arg1.currentTarget as Stage);
            _local2.removeEventListener(MouseEvent.MOUSE_UP, this.stageMouseUpHandler);
            _dragIcon.stopDrag();
            if (_dragIcon.parent == dragLayer){
                dragLayer.removeChild(_dragIcon);
            };
            this.removeFilters();
            if (this.onDrag === emptyFun){
                return;
            };
            var _local3:BoxGrid = this;
            var _local4:BoxGrid = _focusBox;
            if (_local3 === _local4){
                return;
            };
            var _local5:int = _local3.itemType;
            if (((((!((_local4 == null))) && (_local4.canPush(_local5)))) && ((_local4.isLock == false)))){
                this.onDrag(_local3, _local4);
                return;
            };
            if ((((_local4 == null)) || ((_local4.isLock == true)))){
                _local6 = _local2.getObjectsUnderPoint(new Point(_local2.mouseX, _local2.mouseY));
                _local7 = findBoxPack(_local6);
                if ((_local7 is IShopUI)){
                    this.onDrag(_local3, _local4);
                    return;
                };
                if (_local7 == null){
                    this.onDrag(_local3, _local4);
                    return;
                };
            };
        }
        public function canPush(_arg1:int):Boolean{
            if (this.can.length == 0){
                return (true);
            };
            if (this.can.indexOf(_arg1) != -1){
                return (true);
            };
            return (false);
        }
        private function clearIcon(_arg1:Sprite):void{
            while (_arg1.numChildren) {
                BoxIconCache.pushImg((_arg1.removeChildAt(0) as Image));
            };
        }
        private function getImg(_arg1:String, _arg2:Boolean):Image{
            return (BoxIconCache.getImg(_arg1, _arg2));
        }

    }
    var _local1:* = BoxGrid.initStatic();
    return (_local1);
}//package com.assist.view.pack 
