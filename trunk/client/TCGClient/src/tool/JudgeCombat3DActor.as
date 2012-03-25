//Created by Action Script Viewer - http://www.buraks.com/asv
package tool {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import combat_element.*;
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

    public class JudgeCombat3DActor extends Group {

        private var _982754104pointX:VSlider;
        private var _982754103pointY:VSlider;
        private var _78660490rotateXBar:VSlider;
        private var _1716760986transformYBar:VSlider;
        private var _1195816006viewSize:VSlider;
        private var _3685147yPos:VSlider;
        private var __moduleFactoryInitialized:Boolean = false;

        public function JudgeCombat3DActor(){
            this.width = 400;
            this.height = 300;
            this.depth = 5;
            this.mxmlContent = [this._JudgeCombat3DActor_VSlider1_i(), this._JudgeCombat3DActor_Label1_c(), this._JudgeCombat3DActor_VSlider2_i(), this._JudgeCombat3DActor_Label2_c(), this._JudgeCombat3DActor_VSlider3_i(), this._JudgeCombat3DActor_Label3_c(), this._JudgeCombat3DActor_VSlider4_i(), this._JudgeCombat3DActor_Label4_c(), this._JudgeCombat3DActor_VSlider5_i(), this._JudgeCombat3DActor_Label5_c(), this._JudgeCombat3DActor_VSlider6_i(), this._JudgeCombat3DActor_Label6_c()];
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
                this.color = 0xFF00;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function viewSize_changeHandler():void{
            var _local1:PerspectiveProjection = new PerspectiveProjection();
            _local1.fieldOfView = this.viewSize.value;
            _local1.projectionCenter = new Point(this.pointX.value, this.pointY.value);
            CombatStage.getInstance().transform.perspectiveProjection = _local1;
        }
        protected function transformY_changeHandler(_arg1:Event):void{
            CombatStage.getInstance().groupWith3D.transformY = this.transformYBar.value;
        }
        protected function rotateX_changeHandler(_arg1:Event):void{
            CombatStage.getInstance().groupWith3D.rotationX = -(this.rotateXBar.value);
        }
        protected function yPos_changeHandler(_arg1:Event):void{
            CombatStage.getInstance().groupWith3D.y = this.yPos.value;
        }
        private function _JudgeCombat3DActor_VSlider1_i():VSlider{
            var _local1:VSlider;
            _local1 = new VSlider();
            _local1.x = 18;
            _local1.y = 10;
            _local1.value = 22;
            _local1.minimum = 20;
            _local1.maximum = 100;
            _local1.stepSize = 1;
            _local1.addEventListener("change", this.__viewSize_change);
            _local1.id = "viewSize";
            if (!_local1.document){
                _local1.document = this;
            };
            this.viewSize = _local1;
            BindingManager.executeBindings(this, "viewSize", this.viewSize);
            return (_local1);
        }
        public function __viewSize_change(_arg1:Event):void{
            this.viewSize_changeHandler();
        }
        private function _JudgeCombat3DActor_Label1_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.text = "视角大小";
            _local1.x = 0;
            _local1.y = 114;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCombat3DActor_VSlider2_i():VSlider{
            var _local1:VSlider;
            _local1 = new VSlider();
            _local1.x = 70;
            _local1.y = 10;
            _local1.value = 600;
            _local1.minimum = 600;
            _local1.maximum = 1400;
            _local1.stepSize = 10;
            _local1.addEventListener("change", this.__transformYBar_change);
            _local1.id = "transformYBar";
            if (!_local1.document){
                _local1.document = this;
            };
            this.transformYBar = _local1;
            BindingManager.executeBindings(this, "transformYBar", this.transformYBar);
            return (_local1);
        }
        public function __transformYBar_change(_arg1:Event):void{
            this.transformY_changeHandler(_arg1);
        }
        private function _JudgeCombat3DActor_Label2_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.text = "transformY";
            _local1.x = 52;
            _local1.y = 114;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCombat3DActor_VSlider3_i():VSlider{
            var _local1:VSlider;
            _local1 = new VSlider();
            _local1.x = 135;
            _local1.y = 10;
            _local1.value = 40;
            _local1.minimum = 20;
            _local1.maximum = 50;
            _local1.stepSize = 1;
            _local1.addEventListener("change", this.__rotateXBar_change);
            _local1.id = "rotateXBar";
            if (!_local1.document){
                _local1.document = this;
            };
            this.rotateXBar = _local1;
            BindingManager.executeBindings(this, "rotateXBar", this.rotateXBar);
            return (_local1);
        }
        public function __rotateXBar_change(_arg1:Event):void{
            this.rotateX_changeHandler(_arg1);
        }
        private function _JudgeCombat3DActor_Label3_c():Label{
            var _local1:Label = new Label();
            _local1.text = "rotateX";
            _local1.x = 117;
            _local1.y = 114;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCombat3DActor_VSlider4_i():VSlider{
            var _local1:VSlider = new VSlider();
            _local1.x = 181;
            _local1.y = 10;
            _local1.minimum = 300;
            _local1.maximum = 1000;
            _local1.value = 640;
            _local1.stepSize = 10;
            _local1.addEventListener("change", this.__pointX_change);
            _local1.id = "pointX";
            if (!_local1.document){
                _local1.document = this;
            };
            this.pointX = _local1;
            BindingManager.executeBindings(this, "pointX", this.pointX);
            return (_local1);
        }
        public function __pointX_change(_arg1:Event):void{
            this.viewSize_changeHandler();
        }
        private function _JudgeCombat3DActor_Label4_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.text = "pointX";
            _local1.x = 163;
            _local1.y = 114;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCombat3DActor_VSlider5_i():VSlider{
            var _local1:VSlider = new VSlider();
            _local1.x = 224;
            _local1.y = 10;
            _local1.minimum = 200;
            _local1.maximum = 600;
            _local1.value = 280;
            _local1.stepSize = 10;
            _local1.addEventListener("change", this.__pointY_change);
            _local1.id = "pointY";
            if (!_local1.document){
                _local1.document = this;
            };
            this.pointY = _local1;
            BindingManager.executeBindings(this, "pointY", this.pointY);
            return (_local1);
        }
        public function __pointY_change(_arg1:Event):void{
            this.viewSize_changeHandler();
        }
        private function _JudgeCombat3DActor_Label5_c():Label{
            var _local1:Label = new Label();
            _local1.text = "pointY";
            _local1.x = 206;
            _local1.y = 114;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCombat3DActor_VSlider6_i():VSlider{
            var _local1:VSlider = new VSlider();
            _local1.x = 268;
            _local1.y = 10;
            _local1.minimum = -60;
            _local1.maximum = 0;
            _local1.value = -5;
            _local1.stepSize = 1;
            _local1.addEventListener("change", this.__yPos_change);
            _local1.id = "yPos";
            if (!_local1.document){
                _local1.document = this;
            };
            this.yPos = _local1;
            BindingManager.executeBindings(this, "yPos", this.yPos);
            return (_local1);
        }
        public function __yPos_change(_arg1:Event):void{
            this.yPos_changeHandler(_arg1);
        }
        private function _JudgeCombat3DActor_Label6_c():Label{
            var _local1:Label = new Label();
            _local1.text = "yPos";
            _local1.x = 250;
            _local1.y = 114;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function get pointX():VSlider{
            return (this._982754104pointX);
        }
        public function set pointX(_arg1:VSlider):void{
            var _local2:Object = this._982754104pointX;
            if (_local2 !== _arg1){
                this._982754104pointX = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pointX", _local2, _arg1));
                };
            };
        }
        public function get pointY():VSlider{
            return (this._982754103pointY);
        }
        public function set pointY(_arg1:VSlider):void{
            var _local2:Object = this._982754103pointY;
            if (_local2 !== _arg1){
                this._982754103pointY = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pointY", _local2, _arg1));
                };
            };
        }
        public function get rotateXBar():VSlider{
            return (this._78660490rotateXBar);
        }
        public function set rotateXBar(_arg1:VSlider):void{
            var _local2:Object = this._78660490rotateXBar;
            if (_local2 !== _arg1){
                this._78660490rotateXBar = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rotateXBar", _local2, _arg1));
                };
            };
        }
        public function get transformYBar():VSlider{
            return (this._1716760986transformYBar);
        }
        public function set transformYBar(_arg1:VSlider):void{
            var _local2:Object = this._1716760986transformYBar;
            if (_local2 !== _arg1){
                this._1716760986transformYBar = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "transformYBar", _local2, _arg1));
                };
            };
        }
        public function get viewSize():VSlider{
            return (this._1195816006viewSize);
        }
        public function set viewSize(_arg1:VSlider):void{
            var _local2:Object = this._1195816006viewSize;
            if (_local2 !== _arg1){
                this._1195816006viewSize = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewSize", _local2, _arg1));
                };
            };
        }
        public function get yPos():VSlider{
            return (this._3685147yPos);
        }
        public function set yPos(_arg1:VSlider):void{
            var _local2:Object = this._3685147yPos;
            if (_local2 !== _arg1){
                this._3685147yPos = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yPos", _local2, _arg1));
                };
            };
        }

    }
}//package tool 
