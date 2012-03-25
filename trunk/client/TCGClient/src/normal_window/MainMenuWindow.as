//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
//    import mx.effects.*;
	import mx.effects.Parallel;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import source_manager.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import task_guide.*;
    import SoundSystem.*;
    import flash.utils.*;
    import task.*;
    import combat_element_script.*;
    import beginner_guide.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import achievement_system.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class MainMenuWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _MainMenuWindow_Fade1:Fade;
        public var _MainMenuWindow_Move1:Move;
        public var _MainMenuWindow_Parallel2:Parallel;
        public var _MainMenuWindow_Parallel3:Parallel;
        public var _MainMenuWindow_Parallel4:Parallel;
        public var _MainMenuWindow_Parallel5:Parallel;
        public var _MainMenuWindow_Parallel6:Parallel;
        public var _MainMenuWindow_Parallel7:Parallel;
        private var _413245038addEffect:Parallel;
        private var _93647166bgImg:SmoothBitmapImage;
        private var _3079825desc:Label;
        private var _1654810245itemGroup1:MainMenuWindowItem;
        private var _1654810246itemGroup2:MainMenuWindowItem;
        private var _1654810247itemGroup3:MainMenuWindowItem;
        private var _1654810248itemGroup4:MainMenuWindowItem;
        private var _1654810249itemGroup5:MainMenuWindowItem;
        private var _1654810250itemGroup6:MainMenuWindowShopAuctionItem;
        private var _1935899649playerInfoWindow:MainMenuWindowPlayerInfo;
        private var _1267520715removeEffect:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml_source_backgroundImages______png_432151424:Class;
        private var _embed_mxml_source_backgroundImages________jpg_1093844900:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function MainMenuWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_backgroundImages______png_432151424 = MainMenuWindow__embed_mxml_source_backgroundImages______png_432151424;
            this._embed_mxml_source_backgroundImages________jpg_1093844900 = MainMenuWindow__embed_mxml_source_backgroundImages________jpg_1093844900;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._MainMenuWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_MainMenuWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (MainMenuWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.layout = this._MainMenuWindow_BasicLayout1_c();
            this.mxmlContent = [this._MainMenuWindow_SmoothBitmapImage1_i(), this._MainMenuWindow_SmoothBitmapImage2_c(), this._MainMenuWindow_SmoothBitmapImage3_c(), this._MainMenuWindow_MainMenuWindowPlayerInfo1_i(), this._MainMenuWindow_MainMenuWindowItem1_i(), this._MainMenuWindow_MainMenuWindowItem2_i(), this._MainMenuWindow_MainMenuWindowItem3_i(), this._MainMenuWindow_MainMenuWindowItem4_i(), this._MainMenuWindow_MainMenuWindowItem5_i(), this._MainMenuWindow_MainMenuWindowShopAuctionItem1_i(), this._MainMenuWindow_Label1_i()];
            this._MainMenuWindow_Parallel1_i();
            this._MainMenuWindow_Fade8_i();
            this.addEventListener("initialize", this.___MainMenuWindow_Group1_initialize);
            this.addEventListener("creationComplete", this.___MainMenuWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            MainMenuWindow._watcherSetupUtil = _arg1;
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
        private function reset():void{
            alpha = 1;
            mouseChildren = false;
            this.playerInfoWindow.y = -275;
            this.bgImg.alpha = 0;
            this.playerInfoWindow.clearUserInfo();
            this.desc.text = "";
            var _local1 = 1;
            while (_local1 <= 6) {
                (this[("itemGroup" + _local1)] as MainMenuWindowItem).visible = false;
                (this[("itemGroup" + _local1)] as MainMenuWindowItem).newSignFlag = false;
                _local1++;
            };
        }
        private function addEffectEndHandler():void{
            var _local1:int;
            var _local4:String;
            var _local6:int;
            var _local8:int;
            BasicOperationBar.getInstance().registerLeaveFunc(this.clickLeaveBtn);
            mouseChildren = true;
            var _local2:Object = UserObject.campaignOpenInfo["unlock"];
            var _local3:Object = UserObject.campaignCompleteInfo;
            _local1 = 0;
            for each (_local4 in _local2) {
                if (!_local3[_local4]){
                    _local1++;
                };
            };
            if (_local1 > 0){
                this.itemGroup1.toolTip = (("未完成的战役：" + _local1) + "场");
                this.itemGroup1.newSignFlag = true;
            } else {
                this.itemGroup1.toolTip = null;
            };
            var _local5:Object = UserObject.trainRecord;
            _local1 = 0;
            for each (_local6 in [1, 2, 3, 5, 6, 7]) {
                if (!_local5[_local6.toString()]){
                    _local1++;
                };
            };
            if (_local1 > 0){
                this.itemGroup2.toolTip = (("未参与的训练：" + _local1) + "场");
                this.itemGroup2.newSignFlag = true;
            } else {
                this.itemGroup2.toolTip = null;
            };
            var _local7:Object = UserObject.newCardsInfo;
            _local1 = 0;
            for each (_local8 in _local7) {
                if (_local8){
                    _local1++;
                };
            };
            if (_local1 > 0){
                this.itemGroup5.toolTip = (("新卡片：" + _local1) + "张");
                this.itemGroup5.newSignFlag = true;
            } else {
                this.itemGroup5.toolTip = null;
            };
            BeginnerGuideUtil.dispatchLuaEvent("mainMenuWindowAdd");
        }
        private function clickLeaveBtn():void{
            var desc:* = null;
            if (parent){
                var func:* = function (_arg1:Array):Boolean{
                    if (_arg1[0]){
                        TCGClient.getInstance().logout();
                        BasicOperationBar.getInstance().clearLeaveFunc(clickLeaveBtn);
                    };
                    return (true);
                };
                desc = TaskMgr.getInstance().getUnfinishedTaskDesc();
                MessageBox.showMessageBox(MessageBox.SELECT, "提示：", ((desc) ? (desc + "<br>") : "" + "你确认要退出游戏吗？"), func);
            };
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.itemGroup1.cardImage = MainMenuWindowSourceMgr.getInstance().getSourceClass("campaign");
            this.itemGroup2.cardImage = MainMenuWindowSourceMgr.getInstance().getSourceClass("train");
            this.itemGroup3.cardImage = MainMenuWindowSourceMgr.getInstance().getSourceClass("combat");
            this.itemGroup4.cardImage = MainMenuWindowSourceMgr.getInstance().getSourceClass("achievement");
            this.itemGroup5.cardImage = MainMenuWindowSourceMgr.getInstance().getSourceClass("cardGroup");
            this.itemGroup6.cardImage = MainMenuWindowSourceMgr.getInstance().getSourceClass("shop");
        }
        protected function itemGroup1_clickHandler(_arg1:MouseEvent):void{
            GuideMapWindow.lastShowCurtain = -1;
            TCGClient.getInstance().showGuideMapWindow();
            BeginnerGuideUtil.dispatchLuaEvent("mainMenuEnterGuide");
        }
        private function _MainMenuWindow_Parallel1_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.startDelay = 500;
            _local1.children = [this._MainMenuWindow_Move1_i(), this._MainMenuWindow_Fade1_i(), this._MainMenuWindow_Parallel2_i(), this._MainMenuWindow_Parallel3_i(), this._MainMenuWindow_Parallel4_i(), this._MainMenuWindow_Parallel5_i(), this._MainMenuWindow_Parallel6_i(), this._MainMenuWindow_Parallel7_i()];
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _MainMenuWindow_Move1_i():spark.effects.Move{
            var _local1:Move = new Move();
            _local1.yFrom = -275;
            _local1.yTo = -7;
            _local1.duration = 500;
            _local1.addEventListener("effectStart", this.___MainMenuWindow_Move1_effectStart);
            this._MainMenuWindow_Move1 = _local1;
            BindingManager.executeBindings(this, "_MainMenuWindow_Move1", this._MainMenuWindow_Move1);
            return (_local1);
        }
        public function ___MainMenuWindow_Move1_effectStart(_arg1:EffectEvent):void{
            this.playerInfoWindow.setUserInfo();
        }
        private function _MainMenuWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 1;
            _local1.duration = 500;
            this._MainMenuWindow_Fade1 = _local1;
            BindingManager.executeBindings(this, "_MainMenuWindow_Fade1", this._MainMenuWindow_Fade1);
            return (_local1);
        }
        private function _MainMenuWindow_Parallel2_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.startDelay = 500;
            _local1.duration = 600;
            _local1.children = [this._MainMenuWindow_Scale1_c(), this._MainMenuWindow_Fade2_c(), this._MainMenuWindow_Move2_c()];
            this._MainMenuWindow_Parallel2 = _local1;
            BindingManager.executeBindings(this, "_MainMenuWindow_Parallel2", this._MainMenuWindow_Parallel2);
            return (_local1);
        }
        private function _MainMenuWindow_Scale1_c():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 3;
            _local1.scaleXTo = 1;
            _local1.scaleYFrom = 3;
            _local1.scaleYTo = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindow_Fade2_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectStart", this.___MainMenuWindow_Fade2_effectStart);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___MainMenuWindow_Fade2_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("draw");
        }
        private function _MainMenuWindow_Move2_c():Move{
            var _local1:Move = new Move();
            _local1.xFrom = 561;
            _local1.xTo = 175;
            _local1.duration = 600;
            _local1.yFrom = 1200;
            _local1.yTo = 323;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindow_Parallel3_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.startDelay = 600;
            _local1.duration = 600;
            _local1.children = [this._MainMenuWindow_Scale2_c(), this._MainMenuWindow_Fade3_c(), this._MainMenuWindow_Move3_c()];
            this._MainMenuWindow_Parallel3 = _local1;
            BindingManager.executeBindings(this, "_MainMenuWindow_Parallel3", this._MainMenuWindow_Parallel3);
            return (_local1);
        }
        private function _MainMenuWindow_Scale2_c():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 3;
            _local1.scaleXTo = 1;
            _local1.scaleYFrom = 3;
            _local1.scaleYTo = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindow_Fade3_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectStart", this.___MainMenuWindow_Fade3_effectStart);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___MainMenuWindow_Fade3_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("draw");
        }
        private function _MainMenuWindow_Move3_c():Move{
            var _local1:Move = new Move();
            _local1.xFrom = 561;
            _local1.xTo = 332;
            _local1.duration = 600;
            _local1.yFrom = 1200;
            _local1.yTo = 323;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindow_Parallel4_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.startDelay = 700;
            _local1.duration = 600;
            _local1.children = [this._MainMenuWindow_Scale3_c(), this._MainMenuWindow_Fade4_c(), this._MainMenuWindow_Move4_c()];
            this._MainMenuWindow_Parallel4 = _local1;
            BindingManager.executeBindings(this, "_MainMenuWindow_Parallel4", this._MainMenuWindow_Parallel4);
            return (_local1);
        }
        private function _MainMenuWindow_Scale3_c():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 3;
            _local1.scaleXTo = 1;
            _local1.scaleYFrom = 3;
            _local1.scaleYTo = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindow_Fade4_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectStart", this.___MainMenuWindow_Fade4_effectStart);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___MainMenuWindow_Fade4_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("draw");
        }
        private function _MainMenuWindow_Move4_c():Move{
            var _local1:Move = new Move();
            _local1.xFrom = 561;
            _local1.xTo = 489;
            _local1.duration = 600;
            _local1.yFrom = 1200;
            _local1.yTo = 323;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindow_Parallel5_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.startDelay = 800;
            _local1.duration = 600;
            _local1.children = [this._MainMenuWindow_Scale4_c(), this._MainMenuWindow_Fade5_c(), this._MainMenuWindow_Move5_c()];
            this._MainMenuWindow_Parallel5 = _local1;
            BindingManager.executeBindings(this, "_MainMenuWindow_Parallel5", this._MainMenuWindow_Parallel5);
            return (_local1);
        }
        private function _MainMenuWindow_Scale4_c():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 3;
            _local1.scaleXTo = 1;
            _local1.scaleYFrom = 3;
            _local1.scaleYTo = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindow_Fade5_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectStart", this.___MainMenuWindow_Fade5_effectStart);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___MainMenuWindow_Fade5_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("draw");
        }
        private function _MainMenuWindow_Move5_c():Move{
            var _local1:Move = new Move();
            _local1.xFrom = 561;
            _local1.xTo = 646;
            _local1.duration = 600;
            _local1.yFrom = 1200;
            _local1.yTo = 323;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindow_Parallel6_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.startDelay = 900;
            _local1.duration = 600;
            _local1.children = [this._MainMenuWindow_Scale5_c(), this._MainMenuWindow_Fade6_c(), this._MainMenuWindow_Move6_c()];
            this._MainMenuWindow_Parallel6 = _local1;
            BindingManager.executeBindings(this, "_MainMenuWindow_Parallel6", this._MainMenuWindow_Parallel6);
            return (_local1);
        }
        private function _MainMenuWindow_Scale5_c():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 3;
            _local1.scaleXTo = 1;
            _local1.scaleYFrom = 3;
            _local1.scaleYTo = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindow_Fade6_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectStart", this.___MainMenuWindow_Fade6_effectStart);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___MainMenuWindow_Fade6_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("draw");
        }
        private function _MainMenuWindow_Move6_c():Move{
            var _local1:Move = new Move();
            _local1.xFrom = 561;
            _local1.xTo = 803;
            _local1.duration = 600;
            _local1.yFrom = 1200;
            _local1.yTo = 323;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindow_Parallel7_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.startDelay = 1000;
            _local1.duration = 600;
            _local1.children = [this._MainMenuWindow_Scale6_c(), this._MainMenuWindow_Fade7_c(), this._MainMenuWindow_Move7_c()];
            this._MainMenuWindow_Parallel7 = _local1;
            BindingManager.executeBindings(this, "_MainMenuWindow_Parallel7", this._MainMenuWindow_Parallel7);
            return (_local1);
        }
        private function _MainMenuWindow_Scale6_c():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 3;
            _local1.scaleXTo = 1;
            _local1.scaleYFrom = 3;
            _local1.scaleYTo = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindow_Fade7_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectStart", this.___MainMenuWindow_Fade7_effectStart);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___MainMenuWindow_Fade7_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("draw");
        }
        private function _MainMenuWindow_Move7_c():Move{
            var _local1:Move = new Move();
            _local1.xFrom = 561;
            _local1.xTo = 960;
            _local1.duration = 600;
            _local1.yFrom = 1200;
            _local1.yTo = 323;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.addEffectEndHandler();
        }
        private function _MainMenuWindow_Fade8_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 0;
            _local1.addEventListener("effectStart", this.__removeEffect_effectStart);
            _local1.addEventListener("effectEnd", this.__removeEffect_effectEnd);
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        public function __removeEffect_effectStart(_arg1:EffectEvent):void{
            mouseChildren = false;
        }
        public function __removeEffect_effectEnd(_arg1:EffectEvent):void{
            this.reset();
        }
        private function _MainMenuWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindow_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_backgroundImages________jpg_1093844900;
            _local1.initialized(this, "bgImg");
            this.bgImg = _local1;
            BindingManager.executeBindings(this, "bgImg", this.bgImg);
            return (_local1);
        }
        private function _MainMenuWindow_SmoothBitmapImage2_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.horizontalCenter = 0;
            _local1.source = this._embed_mxml_source_backgroundImages______png_432151424;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindow_SmoothBitmapImage3_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.horizontalCenter = 0;
            _local1.rotation = 180;
            _local1.bottom = 0;
            _local1.source = this._embed_mxml_source_backgroundImages______png_432151424;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MainMenuWindow_MainMenuWindowPlayerInfo1_i():MainMenuWindowPlayerInfo{
            var _local1:MainMenuWindowPlayerInfo = new MainMenuWindowPlayerInfo();
            _local1.horizontalCenter = 0;
            _local1.y = -275;
            _local1.id = "playerInfoWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerInfoWindow = _local1;
            BindingManager.executeBindings(this, "playerInfoWindow", this.playerInfoWindow);
            return (_local1);
        }
        private function _MainMenuWindow_MainMenuWindowItem1_i():MainMenuWindowItem{
            var _local1:MainMenuWindowItem = new MainMenuWindowItem();
            _local1.x = 175;
            _local1.y = 323;
            _local1.cardText = "战役";
            _local1.addEventListener("click", this.__itemGroup1_click);
            _local1.addEventListener("rollOver", this.__itemGroup1_rollOver);
            _local1.addEventListener("rollOut", this.__itemGroup1_rollOut);
            _local1.id = "itemGroup1";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup1 = _local1;
            BindingManager.executeBindings(this, "itemGroup1", this.itemGroup1);
            return (_local1);
        }
        public function __itemGroup1_click(_arg1:MouseEvent):void{
            this.itemGroup1_clickHandler(_arg1);
        }
        public function __itemGroup1_rollOver(_arg1:MouseEvent):void{
            this.desc.text = "参与经典战役，了解规则，体验战术";
        }
        public function __itemGroup1_rollOut(_arg1:MouseEvent):void{
            this.desc.text = "";
        }
        private function _MainMenuWindow_MainMenuWindowItem2_i():MainMenuWindowItem{
            var _local1:MainMenuWindowItem = new MainMenuWindowItem();
            _local1.x = 332;
            _local1.y = 323;
            _local1.cardText = "训练";
            _local1.addEventListener("click", this.__itemGroup2_click);
            _local1.addEventListener("rollOver", this.__itemGroup2_rollOver);
            _local1.addEventListener("rollOut", this.__itemGroup2_rollOut);
            _local1.id = "itemGroup2";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup2 = _local1;
            BindingManager.executeBindings(this, "itemGroup2", this.itemGroup2);
            return (_local1);
        }
        public function __itemGroup2_click(_arg1:MouseEvent):void{
            TCGClient.getInstance().enterTrainListWindow();
        }
        public function __itemGroup2_rollOver(_arg1:MouseEvent):void{
            this.desc.text = "小心！有 NPC 出没！";
        }
        public function __itemGroup2_rollOut(_arg1:MouseEvent):void{
            this.desc.text = "";
        }
        private function _MainMenuWindow_MainMenuWindowItem3_i():MainMenuWindowItem{
            var _local1:MainMenuWindowItem = new MainMenuWindowItem();
            _local1.x = 489;
            _local1.y = 323;
            _local1.cardText = "对战";
            _local1.addEventListener("click", this.__itemGroup3_click);
            _local1.addEventListener("rollOver", this.__itemGroup3_rollOver);
            _local1.addEventListener("rollOut", this.__itemGroup3_rollOut);
            _local1.id = "itemGroup3";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup3 = _local1;
            BindingManager.executeBindings(this, "itemGroup3", this.itemGroup3);
            return (_local1);
        }
        public function __itemGroup3_click(_arg1:MouseEvent):void{
            LuaAgent.getInstance().run("u.hall_room_mgr:enter_hall()");
        }
        public function __itemGroup3_rollOver(_arg1:MouseEvent):void{
            this.desc.text = "挑战其他玩家，展示自己的个性化战术";
        }
        public function __itemGroup3_rollOut(_arg1:MouseEvent):void{
            this.desc.text = "";
        }
        private function _MainMenuWindow_MainMenuWindowItem4_i():MainMenuWindowItem{
            var _local1:MainMenuWindowItem = new MainMenuWindowItem();
            _local1.x = 646;
            _local1.y = 323;
            _local1.cardText = "竞赛";
            _local1.addEventListener("rollOver", this.__itemGroup4_rollOver);
            _local1.addEventListener("rollOut", this.__itemGroup4_rollOut);
            _local1.id = "itemGroup4";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup4 = _local1;
            BindingManager.executeBindings(this, "itemGroup4", this.itemGroup4);
            return (_local1);
        }
        public function __itemGroup4_rollOver(_arg1:MouseEvent):void{
            this.desc.text = "功能暂未开放";
        }
        public function __itemGroup4_rollOut(_arg1:MouseEvent):void{
            this.desc.text = "";
        }
        private function _MainMenuWindow_MainMenuWindowItem5_i():MainMenuWindowItem{
            var _local1:MainMenuWindowItem = new MainMenuWindowItem();
            _local1.x = 803;
            _local1.y = 323;
            _local1.cardText = "卡组";
            _local1.addEventListener("click", this.__itemGroup5_click);
            _local1.addEventListener("rollOver", this.__itemGroup5_rollOver);
            _local1.addEventListener("rollOut", this.__itemGroup5_rollOut);
            _local1.id = "itemGroup5";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup5 = _local1;
            BindingManager.executeBindings(this, "itemGroup5", this.itemGroup5);
            return (_local1);
        }
        public function __itemGroup5_click(_arg1:MouseEvent):void{
            TCGClient.getInstance().enterJudgeCardsWindow("mainMenu");
            BeginnerGuideUtil.dispatchLuaEvent("mainMenuEnterJudge");
        }
        public function __itemGroup5_rollOver(_arg1:MouseEvent):void{
            this.desc.text = "卡组需要强力的卡片，更需要创意和灵感";
        }
        public function __itemGroup5_rollOut(_arg1:MouseEvent):void{
            this.desc.text = "";
        }
        private function _MainMenuWindow_MainMenuWindowShopAuctionItem1_i():MainMenuWindowShopAuctionItem{
            var _local1:MainMenuWindowShopAuctionItem = new MainMenuWindowShopAuctionItem();
            _local1.x = 960;
            _local1.y = 323;
            _local1.cardText = "商店";
            _local1.addEventListener("rollOver", this.__itemGroup6_rollOver);
            _local1.addEventListener("rollOut", this.__itemGroup6_rollOut);
            _local1.id = "itemGroup6";
            if (!_local1.document){
                _local1.document = this;
            };
            this.itemGroup6 = _local1;
            BindingManager.executeBindings(this, "itemGroup6", this.itemGroup6);
            return (_local1);
        }
        public function __itemGroup6_rollOver(_arg1:MouseEvent):void{
            this.desc.text = "使用积分和金币购买生活必需品";
        }
        public function __itemGroup6_rollOut(_arg1:MouseEvent):void{
            this.desc.text = "";
        }
        private function _MainMenuWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.width = 540;
            _local1.height = 100;
            _local1.x = 370;
            _local1.y = 630;
            _local1.filters = [this._MainMenuWindow_GlowFilter1_c()];
            _local1.setStyle("fontSize", 28);
            _local1.setStyle("color", 0xFFFFFF);
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "desc";
            if (!_local1.document){
                _local1.document = this;
            };
            this.desc = _local1;
            BindingManager.executeBindings(this, "desc", this.desc);
            return (_local1);
        }
        private function _MainMenuWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___MainMenuWindow_Group1_initialize(_arg1:FlexEvent):void{
            this.reset();
        }
        public function ___MainMenuWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _MainMenuWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("removedEffect", _arg1);
            }, "this.removedEffect", "removeEffect");
            result[2] = new Binding(this, null, null, "_MainMenuWindow_Move1.target", "playerInfoWindow");
            result[3] = new Binding(this, null, null, "_MainMenuWindow_Fade1.target", "bgImg");
            result[4] = new Binding(this, null, null, "_MainMenuWindow_Parallel2.target", "itemGroup1");
            result[5] = new Binding(this, null, null, "_MainMenuWindow_Parallel3.target", "itemGroup2");
            result[6] = new Binding(this, null, null, "_MainMenuWindow_Parallel4.target", "itemGroup3");
            result[7] = new Binding(this, null, null, "_MainMenuWindow_Parallel5.target", "itemGroup4");
            result[8] = new Binding(this, null, null, "_MainMenuWindow_Parallel6.target", "itemGroup5");
            result[9] = new Binding(this, null, null, "_MainMenuWindow_Parallel7.target", "itemGroup6");
            return (result);
        }
        public function get addEffect():Parallel{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Parallel):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }
        public function get bgImg():SmoothBitmapImage{
            return (this._93647166bgImg);
        }
        public function set bgImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._93647166bgImg;
            if (_local2 !== _arg1){
                this._93647166bgImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgImg", _local2, _arg1));
                };
            };
        }
        public function get desc():Label{
            return (this._3079825desc);
        }
        public function set desc(_arg1:Label):void{
            var _local2:Object = this._3079825desc;
            if (_local2 !== _arg1){
                this._3079825desc = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "desc", _local2, _arg1));
                };
            };
        }
        public function get itemGroup1():MainMenuWindowItem{
            return (this._1654810245itemGroup1);
        }
        public function set itemGroup1(_arg1:MainMenuWindowItem):void{
            var _local2:Object = this._1654810245itemGroup1;
            if (_local2 !== _arg1){
                this._1654810245itemGroup1 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemGroup1", _local2, _arg1));
                };
            };
        }
        public function get itemGroup2():MainMenuWindowItem{
            return (this._1654810246itemGroup2);
        }
        public function set itemGroup2(_arg1:MainMenuWindowItem):void{
            var _local2:Object = this._1654810246itemGroup2;
            if (_local2 !== _arg1){
                this._1654810246itemGroup2 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemGroup2", _local2, _arg1));
                };
            };
        }
        public function get itemGroup3():MainMenuWindowItem{
            return (this._1654810247itemGroup3);
        }
        public function set itemGroup3(_arg1:MainMenuWindowItem):void{
            var _local2:Object = this._1654810247itemGroup3;
            if (_local2 !== _arg1){
                this._1654810247itemGroup3 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemGroup3", _local2, _arg1));
                };
            };
        }
        public function get itemGroup4():MainMenuWindowItem{
            return (this._1654810248itemGroup4);
        }
        public function set itemGroup4(_arg1:MainMenuWindowItem):void{
            var _local2:Object = this._1654810248itemGroup4;
            if (_local2 !== _arg1){
                this._1654810248itemGroup4 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemGroup4", _local2, _arg1));
                };
            };
        }
        public function get itemGroup5():MainMenuWindowItem{
            return (this._1654810249itemGroup5);
        }
        public function set itemGroup5(_arg1:MainMenuWindowItem):void{
            var _local2:Object = this._1654810249itemGroup5;
            if (_local2 !== _arg1){
                this._1654810249itemGroup5 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemGroup5", _local2, _arg1));
                };
            };
        }
        public function get itemGroup6():MainMenuWindowShopAuctionItem{
            return (this._1654810250itemGroup6);
        }
        public function set itemGroup6(_arg1:MainMenuWindowShopAuctionItem):void{
            var _local2:Object = this._1654810250itemGroup6;
            if (_local2 !== _arg1){
                this._1654810250itemGroup6 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemGroup6", _local2, _arg1));
                };
            };
        }
        public function get playerInfoWindow():MainMenuWindowPlayerInfo{
            return (this._1935899649playerInfoWindow);
        }
        public function set playerInfoWindow(_arg1:MainMenuWindowPlayerInfo):void{
            var _local2:Object = this._1935899649playerInfoWindow;
            if (_local2 !== _arg1){
                this._1935899649playerInfoWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerInfoWindow", _local2, _arg1));
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

    }
}//package normal_window 
