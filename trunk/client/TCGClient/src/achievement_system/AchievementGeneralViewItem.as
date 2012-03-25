//Created by Action Script Viewer - http://www.buraks.com/asv
package achievement_system {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import source_manager.*;
    import spark.layouts.*;
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

    public class AchievementGeneralViewItem extends Group {

        public static const MY_HEIGHT:int = 98;

        private var _410042730completeSign:SmoothBitmapImage;
        private var _274178252mainFrame:SmoothBitmapImage;
        private var _1215755259nameLable:Label;
        private var _1631051279reachDescText:Label;
        private var _1565760596scoreLable:Label;
        private var _910411458unlockDescText:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        public var achievementReach:Boolean;
        public var achievementId:String;
        private var hasCreationComplete:Boolean = false;

        public function AchievementGeneralViewItem(){
            this.width = 637;
            this.height = 100;
            this.layout = this._AchievementGeneralViewItem_BasicLayout1_c();
            this.mxmlContent = [this._AchievementGeneralViewItem_Label1_i(), this._AchievementGeneralViewItem_Label2_i(), this._AchievementGeneralViewItem_Label3_i(), this._AchievementGeneralViewItem_SmoothBitmapImage1_i(), this._AchievementGeneralViewItem_Label4_i(), this._AchievementGeneralViewItem_SmoothBitmapImage2_i()];
            this.addEventListener("creationComplete", this.___AchievementGeneralViewItem_Group1_creationComplete);
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
        public function setAchievementInfo(_arg1:String, _arg2:Boolean):void{
            this.achievementId = _arg1;
            this.achievementReach = _arg2;
            this.buildAchievementInfo();
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.hasCreationComplete = true;
            this.buildAchievementInfo();
        }
        private function buildAchievementInfo():void{
            var _local1:Object;
            if (((this.hasCreationComplete) && (this.achievementId))){
                _local1 = AchievementLib.achievementConfig[this.achievementId];
                this.nameLable.text = _local1["name"];
                this.reachDescText.text = _local1["reach_desc"];
                this.unlockDescText.text = _local1["unlock_desc"];
                this.scoreLable.text = _local1["score"];
                this.setInfoByReach();
            };
        }
        private function setInfoByReach():void{
            if (this.achievementReach){
                this.completeSign.source = AchievementGeneralViewWindowSourceMgr.getInstance().getSourceClass("completeSign");
                this.mainFrame.source = AchievementGeneralViewWindowSourceMgr.getInstance().getSourceClass("completeFrame");
                this.nameLable.setStyle("color", 11730772);
                this.reachDescText.setStyle("color", 14665611);
                this.unlockDescText.setStyle("color", 8442405);
                this.scoreLable.setStyle("color", 10157327);
            } else {
                this.completeSign.source = AchievementGeneralViewWindowSourceMgr.getInstance().getSourceClass("uncompleteSign");
                this.mainFrame.source = AchievementGeneralViewWindowSourceMgr.getInstance().getSourceClass("uncompleteFrame");
                this.nameLable.setStyle("color", 11842738);
                this.reachDescText.setStyle("color", 11842738);
                this.unlockDescText.setStyle("color", 11389075);
                this.scoreLable.setStyle("color", 11389075);
            };
        }
        private function _AchievementGeneralViewItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AchievementGeneralViewItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.width = 200;
            _local1.percentHeight = 100;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 30);
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "nameLable";
            if (!_local1.document){
                _local1.document = this;
            };
            this.nameLable = _local1;
            BindingManager.executeBindings(this, "nameLable", this.nameLable);
            return (_local1);
        }
        private function _AchievementGeneralViewItem_Label2_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 182;
            _local1.y = 43;
            _local1.width = 310;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("fontSize", 16);
            _local1.id = "reachDescText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.reachDescText = _local1;
            BindingManager.executeBindings(this, "reachDescText", this.reachDescText);
            return (_local1);
        }
        private function _AchievementGeneralViewItem_Label3_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 182;
            _local1.y = 56;
            _local1.width = 310;
            _local1.visible = false;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("fontSize", 16);
            _local1.id = "unlockDescText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.unlockDescText = _local1;
            BindingManager.executeBindings(this, "unlockDescText", this.unlockDescText);
            return (_local1);
        }
        private function _AchievementGeneralViewItem_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 480;
            _local1.verticalCenter = 0;
            _local1.initialized(this, "completeSign");
            this.completeSign = _local1;
            BindingManager.executeBindings(this, "completeSign", this.completeSign);
            return (_local1);
        }
        private function _AchievementGeneralViewItem_Label4_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 562;
            _local1.y = 7;
            _local1.rotation = 20;
            _local1.setStyle("fontFamily", "Georgia");
            _local1.setStyle("fontSize", 30);
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "scoreLable";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scoreLable = _local1;
            BindingManager.executeBindings(this, "scoreLable", this.scoreLable);
            return (_local1);
        }
        private function _AchievementGeneralViewItem_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.verticalCenter = 0;
            _local1.initialized(this, "mainFrame");
            this.mainFrame = _local1;
            BindingManager.executeBindings(this, "mainFrame", this.mainFrame);
            return (_local1);
        }
        public function ___AchievementGeneralViewItem_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function get completeSign():SmoothBitmapImage{
            return (this._410042730completeSign);
        }
        public function set completeSign(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._410042730completeSign;
            if (_local2 !== _arg1){
                this._410042730completeSign = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "completeSign", _local2, _arg1));
                };
            };
        }
        public function get mainFrame():SmoothBitmapImage{
            return (this._274178252mainFrame);
        }
        public function set mainFrame(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._274178252mainFrame;
            if (_local2 !== _arg1){
                this._274178252mainFrame = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainFrame", _local2, _arg1));
                };
            };
        }
        public function get nameLable():Label{
            return (this._1215755259nameLable);
        }
        public function set nameLable(_arg1:Label):void{
            var _local2:Object = this._1215755259nameLable;
            if (_local2 !== _arg1){
                this._1215755259nameLable = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameLable", _local2, _arg1));
                };
            };
        }
        public function get reachDescText():Label{
            return (this._1631051279reachDescText);
        }
        public function set reachDescText(_arg1:Label):void{
            var _local2:Object = this._1631051279reachDescText;
            if (_local2 !== _arg1){
                this._1631051279reachDescText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reachDescText", _local2, _arg1));
                };
            };
        }
        public function get scoreLable():Label{
            return (this._1565760596scoreLable);
        }
        public function set scoreLable(_arg1:Label):void{
            var _local2:Object = this._1565760596scoreLable;
            if (_local2 !== _arg1){
                this._1565760596scoreLable = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scoreLable", _local2, _arg1));
                };
            };
        }
        public function get unlockDescText():Label{
            return (this._910411458unlockDescText);
        }
        public function set unlockDescText(_arg1:Label):void{
            var _local2:Object = this._910411458unlockDescText;
            if (_local2 !== _arg1){
                this._910411458unlockDescText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "unlockDescText", _local2, _arg1));
                };
            };
        }

    }
}//package achievement_system 
