//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;
    import flash.events.*;
    import flash.filters.*;
    import __AS3__.vec.*;
    import combat_element.*;
    import combat_element_script.*;

    public class ArcLineWindow {

        private static var ADD_EFFECT_END:String = "add_effect_end";
        private static var REMOVE_EFFECT_END:String = "remove_effect_end";
        public static var arcWindow:ArcLineWindow;

        private var lineContainer:UIComponent;
        private var allElements:Vector.<ArcLineElement>;
        public var followMouse:Boolean = false;
        private var lineEndXpos:Number = 0;
        private var lineEndYpos:Number = 0;
        private var elementNum:Number = 200;
        private var zMaxHeight:Number = 150;
        private var currentEffectElement:Number;
        private var effectSpeed:int = 20;
        private var needAddEffect:Boolean = false;
        private var needRemoveEffect:Boolean = false;
        private var lineColorFrom:uint = 16725799;
        private var lineColorTo:uint = 16725799;
        private var lineGlowColor:uint = 16725799;

        public function ArcLineWindow(){
            this.init();
        }
        public static function showArcLineWindow(_arg1, _arg2:uint, _arg3:uint, _arg4:uint, _arg5:Number, _arg6:Number, _arg7:Boolean=false, _arg8:Boolean=true, _arg9:Number=0, _arg10:Number=0):void{
            var setAlpha:* = null;
            var addToStage:* = _arg1;
            var lColorFrom:* = _arg2;
            var lColorTo:* = _arg3;
            var gColor:* = _arg4;
            var xPosFrom:* = _arg5;
            var yPosFrom:* = _arg6;
            var needEffect:Boolean = _arg7;
            var followMouse:Boolean = _arg8;
            var xPosTo:int = _arg9;
            var yPosTo:int = _arg10;
            setAlpha = function ():void{
                arcWindow.lineContainer.visible = true;
            };
            if (!arcWindow){
                arcWindow = new (ArcLineWindow)();
                arcWindow.lineContainer.depth = CombatStageDepthInfo.DEPTH_OF_ARCLINE_WINDOW;
            };
            arcWindow.lineContainer.visible = false;
            if (needEffect){
                arcWindow.playEffect(true);
            } else {
                arcWindow.setVisible(true);
            };
            if (arcWindow.lineContainer.parent != addToStage){
                addToStage.addElement(arcWindow.lineContainer);
            };
            arcWindow.lineContainer.x = xPosFrom;
            arcWindow.lineContainer.y = yPosFrom;
            arcWindow.followMouse = followMouse;
            if (!followMouse){
                arcWindow.updateAll((xPosTo - xPosFrom), (yPosTo - yPosFrom));
            } else {
                arcWindow.updateAll((addToStage.mouseX - xPosFrom), (addToStage.mouseY - yPosFrom));
            };
            arcWindow.setColor(lColorFrom, lColorTo, gColor);
            arcWindow.lineContainer.callLater(setAlpha);
        }
        public static function hideArcLineWindow(_arg1:Boolean=false):void{
            var removeFromStage:* = null;
            var needEffect:Boolean = _arg1;
            removeFromStage = function (_arg1:Event=null):void{
                arcWindow.lineContainer.removeEventListener(REMOVE_EFFECT_END, removeFromStage);
                var _local2:* = arcWindow.lineContainer.parent;
                if (_local2){
                    _local2.removeElement(arcWindow.lineContainer);
                };
            };
            if (((arcWindow) && (arcWindow.lineContainer.parent))){
                if (needEffect){
                    arcWindow.followMouse = false;
                    arcWindow.playEffect(false);
                    arcWindow.lineContainer.addEventListener(REMOVE_EFFECT_END, removeFromStage);
                } else {
                    removeFromStage();
                };
            };
        }

        protected function init():void{
            var _local5:ArcLineElement;
            this.lineContainer = new UIComponent();
            this.allElements = new Vector.<ArcLineElement>();
            var _local1:Number = (Math.cos((Math.PI / 2)) * this.zMaxHeight);
            var _local2:int;
            while (_local2 < this.elementNum) {
                _local5 = new ArcLineElement((_local2 / this.elementNum), this.lineColorFrom, this.lineColorTo);
                _local5.z = (_local1 - (Math.cos(((((this.elementNum / 2) - _local2) / this.elementNum) * Math.PI)) * this.zMaxHeight));
                this.allElements.push(_local5);
                _local2++;
            };
            this.lineContainer.addChild(this.allElements[0]);
            var _local3 = 1;
            while (_local3 < (this.elementNum / 2)) {
                this.lineContainer.addChild(this.allElements[(this.elementNum - _local3)]);
                this.lineContainer.addChild(this.allElements[_local3]);
                _local3++;
            };
            this.lineContainer.addChild(this.allElements[(this.elementNum / 2)]);
            var _local4:GlowFilter = new GlowFilter(this.lineGlowColor, 0.2, 30, 30);
            this.lineContainer.filters = [_local4];
            this.lineContainer.mouseEnabled = false;
            this.lineContainer.mouseChildren = false;
            this.lineContainer.addEventListener(Event.ADDED_TO_STAGE, this.addToStageHandler);
            this.lineContainer.addEventListener(Event.REMOVED_FROM_STAGE, this.removeFromStageHandler);
        }
        public function updateAll(_arg1:Number, _arg2:Number):void{
            var _local4:ArcLineElement;
            var _local3:int;
            while (_local3 < this.elementNum) {
                _local4 = (this.allElements[_local3] as ArcLineElement);
                _local4.x = (_arg1 * _local4.percent);
                _local4.y = (_arg2 * _local4.percent);
                _local3++;
            };
        }
        public function setColor(_arg1:uint, _arg2:uint, _arg3:uint):void{
            var _local6:ArcLineElement;
            this.lineColorFrom = _arg1;
            this.lineColorTo = _arg2;
            this.lineGlowColor = _arg3;
            var _local4:GlowFilter = new GlowFilter(this.lineGlowColor, 0.2, 30, 30);
            this.lineContainer.filters = [_local4];
            var _local5:int;
            while (_local5 < this.elementNum) {
                _local6 = (this.allElements[_local5] as ArcLineElement);
                _local6.init(this.lineColorFrom, this.lineColorTo);
                _local5++;
            };
        }
        protected function enterFrameHandler(_arg1:Event):void{
            var _local2:Number;
            var _local3:Number;
            var _local4:int;
            var _local5:int;
            if (this.followMouse){
                _local2 = this.lineContainer.mouseX;
                _local3 = this.lineContainer.mouseY;
                if (((!((this.lineEndXpos == _local2))) || (!((this.lineEndYpos == _local3))))){
                    this.updateAll(_local2, _local3);
                    this.lineEndXpos = _local2;
                    this.lineEndYpos = _local3;
                };
            };
            if (this.needAddEffect){
                _local4 = 0;
                while (_local4 < this.effectSpeed) {
                    this.allElements[this.currentEffectElement].visible = true;
                    this.currentEffectElement++;
                    if (this.currentEffectElement >= this.elementNum){
                        this.needAddEffect = false;
                        this.lineContainer.dispatchEvent(new Event(ADD_EFFECT_END));
                        return;
                    };
                    _local4++;
                };
            } else {
                if (this.needRemoveEffect){
                    _local5 = 0;
                    while (_local5 < this.effectSpeed) {
                        this.allElements[this.currentEffectElement].visible = false;
                        this.currentEffectElement++;
                        if (this.currentEffectElement >= this.elementNum){
                            this.needRemoveEffect = false;
                            this.lineContainer.dispatchEvent(new Event(REMOVE_EFFECT_END));
                            return;
                        };
                        _local5++;
                    };
                };
            };
        }
        private function addToStageHandler(_arg1:Event):void{
            this.lineContainer.addEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
        }
        private function removeFromStageHandler(_arg1:Event):void{
            this.lineContainer.removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
        }
        public function playEffect(_arg1:Boolean):void{
            this.needAddEffect = _arg1;
            this.needRemoveEffect = !(_arg1);
            this.currentEffectElement = 0;
            this.setVisible(!(_arg1));
        }
        public function setVisible(_arg1:Boolean):void{
            var _local3:ArcLineElement;
            var _local2:int;
            while (_local2 < this.elementNum) {
                _local3 = (this.allElements[_local2] as ArcLineElement);
                _local3.visible = _arg1;
                _local2++;
            };
        }

    }
}//package custom_control 
