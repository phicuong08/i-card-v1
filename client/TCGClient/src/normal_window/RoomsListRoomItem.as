//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
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
    import combat_element_script.*;
    import player_view.*;
    import flash.accessibility.*;
    import skins.*;
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

    public class RoomsListRoomItem extends Group {

        private var _2002225732duelBtn:Button;
        private var _1939951317duelSign:SmoothBitmapImage;
        private var _840147255maskImg:SmoothBitmapImage;
        private var _640558963roomItemBg:SmoothBitmapImage;
        private var _173503994roomName:Label;
        private var _1636108816roomOwerHead:MyImage;
        private var _1756711613roomOwnerName:Label;
        private var _648742474roomPlayerNum:Label;
        private var _953243001roomViewerNum:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var creationHasComplete:Boolean = false;
        private var info:Object;
        private var _isSelected:Boolean = false;
        private var _embed_mxml_source_commonUI_____png_1704344224:Class;

        public function RoomsListRoomItem(){
            this._embed_mxml_source_commonUI_____png_1704344224 = RoomsListRoomItem__embed_mxml_source_commonUI_____png_1704344224;
            super();
            this.width = 639;
            this.height = 72;
            this.layout = this._RoomsListRoomItem_BasicLayout1_c();
            this.mxmlContent = [this._RoomsListRoomItem_SmoothBitmapImage1_i(), this._RoomsListRoomItem_MyImage1_i(), this._RoomsListRoomItem_SmoothBitmapImage2_c(), this._RoomsListRoomItem_Button1_c(), this._RoomsListRoomItem_Button2_i(), this._RoomsListRoomItem_Label1_i(), this._RoomsListRoomItem_Label2_i(), this._RoomsListRoomItem_Label3_i(), this._RoomsListRoomItem_Label4_i(), this._RoomsListRoomItem_SmoothBitmapImage3_i(), this._RoomsListRoomItem_SmoothBitmapImage4_i()];
            this.addEventListener("creationComplete", this.___RoomsListRoomItem_Group1_creationComplete);
            this.addEventListener("rollOver", this.___RoomsListRoomItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___RoomsListRoomItem_Group1_rollOut);
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
                this.fontSize = 14;
                this.color = 12959647;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function set isSelected(_arg1:Boolean):void{
            this.maskImg.alpha = 1;
            this.maskImg.visible = _arg1;
            this._isSelected = _arg1;
        }
        public function get isSelected():Boolean{
            return (this._isSelected);
        }
        public function set roomInfo(_arg1:Object):void{
            this.info = _arg1;
            this.buildDisplayInfo();
        }
        public function get roomInfo():Object{
            return (this.info);
        }
        protected function creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.roomItemBg.source = RoomsListSourceMgr.getInstance().getSourceClass("roomItemBg");
            this.duelSign.source = RoomsListSourceMgr.getInstance().getSourceClass("duelSign");
            this.maskImg.source = RoomsListSourceMgr.getInstance().getSourceClass("yellowMask");
            this.roomOwerHead.source = RoomsListSourceMgr.getInstance().getSourceClass("defaultHead");
            this.buildDisplayInfo();
        }
        private function buildDisplayInfo():void{
            var _local1:int;
            if (((this.creationHasComplete) && (this.info))){
                this.roomName.text = RoomUtil.getRoomNameByInfo(this.info);
                if (this.info["owner_icon"]){
                    this.roomOwerHead.source = (("source/userHead/" + this.info["owner_icon"]) + ".jpg");
                    this.roomOwnerName.text = ("房主：" + this.info["owner_name"]);
                } else {
                    this.roomOwerHead.source = null;
                    this.roomOwnerName.text = "房主：----";
                };
                _local1 = (RoomUtil.isTwoPlayerModeRoom(this.info["type"])) ? 2 : 4;
                this.roomPlayerNum.text = ((("参战：" + this.info["player_num"]) + " / ") + _local1);
                this.roomViewerNum.text = ("观战：" + this.info["viewer_num"]);
                this.duelSign.visible = (this.info["state"] == "duel");
                this.duelBtn.enabled = !((this.info["player_num"] == _local1));
            };
        }
        protected function enterRoom(_arg1:Boolean):void{
            if (this.info){
                LuaAgent.getInstance().run((((((("u.hall_room_mgr:enter_room(\"" + this.info["type"]) + "\", ") + this.info["number"]) + ",") + _arg1) + ")"));
            };
        }
        protected function group1_rollOverHandler(_arg1:MouseEvent):void{
            if (!this._isSelected){
                this.maskImg.alpha = 0.5;
                this.maskImg.visible = true;
            };
        }
        protected function group1_rollOutHandler(_arg1:MouseEvent):void{
            if (!this._isSelected){
                this.maskImg.visible = false;
            };
        }
        private function _RoomsListRoomItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomsListRoomItem_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.initialized(this, "roomItemBg");
            this.roomItemBg = _local1;
            BindingManager.executeBindings(this, "roomItemBg", this.roomItemBg);
            return (_local1);
        }
        private function _RoomsListRoomItem_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 7;
            _local1.y = 6;
            _local1.width = 60;
            _local1.height = 60;
            _local1.addEventListener("click", this.__roomOwerHead_click);
            _local1.id = "roomOwerHead";
            if (!_local1.document){
                _local1.document = this;
            };
            this.roomOwerHead = _local1;
            BindingManager.executeBindings(this, "roomOwerHead", this.roomOwerHead);
            return (_local1);
        }
        public function __roomOwerHead_click(_arg1:MouseEvent):void{
            PlayViewMgr.getInstance().showOpMenu(this.info["owner_name"]);
        }
        private function _RoomsListRoomItem_SmoothBitmapImage2_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 5;
            _local1.y = 4;
            _local1.source = this._embed_mxml_source_commonUI_____png_1704344224;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomsListRoomItem_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.x = 490;
            _local1.y = 35;
            _local1.buttonMode = true;
            _local1.setStyle("skinClass", RoomListItemViewButtonSkin);
            _local1.addEventListener("click", this.___RoomsListRoomItem_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RoomsListRoomItem_Button1_click(_arg1:MouseEvent):void{
            this.enterRoom(true);
        }
        private function _RoomsListRoomItem_Button2_i():Button{
            var _local1:Button = new Button();
            _local1.x = 565;
            _local1.y = 35;
            _local1.buttonMode = true;
            _local1.enabled = false;
            _local1.setStyle("skinClass", RoomListItemDuelButtonSkin);
            _local1.addEventListener("click", this.__duelBtn_click);
            _local1.id = "duelBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.duelBtn = _local1;
            BindingManager.executeBindings(this, "duelBtn", this.duelBtn);
            return (_local1);
        }
        public function __duelBtn_click(_arg1:MouseEvent):void{
            this.enterRoom(false);
        }
        private function _RoomsListRoomItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 80;
            _local1.y = 12;
            _local1.text = "新手场：---";
            _local1.setStyle("color", 15257718);
            _local1.id = "roomName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.roomName = _local1;
            BindingManager.executeBindings(this, "roomName", this.roomName);
            return (_local1);
        }
        private function _RoomsListRoomItem_Label2_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 119;
            _local1.y = 45;
            _local1.text = "房主：----";
            _local1.id = "roomOwnerName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.roomOwnerName = _local1;
            BindingManager.executeBindings(this, "roomOwnerName", this.roomOwnerName);
            return (_local1);
        }
        private function _RoomsListRoomItem_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 263;
            _local1.y = 45;
            _local1.text = "参战：0 / 2";
            _local1.id = "roomPlayerNum";
            if (!_local1.document){
                _local1.document = this;
            };
            this.roomPlayerNum = _local1;
            BindingManager.executeBindings(this, "roomPlayerNum", this.roomPlayerNum);
            return (_local1);
        }
        private function _RoomsListRoomItem_Label4_i():Label{
            var _local1:Label = new Label();
            _local1.x = 407;
            _local1.y = 45;
            _local1.text = "观战：0";
            _local1.id = "roomViewerNum";
            if (!_local1.document){
                _local1.document = this;
            };
            this.roomViewerNum = _local1;
            BindingManager.executeBindings(this, "roomViewerNum", this.roomViewerNum);
            return (_local1);
        }
        private function _RoomsListRoomItem_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.visible = false;
            _local1.x = 542;
            _local1.y = 13;
            _local1.initialized(this, "duelSign");
            this.duelSign = _local1;
            BindingManager.executeBindings(this, "duelSign", this.duelSign);
            return (_local1);
        }
        private function _RoomsListRoomItem_SmoothBitmapImage4_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.visible = false;
            _local1.initialized(this, "maskImg");
            this.maskImg = _local1;
            BindingManager.executeBindings(this, "maskImg", this.maskImg);
            return (_local1);
        }
        public function ___RoomsListRoomItem_Group1_creationComplete(_arg1:FlexEvent):void{
            this.creationCompleteHandler(_arg1);
        }
        public function ___RoomsListRoomItem_Group1_rollOver(_arg1:MouseEvent):void{
            this.group1_rollOverHandler(_arg1);
        }
        public function ___RoomsListRoomItem_Group1_rollOut(_arg1:MouseEvent):void{
            this.group1_rollOutHandler(_arg1);
        }
        public function get duelBtn():Button{
            return (this._2002225732duelBtn);
        }
        public function set duelBtn(_arg1:Button):void{
            var _local2:Object = this._2002225732duelBtn;
            if (_local2 !== _arg1){
                this._2002225732duelBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "duelBtn", _local2, _arg1));
                };
            };
        }
        public function get duelSign():SmoothBitmapImage{
            return (this._1939951317duelSign);
        }
        public function set duelSign(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1939951317duelSign;
            if (_local2 !== _arg1){
                this._1939951317duelSign = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "duelSign", _local2, _arg1));
                };
            };
        }
        public function get maskImg():SmoothBitmapImage{
            return (this._840147255maskImg);
        }
        public function set maskImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._840147255maskImg;
            if (_local2 !== _arg1){
                this._840147255maskImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maskImg", _local2, _arg1));
                };
            };
        }
        public function get roomItemBg():SmoothBitmapImage{
            return (this._640558963roomItemBg);
        }
        public function set roomItemBg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._640558963roomItemBg;
            if (_local2 !== _arg1){
                this._640558963roomItemBg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomItemBg", _local2, _arg1));
                };
            };
        }
        public function get roomName():Label{
            return (this._173503994roomName);
        }
        public function set roomName(_arg1:Label):void{
            var _local2:Object = this._173503994roomName;
            if (_local2 !== _arg1){
                this._173503994roomName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomName", _local2, _arg1));
                };
            };
        }
        public function get roomOwerHead():MyImage{
            return (this._1636108816roomOwerHead);
        }
        public function set roomOwerHead(_arg1:MyImage):void{
            var _local2:Object = this._1636108816roomOwerHead;
            if (_local2 !== _arg1){
                this._1636108816roomOwerHead = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomOwerHead", _local2, _arg1));
                };
            };
        }
        public function get roomOwnerName():Label{
            return (this._1756711613roomOwnerName);
        }
        public function set roomOwnerName(_arg1:Label):void{
            var _local2:Object = this._1756711613roomOwnerName;
            if (_local2 !== _arg1){
                this._1756711613roomOwnerName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomOwnerName", _local2, _arg1));
                };
            };
        }
        public function get roomPlayerNum():Label{
            return (this._648742474roomPlayerNum);
        }
        public function set roomPlayerNum(_arg1:Label):void{
            var _local2:Object = this._648742474roomPlayerNum;
            if (_local2 !== _arg1){
                this._648742474roomPlayerNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomPlayerNum", _local2, _arg1));
                };
            };
        }
        public function get roomViewerNum():Label{
            return (this._953243001roomViewerNum);
        }
        public function set roomViewerNum(_arg1:Label):void{
            var _local2:Object = this._953243001roomViewerNum;
            if (_local2 !== _arg1){
                this._953243001roomViewerNum = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomViewerNum", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
