//Created by Action Script Viewer - http://www.buraks.com/asv
package buff_system {
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;
    import mx.binding.*;
    import spark.layouts.*;

    public class BuffMainWindow extends Group {

        private var _1489541515buffIconContainer:VGroup;
        private var __moduleFactoryInitialized:Boolean = false;

        public function BuffMainWindow(){
            this.width = 0x0500;
            this.height = 800;
            this.depth = 5;
            this.layout = this._BuffMainWindow_BasicLayout1_c();
            this.mxmlContent = [this._BuffMainWindow_VGroup1_i()];
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
        public function addBuffIcon(_arg1:IVisualElement):void{
            this.buffIconContainer.addElement(_arg1);
        }
        public function removeBuffIcon(_arg1:IVisualElement):void{
            this.buffIconContainer.removeElement(_arg1);
        }
        private function _BuffMainWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BuffMainWindow_VGroup1_i():VGroup{
            var _local1:VGroup = new VGroup();
            _local1.verticalCenter = -100;
            _local1.right = 0;
            _local1.id = "buffIconContainer";
            if (!_local1.document){
                _local1.document = this;
            };
            this.buffIconContainer = _local1;
            BindingManager.executeBindings(this, "buffIconContainer", this.buffIconContainer);
            return (_local1);
        }
        public function get buffIconContainer():VGroup{
            return (this._1489541515buffIconContainer);
        }
        public function set buffIconContainer(_arg1:VGroup):void{
            var _local2:Object = this._1489541515buffIconContainer;
            if (_local2 !== _arg1){
                this._1489541515buffIconContainer = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buffIconContainer", _local2, _arg1));
                };
            };
        }

    }
}//package buff_system 
