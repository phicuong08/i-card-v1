//Created by Action Script Viewer - http://www.buraks.com/asv
package card_smelt {
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

    public class AddSmeltWindow extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _AddSmeltWindow_CommonMiddleFrame1:CommonMiddleFrame;
        private var _1466093302addSmeltBtn:CardSmeltStyleButton;
        private var _1020166578fadeInEffect:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function AddSmeltWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._AddSmeltWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_card_smelt_AddSmeltWindowWatcherSetupUtil");
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
            this.width = 457;
            this.height = 192;
            this.layout = this._AddSmeltWindow_BasicLayout1_c();
            this.mxmlContent = [this._AddSmeltWindow_CommonMiddleFrame1_i(), this._AddSmeltWindow_CardSmeltStyleButton1_i()];
            this._AddSmeltWindow_Fade1_i();
            this.addEventListener("creationComplete", this.___AddSmeltWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            AddSmeltWindow._watcherSetupUtil = _arg1;
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
            this.fadeInEffect.play();
        }
        protected function addSmeltBtn_clickHandler(_arg1:MouseEvent):void{
            MessageBox.showMessageBox(MessageBox.EASY_NOTICE, "提示：", "使用道具#g【炼卡炉】#n可以新增一个炼卡炉位。<br>该道具在商城“道具分页”界面中出售。");
        }
        private function _AddSmeltWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        private function _AddSmeltWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AddSmeltWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.id = "_AddSmeltWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._AddSmeltWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_AddSmeltWindow_CommonMiddleFrame1", this._AddSmeltWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _AddSmeltWindow_CardSmeltStyleButton1_i():CardSmeltStyleButton{
            var _local1:CardSmeltStyleButton = new CardSmeltStyleButton();
            _local1.label = "添加卡炉";
            _local1.verticalCenter = 0;
            _local1.horizontalCenter = 0;
            _local1.addEventListener("click", this.__addSmeltBtn_click);
            _local1.id = "addSmeltBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.addSmeltBtn = _local1;
            BindingManager.executeBindings(this, "addSmeltBtn", this.addSmeltBtn);
            return (_local1);
        }
        public function __addSmeltBtn_click(_arg1:MouseEvent):void{
            this.addSmeltBtn_clickHandler(_arg1);
        }
        public function ___AddSmeltWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _AddSmeltWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (this);
            }, null, "fadeInEffect.target");
            result[1] = new Binding(this, null, null, "_AddSmeltWindow_CommonMiddleFrame1.width", "width");
            result[2] = new Binding(this, null, null, "_AddSmeltWindow_CommonMiddleFrame1.height", "height");
            return (result);
        }
        public function get addSmeltBtn():CardSmeltStyleButton{
            return (this._1466093302addSmeltBtn);
        }
        public function set addSmeltBtn(_arg1:CardSmeltStyleButton):void{
            var _local2:Object = this._1466093302addSmeltBtn;
            if (_local2 !== _arg1){
                this._1466093302addSmeltBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addSmeltBtn", _local2, _arg1));
                };
            };
        }
        public function get fadeInEffect():Fade{
            return (this._1020166578fadeInEffect);
        }
        public function set fadeInEffect(_arg1:Fade):void{
            var _local2:Object = this._1020166578fadeInEffect;
            if (_local2 !== _arg1){
                this._1020166578fadeInEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeInEffect", _local2, _arg1));
                };
            };
        }

    }
}//package card_smelt 
