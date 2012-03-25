//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;
    import spark.components.*;
    import mx.binding.*;
    import spark.layouts.*;
    import spark.primitives.*;
    import mx.graphics.*;

    public class MyTooltipGroup extends Group {

        private var __moduleFactoryInitialized:Boolean = false;

        public function MyTooltipGroup(){
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.layout = this._MyTooltipGroup_BasicLayout1_c();
            this.mxmlContent = [this._MyTooltipGroup_Rect1_c()];
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
        private function _MyTooltipGroup_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MyTooltipGroup_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.radiusX = 4;
            _local1.radiusY = 4;
            _local1.fill = this._MyTooltipGroup_SolidColor1_c();
            _local1.stroke = this._MyTooltipGroup_SolidColorStroke1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MyTooltipGroup_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0x222222;
            _local1.alpha = 0.7;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MyTooltipGroup_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 14791514;
            _local1.weight = 2;
            _local1.alpha = 0.9;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }

    }
}//package custom_control 
