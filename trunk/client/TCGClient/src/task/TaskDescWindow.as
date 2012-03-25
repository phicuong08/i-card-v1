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
    import spark.effects.*;
    import spark.layouts.*;
    import flashx.textLayout.elements.*;
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
    public class TaskDescWindow extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _TaskDescWindow_RichText1:RichText;
        private var _413245038addEffect:Fade;
        private var _66803271scrollerCp:Scroller;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _2094953950taskComplete:Boolean = false;
        private var _555816166bonusTextVisible:Boolean = false;
        private var taskId:int;
        private var _1016906591descFlow:TextFlow;
        private var _61512252taskTargetFlow:TextFlow;
        private var _1440706029bonusFlow:TextFlow;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function TaskDescWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._TaskDescWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_task_TaskDescWindowWatcherSetupUtil");
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
            this.width = 290;
            this.height = 360;
            this.x = 270;
            this.layout = this._TaskDescWindow_BasicLayout1_c();
            this.mxmlContent = [this._TaskDescWindow_Scroller1_i()];
            this._TaskDescWindow_Fade1_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            TaskDescWindow._watcherSetupUtil = _arg1;
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
        public function setTaskInfo(_arg1:Object):void{
            var _local2:Object = TaskDescScript.getTaskDescScript(_arg1);
            this.taskId = _arg1.id;
            this.taskComplete = _arg1.complete_flag;
            this.descFlow = this.getTextFlowContent(_local2.descText);
            this.bonusTextVisible = ((_local2.bonusText) && (!((_local2.bonusText == ""))));
        }
        private function getTextFlowContent(_arg1:String):TextFlow{
            return (StringUtils.createTFByHtmlText(_arg1));
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function _TaskDescWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 300;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _TaskDescWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskDescWindow_Scroller1_i():Scroller{
            var _local1:Scroller;
            _local1 = new Scroller();
            _local1.x = 35;
            _local1.y = 80;
            _local1.width = 234;
            _local1.height = 245;
            _local1.viewport = this._TaskDescWindow_Group2_c();
            _local1.setStyle("horizontalScrollPolicy", "off");
            _local1.id = "scrollerCp";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scrollerCp = _local1;
            BindingManager.executeBindings(this, "scrollerCp", this.scrollerCp);
            return (_local1);
        }
        private function _TaskDescWindow_Group2_c():Group{
            var _local1:Group = new Group();
            _local1.mxmlContent = [this._TaskDescWindow_RichText1_i()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TaskDescWindow_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.maxWidth = 215;
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("color", 15971955);
            _local1.id = "_TaskDescWindow_RichText1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TaskDescWindow_RichText1 = _local1;
            BindingManager.executeBindings(this, "_TaskDescWindow_RichText1", this._TaskDescWindow_RichText1);
            return (_local1);
        }
        private function _TaskDescWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, function ():TextFlow{
                return (descFlow);
            }, null, "_TaskDescWindow_RichText1.textFlow");
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
        public function get taskComplete():Boolean{
            return (this._2094953950taskComplete);
        }
        public function set taskComplete(_arg1:Boolean):void{
            var _local2:Object = this._2094953950taskComplete;
            if (_local2 !== _arg1){
                this._2094953950taskComplete = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "taskComplete", _local2, _arg1));
                };
            };
        }
        private function get bonusTextVisible():Boolean{
            return (this._555816166bonusTextVisible);
        }
        private function set bonusTextVisible(_arg1:Boolean):void{
            var _local2:Object = this._555816166bonusTextVisible;
            if (_local2 !== _arg1){
                this._555816166bonusTextVisible = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bonusTextVisible", _local2, _arg1));
                };
            };
        }
        private function get descFlow():TextFlow{
            return (this._1016906591descFlow);
        }
        private function set descFlow(_arg1:TextFlow):void{
            var _local2:Object = this._1016906591descFlow;
            if (_local2 !== _arg1){
                this._1016906591descFlow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descFlow", _local2, _arg1));
                };
            };
        }
        private function get taskTargetFlow():TextFlow{
            return (this._61512252taskTargetFlow);
        }
        private function set taskTargetFlow(_arg1:TextFlow):void{
            var _local2:Object = this._61512252taskTargetFlow;
            if (_local2 !== _arg1){
                this._61512252taskTargetFlow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "taskTargetFlow", _local2, _arg1));
                };
            };
        }
        private function get bonusFlow():TextFlow{
            return (this._1440706029bonusFlow);
        }
        private function set bonusFlow(_arg1:TextFlow):void{
            var _local2:Object = this._1440706029bonusFlow;
            if (_local2 !== _arg1){
                this._1440706029bonusFlow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bonusFlow", _local2, _arg1));
                };
            };
        }

    }
}//package task 
