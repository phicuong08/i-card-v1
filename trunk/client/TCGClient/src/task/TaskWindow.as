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
    import custom_control1.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import spark.primitives.*;
    import mx.graphics.*;
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

    public class TaskWindow extends AutoDepthGroup implements IBindingClient {
		use namespace mx_internal;
        public static var displayTaskType:String = "main_line";
        public static var needDisplayTaskId:int;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _TaskWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _TaskWindow_CommonMiddleFrame2:CommonMiddleFrame;
        public var _TaskWindow_CommonOuterFrame1:CommonOuterFrame;
        private var _413245038addEffect:Fade;
        private var _2131590956itemGroup:VGroup;
        private var _66803271scrollerCp:Scroller;
        private var _663284768taskTabWindow:CommonTabWindow;
        private var __moduleFactoryInitialized:Boolean = false;
        private var itemGroupCreationHasComplete:Boolean = false;
        private var allTaskInfoArr:Array;
        private var currentSelectTaskItem:TaskListItem;
        private var taskDescWindow:TaskDescWindow;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function TaskWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.taskDescWindow = new TaskDescWindow();
            this._embed_mxml_source_commonUI____png_1538356188 = TaskWindow__embed_mxml_source_commonUI____png_1538356188;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._TaskWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_task_TaskWindowWatcherSetupUtil");
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
            this.width = 560;
            this.height = 360;
            this.layout = this._TaskWindow_BasicLayout1_c();
            this.mxmlContent = [this._TaskWindow_CommonOuterFrame1_i(), this._TaskWindow_CommonMiddleFrame1_i(), this._TaskWindow_CommonMiddleFrame2_i(), this._TaskWindow_Rect1_c(), this._TaskWindow_Rect2_c(), this._TaskWindow_SmoothBitmapImage1_c(), this._TaskWindow_Label1_c(), this._TaskWindow_CloseSignBtn1_c(), this._TaskWindow_CommonTabWindow1_i(), this._TaskWindow_Scroller1_i()];
            this._TaskWindow_Fade1_i();
            this.addEventListener("mouseUp", this.___TaskWindow_AutoDepthGroup1_mouseUp);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            TaskWindow._watcherSetupUtil = _arg1;
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
        public function setAllTaskInfo(_arg1:Object):void{
            var _local2:Object;
            this.allTaskInfoArr = new Array();
            for each (_local2 in _arg1) {
                this.allTaskInfoArr.push(_local2);
            };
            this.allTaskInfoArr.sortOn(["complete_flag", "id"], [0, (Array.NUMERIC | Array.DESCENDING)]);
            callLater(this.buildTaskList);
        }
        protected function itemGroup_creationCompleteHandler(_arg1:FlexEvent):void{
            this.itemGroupCreationHasComplete = true;
            this.buildTaskList();
        }
        protected function buildTaskList():void{
            var _local2:TaskListItem;
            var _local4:TaskListItem;
            if (((!(this.itemGroupCreationHasComplete)) || (!(this.allTaskInfoArr)))){
                return;
            };
            var _local1:int = this.itemGroup.numElements;
            var _local3:int;
            this.taskTabWindow.selectItemText = this.translateTaskType(displayTaskType);
            var _local5:int;
            while (_local5 < this.allTaskInfoArr.length) {
                if (((!((this.allTaskInfoArr[_local5].type == displayTaskType))) || (!(TaskDescScript.getTaskDescScript(this.allTaskInfoArr[_local5], true))))){
                } else {
                    if (_local3 >= _local1){
                        _local2 = new TaskListItem();
                        _local2.addEventListener(MouseEvent.CLICK, this.taskItemClickHandler);
                        this.itemGroup.addElement(_local2);
                    } else {
                        _local2 = (this.itemGroup.getElementAt(_local3) as TaskListItem);
                    };
                    _local2.taskInfo = this.allTaskInfoArr[_local5];
                    if (_local2.taskInfo.id == needDisplayTaskId){
                        _local4 = _local2;
                    };
                    _local3++;
                };
                _local5++;
            };
            _local5 = (this.itemGroup.numElements - 1);
            while (_local5 >= _local3) {
                _local2 = (this.itemGroup.removeElementAt(_local5) as TaskListItem);
                _local2.removeEventListener(MouseEvent.CLICK, this.taskItemClickHandler);
                if (this.currentSelectTaskItem == _local2){
                    this.clearSelectTaskItem();
                };
                _local5--;
            };
            if (((_local4) || (this.currentSelectTaskItem))){
                this.setSelectTaskItem((_local4) ? _local4 : this.currentSelectTaskItem);
            };
        }
        private function clearSelectTaskItem():void{
            needDisplayTaskId = 0;
            if (this.currentSelectTaskItem){
                this.currentSelectTaskItem.isSelected = false;
            };
            this.currentSelectTaskItem = null;
            this.taskDescWindow.removeSelf();
        }
        private function taskItemClickHandler(_arg1:MouseEvent):void{
            this.setSelectTaskItem((_arg1.currentTarget as TaskListItem));
        }
        private function setSelectTaskItem(_arg1:TaskListItem):void{
            needDisplayTaskId = 0;
            if (((this.currentSelectTaskItem) && (!((this.currentSelectTaskItem == _arg1))))){
                this.currentSelectTaskItem.isSelected = false;
            };
            this.currentSelectTaskItem = _arg1;
            this.currentSelectTaskItem.isSelected = true;
            this.showTaskDescWindow(this.currentSelectTaskItem.taskInfo);
        }
        private function showTaskDescWindow(_arg1:Object):void{
            if (!this.taskDescWindow.parent){
                this.taskDescWindow.addEventListener(FlexEvent.REMOVE, this.descWindowRemoveHandler);
                addElement(this.taskDescWindow);
            };
            this.taskDescWindow.setTaskInfo(_arg1);
        }
        private function descWindowRemoveHandler(_arg1:FlexEvent):void{
            this.taskDescWindow.removeEventListener(FlexEvent.REMOVE, this.descWindowRemoveHandler);
            this.clearSelectTaskItem();
        }
        protected function tabWindow_clickHandler(_arg1:MouseEvent):void{
            var _local2:String = this.translateTaskType(this.taskTabWindow.selectItemText);
            if (displayTaskType != _local2){
                displayTaskType = _local2;
                this.clearSelectTaskItem();
                this.buildTaskList();
            };
        }
        private function translateTaskType(_arg1:String):String{
            switch (_arg1){
                case "main_line":
                    return ("主线任务");
                case "branch":
                    return ("支线任务");
                case "daily":
                    return ("日常任务");
                case "主线任务":
                    return ("main_line");
                case "支线任务":
                    return ("branch");
                default:
                    return ("daily");
            };
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function _TaskWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 300;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _TaskWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.alpha = 0.9;
            _local1.mouseEnabled = true;
            _local1.filters = [this._TaskWindow_DropShadowFilter1_c()];
            _local1.addEventListener("mouseDown", this.___TaskWindow_CommonOuterFrame1_mouseDown);
            _local1.id = "_TaskWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TaskWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_TaskWindow_CommonOuterFrame1", this._TaskWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _TaskWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___TaskWindow_CommonOuterFrame1_mouseDown(_arg1:MouseEvent):void{
            this.startDrag();
        }
        private function _TaskWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 15;
            _local1.y = 70;
            _local1.alpha = 0.85;
            _local1.id = "_TaskWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TaskWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_TaskWindow_CommonMiddleFrame1", this._TaskWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _TaskWindow_CommonMiddleFrame2_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 285;
            _local1.y = 50;
            _local1.alpha = 0.85;
            _local1.id = "_TaskWindow_CommonMiddleFrame2";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TaskWindow_CommonMiddleFrame2 = _local1;
            BindingManager.executeBindings(this, "_TaskWindow_CommonMiddleFrame2", this._TaskWindow_CommonMiddleFrame2);
            return (_local1);
        }
        private function _TaskWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 21;
            _local1.y = 80;
            _local1.alpha = 0.4;
            _local1.width = 248;
            _local1.height = 259;
            _local1.radiusX = 5;
            _local1.radiusY = 5;
            _local1.fill = this._TaskWindow_SolidColor1_c();
            _local1.stroke = this._TaskWindow_SolidColorStroke1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskWindow_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskWindow_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 13156254;
            _local1.weight = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskWindow_Rect2_c():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 291;
            _local1.y = 60;
            _local1.alpha = 0.4;
            _local1.width = 248;
            _local1.height = 284;
            _local1.radiusX = 5;
            _local1.radiusY = 5;
            _local1.fill = this._TaskWindow_SolidColor2_c();
            _local1.stroke = this._TaskWindow_SolidColorStroke2_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskWindow_SolidColor2_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskWindow_SolidColorStroke2_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 13156254;
            _local1.weight = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.x = 0;
            _local1.y = 17;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskWindow_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 31;
            _local1.y = 13;
            _local1.text = "任务列表";
            _local1.mouseEnabled = false;
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskWindow_CloseSignBtn1_c():CloseSignBtn{
            var _local1:CloseSignBtn = new CloseSignBtn();
            _local1.right = 4;
            _local1.top = 4;
            _local1.addEventListener("click", this.___TaskWindow_CloseSignBtn1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___TaskWindow_CloseSignBtn1_click(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        private function _TaskWindow_CommonTabWindow1_i():CommonTabWindow{
            var _local1:CommonTabWindow = new CommonTabWindow();
            _local1.x = 15;
            _local1.y = 44;
            _local1.addEventListener("click", this.__taskTabWindow_click);
            _local1.id = "taskTabWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.taskTabWindow = _local1;
            BindingManager.executeBindings(this, "taskTabWindow", this.taskTabWindow);
            return (_local1);
        }
        public function __taskTabWindow_click(_arg1:MouseEvent):void{
            this.tabWindow_clickHandler(_arg1);
        }
        private function _TaskWindow_Scroller1_i():Scroller{
            var _local1:Scroller = new Scroller();
            _local1.x = 35;
            _local1.y = 100;
            _local1.width = 228;
            _local1.maxHeight = 225;
            _local1.viewport = this._TaskWindow_VGroup1_i();
            _local1.setStyle("horizontalScrollPolicy", "off");
            _local1.id = "scrollerCp";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scrollerCp = _local1;
            BindingManager.executeBindings(this, "scrollerCp", this.scrollerCp);
            return (_local1);
        }
        private function _TaskWindow_VGroup1_i():VGroup{
            var _local1:VGroup = new VGroup();
            _local1.gap = 0;
            _local1.addEventListener("creationComplete", this.__itemGroup_creationComplete);
            _local1.id = "itemGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup = _local1;
            BindingManager.executeBindings(this, "itemGroup", this.itemGroup);
            return (_local1);
        }
        public function __itemGroup_creationComplete(_arg1:FlexEvent):void{
            this.itemGroup_creationCompleteHandler(_arg1);
        }
        public function ___TaskWindow_AutoDepthGroup1_mouseUp(_arg1:MouseEvent):void{
            this.stopDrag();
        }
        private function _TaskWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [560, 360];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_TaskWindow_CommonOuterFrame1.size");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [260, 275];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_TaskWindow_CommonMiddleFrame1.size");
            result[3] = new Binding(this, function ():Array{
                var _local1:* = [260, 300];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_TaskWindow_CommonMiddleFrame2.size");
            result[4] = new Binding(this, function ():Array{
                var _local1:* = ["主线任务", "支线任务", "日常任务"];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "taskTabWindow.tabItemDataProvider");
            return (result);
        }
        public function get addEffect():Fade{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Fade):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }
        public function get itemGroup():VGroup{
            return (this._2131590956itemGroup);
        }
        public function set itemGroup(_arg1:VGroup):void{
            var _local2:Object = this._2131590956itemGroup;
            if (_local2 !== _arg1){
                this._2131590956itemGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemGroup", _local2, _arg1));
                };
            };
        }
        public function get scrollerCp():Scroller{
            return (this._66803271scrollerCp);
        }
        public function set scrollerCp(_arg1:Scroller):void{
            var _local2:Object = this._66803271scrollerCp;
            if (_local2 !== _arg1){
                this._66803271scrollerCp = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scrollerCp", _local2, _arg1));
                };
            };
        }
        public function get taskTabWindow():CommonTabWindow{
            return (this._663284768taskTabWindow);
        }
        public function set taskTabWindow(_arg1:CommonTabWindow):void{
            var _local2:Object = this._663284768taskTabWindow;
            if (_local2 !== _arg1){
                this._663284768taskTabWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "taskTabWindow", _local2, _arg1));
                };
            };
        }

    }
}//package task 
