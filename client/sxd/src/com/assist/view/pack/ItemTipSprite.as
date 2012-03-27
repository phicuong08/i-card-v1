//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.pack {
    import flash.events.*;
    import flash.display.*;
    import com.assist.view.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.haloer.display.*;
    import flash.text.*;
    import com.assist.*;
    import com.assist.view.map.*;
    import com.assist.server.*;

    public final class ItemTipSprite extends Sprite {

        public static var iTip:ITip;
        public static var ed:EventDispatcher = new EventDispatcher();
        private static var _goldIdxList:Array = [1, 0, 1203, 1204, 1205, 1206, 1207, 1208, 1209, 1210, 1211];
        private static var _tfList:Array = [];

        public var topString:String = "";
        public var bottomString:String = "";
        public var tipName:String = "";
        public var tipList:Array;
        public var playerItemId:int = 0;
        public var goldId:int = 0;
        public var basic:ItemBasically;
        private var _content:Sprite;
        private var _box:MovieClip;
        private var _gStar:MovieClip;
        private var _otherlist:Array;
        private var _reqtime:int = 0;
        private var _isChange:Boolean = true;

        public function ItemTipSprite(){
            this.tipList = [];
            this._content = new Sprite();
            this._otherlist = [];
            super();
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
                _local4.textColor = 0xFFFFFF;
            };
            _local4.x = 3;
            _local4.y = 0;
            _local4.width = _arg3;
            _local4.height = 300;
            _local4.htmlText = (("<textformat leading='6'>" + _arg1) + "</textformat>");
            _local4.height = (_local4.textHeight + _arg2);
            return (_local4);
        }

        private function addtostageHandler(_arg1:Event):void{
            if (this.tipName == ""){
                return;
            };
            this._box = ((this._box) || (MapStatic.mapInstance.boxObj));
            this._box.x = 145;
            this._box.y = 1;
            this._gStar = ((this._gStar) || (MapStatic.mapInstance.boxStar));
            this._gStar.x = 1;
            this._gStar.y = 37;
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
        public function updateTip(_arg1:String, _arg2:Array):void{
            this.tipName = _arg1;
            this.tipList = ((_arg2) || ([]));
            _arg2.push(((_arg2.pop() + "\n") + this.bottomString));
            this._isChange = true;
            if (stage){
                this.update();
            };
        }
        public function reset():void{
            this._otherlist = [];
            this.basic = ItemBasically.empty;
            this.playerItemId = (this.goldId = (this._reqtime = 0));
            this.tipList = [];
            this.tipName = "";
            this._isChange = true;
        }
        private function update():void{
            var _local1:TextField;
            if (this._isChange == false){
                return;
            };
            this._isChange = false;
            this.clear();
            this._box.Icon.addChild(BoxIconCache.getImg(this.basic.getImgUrl(this.goldId), true));
            this.updateItemTip();
            if (this.topString != ""){
                this._content.y = 16;
                _local1 = getTipTF(this.topString);
                this.addChild(_local1);
            } else {
                this._content.y = 0;
            };
            iTip.updateTarget();
        }
        private function updateItemTip():void{
            var _local3:TextField;
            var _local1:int = _goldIdxList.indexOf(this.goldId);
            var _local2:int = 3;
            this._content.graphics.lineStyle(1, 4012085);
            this._gStar.gotoAndStop(_local1);
            _local3 = getTipTF(this.tipName, 0);
            _local3.y = _local2;
            this._content.addChild(_local3);
            if (_local3.textWidth > 143){
                this._box.x = (_local3.textWidth + 3);
            };
            _local2 = (_local2 + _local3.height);
            if (_local1 > 2){
                _local2 = (_local2 + 20);
            };
            var _local4:String = this.tipList[0];
            if ((((this.basic.isEquip == false)) && ((this.basic.isDanYao == false)))){
                _local3 = getTipTF(this.tipList[0], 0, 140);
                if (_local3.numLines > 1){
                    _local4 = _local4.replace(_local3.getLineText(0), (_local3.getLineText(0) + "\n"));
                };
                _tfList.push(_local3);
            };
            _local3 = getTipTF(_local4);
            _local3.y = _local2;
            this._content.addChild(_local3);
            _local2 = (_local2 + _local3.height);
            var _local5:int;
            if (this._otherlist.length > 0){
                this._content.graphics.moveTo(2, _local2);
                this._content.graphics.lineTo(188, _local2);
                _local2 = (_local2 + 4);
                if (this.basic.isEquip){
                    _local3 = getTipTF(this._otherlist.join("\n"));
                    _local3.y = _local2;
                    _local2 = (_local2 + _local3.height);
                    this._content.addChild(_local3);
                } else {
                    if (this.basic.isJuanZhou){
                        _local5 = this._otherlist.length;
                        while (_local5 > 0) {
                            _local5--;
                            _local3 = getTipTF(this._otherlist[_local5], 3);
                            _local3.width = (_local3.textWidth + 6);
                            _local3.x = (2 + ((_local5 & 1) * 100));
                            _local3.y = (_local2 + ((_local5 >> 1) * 18));
                            this._content.addChild(_local3);
                        };
                        _local2 = ((_local2 + (((this._otherlist.length + 1) >> 1) * 18)) + 5);
                    };
                };
            };
            _local5 = this.tipList.length;
            var _local6:int = 1;
            while (_local6 < _local5) {
                this._content.graphics.moveTo(2, _local2);
                this._content.graphics.lineTo(188, _local2);
                _local2 = (_local2 + 4);
                _local3 = getTipTF(this.tipList[_local6]);
                _local3.y = _local2;
                _local2 = (_local2 + _local3.height);
                this._content.addChild(_local3);
                _local6++;
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
                this._isChange = true;
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
                this._isChange = true;
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
