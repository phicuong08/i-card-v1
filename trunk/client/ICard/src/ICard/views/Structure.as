//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.*;
    import flash.display.*;
    import ICard.assist.view.*;
    import flash.utils.*;
    import flash.geom.*;
    import ICard.views.structure.*;

    public class Structure {

        public static const minStageWidth:int = 1000;
        public static const minStageHeight:int = 600;
        public static const maxStageWidth:int = 1650;
        public static const maxStageHeight:int = 850;

        private static var _instance:Structure;

        private var _stage:Stage;
        private var _view:ViewMgr;
        private var _mouse:Sprite;
        private var _tip:Tip;
        private var _alert:Alert;
        private var _load:Load;
        private var _content:Content;
        private var _background:Sprite;
        private var _popup:Popup;

        public function Structure(_arg1:Singleton){
        }
        public static function getInstance(_arg1:Stage, _arg2:ViewBaseMgr):Structure{
            if (null == Structure._instance){
                Structure._instance = new Structure(new Singleton());
                Structure._instance.init(_arg1, (_arg2 as ViewMgr));
            };
            return (Structure._instance);
        }
        public static function get stageWidth():Number{
            return ((Math.max(minStageWidth, Math.min(maxStageWidth, _instance.stage.stageWidth)) - stageClip.x));
        }
        public static function get stageHeight():Number{
            return ((Math.max(minStageHeight, Math.min(maxStageHeight, _instance.stage.stageHeight)) - stageClip.y));
        }
        public static function get stageOffset():Point{
            var _local1:Number = 0;
            var _local2:Number = 0;
            if (_instance.stage.stageWidth > maxStageWidth){
                _local1 = ((_instance.stage.stageWidth - maxStageWidth) / 2);
            };
            if (_instance.stage.stageHeight > maxStageHeight){
                _local2 = ((_instance.stage.stageHeight - maxStageHeight) / 2);
            };
            return (new Point(Math.floor(_local1), Math.floor(_local2)));
        }
        public static function get stageClip():Point{
            var _local1:Number = 0;
            var _local2:Number = 0;
            if (_instance.stage.stageWidth < minStageWidth){
                _local1 = (minStageWidth - Math.max(500, _instance.stage.stageWidth));
            };
            if (_instance.stage.stageHeight < minStageHeight){
                _local2 = (minStageHeight - Math.max(400, _instance.stage.stageHeight));
            };
            return (new Point(Math.floor(_local1), Math.floor(_local2)));
        }

        private function get stage():Stage{
            return (this._stage);
        }
        public function get mouse():Sprite{
            return (this._mouse);
        }
        public function get tip():Tip{
            return (this._tip);
        }
        public function get alert():Alert{
            return (this._alert);
        }
        public function get load():Load{
            return (this._load);
        }
        public function get popup():Popup{
            return (this._popup);
        }
        public function get content():Content{
            return (this._content);
        }
        public function get background():Sprite{
            return (this._background);
        }
        private function init(_arg1:Stage, _arg2:ViewMgr):void{
            this._stage = _arg1;
            this._view = _arg2;
            this._mouse = new Sprite();
            this._tip = new Tip();
            this._load = new Load();
            this._alert = new Alert();
            this._popup = new Popup(this._view);
            this._content = new Content();
            this._background = new Background();
            this._stage.addChild(this._background);
            this._stage.addChild(this._content);
            this._stage.addChild(this._popup);
            this._stage.addChild(this._alert);
            this._stage.addChild(this._load);
            this._stage.addChild(this._tip);
            this._stage.addChild(this._mouse);
            this._popup.structure = this;
            this._mouse.mouseEnabled = false;
            this._mouse.mouseChildren = false;
            this._tip.mouseEnabled = false;
            this._popup.mouseEnabled = false;
            this._content.tabChildren = (this._popup.tabChildren = false);
            this._content.tabEnabled = (this._popup.tabEnabled = false);
            Shortcut.getRelatedView = this._popup.getRelatedView;
        }
        public function drawMark():void{
            this.drawBlack(-600, -200, 2500, 200);
            this.drawBlack(1250, 0, 1000, 1000);
            this.drawBlack(-600, 650, 2500, 200);
            this.drawBlack(-1000, 0, 1000, 1000);
        }
        private function drawBlack(_arg1:Number, _arg2:Number, _arg3:Number, _arg4:Number):void{
            this._tip.graphics.beginFill(0, 1);
            this._tip.graphics.drawRect(_arg1, _arg2, _arg3, _arg4);
            this._tip.graphics.endFill();
        }
        public function reposition():void{
            this._mouse.x = (this._tip.x = (this._load.x = (this._alert.x = (this._popup.x = (this._content.x = (this._background.x = stageOffset.x))))));
            this._mouse.y = (this._tip.y = (this._load.y = (this._alert.y = (this._popup.y = (this._content.y = (this._background.y = stageOffset.y))))));
            setTimeout(this._popup.reposition, 10);
        }

    }
}//package com.views 

class Singleton {

    public function Singleton(){
    }
}
