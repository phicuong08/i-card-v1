//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import custom_control1.*;
    
    import custom_effect.*;
    
    import flash.accessibility.*;
    import flash.debugger.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;
    
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.filters.*;
    import mx.styles.*;
    
    import player_view.*;
    
    import source_manager.*;
    
    import spark.components.*;
    import spark.effects.*;
    import spark.layouts.*;
	use namespace mx_internal;
    public class RoomWindowViewerAreaItem extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Fade;
        private var _795280835headImg:MyImage;
        private var _188974544levelLabel:Label;
        private var _1215755049nameLabel:Label;
        private var _719739179numberLabel:Label;
        private var _1267520715removeEffect:Fade;
        private var _140131771viewerInfoBg:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        public var isMeFlag:Boolean = false;
        public var isMainUserWindow:Boolean = false;
        private var _info:Object;
        private var creationHasComplete:Boolean = false;
        private var moveEffect:MoveEffect;
        private var _embed_mxml_source_commonUI_____png_1704344224:Class;
        private var _embed_mxml_source_commonUI______png_298371472:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function RoomWindowViewerAreaItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.moveEffect = new MoveEffect(this);
            this._embed_mxml_source_commonUI_____png_1704344224 = RoomWindowViewerAreaItem__embed_mxml_source_commonUI_____png_1704344224;
            this._embed_mxml_source_commonUI______png_298371472 = RoomWindowViewerAreaItem__embed_mxml_source_commonUI______png_298371472;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._RoomWindowViewerAreaItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_RoomWindowViewerAreaItemWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (RoomWindowViewerAreaItem[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 173;
            this.height = 86;
            this.layout = this._RoomWindowViewerAreaItem_BasicLayout1_c();
            this.mxmlContent = [this._RoomWindowViewerAreaItem_SmoothBitmapImage1_i(), this._RoomWindowViewerAreaItem_MyImage1_i(), this._RoomWindowViewerAreaItem_SmoothBitmapImage2_c(), this._RoomWindowViewerAreaItem_SmoothBitmapImage3_c(), this._RoomWindowViewerAreaItem_Label1_i(), this._RoomWindowViewerAreaItem_Label2_i(), this._RoomWindowViewerAreaItem_Label3_i()];
            this._RoomWindowViewerAreaItem_Fade1_i();
            this._RoomWindowViewerAreaItem_Fade2_i();
            this.addEventListener("creationComplete", this.___RoomWindowViewerAreaItem_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            RoomWindowViewerAreaItem._watcherSetupUtil = _arg1;
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
                this.color = 14466179;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.viewerInfoBg.source = RoomWindowSourceMgr.getInstance().getSourceClass("viewerInfoBg");
            this.displayInfo();
        }
        public function set viewInfo(_arg1:Object):void{
            this._info = _arg1;
        }
        public function get viewInfo():Object{
            return (this._info);
        }
        private function displayInfo():void{
            if (((this.creationHasComplete) && (this._info))){
                this.numberLabel.text = this._info["viewer_number"];
                this.nameLabel.text = this._info["name"];
                this.levelLabel.text = ("等级：" + this._info["level"]);
                this.headImg.source = (("source/userHead/" + this._info["head_icon"]) + ".jpg");
            };
        }
        public function changeViewerState(_arg1:String, _arg2:String=null):void{
            if (!this._info){
                return;
            };
            this._info.state = _arg1;
        }
        public function refreshNumber():void{
            if (this.numberLabel){
                this.numberLabel.text = this._info["viewer_number"];
            };
        }
        public function moveYpos(_arg1:Number):void{
            if (((((this.moveEffect.isPlaying) && ((this.moveEffect.yTo == _arg1)))) || (((!(this.moveEffect.isPlaying)) && ((y == _arg1)))))){
                return;
            };
            this.moveEffect.duration = ((Math.abs((_arg1 - y)) / height) * 300);
            this.moveEffect.xTo = x;
            this.moveEffect.yTo = _arg1;
            this.moveEffect.play();
        }
        private function _RoomWindowViewerAreaItem_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _RoomWindowViewerAreaItem_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 0;
            _local1.duration = 300;
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        private function _RoomWindowViewerAreaItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowViewerAreaItem_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 13;
            _local1.y = 21;
            _local1.initialized(this, "viewerInfoBg");
            this.viewerInfoBg = _local1;
            BindingManager.executeBindings(this, "viewerInfoBg", this.viewerInfoBg);
            return (_local1);
        }
        private function _RoomWindowViewerAreaItem_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 4;
            _local1.y = 13;
            _local1.width = 60;
            _local1.height = 60;
            _local1.addEventListener("click", this.__headImg_click);
            _local1.id = "headImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.headImg = _local1;
            BindingManager.executeBindings(this, "headImg", this.headImg);
            return (_local1);
        }
        public function __headImg_click(_arg1:MouseEvent):void{
            PlayViewMgr.getInstance().showOpMenu(this._info["name"]);
        }
        private function _RoomWindowViewerAreaItem_SmoothBitmapImage2_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 2;
            _local1.y = 11;
            _local1.source = this._embed_mxml_source_commonUI_____png_1704344224;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowViewerAreaItem_SmoothBitmapImage3_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.bottom = 0;
            _local1.source = this._embed_mxml_source_commonUI______png_298371472;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindowViewerAreaItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.width = 22;
            _local1.text = "222";
            _local1.x = 7;
            _local1.y = 59;
            _local1.setStyle("textAlign", "center");
            _local1.id = "numberLabel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.numberLabel = _local1;
            BindingManager.executeBindings(this, "numberLabel", this.numberLabel);
            return (_local1);
        }
        private function _RoomWindowViewerAreaItem_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.text = "打发是打发打";
            _local1.x = 72;
            _local1.y = 23;
            _local1.id = "nameLabel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.nameLabel = _local1;
            BindingManager.executeBindings(this, "nameLabel", this.nameLabel);
            return (_local1);
        }
        private function _RoomWindowViewerAreaItem_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.text = "等级：333 ";
            _local1.x = 71;
            _local1.y = 51;
            _local1.id = "levelLabel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.levelLabel = _local1;
            BindingManager.executeBindings(this, "levelLabel", this.levelLabel);
            return (_local1);
        }
        public function ___RoomWindowViewerAreaItem_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _RoomWindowViewerAreaItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("removedEffect", _arg1);
            }, "this.removedEffect", "removeEffect");
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
        public function get headImg():MyImage{
            return (this._795280835headImg);
        }
        public function set headImg(_arg1:MyImage):void{
            var _local2:Object = this._795280835headImg;
            if (_local2 !== _arg1){
                this._795280835headImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headImg", _local2, _arg1));
                };
            };
        }
        public function get levelLabel():Label{
            return (this._188974544levelLabel);
        }
        public function set levelLabel(_arg1:Label):void{
            var _local2:Object = this._188974544levelLabel;
            if (_local2 !== _arg1){
                this._188974544levelLabel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelLabel", _local2, _arg1));
                };
            };
        }
        public function get nameLabel():Label{
            return (this._1215755049nameLabel);
        }
        public function set nameLabel(_arg1:Label):void{
            var _local2:Object = this._1215755049nameLabel;
            if (_local2 !== _arg1){
                this._1215755049nameLabel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameLabel", _local2, _arg1));
                };
            };
        }
        public function get numberLabel():Label{
            return (this._719739179numberLabel);
        }
        public function set numberLabel(_arg1:Label):void{
            var _local2:Object = this._719739179numberLabel;
            if (_local2 !== _arg1){
                this._719739179numberLabel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numberLabel", _local2, _arg1));
                };
            };
        }
        public function get removeEffect():Fade{
            return (this._1267520715removeEffect);
        }
        public function set removeEffect(_arg1:Fade):void{
            var _local2:Object = this._1267520715removeEffect;
            if (_local2 !== _arg1){
                this._1267520715removeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "removeEffect", _local2, _arg1));
                };
            };
        }
        public function get viewerInfoBg():SmoothBitmapImage{
            return (this._140131771viewerInfoBg);
        }
        public function set viewerInfoBg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._140131771viewerInfoBg;
            if (_local2 !== _arg1){
                this._140131771viewerInfoBg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewerInfoBg", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 
