//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.display.*;
    import flash.utils.*;
    import com.assist.view.info.*;
    import com.assist.view.interfaces.map.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.map.*;

    public class DramaView extends Base {

        private var _id:int = 0;
        private var _content:Sprite;
        private var _dramaCache:Array;
        private var _endFun:Function;
        private var _isSee:Boolean;
        private var _toWar:Boolean;

        public function DramaView(){
            this._content = new Sprite();
            this._dramaCache = [];
            super();
            this._content.graphics.beginFill(0, 1);
            this._content.graphics.drawRect(0, 0, 1000, 600);
            this._content.graphics.endFill();
        }
        override public function get inStage():Boolean{
            return (!((this._content.stage == null)));
        }
        public function init(_arg1:int, _arg2:String):void{
            var _local3:PlayerInfo;
            if (this._dramaCache[_arg1] == null){
                this._dramaCache[_arg1] = MapStatic.mapInstance.drama;
                _local3 = _ctrl.player.playerInfo;
                (this._dramaCache[_arg1] as IDramaManage).initXMLUrl(_arg2, _local3.sign, _local3.signSuffix, _local3.name);
            };
        }
        public function play(_arg1:int, _arg2:Function, _arg3:Boolean):void{
            this._isSee = _arg3;
            this._id = _arg1;
            this._endFun = ((_arg2) || (new Function()));
            var _local4:IDramaManage = (this._dramaCache[_arg1] as IDramaManage);
            this._content.addChild(_local4.content);
            _popup.addChild(this._content);
            _local4.play(this.dramaEnd, this.dramagropress);
            _local4.closeVisible = _arg3;
            MouseCursor.show();
            if (this._content.stage){
                this._content.stage.focus = null;
            };
            _view.chat.chatVisible = false;
            _view.processTip.visible = false;
            _view.screen.display.visible = false;
        }
        private function dramagropress(_arg1:String, _arg2:Boolean):void{
            _view.showLoading(_arg1, 100);
            if (_arg2){
                _view.hideLoading();
            };
        }
        private function dramaEnd():void{
            var _local1:IDramaManage = (this._dramaCache[this._id] as IDramaManage);
            this._toWar = _local1.toWar;
            if ((((this._toWar == false)) || ((this._isSee == true)))){
                this._toWar = false;
                _local1.actionBackMask();
            } else {
                if (this._endFun.length == 1){
                    this._endFun(this._toWar);
                } else {
                    this._endFun();
                };
            };
            if ((((this._isSee == false)) && ((this._id < 0x800000)))){
                _data.call(Mod_Mission_Base.sign_play_mission_video, null, [this._id]);
            };
            delete this._dramaCache[this._id];
            setTimeout(this.dramaClear, 800);
            _view.chat.chatVisible = true;
            _view.processTip.visible = true;
            _view.screen.display.visible = true;
        }
        public function dramaClear():void{
            if (this._content.parent){
                this._content.parent.removeChild(this._content);
            };
            while (this._content.numChildren) {
                this._content.removeChildAt(0);
            };
            if (this._toWar == false){
                if (this._endFun.length == 1){
                    this._endFun(this._toWar);
                } else {
                    this._endFun();
                };
            };
        }

    }
}//package com.views 
