//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import spark.layouts.*;
    import spark.filters.*;
    import flash.utils.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class CardBuffWindow extends Group {

        private var __moduleFactoryInitialized:Boolean = false;
        private var circleTextWindows:Array;

        public function CardBuffWindow(){
            this.circleTextWindows = new Array();
            super();
            this.height = 20;
            this.layout = this._CardBuffWindow_BasicLayout1_c();
            this.filters = [this._CardBuffWindow_GlowFilter1_c()];
        }
        override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
            var factory:* = _arg1;
            super.moduleFactory = factory;
            if (this.__moduleFactoryInitialized){
                return;
            };
            this.__moduleFactoryInitialized = true;
            if (!this.styleDeclaration){
                this.styleDeclaration = new CSSStyleDeclaration(null, styleManager);
            };
            this.styleDeclaration.defaultFactory = function ():void{
                this.fontWeight = "bold";
                this.fontFamily = "Georgia";
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function addBuff(_arg1):void{
            var _local4:CardBuffWindowItem;
            var _local2:Array = ((_arg1 is Array)) ? _arg1 : [_arg1];
            var _local3:int;
            while (_local3 < _local2.length) {
                _local4 = new CardBuffWindowItem();
                _local4.displayText = _local2[_local3];
                addElement(_local4);
                this.circleTextWindows.push(_local4);
                _local3++;
            };
            this.setAllCircleTextWindowPos();
        }
        public function removeBuff(_arg1:String):void{
            var _local3:CardBuffWindowItem;
            var _local2:int;
            while (_local2 < this.circleTextWindows.length) {
                _local3 = (this.circleTextWindows[_local2] as CardBuffWindowItem);
                if (_local3.displayText == _arg1){
                    this.circleTextWindows.splice(_local2, 1);
                    removeElement(_local3);
                    break;
                };
                _local2++;
            };
            this.setAllCircleTextWindowPos();
        }
        public function removeAllBuff():void{
            var _local1:CardBuffWindowItem;
            for each (_local1 in this.circleTextWindows) {
                removeElement(_local1);
            };
            this.circleTextWindows = new Array();
        }
        private function setAllCircleTextWindowPos():void{
            var _local2:CardBuffWindowItem;
            var _local3:Number;
            var _local1:int;
            while (_local1 < this.circleTextWindows.length) {
                _local2 = (this.circleTextWindows[((this.circleTextWindows.length - _local1) - 1)] as CardBuffWindowItem);
                _local3 = (_local1 * 21);
                _local2.moveTo(_local3);
                _local1++;
            };
        }
        public function getAllBuffText():Array{
            var _local3:CardBuffWindowItem;
            var _local1:Array = new Array();
            var _local2:int;
            while (_local2 < this.circleTextWindows.length) {
                _local3 = (this.circleTextWindows[_local2] as CardBuffWindowItem);
                _local1.push(_local3.displayText);
                _local2++;
            };
            return (_local1);
        }
        private function _CardBuffWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBuffWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }

    }
}//package combat_element 
