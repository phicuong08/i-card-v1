//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.pack {
    import flash.events.*;
    import flash.display.*;
    import com.haloer.display.*;
    import flash.text.*;
    import com.assist.view.map.*;
    import flash.filters.*;

    public final class SoulTipSprite extends Sprite {

        private static var _gf:GlowFilter = new GlowFilter(0, 1, 2, 2, 4, 1);
        private static var _tfList:Array = [];

        public var iconUrl:String = "";
        public var nameHtml:String = "";
        public var desHtml:String = "";
        public var addHtml:String = "";
        public var star1:int = 0;
        public var star2:int = 0;
        public var star3:int = 0;
        public var ischange:Boolean = true;
        private var _icon:Sprite;
        private var _star1:MovieClip;
        private var _star2:MovieClip;
        private var _star3:MovieClip;
        private var _box:MovieClip;

        public function SoulTipSprite(){
            this._icon = new Sprite();
            super();
            this._star1 = (this._star2 = (this._star3 = new MovieClip()));
            this.mouseChildren = false;
            this.mouseEnabled = false;
            this.addEventListener(Event.ADDED_TO_STAGE, this.addtostageHandler);
        }
        private static function getTipTF(_arg1:String, _arg2:int=145):TextField{
            var _local3:TextField = (_tfList.pop() as TextField);
            if (_local3 == null){
                _local3 = new TextField();
                _local3.mouseEnabled = false;
                _local3.wordWrap = true;
                _local3.multiline = true;
                _local3.textColor = 0xFFFFFF;
            };
            _local3.x = 3;
            _local3.y = 0;
            _local3.width = _arg2;
            _local3.htmlText = (("<textformat leading='6'>" + _arg1) + "</textformat>");
            _local3.height = (_local3.textHeight + 5);
            return (_local3);
        }

        private function addtostageHandler(_arg1:Event):void{
            if (this._box == null){
                this._box = MapStatic.mapInstance.soulBox;
                this._box.x = 145;
                this._box.y = 1;
                this._icon = this._box.MCIcon;
                this._star1 = this._box.MCStar1;
                this._star2 = this._box.MCStar2;
                this._star3 = this._box.MCStar3;
                this.filters = [_gf];
            };
            this.update();
        }
        private function clearChild(_arg1:Sprite):void{
            while (_arg1.numChildren) {
                BoxIconCache.pushImg((_arg1.removeChildAt(0) as Image));
            };
        }
        private function update():void{
            if (this.ischange == false){
                return;
            };
            this.ischange = false;
            this.clear();
            if (this._icon.numChildren == 0){
                this._icon.addChild(BoxIconCache.getImg(this.iconUrl, true));
            };
            this._star1.gotoAndStop(this.star1);
            this._star1.visible = !((this.star1 == 0));
            this._star2.gotoAndStop(this.star2);
            this._star2.visible = !((this.star2 == 0));
            this._star3.gotoAndStop(this.star3);
            this._star3.visible = !((this.star3 == 0));
            var _local1:TextField = getTipTF(this.regStrList([this.nameHtml, this.addHtml, this.desHtml]));
            this.addChild(_local1);
        }
        public function clear():void{
            var _local1:TextField;
            this.graphics.clear();
            while (this.numChildren) {
                _local1 = (this.removeChildAt(0) as TextField);
                if (_local1 != null){
                    _local1.width = 180;
                    _local1.height = 20;
                    _tfList.push(_local1);
                };
            };
            while (this._icon.numChildren) {
                this._icon.removeChildAt(0);
            };
            this.addChild(this._box);
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
