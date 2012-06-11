//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import flash.utils.*;
    import ICard.assist.view.interfaces.*;

    public class WorldNoticeView extends Base {

        private var _worldNotice:IWorldNotice;
        private var _strMessage:String;
        private var _intSecond:int = 5;
		private var _icon:String;
        public function close():void{
            this._viewMgr.stage.removeChild(this._worldNotice.content);
        }
        public function showMessage(_arg1:String, _arg2:int=5,_arg3:String=""):void{
            this._strMessage = _arg1;
            this._intSecond = _arg2;
			this._icon = _arg3;
            if (this._worldNotice == null){
                loadAssets("WorldNotice", this.render, "", true, true);
            } else {
                this.render();
            };
        }
        public function reposition(_arg1:Boolean=true):void{
            if (true == _arg1){
                _viewMgr.toolbar.reposition();
            } else {
                if (((!((this._worldNotice == null))) && (this._viewMgr.stage.contains(this._worldNotice.content)))){
                    this._worldNotice.content.x = Math.max(290, (Math.floor(((this._viewMgr.stage.stageWidth - 420) / 2)) - Structure.stageClip.x));
                    this._worldNotice.content.y = (150 + Structure.stageOffset.y);
                };
            };
        }
        public function preLoad():void{
            if (this._worldNotice == null){
                this._worldNotice = (_viewMgr.getAssetsObject("WorldNotice", "WorldNotice") as IWorldNotice);
            };
        }
        private function render():void{
            if (this._worldNotice == null){
                this._worldNotice = (_viewMgr.getAssetsObject("WorldNotice", "WorldNotice") as IWorldNotice);
            };
            this.showWorldNotice(this._strMessage, this._intSecond,_icon);
        }
        private function showWorldNotice(_arg1:String, _arg2:int,_arg3:String):void{
            var delay:* = null;
            var strMessage:* = _arg1;
            var intSecond:* = _arg2;
//            delay = function ():void{
//                showWorldNotice(strMessage, intSecond);
//            };
//            if (this._viewMgr.inWar){
//                setTimeout(delay, 5000);
//                return;
//            };
            if (!this._viewMgr.stage.contains(this._worldNotice.content)){
                this._worldNotice.content.x = Math.max(290, Math.floor(((this._viewMgr.stage.stageWidth - 420) / 2)));
                this._worldNotice.content.y = (100 + Structure.stageOffset.y);
            };
            this._viewMgr.stage.addChild(this._worldNotice.content);
            this._worldNotice.onClose = this.close;
            this._worldNotice.show(strMessage, intSecond,_arg3);
        }

    }
}//package com.views 
