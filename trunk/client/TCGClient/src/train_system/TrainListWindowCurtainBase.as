//Created by Action Script Viewer - http://www.buraks.com/asv
package train_system {
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
    import source_manager.*;
    import spark.layouts.*;
    import flash.utils.*;
    import combat_element_script.*;
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

    public class TrainListWindowCurtainBase extends Group {

        private var __moduleFactoryInitialized:Boolean = false;
        protected var creationHasComplete:Boolean = false;

        public function TrainListWindowCurtainBase(){
            this.x = 105;
            this.y = 134;
            this.width = 851;
            this.height = 445;
            this.layout = this._TrainListWindowCurtainBase_BasicLayout1_c();
            this.addEventListener("addedToStage", this.___TrainListWindowCurtainBase_Group1_addedToStage);
            this.addEventListener("creationComplete", this.___TrainListWindowCurtainBase_Group1_creationComplete);
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
        protected function get startIndex():int{
            return (1);
        }
        protected function get endIndex():int{
            return (8);
        }
        protected function setCampaignImage():void{
            var _local2:TrainListWindowItem;
            this.creationHasComplete = true;
            var _local1:int = this.startIndex;
            while (_local1 <= this.endIndex) {
                _local2 = (this[("item" + _local1)] as TrainListWindowItem);
                _local2.headImg = TrainListWindowSourceMgr.getInstance().getSourceClass(("campaign_" + _local1));
                _local2.descText = TrainSystem.getInstance().getTrainName(_local1);
                _local1++;
            };
            this.setUserTrainInfo();
        }
        protected function setUserTrainInfo():void{
            if (!this.creationHasComplete){
                return;
            };
            this.setActiveTrain(UserObject.activeTrainList);
            var _local1:Object = UserObject.trainRecord;
            var _local2:int = this.startIndex;
            while (_local2 <= this.endIndex) {
                (this[("item" + _local2)] as TrainListWindowItem).trainInfo = _local1[_local2.toString()];
                _local2++;
            };
        }
        protected function setActiveTrain(_arg1:Array):void{
            var _local3:Boolean;
            var _local4:TrainListWindowItem;
            var _local2:int = this.startIndex;
            while (_local2 <= this.endIndex) {
                _local3 = !((_arg1.indexOf(_local2) == -1));
                _local4 = (this[("item" + _local2)] as TrainListWindowItem);
                _local4.active = _local3;
                if (((!(_local3)) && ((TrainListWindowItem.currentSelectItem == _local4)))){
                    _local4.select = false;
                    TrainListWindowItem.changeSelectItem(null);
                };
                _local2++;
            };
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function _TrainListWindowCurtainBase_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___TrainListWindowCurtainBase_Group1_addedToStage(_arg1:Event):void{
            callLater(this.setUserTrainInfo);
        }
        public function ___TrainListWindowCurtainBase_Group1_creationComplete(_arg1:FlexEvent):void{
            this.setCampaignImage();
        }

    }
}//package train_system 
