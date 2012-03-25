//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import mx.core.*;
    import mx.managers.*;
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
    import flash.utils.*;
    import combat_element_script.*;
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

    public class RoomWindowUserArea extends Group {

        private var __moduleFactoryInitialized:Boolean = false;
        public var isEmpty:Boolean = true;
        public var isMeFlag:Boolean = false;
        protected var _userInfo:Object;
        protected var _517548125_isMainUserWindow:Boolean = false;
        protected var _posIndex:int;

        public function RoomWindowUserArea(){
            this.addEventListener("dragEnter", this.___RoomWindowUserArea_Group1_dragEnter);
            this.addEventListener("dragDrop", this.___RoomWindowUserArea_Group1_dragDrop);
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
        public function set userInfo(_arg1:Object):void{
            this._userInfo = _arg1;
        }
        public function get userInfo():Object{
            return (this._userInfo);
        }
        public function set posIndex(_arg1:int):void{
            this._posIndex = _arg1;
        }
        public function get posIndex():int{
            return (this._posIndex);
        }
        public function clearUserInfo():void{
        }
        public function getSelectCardName():String{
            return ("");
        }
        public function changeUserState(_arg1:String, _arg2:String=null):void{
        }
        public function set isMainUserWindow(_arg1:Boolean):void{
            this._isMainUserWindow = _arg1;
        }
        public function get isMainUserWindow():Boolean{
            return (this._isMainUserWindow);
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function changeSeat():void{
            LuaAgent.getInstance().run((("u.hall_room_mgr:player_change_seat(true, " + this.posIndex) + ")"));
        }
        protected function dragStartHandler(_arg1:MouseEvent):void{
            var _local2:UIComponent;
            var _local3:BitmapData;
            var _local4:DragSource;
            if ((_arg1.target is RichEditableText)){
                return;
            };
            if (((RoomWindow.getInstance().isMeRoomOwner) && (!(RoomUtil.isCompetitionModeRoom(RoomWindow.getInstance().roomType))))){
                _local2 = new UIComponent();
                _local3 = new BitmapData(width, height, true, 0);
                _local3.draw(this);
                _local2.addChild(new Bitmap(_local3));
                _local2.width = _local3.width;
                _local2.height = _local3.height;
                _local4 = new DragSource();
                _local4.addData({posIndex:this._posIndex}, "source");
                DragManager.doDrag(this, _local4, _arg1, _local2, 0, 0, 0.5);
            };
        }
        protected function group1_dragEnterHandler(_arg1:DragEvent):void{
            if ((((_arg1.dragInitiator is RoomWindowUserArea)) && (!((_arg1.dragInitiator == this))))){
                DragManager.acceptDragDrop(this);
            };
        }
        protected function group1_dragDropHandler(_arg1:DragEvent):void{
            var _local2:Object = (_arg1.dragSource.dataForFormat("source") as Object);
            RoomWindow.getInstance().roomOwnerTryChangeSeat(_local2["posIndex"], this.posIndex);
        }
        public function ___RoomWindowUserArea_Group1_dragEnter(_arg1:DragEvent):void{
            this.group1_dragEnterHandler(_arg1);
        }
        public function ___RoomWindowUserArea_Group1_dragDrop(_arg1:DragEvent):void{
            this.group1_dragDropHandler(_arg1);
        }
        protected function get _isMainUserWindow():Boolean{
            return (this._517548125_isMainUserWindow);
        }
        protected function set _isMainUserWindow(_arg1:Boolean):void{
            var _local2:Object = this._517548125_isMainUserWindow;
            if (_local2 !== _arg1){
                this._517548125_isMainUserWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_isMainUserWindow", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
