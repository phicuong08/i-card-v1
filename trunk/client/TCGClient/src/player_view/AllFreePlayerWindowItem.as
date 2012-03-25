//Created by Action Script Viewer - http://www.buraks.com/asv
package player_view {
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
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import tool.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class AllFreePlayerWindowItem extends Group {

        private var _539145507playerLevel:Label;
        private var _2095657228playerName:Label;
        private var _2095789916playerRoom:Label;
        private var _546037296playerState:Label;
        private var _1149221507rollOverMask:Rect;
        private var __moduleFactoryInitialized:Boolean = false;
        private var creationHasComplete:Boolean = false;
        private var info:Object;
        private var _embed_mxml_source_commonUI______png_298371472:Class;

        public function AllFreePlayerWindowItem(){
            this.info = new Object();
            this._embed_mxml_source_commonUI______png_298371472 = AllFreePlayerWindowItem__embed_mxml_source_commonUI______png_298371472;
            super();
            this.width = 265;
            this.height = 18;
            this.mxmlContent = [this._AllFreePlayerWindowItem_Label1_i(), this._AllFreePlayerWindowItem_Label2_i(), this._AllFreePlayerWindowItem_Label3_i(), this._AllFreePlayerWindowItem_Label4_i(), this._AllFreePlayerWindowItem_Rect1_i(), this._AllFreePlayerWindowItem_SmoothBitmapImage1_c()];
            this.addEventListener("creationComplete", this.___AllFreePlayerWindowItem_Group1_creationComplete);
            this.addEventListener("rollOver", this.___AllFreePlayerWindowItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___AllFreePlayerWindowItem_Group1_rollOut);
            this.addEventListener("click", this.___AllFreePlayerWindowItem_Group1_click);
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
                this.color = 0xFFFFFF;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function set playerInfo(_arg1:Object):void{
            this.info = _arg1;
            this.buildDisplayInfo();
        }
        public function get playerInfo():Object{
            return (this.info);
        }
        protected function creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.buildDisplayInfo();
        }
        private function buildDisplayInfo():void{
            if (((this.creationHasComplete) && (this.info))){
                this.playerName.text = this.info["name"];
                this.playerLevel.text = this.info["level"];
                this.playerState.text = this.info["state_desc"];
                if (this.info.room_number){
                    this.playerRoom.text = RoomUtil.getRoomNameByInfo(this.info);
                } else {
                    this.playerRoom.text = "----";
                };
                this.playerState.setStyle("color", this.info["state_color"]);
            };
        }
        protected function group1_clickHandler(_arg1:MouseEvent):void{
            PlayViewMgr.getInstance().showOpMenu(this.info["name"]);
        }
        private function _AllFreePlayerWindowItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.y = 2;
            _local1.width = 90;
            _local1.setStyle("textAlign", "center");
            _local1.id = "playerName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerName = _local1;
            BindingManager.executeBindings(this, "playerName", this.playerName);
            return (_local1);
        }
        private function _AllFreePlayerWindowItem_Label2_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 95;
            _local1.y = 2;
            _local1.width = 30;
            _local1.setStyle("textAlign", "center");
            _local1.id = "playerLevel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerLevel = _local1;
            BindingManager.executeBindings(this, "playerLevel", this.playerLevel);
            return (_local1);
        }
        private function _AllFreePlayerWindowItem_Label3_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 135;
            _local1.y = 2;
            _local1.width = 60;
            _local1.setStyle("textAlign", "center");
            _local1.id = "playerState";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerState = _local1;
            BindingManager.executeBindings(this, "playerState", this.playerState);
            return (_local1);
        }
        private function _AllFreePlayerWindowItem_Label4_i():Label{
            var _local1:Label = new Label();
            _local1.x = 200;
            _local1.y = 2;
            _local1.width = 70;
            _local1.setStyle("textAlign", "center");
            _local1.id = "playerRoom";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerRoom = _local1;
            BindingManager.executeBindings(this, "playerRoom", this.playerRoom);
            return (_local1);
        }
        private function _AllFreePlayerWindowItem_Rect1_i():Rect{
            var _local1:Rect = new Rect();
            _local1.visible = false;
            _local1.top = 0;
            _local1.left = 0;
            _local1.bottom = 1;
            _local1.right = 0;
            _local1.fill = this._AllFreePlayerWindowItem_LinearGradient1_c();
            _local1.initialized(this, "rollOverMask");
            this.rollOverMask = _local1;
            BindingManager.executeBindings(this, "rollOverMask", this.rollOverMask);
            return (_local1);
        }
        private function _AllFreePlayerWindowItem_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._AllFreePlayerWindowItem_GradientEntry1_c(), this._AllFreePlayerWindowItem_GradientEntry2_c(), this._AllFreePlayerWindowItem_GradientEntry3_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindowItem_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 15388793;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindowItem_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 15388793;
            _local1.alpha = 0.3;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindowItem_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 15388793;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AllFreePlayerWindowItem_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.bottom = 0;
            _local1.horizontalCenter = 0;
            _local1.source = this._embed_mxml_source_commonUI______png_298371472;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AllFreePlayerWindowItem_Group1_creationComplete(_arg1:FlexEvent):void{
            this.creationCompleteHandler(_arg1);
        }
        public function ___AllFreePlayerWindowItem_Group1_rollOver(_arg1:MouseEvent):void{
            this.rollOverMask.visible = true;
        }
        public function ___AllFreePlayerWindowItem_Group1_rollOut(_arg1:MouseEvent):void{
            this.rollOverMask.visible = false;
        }
        public function ___AllFreePlayerWindowItem_Group1_click(_arg1:MouseEvent):void{
            this.group1_clickHandler(_arg1);
        }
        public function get playerLevel():Label{
            return (this._539145507playerLevel);
        }
        public function set playerLevel(_arg1:Label):void{
            var _local2:Object = this._539145507playerLevel;
            if (_local2 !== _arg1){
                this._539145507playerLevel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerLevel", _local2, _arg1));
                };
            };
        }
        public function get playerName():Label{
            return (this._2095657228playerName);
        }
        public function set playerName(_arg1:Label):void{
            var _local2:Object = this._2095657228playerName;
            if (_local2 !== _arg1){
                this._2095657228playerName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerName", _local2, _arg1));
                };
            };
        }
        public function get playerRoom():Label{
            return (this._2095789916playerRoom);
        }
        public function set playerRoom(_arg1:Label):void{
            var _local2:Object = this._2095789916playerRoom;
            if (_local2 !== _arg1){
                this._2095789916playerRoom = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerRoom", _local2, _arg1));
                };
            };
        }
        public function get playerState():Label{
            return (this._546037296playerState);
        }
        public function set playerState(_arg1:Label):void{
            var _local2:Object = this._546037296playerState;
            if (_local2 !== _arg1){
                this._546037296playerState = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerState", _local2, _arg1));
                };
            };
        }
        public function get rollOverMask():Rect{
            return (this._1149221507rollOverMask);
        }
        public function set rollOverMask(_arg1:Rect):void{
            var _local2:Object = this._1149221507rollOverMask;
            if (_local2 !== _arg1){
                this._1149221507rollOverMask = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rollOverMask", _local2, _arg1));
                };
            };
        }

    }
}//package player_view 
