//Created by Action Script Viewer - http://www.buraks.com/asv
package competition {
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
    import spark.layouts.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import skins.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class CompetitionRoom extends Group {

        private var _2105905052enterBtn:Button;
        private var _1879274115player_a:CompetitorWindow;
        private var _1879274116player_b:CompetitorWindow;
        private var _1149221507rollOverMask:Rect;
        private var __moduleFactoryInitialized:Boolean = false;
        private var roomInfo:Object;
        private var creationHasComplete:Boolean = false;

        public function CompetitionRoom(){
            this.width = 190;
            this.layout = this._CompetitionRoom_BasicLayout1_c();
            this.mxmlContent = [this._CompetitionRoom_Rect1_i(), this._CompetitionRoom_CompetitorWindow1_i(), this._CompetitionRoom_CompetitorWindow2_i(), this._CompetitionRoom_Button1_i()];
            this.addEventListener("rollOver", this.___CompetitionRoom_Group1_rollOver);
            this.addEventListener("rollOut", this.___CompetitionRoom_Group1_rollOut);
            this.addEventListener("creationComplete", this.___CompetitionRoom_Group1_creationComplete);
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
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.refreshDisplay();
        }
        public function setCompetitionRoomInfo(_arg1:Object):void{
            this.roomInfo = _arg1;
            if (this.roomInfo){
                this.refreshDisplay();
            } else {
                this.reset();
            };
        }
        protected function group1_rollOverHandler(_arg1:MouseEvent):void{
            this.rollOverMask.visible = true;
            this.enterBtn.visible = true;
            this.enterBtn.enabled = ((this.roomInfo) && (!(this.roomInfo.competition_complete)));
        }
        protected function group1_rollOutHandler(_arg1:MouseEvent):void{
            this.rollOverMask.visible = false;
            this.enterBtn.visible = false;
        }
        private function refreshDisplay():void{
            if (((this.roomInfo) && (this.creationHasComplete))){
                this.player_a.userInfo = this.roomInfo.player_a_info;
                this.player_b.userInfo = this.roomInfo.player_b_info;
                if (this.roomInfo.competition_complete){
                    this.player_a.active = ((((this.roomInfo.winner_name) && (this.roomInfo.player_a_info))) && ((this.roomInfo.player_a_info.name == this.roomInfo.winner_name)));
                    this.player_a.winSignVisible = ((this.player_a.active) && (this.roomInfo.player_a_info));
                    this.player_a.loseSignVisible = ((!(this.player_a.active)) && (this.roomInfo.player_a_info));
                    this.player_b.active = ((((this.roomInfo.winner_name) && (this.roomInfo.player_b_info))) && ((this.roomInfo.player_b_info.name == this.roomInfo.winner_name)));
                    this.player_b.winSignVisible = ((this.player_b.active) && (this.roomInfo.player_b_info));
                    this.player_b.loseSignVisible = ((!(this.player_b.active)) && (this.roomInfo.player_b_info));
                } else {
                    this.player_a.active = true;
                    this.player_b.active = true;
                };
            };
        }
        private function reset():void{
            if (this.creationHasComplete){
                this.player_a.userInfo = null;
                this.player_b.userInfo = null;
            };
        }
        protected function enterBtn_clickHandler(_arg1:MouseEvent):void{
            LuaAgent.getInstance().run((((("u.competition_mgr:enter_room(" + this.roomInfo.group_index) + " , ") + this.roomInfo.number) + ")"));
        }
        private function _CompetitionRoom_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionRoom_Rect1_i():Rect{
            var _local1:Rect = new Rect();
            _local1.visible = false;
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.radiusX = 7;
            _local1.radiusY = 7;
            _local1.fill = this._CompetitionRoom_SolidColor1_c();
            _local1.initialized(this, "rollOverMask");
            this.rollOverMask = _local1;
            BindingManager.executeBindings(this, "rollOverMask", this.rollOverMask);
            return (_local1);
        }
        private function _CompetitionRoom_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.alpha = 0.2;
            _local1.color = 0xFFFFFF;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionRoom_CompetitorWindow1_i():CompetitorWindow{
            var _local1:CompetitorWindow = new CompetitorWindow();
            _local1.x = 10;
            _local1.y = 10;
            _local1.id = "player_a";
            if (!_local1.document){
                _local1.document = this;
            };
            this.player_a = _local1;
            BindingManager.executeBindings(this, "player_a", this.player_a);
            return (_local1);
        }
        private function _CompetitionRoom_CompetitorWindow2_i():CompetitorWindow{
            var _local1:CompetitorWindow = new CompetitorWindow();
            _local1.bottom = 10;
            _local1.right = 10;
            _local1.id = "player_b";
            if (!_local1.document){
                _local1.document = this;
            };
            this.player_b = _local1;
            BindingManager.executeBindings(this, "player_b", this.player_b);
            return (_local1);
        }
        private function _CompetitionRoom_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.visible = false;
            _local1.label = "进入房间";
            _local1.horizontalCenter = 0;
            _local1.verticalCenter = 0;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__enterBtn_click);
            _local1.id = "enterBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.enterBtn = _local1;
            BindingManager.executeBindings(this, "enterBtn", this.enterBtn);
            return (_local1);
        }
        public function __enterBtn_click(_arg1:MouseEvent):void{
            this.enterBtn_clickHandler(_arg1);
        }
        public function ___CompetitionRoom_Group1_rollOver(_arg1:MouseEvent):void{
            this.group1_rollOverHandler(_arg1);
        }
        public function ___CompetitionRoom_Group1_rollOut(_arg1:MouseEvent):void{
            this.group1_rollOutHandler(_arg1);
        }
        public function ___CompetitionRoom_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function get enterBtn():Button{
            return (this._2105905052enterBtn);
        }
        public function set enterBtn(_arg1:Button):void{
            var _local2:Object = this._2105905052enterBtn;
            if (_local2 !== _arg1){
                this._2105905052enterBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enterBtn", _local2, _arg1));
                };
            };
        }
        public function get player_a():CompetitorWindow{
            return (this._1879274115player_a);
        }
        public function set player_a(_arg1:CompetitorWindow):void{
            var _local2:Object = this._1879274115player_a;
            if (_local2 !== _arg1){
                this._1879274115player_a = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "player_a", _local2, _arg1));
                };
            };
        }
        public function get player_b():CompetitorWindow{
            return (this._1879274116player_b);
        }
        public function set player_b(_arg1:CompetitorWindow):void{
            var _local2:Object = this._1879274116player_b;
            if (_local2 !== _arg1){
                this._1879274116player_b = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "player_b", _local2, _arg1));
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
}//package competition 
