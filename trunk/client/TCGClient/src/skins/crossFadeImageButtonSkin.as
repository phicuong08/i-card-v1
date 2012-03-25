//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import custom_effect.*;
    import spark.skins.*;

    public class crossFadeImageButtonSkin extends SparkSkin implements IStateClient2 {

        private var _1779941047buttonImage:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var crossFadeEffect:MyCrossFadeEffect;
        private var creationHasComplete:Boolean = false;
        private var _213507019hostComponent:Button;

        public function crossFadeImageButtonSkin(){
            this.minWidth = 1;
            this.minHeight = 1;
            this.mxmlContent = [this._crossFadeImageButtonSkin_SmoothBitmapImage1_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___crossFadeImageButtonSkin_SparkSkin1_creationComplete);
            this.addEventListener("currentStateChanging", this.___crossFadeImageButtonSkin_SparkSkin1_currentStateChanging);
            states = [new State({
                name:"up",
                overrides:[]
            }), new State({
                name:"over",
                overrides:[]
            }), new State({
                name:"down",
                overrides:[]
            }), new State({
                name:"disabled",
                overrides:[]
            })];
        }
        override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
            super.moduleFactory = _arg1;
            if (this.__moduleFactoryInitialized){
                return;
            };
            this.__moduleFactoryInitialized = true;
        }
        override public function initialize():void{
            super.initialize();
        }
        private function init():void{
            this.creationHasComplete = true;
            var _local1:BitmapData = this.getStateBitmapdata("up");
            this.buttonImage.source = _local1;
            this.crossFadeEffect = new MyCrossFadeEffect(this.buttonImage, 200);
        }
        protected function sparkskin1_currentStateChangingHandler(_arg1:StateChangeEvent):void{
            if (!this.creationHasComplete){
                return;
            };
            if ((((((_arg1.oldState == "disabled")) || ((_arg1.newState == "disabled")))) && (this.hostComponent.getStyle("buttonDisableGradient")))){
                this.playCrossFadeEffect(_arg1);
            } else {
                if ((((_arg1.oldState == "over")) && ((_arg1.newState == "up")))){
                    this.playCrossFadeEffect(_arg1);
                } else {
                    this.crossFadeEffect.stop();
                    this.buttonImage.source = this.getStateBitmapdata(_arg1.newState);
                };
            };
        }
        private function playCrossFadeEffect(_arg1:StateChangeEvent):void{
            if (this.crossFadeEffect.isPlaying){
                this.crossFadeEffect.stop();
                this.crossFadeEffect.bitmapdataFrom = (this.buttonImage.source as BitmapData);
            } else {
                this.crossFadeEffect.bitmapdataFrom = this.getStateBitmapdata(_arg1.oldState);
            };
            this.crossFadeEffect.bitmapdataTo = this.getStateBitmapdata(_arg1.newState);
            if (((this.crossFadeEffect.bitmapdataTo) || (this.crossFadeEffect.bitmapdataFrom))){
                this.crossFadeEffect.play();
            };
        }
        private function getStateBitmapdata(_arg1:String):BitmapData{
            return ((this.hostComponent.getStyle((_arg1 + "Bitmapdata")) as BitmapData));
        }
        private function _crossFadeImageButtonSkin_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.initialized(this, "buttonImage");
            this.buttonImage = _local1;
            BindingManager.executeBindings(this, "buttonImage", this.buttonImage);
            return (_local1);
        }
        public function ___crossFadeImageButtonSkin_SparkSkin1_creationComplete(_arg1:FlexEvent):void{
            this.init();
        }
        public function ___crossFadeImageButtonSkin_SparkSkin1_currentStateChanging(_arg1:StateChangeEvent):void{
            this.sparkskin1_currentStateChangingHandler(_arg1);
        }
        public function get buttonImage():SmoothBitmapImage{
            return (this._1779941047buttonImage);
        }
        public function set buttonImage(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1779941047buttonImage;
            if (_local2 !== _arg1){
                this._1779941047buttonImage = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buttonImage", _local2, _arg1));
                };
            };
        }
        public function get hostComponent():Button{
            return (this._213507019hostComponent);
        }
        public function set hostComponent(_arg1:Button):void{
            var _local2:Object = this._213507019hostComponent;
            if (_local2 !== _arg1){
                this._213507019hostComponent = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hostComponent", _local2, _arg1));
                };
            };
        }

    }
}//package skins 
