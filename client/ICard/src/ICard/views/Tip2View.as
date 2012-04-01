//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.assist.view.controls.*;
    import ICard.assist.view.interfaces.*;
    import ICard.lang.client.com.views.*;
    
    import flash.display.Sprite;
    import flash.net.*;

    public class Tip2View extends Base implements IView {

        private var _tip:ITip2;
        private var _list:Array;
        private var _hackToolsTip:ITip2;
        private var _hackToolsTipList:Array;
        private var _alert:IAlert2;
        private var _title:String;
        private var _type:int;

        public function Tip2View(){
            this._list = [];
            this._hackToolsTipList = [];
            super();
        }
        public function show():void{
        }
        public function clear():void{
        }
        private function loadTip(_arg1:Function):void{
            loadAssets("Tip2", _arg1, Tip2ViewLang.LoadInfo, true, true);
        }
        public function close():void{
            if (this.iTip){
                this.iTip.hide();
            };
        }
        public function test():void{
            this.iTip.show("警告", "内容", TipType.Alert);
            this.iTip.show("失败", "内容", TipType.Failure);
            this.iTip.show("处理中...", "内容", TipType.Process);
            this.iTip.show("问题", "内容", TipType.Question);
            this.iTip.show("成功", "内容", TipType.Success);
        }
        public function showTip(_arg1:String, _arg2:String, _arg3:int):void{
            this._list.push({
                title:_arg1,
                content:_arg2,
                type:_arg3
            });
            this.loadTip(this.renderTip);
        }
        private function renderTip():void{
            if (this._list.length > 0){
                this.iTip.show(this._list[0]["title"], ((this._list[0]["content"]) || (Tip2ViewLang.TipContent)), this._list[0]["type"]);
                this._list = [];
            };
        }
        public function hideTip():void{
            if (this._tip){
                this._tip.hide();
            };
        }
        public function reposition():void{
            if (this._tip){
                this._tip.reposition(Structure.stageWidth, Structure.stageHeight);
            };
            if (this._alert){
                this._alert.reposition(Structure.stageWidth, Structure.stageHeight);
            };
            if (this._hackToolsTip){
                this._hackToolsTip.reposition(Structure.stageWidth, Structure.stageHeight);
            };
        }
        public function showHackToolsTip(_arg1:String, _arg2:String=null):void{
            this._hackToolsTipList.push({
                title:_arg1,
                content:_arg2
            });
            this.loadTip(this.renderHackToolsTip);
        }
        private function renderHackToolsTip():void{
            if (this._hackToolsTipList.length > 0){
                this.hackToolsTip.show(this._hackToolsTipList[0]["title"], null, 0);
                this._hackToolsTipList = [];
            };
        }
        public function showAlert(_arg1:String, _arg2:int=5):void{
            this._title = _arg1;
            this._type = _arg2;
            this.loadTip(this.renderAlert);
        }
        private function renderAlert():void{
            this.iAlert.show(this._title);
        }
        private function get iTip():ITip2{
            if (!this._tip){
                this._tip = (_viewMgr.getAssetsObject("Tip2", "Tip2") as ITip2);
                this._tip.oParent = _structure.tip;
                this._tip.delay = 2000;
                this.reposition();
            };
            return (this._tip);
        }
        private function get iAlert():IAlert2{
            if (!this._alert){
				this._alert = (_viewMgr.getAssetsObject("Tip2", "Alert2") as IAlert2);
				this._alert.oParent = _structure.alert;

                this.reposition();
            };
			if(this._alert)
			{
				this._alert.onClose = function ():void{
					navigateToURL(new URLRequest("index.php"), "_self");
				};
			}
       
            return (this._alert);
        }
        private function get hackToolsTip():ITip2{
            if (!this._hackToolsTip){
                this._hackToolsTip = (_viewMgr.getAssetsObject("Tip2", "HackToolsTip") as ITip2);
                this._hackToolsTip.oParent = _structure.tip;
                this._hackToolsTip.delay = 2000;
                this.reposition();
            };
            return (this._hackToolsTip);
        }

    }
}//package com.views 
