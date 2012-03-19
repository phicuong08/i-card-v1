//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.pack {
    import flash.events.*;
    import flash.display.*;
    import ICard.assist.view.*;
    import flash.utils.*;
    import ICard.haloer.display.*;
    import flash.text.*;
    import ICard.assist.*;
    import ICard.assist.view.map.*;
    import ICard.assist.server.*;
    import ICard.lang.client.com.assist.view.pack.*;

    public final class ItemTipSprite extends Sprite {

        private static const goldIdxList:Array = [1, 0, 1203, 1204, 1205, 1206, 1207, 1208, 1209, 1210, 1211];

        public static var ed:EventDispatcher = new EventDispatcher();
        private static var _textformat:TextFormat;
        private static var _tfList:Array = [];

        public var addS:String = "";
        public var addE:String = "";
        public var tipName:String = "";
        public var tipAdd:String = "";
        public var tipReq:String = "";
        public var tipDes:String = "";
        public var tipLast:String = "";
        public var playerItemId:int = 0;
        public var goldId:int = 0;
        private var isChange:Boolean = true;
        public var basic:ItemBasically;
        private var _content:Sprite;
        private var _box:MovieClip;
        private var _gStar:MovieClip;
        private var _otherlist:Array;
        private var _reqtime:int = 0;

        public function ItemTipSprite(){
            this._content = new Sprite();
            this._otherlist = [];
            super();
            if (_textformat == null){
                _textformat = new TextFormat();
                _textformat.align = TextFieldAutoSize.LEFT;
                _textformat.leading = 5;
                _textformat.color = 0xFFFFFF;
            };
            this.mouseChildren = false;
            this.mouseEnabled = false;
            this.addEventListener(Event.ADDED_TO_STAGE, this.addtostageHandler);
            this.filters = [Filter.filter2];
        }
        private static function getTipTF(_arg1:String, _arg2:int=8, _arg3:int=190):TextField{
            var _local4:TextField = (_tfList.pop() as TextField);
            if (_local4 == null){
                _local4 = new TextField();
                _local4.mouseEnabled = false;
                _local4.wordWrap = true;
                _local4.multiline = true;
                _local4.defaultTextFormat = _textformat;
            };
            _local4.text = "";
            _local4.x = 3;
            _local4.y = 0;
            _local4.width = _arg3;
            _local4.height = 300;
            _local4.htmlText = _arg1;
            _local4.height = (_local4.textHeight + _arg2);
            return (_local4);
        }

        private function addtostageHandler(_arg1:Event):void{
            if (this.tipName == ""){
                return;
            };
            if (this._box == null){
                this._box = MapStatic.mapInstance.boxObj;
                this._box.x = 145;
                this._box.y = 1;
            };
            if (this._gStar == null){
                this._gStar = MapStatic.mapInstance.boxStar;
                this._gStar.x = 1;
                this._gStar.y = 35;
            };
            if (getTimer() > this._reqtime){
                if (this.basic.isJuanZhou){
                    ed.dispatchEvent(new JuanZhouEvent(null, this.basic.item_id, "Item_Req"));
                    ed.addEventListener(("Item_" + this.basic.item_id), this.reqJuanZhouHandler);
                } else {
                    if ((((this.basic.type_id == ItemType.WuQi)) && (!((this.playerItemId == 0))))){
                        ed.dispatchEvent(new JuanZhouEvent(null, this.playerItemId, "ItemSoul_Req"));
                        ed.addEventListener(("ItemSoul_" + this.playerItemId), this.reqSoulHandler);
                    };
                };
            };
            this.update();
        }
        public function updateTips(_arg1:String="", _arg2:String="", _arg3:String="", _arg4:String="", _arg5:String=""):void{
            this.tipName = _arg1;
            this.tipAdd = _arg2;
            this.tipReq = _arg3;
            this.tipDes = _arg4;
            this.tipLast = _arg5;
            this.isChange = true;
            if (stage){
                this.update();
            };
        }
        public function reset():void{
            this._otherlist = [];
            this.basic = ItemBasically.empty;
            this.playerItemId = (this.goldId = (this._reqtime = 0));
            this.tipName = (this.tipAdd = (this.tipReq = (this.tipDes = (this.tipLast = ""))));
            this.isChange = true;
        }
        private function update():void{
            var _local1:TextField;
            if (this.isChange == false){
                return;
            };
            this.isChange = false;
            this.clear();
            this._box.Icon.addChild(BoxIconCache.getImg(this.basic.getImgUrl(this.goldId), true));
            if (this.basic.isEquip){
                this.updateEQTips();
            } else {
                if (this.basic.isJuanZhou){
                    this.updateJuanZhouTips();
                } else {
                    this.updateItemTips();
                };
            };
            this._content.y = 0;
            if (this.addS != ""){
                this._content.y = 20;
                _local1 = getTipTF(this.addS);
                this.addChild(_local1);
            };
            BoxGrid.itip.updateTarget(null);
        }
        private function updateEQTips():void{
            var _local3:TextField;
            var _local1:int = goldIdxList.indexOf(this.goldId);
            var _local2:int;
            this._content.graphics.lineStyle(1, 4012085);
            this._gStar.gotoAndStop(_local1);
            if (_local1 > 2){
                _local3 = getTipTF(this.regStrList([this.tipName, " ", this.tipAdd, this.tipDes]));
            } else {
                _local3 = getTipTF(this.regStrList([this.tipName, this.tipAdd, this.tipDes]));
            };
            _local3.y = _local2;
            _local2 = (_local2 + _local3.height);
            this._content.addChild(_local3);
            this._content.graphics.moveTo(2, _local2);
            this._content.graphics.lineTo(188, _local2);
            _local2 = (_local2 + 4);
            if (this._otherlist.length > 0){
                _local3 = getTipTF(this.regStrList(this._otherlist));
                _local3.y = _local2;
                _local2 = (_local2 + _local3.height);
                this._content.addChild(_local3);
                this._content.graphics.moveTo(2, _local2);
                this._content.graphics.lineTo(188, _local2);
                _local2 = (_local2 + 4);
            };
            _local3 = getTipTF(this.regStrList([this.tipReq]));
            _local3.y = _local2;
            _local2 = (_local2 + _local3.height);
            this._content.addChild(_local3);
            if (((!((this.tipLast == ""))) || (!((this.addE == ""))))){
                this._content.graphics.moveTo(2, _local2);
                this._content.graphics.lineTo(188, _local2);
                _local2 = (_local2 + 4);
                _local3 = getTipTF(this.regStrList([this.tipLast, this.addE]), 4);
                _local3.y = _local2;
                this._content.addChild(_local3);
            };
        }
        private function updateItemTips():void{
            var _local1:TextField;
            var _local2:int = (((this.tipReq + this.tipAdd))=="") ? 140 : 190;
            _local1 = getTipTF(this.regStrList([this.tipName, this.tipReq, this.tipAdd, this.tipDes, this.tipLast, this.addE]), 4, _local2);
            _local1.y = 3;
            this._content.addChild(_local1);
        }
        private function updateJuanZhouTips():void{
            var _local1:TextField;
            var _local2:int;
            var _local3:int;
            if (this._otherlist.length == 0){
                this.updateItemTips();
            } else {
                _local2 = 0;
                _local3 = 0;
                this._content.graphics.lineStyle(1, 4012085);
                _local1 = getTipTF(this.regStrList([this.tipName, this.tipReq, this.tipAdd, this.tipDes]), 8, 145);
                _local1.y = _local3;
                _local3 = (_local1.height + _local3);
                this._content.addChild(_local1);
                this._content.graphics.moveTo(2, _local3);
                this._content.graphics.lineTo(188, _local3);
                _local3 = (_local3 + 4);
                _local1 = getTipTF(ItemTipSpriteLang.DemandMaterials);
                _local1.y = _local3;
                this._content.addChild(_local1);
                _local3 = ((_local1.height + _local3) - 6);
                _local2 = this._otherlist.length;
                while (_local2 > 0) {
                    _local2--;
                    _local1 = getTipTF(this._otherlist[_local2], 3);
                    _local1.width = (_local1.textWidth + 6);
                    _local1.x = (2 + ((_local2 & 1) * 100));
                    _local1.y = (_local3 + ((_local2 >> 1) * 18));
                    this._content.addChild(_local1);
                };
                if (((!((this.tipLast == ""))) || (!((this.addE == ""))))){
                    _local3 = ((_local3 + 8) + (((this._otherlist.length + 1) >> 1) * 18));
                    this._content.graphics.moveTo(2, _local3);
                    this._content.graphics.lineTo(188, _local3);
                    _local1 = getTipTF(this.regStrList([this.tipLast, this.addE]), 4);
                    _local1.y = (_local3 + 6);
                    this._content.addChild(_local1);
                };
            };
        }
        private function reqJuanZhouHandler(_arg1:JuanZhouEvent):void{
            var _local2:int;
            var _local3:Array;
            var _local4:ItemBasically;
            var _local5:int;
            var _local6:int;
            var _local7:String;
            if (_arg1.id == this.basic.item_id){
                this._otherlist = [];
                this._reqtime = (getTimer() + 20000);
                _local2 = _arg1.list[7];
                for each (_local3 in _arg1.list[4]) {
                    _local4 = ItemBasically.getBasic(_local3[0]);
                    _local5 = _local3[4];
                    _local6 = _local3[1];
                    _local7 = _local4.getItemName(_local2);
                    if (_local5 >= _local6){
                        _local7 = HtmlText.format(((((_local7 + " ") + _local6) + "/") + _local6), 0xFF00);
                    } else {
                        _local7 = HtmlText.format(((((_local7 + " ") + _local5) + "/") + _local6), 0xEEEEEE);
                    };
                    this._otherlist.push(_local7);
                };
                this.isChange = true;
                if (stage){
                    this.update();
                };
            };
            ed.removeEventListener(_arg1.type, this.reqJuanZhouHandler);
        }
        private function reqSoulHandler(_arg1:JuanZhouEvent):void{
            var _local2:Object;
            if (_arg1.id == this.playerItemId){
                this._otherlist = [];
                this._reqtime = (getTimer() + 20000);
                for each (_local2 in _arg1.list) {
                    this._otherlist.push(htmlFormat(_local2.info, 12, this.basic.getItemColor(this.goldId)));
                };
                this.isChange = true;
                if (stage){
                    this.update();
                };
            };
            ed.removeEventListener(_arg1.type, this.reqSoulHandler);
        }
        private function clear():void{
            var _local1:TextField;
            var _local2:int = this.numChildren;
            while (_local2 > 0) {
                --_local2;
                _local1 = (this.removeChildAt(_local2) as TextField);
                if (_local1 != null){
                    _local1.width = 180;
                    _local1.height = 20;
                    _tfList.push(_local1);
                };
            };
            _local2 = this._content.numChildren;
            while (_local2 > 0) {
                --_local2;
                _local1 = (this._content.removeChildAt(_local2) as TextField);
                if (_local1 != null){
                    _local1.width = 180;
                    _local1.height = 20;
                    _tfList.push(_local1);
                };
            };
            while (this._box.Icon.numChildren) {
                BoxIconCache.pushImg((this._box.Icon.removeChildAt(0) as Image));
            };
            this._gStar.gotoAndStop(1);
            this._content.graphics.clear();
            this._content.addChild(this._box);
            this._content.addChild(this._gStar);
            this.addChild(this._content);
        }
        private function regStrList(_arg1:Array):String{
            var _local3:String;
            var _local2:Array = [];
            for each (_local3 in _arg1) {
                if (_local3 != ""){
                    _local3 = _local3.split("\r\n").join("\n");
                    _local2.push(_local3);
                };
            };
            return (_local2.join("\n"));
        }

    }
}//package com.assist.view.pack 
