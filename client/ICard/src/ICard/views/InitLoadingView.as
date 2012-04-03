//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.*;
    import ICard.assist.*;
    import ICard.assist.view.*;
    import ICard.assist.view.interfaces.*;
    import ICard.lang.client.com.views.*;
    import ICard.protocols.*;

    public class InitLoadingView extends Base implements IView {

        private var _il:IInitLoading;
        private var _limitForLogo:int = 2;
        private var _toolbarLoaded:Boolean = false;
        private var _toolbarHandler:Function;

        public function show():void{
            if (this._limitForLogo-- == 0){
                this._il.content.gotoAndStop(2);
            };
            if (this._limitForLogo < -1){
                this._limitForLogo = -1;
            };
            this.render();
        }
        public function get logoSuffix():String{
            var _local1:String = "";
            if (((URI.isBaidu) || (URI.isPlatformB))){
                _local1 = "Baidu";
            } else {
                if (URI.isMangguo){
                    _local1 = "Mangguo";
                };
            };
            return (_local1);
        }
        private function render():void{
            if (null == this._il){
				this._il = (_viewMgr.getAssetsObject(("InitLoading" + this.logoSuffix), "InitLoading") as IInitLoading);
                this._il.tip = InitLoadingViewLang.Tip;
            };
//			_viewMgr.stage.addChild(this._il.content);
            _popup.addView(this, this._il.content);
            this.loading("");
			_viewMgr.closeEvent();
        }
        public function clear():void{
        }
        public function close():void{
            this.reposition(false);
            this.clear();
            _popup.closeView(this);
			_viewMgr.openEvent();
        }
        public function loadChooseRole():void{
            var callback:* = function ():void{
//				_viewMgr.chooseRoles.show();
                close();
                backendLoadToolbar();
            };
            this.loadResources(["ChooseRoles"], callback);
        }
        public function loadToolbar():void{
            if (_viewMgr.login.first == false){
                this.loadToolbar1(this.get_player_info);
            } else {
                if (true == this._toolbarLoaded){
                    this.get_player_info();
                } else {
                    if (false == inStage){
                        this.render();
                    };
                    this._toolbarHandler = this.get_player_info;
                };
            };
        }
        public function backendLoadToolbar():void{
            var callback:* = function ():void{
                if ((_toolbarHandler is Function)){
                    _toolbarHandler();
                };
                _toolbarLoaded = true;
            };
            this.loadToolbar1(callback);
        }
        private function loadToolbar1(_arg1:Function):void{
            this.loadResources(["Toolbar", "PanelLoading", "DelayMessage", "Map", "Chat", "Templet"], _arg1);
        }
        public function get_player_info():void{
            Helper.backtrace("Mod_Player_Base.get_player_info, 1");
			_viewMgr.formatServerData();
            _data.call(Mod_Player_Base.get_player_info, this.getPlayerInfoCallback, []);
        }
        private function getPlayerInfoCallback():void{
            Helper.backtrace("Mod_Player_Base.get_player_info, 0");
			_viewMgr.afterGetPlayerInfo();
        }
        private function loadResources(_arg1:Array, _arg2:Function):void{
            var _local3:LoadResponder = new LoadResponder(_arg2, this.loading);
			_viewMgr.loadResources(_arg1, _local3);
        }
        public function loading(_arg1:String, _arg2:int=0, _arg3:int=0, _arg4:int=1, _arg5:String=""):void{
            var _local6:String = Lang.sprintf(InitLoadingViewLang.Loading, (_arg3 + 1), _arg4, _arg2, _arg5);
            this.loading1(_local6, _arg2);
        }
        public function loading1(_arg1:String, _arg2:int=100):void{
            this._il.render(_arg1, _arg2);
            this.reposition(false);
        }
        public function reposition(_arg1:Boolean=true):void{
            var _local2:int;
            var _local3:int;
            if (inStage == false){
                return;
            };
            if (true == _arg1){
//				_viewMgr.toolbar.reposition();
            } else {
                _local2 = Structure.stageWidth;
                _local3 = Structure.stageHeight;
                this._il.content.x = ((_local2 - this._il.content.width) / 2);
                this._il.content.y = ((_local3 - this._il.content.height) / 2);
            };
            _structure.reposition();
        }
        public function set tip(_arg1:String):void{
            this._il.tip = _arg1;
        }

    }
}//package com.views 
