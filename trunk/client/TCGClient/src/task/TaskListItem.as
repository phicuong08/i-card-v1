//Created by Action Script Viewer - http://www.buraks.com/asv
package task {
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
    import spark.filters.*;
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
	use namespace mx_internal;
    public class TaskListItem extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _TaskListItem_Label1:Label;
        public var _TaskListItem_Label2:Label;
        public var _TaskListItem_Rect1:Rect;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _410330704taskName:String;
        private var _2094953950taskComplete:Boolean = false;
        private var isMouseOver:Boolean = false;
        private var _isSelected:Boolean = false;
        private var _1631768462maskVisibleFlag:Boolean = false;
        private var _taskInfo:Object;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function TaskListItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._TaskListItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_task_TaskListItemWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 210;
            this.height = 25;
            this.layout = this._TaskListItem_BasicLayout1_c();
            this.mxmlContent = [this._TaskListItem_Rect1_i(), this._TaskListItem_Label1_i(), this._TaskListItem_Label2_i()];
            this.addEventListener("rollOver", this.___TaskListItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___TaskListItem_Group1_rollOut);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            TaskListItem._watcherSetupUtil = _arg1;
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
                this.fontSize = 16;
                this.color = 15126902;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function set taskInfo(_arg1:Object):void{
            var _local2:ColorMatrixFilter;
            this._taskInfo = _arg1;
            this.taskComplete = this._taskInfo.complete_flag;
            if (this.taskComplete){
                _local2 = new ColorMatrixFilter();
                _local2.matrix = ColorUtil.getGrayColorMatrix();
                filters = [_local2];
            } else {
                filters = [];
            };
            this.taskName = TaskDescScript.getTaskDescScript(this._taskInfo, true).name;
        }
        public function get taskInfo():Object{
            return (this._taskInfo);
        }
        public function set isSelected(_arg1:Boolean):void{
            if (this._isSelected != _arg1){
                this._isSelected = _arg1;
                this.maskVisibleFlag = ((this._isSelected) || (this.isMouseOver));
            };
        }
        public function get isSelected():Boolean{
            return (this._isSelected);
        }
        protected function group1_rollOverHandler(_arg1:MouseEvent):void{
            this.isMouseOver = true;
            this.maskVisibleFlag = ((this._isSelected) || (this.isMouseOver));
        }
        protected function group1_rollOutHandler(_arg1:MouseEvent):void{
            this.isMouseOver = false;
            this.maskVisibleFlag = ((this._isSelected) || (this.isMouseOver));
        }
        private function _TaskListItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskListItem_Rect1_i():Rect{
            var _local1:Rect = new Rect();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.fill = this._TaskListItem_LinearGradient1_c();
            _local1.initialized(this, "_TaskListItem_Rect1");
            this._TaskListItem_Rect1 = _local1;
            BindingManager.executeBindings(this, "_TaskListItem_Rect1", this._TaskListItem_Rect1);
            return (_local1);
        }
        private function _TaskListItem_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._TaskListItem_GradientEntry1_c(), this._TaskListItem_GradientEntry2_c(), this._TaskListItem_GradientEntry3_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskListItem_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 9868164;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskListItem_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 9868164;
            _local1.alpha = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskListItem_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 9868164;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskListItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.verticalCenter = 0;
            _local1.id = "_TaskListItem_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TaskListItem_Label1 = _local1;
            BindingManager.executeBindings(this, "_TaskListItem_Label1", this._TaskListItem_Label1);
            return (_local1);
        }
        private function _TaskListItem_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.text = "(已完成)";
            _local1.right = 0;
            _local1.verticalCenter = 0;
            _local1.id = "_TaskListItem_Label2";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TaskListItem_Label2 = _local1;
            BindingManager.executeBindings(this, "_TaskListItem_Label2", this._TaskListItem_Label2);
            return (_local1);
        }
        public function ___TaskListItem_Group1_rollOver(_arg1:MouseEvent):void{
            this.group1_rollOverHandler(_arg1);
        }
        public function ___TaskListItem_Group1_rollOut(_arg1:MouseEvent):void{
            this.group1_rollOutHandler(_arg1);
        }
        private function _TaskListItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Boolean{
                return (maskVisibleFlag);
            }, null, "_TaskListItem_Rect1.visible");
            result[1] = new Binding(this, function ():String{
                var _local1:* = taskName;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_TaskListItem_Label1.text");
            result[2] = new Binding(this, function ():Boolean{
                return (taskComplete);
            }, null, "_TaskListItem_Label2.visible");
            return (result);
        }
        private function get taskName():String{
            return (this._410330704taskName);
        }
        private function set taskName(_arg1:String):void{
            var _local2:Object = this._410330704taskName;
            if (_local2 !== _arg1){
                this._410330704taskName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "taskName", _local2, _arg1));
                };
            };
        }
        private function get taskComplete():Boolean{
            return (this._2094953950taskComplete);
        }
        private function set taskComplete(_arg1:Boolean):void{
            var _local2:Object = this._2094953950taskComplete;
            if (_local2 !== _arg1){
                this._2094953950taskComplete = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "taskComplete", _local2, _arg1));
                };
            };
        }
        private function get maskVisibleFlag():Boolean{
            return (this._1631768462maskVisibleFlag);
        }
        private function set maskVisibleFlag(_arg1:Boolean):void{
            var _local2:Object = this._1631768462maskVisibleFlag;
            if (_local2 !== _arg1){
                this._1631768462maskVisibleFlag = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maskVisibleFlag", _local2, _arg1));
                };
            };
        }

    }
}//package task 
