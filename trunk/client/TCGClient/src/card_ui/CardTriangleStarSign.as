//Created by Action Script Viewer - http://www.buraks.com/asv
package card_ui {
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;

    public class CardTriangleStarSign extends Group {

        private var _109757471star1:SmoothBitmapImage;
        private var _109757472star2:SmoothBitmapImage;
        private var _109757473star3:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var creationComplete:Boolean = false;
        private var num:int = 0;
        private var _embed_mxml_source_cardUI_str_int_star_png_1028486577:Class;

        public function CardTriangleStarSign(){
            this._embed_mxml_source_cardUI_str_int_star_png_1028486577 = CardTriangleStarSign__embed_mxml_source_cardUI_str_int_star_png_1028486577;
            super();
            this.width = 33;
            this.height = 33;
            this.mxmlContent = [this._CardTriangleStarSign_SmoothBitmapImage1_i(), this._CardTriangleStarSign_SmoothBitmapImage2_i(), this._CardTriangleStarSign_SmoothBitmapImage3_i()];
            this.addEventListener("creationComplete", this.___CardTriangleStarSign_Group1_creationComplete);
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
        public function set starNum(_arg1):void{
            this.num = int(_arg1);
            if (this.creationComplete){
                this.setNum();
            };
        }
        private function setNum():void{
            switch (this.num){
                case 1:
                    this.star1.x = 8.5;
                    this.star1.y = 8.5;
                    this.star1.visible = true;
                    this.star2.visible = false;
                    this.star3.visible = false;
                    break;
                case 2:
                    this.star1.x = 0;
                    this.star1.y = 8.5;
                    this.star2.x = 17;
                    this.star2.y = 8.5;
                    this.star1.visible = true;
                    this.star2.visible = true;
                    this.star3.visible = false;
                    break;
                case 3:
                    this.star1.x = 8.5;
                    this.star1.y = 0;
                    this.star2.x = 0;
                    this.star2.y = 17;
                    this.star3.x = 17;
                    this.star3.y = 17;
                    this.star1.visible = true;
                    this.star2.visible = true;
                    this.star3.visible = true;
                    break;
                default:
                    this.star1.visible = false;
                    this.star2.visible = false;
                    this.star3.visible = false;
            };
        }
        protected function group1_creationCompleteHandler():void{
            this.creationComplete = true;
            this.setNum();
        }
        private function _CardTriangleStarSign_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.width = 16;
            _local1.height = 15;
            _local1.source = this._embed_mxml_source_cardUI_str_int_star_png_1028486577;
            _local1.initialized(this, "star1");
            this.star1 = _local1;
            BindingManager.executeBindings(this, "star1", this.star1);
            return (_local1);
        }
        private function _CardTriangleStarSign_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.width = 16;
            _local1.height = 15;
            _local1.source = this._embed_mxml_source_cardUI_str_int_star_png_1028486577;
            _local1.initialized(this, "star2");
            this.star2 = _local1;
            BindingManager.executeBindings(this, "star2", this.star2);
            return (_local1);
        }
        private function _CardTriangleStarSign_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.width = 16;
            _local1.height = 15;
            _local1.source = this._embed_mxml_source_cardUI_str_int_star_png_1028486577;
            _local1.initialized(this, "star3");
            this.star3 = _local1;
            BindingManager.executeBindings(this, "star3", this.star3);
            return (_local1);
        }
        public function ___CardTriangleStarSign_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler();
        }
        public function get star1():SmoothBitmapImage{
            return (this._109757471star1);
        }
        public function set star1(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._109757471star1;
            if (_local2 !== _arg1){
                this._109757471star1 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star1", _local2, _arg1));
                };
            };
        }
        public function get star2():SmoothBitmapImage{
            return (this._109757472star2);
        }
        public function set star2(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._109757472star2;
            if (_local2 !== _arg1){
                this._109757472star2 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star2", _local2, _arg1));
                };
            };
        }
        public function get star3():SmoothBitmapImage{
            return (this._109757473star3);
        }
        public function set star3(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._109757473star3;
            if (_local2 !== _arg1){
                this._109757473star3 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star3", _local2, _arg1));
                };
            };
        }

    }
}//package card_ui 
