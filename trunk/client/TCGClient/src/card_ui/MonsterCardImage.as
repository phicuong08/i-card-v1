//Created by Action Script Viewer - http://www.buraks.com/asv
package card_ui {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    
    import spark.components.*;
    import mx.binding.*;
	import mx.effects.Parallel;
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import __AS3__.vec.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import custom_effect.*;
    import flash.utils.*;
    import spark.effects.animation.*;
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
    public class MonsterCardImage extends Group implements IBindingClient {

        public static const CREATION_COMPLETE:String = "creation_complete";
		public var __slot1;
        public static var darkGoldCls:Class = MonsterCardImage_darkGoldCls;
        public static var goldCls:Class = MonsterCardImage_goldCls;
        public static var silverCls:Class = MonsterCardImage_silverCls;
        public static var gold:Class = MonsterCardImage_gold;
        public static var silver:Class = MonsterCardImage_silver;
        public static var dongzhuo:Class = MonsterCardImage_dongzhuo;
        public static var han:Class = MonsterCardImage_han;
        public static var lvbu:Class = MonsterCardImage_lvbu;
        public static var yuanshao:Class = MonsterCardImage_yuanshao;
        public static var caowei:Class = MonsterCardImage_caowei;
        public static var shuhan:Class = MonsterCardImage_shuhan;
        public static var sunwu:Class = MonsterCardImage_sunwu;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _422349746agnameChangeEffect:Parallel;
        private var _1893624907backgroundImg:SmoothBitmapImage;
        private var _122937057cardAgname:Label;
        private var _1526981222cardCountry:CardCountrySign;
        private var _8429125cardName:Label;
        private var _8262270cardStar:CardStarSign;
        private var _8227222cardType:CardTypeSign;
        private var _2135733693countryBgDown:SmoothBitmapImage;
        private var _1477105034countryBgUp:SmoothBitmapImage;
        private var _795280835headImg:MyImage;
        private var _414797072intChangeEffect:AnimateFilter;
        private var _1957224765intInfo:RollNumGroup;
        private var _981596097rareImg:SmoothBitmapImage;
        private var _670726606strChangeEffect:AnimateFilter;
        private var _1882712449strInfo:RollNumGroup;
        private var __moduleFactoryInitialized:Boolean = false;
        protected var cardInfo:Object;
        public var creationHasComplete:Boolean = false;
        private var _embed_mxml_source_cardUI_str_int_zhili_png_1660085053:Class;
        private var _embed_mxml_source_cardUI_str_int_wuli_png_2079155649:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function MonsterCardImage(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_cardUI_str_int_zhili_png_1660085053 = MonsterCardImage__embed_mxml_source_cardUI_str_int_zhili_png_1660085053;
            this._embed_mxml_source_cardUI_str_int_wuli_png_2079155649 = MonsterCardImage__embed_mxml_source_cardUI_str_int_wuli_png_2079155649;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._MonsterCardImage_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_card_ui_MonsterCardImageWatcherSetupUtil");
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
            this.width = 84;
            this.height = 112;
            this.clipAndEnableScrolling = true;
            this.layout = this._MonsterCardImage_BasicLayout1_c();
            this.mxmlContent = [this._MonsterCardImage_MyImage1_i(), this._MonsterCardImage_SmoothBitmapImage1_i(), this._MonsterCardImage_Label1_i(), this._MonsterCardImage_SmoothBitmapImage2_i(), this._MonsterCardImage_SmoothBitmapImage3_i(), this._MonsterCardImage_SmoothBitmapImage4_i(), this._MonsterCardImage_CardCountrySign1_i(), this._MonsterCardImage_CardTypeSign1_i(), this._MonsterCardImage_CardStarSign1_i(), this._MonsterCardImage_Label2_i(), this._MonsterCardImage_SmoothBitmapImage5_c(), this._MonsterCardImage_SmoothBitmapImage6_c(), this._MonsterCardImage_RollNumGroup1_i(), this._MonsterCardImage_RollNumGroup2_i()];
            this._MonsterCardImage_Parallel1_i();
            this._MonsterCardImage_AnimateFilter2_i();
            this._MonsterCardImage_AnimateFilter1_i();
            this.addEventListener("creationComplete", this.___MonsterCardImage_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            MonsterCardImage._watcherSetupUtil = _arg1;
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
                this.fontSize = 10;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.buildCardInfo();
        }
        public function setCardInfo(_arg1:Object):void{
            this.cardInfo = CommonUtil.cloneObject(_arg1);
            this.buildCardInfo();
        }
        protected function buildCardInfo():void{
            if (((this.creationHasComplete) && (this.cardInfo))){
                this.cardCountry.country = this.cardInfo["country"];
                this.cardType.cardType = this.cardInfo["type"];
                this.cardStar.starNum = int(this.cardInfo["star"]);
                this.cardName.text = this.cardInfo["name"];
                this.setCardAgname(this.cardInfo["agname"]);
                this.setAttribInfo(int(this.cardInfo["str"]), int(this.cardInfo["int"]), false);
                this.backgroundImg.source = MonsterCardImage[this.cardInfo["color"]];
                this.headImg.source = (("source/cardImages/" + this.cardInfo["image"]) + ".jpg");
                this.setCountryBackgroundImg();
                this.setRareImg(int(this.cardInfo["rare_level"]));
            };
        }
        public function setAttribInfo(_arg1:int, _arg2:int, _arg3:Boolean=true):void{
            if (this.strInfo.getNum() != _arg1){
                this.strInfo.setNum(_arg1, _arg3);
                if (_arg3){
                    this.strChangeEffect.play();
                };
            };
            this.strInfo.setStyle("color", this.getAttribColor(int(this.cardInfo["str"]), _arg1));
            if (this.intInfo.getNum() != _arg2){
                this.intInfo.setNum(_arg2, _arg3);
                if (_arg3){
                    this.intChangeEffect.play();
                };
            };
            this.intInfo.setStyle("color", this.getAttribColor(int(this.cardInfo["int"]), _arg2));
        }
        protected function getAttribColor(_arg1:int, _arg2:int):uint{
            if (_arg2 > _arg1){
                return (639232);
            };
            if (_arg2 < _arg1){
                return (0xFF0000);
            };
            return (0);
        }
        protected function setCountryBackgroundImg():void{
            var _local1:String = this.cardInfo["country"];
            this.countryBgUp.source = MonsterCardImage[_local1];
            this.countryBgDown.source = MonsterCardImage[_local1];
        }
        protected function setCardAgname(_arg1:String):void{
            var _local2:Array = _arg1.split("");
            this.cardAgname.text = _local2.join("\n");
        }
        public function showAgnameChangeEffect(_arg1:String):void{
            var f:* = null;
            var t:* = null;
            var timerHandler:* = null;
            var newAgName:* = _arg1;
            var showNewAgName:* = function ():void{
                cardInfo["agname"] = newAgName;
                setCardAgname(newAgName);
                if (cardInfo["agname"] != ""){
                    agnameChangeEffect.play();
                };
            };
            if (this.cardInfo["agname"] != ""){
                timerHandler = function (_arg1:TimerEvent):void{
                    t.removeEventListener(TimerEvent.TIMER, timerHandler);
                    t.stop();
                    showNewAgName();
                };
                this.cardAgname.visible = false;
                f = new InkEffect(this.cardAgname, 700);
                f.play();
                t = new Timer(600, 1);
                t.addEventListener(TimerEvent.TIMER, timerHandler);
                t.start();
            } else {
                showNewAgName();
            };
        }
        public function showStarChangeEffect(_arg1:int):void{
            this.cardInfo["star"] = _arg1;
            this.cardStar.doStartChangeEffect(_arg1);
        }
        private function setRareImg(_arg1:int):void{
            switch (_arg1){
                case 0:
                case 1:
                    this.rareImg.source = null;
                    break;
                case 2:
                    this.rareImg.source = silverCls;
                    break;
                case 3:
                    this.rareImg.source = goldCls;
                    break;
                default:
                    this.rareImg.source = darkGoldCls;
            };
        }
        private function _MonsterCardImage_Parallel1_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.children = [this._MonsterCardImage_Fade1_c(), this._MonsterCardImage_AnimateFilter3_c()];
            this.agnameChangeEffect = _local1;
            BindingManager.executeBindings(this, "agnameChangeEffect", this.agnameChangeEffect);
            return (_local1);
        }
        private function _MonsterCardImage_Fade1_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_AnimateFilter3_c():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 1000;
            _local1.bitmapFilter = this._MonsterCardImage_GlowFilter3_c();
            new Vector.<MotionPath>(3)[0] = this._MonsterCardImage_SimpleMotionPath7_c();
            new Vector.<MotionPath>(3)[1] = this._MonsterCardImage_SimpleMotionPath8_c();
            new Vector.<MotionPath>(3)[2] = this._MonsterCardImage_SimpleMotionPath9_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_GlowFilter3_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            _local1.strength = 2;
            _local1.quality = 3;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_SimpleMotionPath7_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 1;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_SimpleMotionPath8_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 80;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_SimpleMotionPath9_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 80;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_AnimateFilter2_i():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 1000;
            _local1.bitmapFilter = this._MonsterCardImage_GlowFilter2_c();
            new Vector.<MotionPath>(3)[0] = this._MonsterCardImage_SimpleMotionPath4_c();
            new Vector.<MotionPath>(3)[1] = this._MonsterCardImage_SimpleMotionPath5_c();
            new Vector.<MotionPath>(3)[2] = this._MonsterCardImage_SimpleMotionPath6_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            this.intChangeEffect = _local1;
            BindingManager.executeBindings(this, "intChangeEffect", this.intChangeEffect);
            return (_local1);
        }
        private function _MonsterCardImage_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFF;
            _local1.strength = 2;
            _local1.quality = 3;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_SimpleMotionPath4_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 1;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_SimpleMotionPath5_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 80;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_SimpleMotionPath6_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 80;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_AnimateFilter1_i():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 1000;
            _local1.bitmapFilter = this._MonsterCardImage_GlowFilter1_c();
            new Vector.<MotionPath>(3)[0] = this._MonsterCardImage_SimpleMotionPath1_c();
            new Vector.<MotionPath>(3)[1] = this._MonsterCardImage_SimpleMotionPath2_c();
            new Vector.<MotionPath>(3)[2] = this._MonsterCardImage_SimpleMotionPath3_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            this.strChangeEffect = _local1;
            BindingManager.executeBindings(this, "strChangeEffect", this.strChangeEffect);
            return (_local1);
        }
        private function _MonsterCardImage_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFF;
            _local1.strength = 2;
            _local1.quality = 3;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_SimpleMotionPath1_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 1;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_SimpleMotionPath2_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 80;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_SimpleMotionPath3_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 80;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 6;
            _local1.y = 6;
            _local1.width = 72;
            _local1.height = 72;
            _local1.smoothBitmapContent = true;
            _local1.id = "headImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.headImg = _local1;
            BindingManager.executeBindings(this, "headImg", this.headImg);
            return (_local1);
        }
        private function _MonsterCardImage_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.width = 84;
            _local1.height = 112;
            _local1.initialized(this, "backgroundImg");
            this.backgroundImg = _local1;
            BindingManager.executeBindings(this, "backgroundImg", this.backgroundImg);
            return (_local1);
        }
        private function _MonsterCardImage_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 62;
            _local1.y = 8;
            _local1.width = 19;
            _local1.height = 74;
            _local1.filters = [this._MonsterCardImage_GlowFilter4_c()];
            _local1.setStyle("lineHeight", 9);
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("color", 0xFFFFFF);
            _local1.setStyle("fontSize", 9);
            _local1.id = "cardAgname";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardAgname = _local1;
            BindingManager.executeBindings(this, "cardAgname", this.cardAgname);
            return (_local1);
        }
        private function _MonsterCardImage_GlowFilter4_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 5;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.horizontalCenter = 0;
            _local1.y = 4;
            _local1.width = 74;
            _local1.height = 14;
            _local1.initialized(this, "countryBgUp");
            this.countryBgUp = _local1;
            BindingManager.executeBindings(this, "countryBgUp", this.countryBgUp);
            return (_local1);
        }
        private function _MonsterCardImage_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.horizontalCenter = 0;
            _local1.y = 69;
            _local1.width = 74;
            _local1.height = 19;
            _local1.initialized(this, "countryBgDown");
            this.countryBgDown = _local1;
            BindingManager.executeBindings(this, "countryBgDown", this.countryBgDown);
            return (_local1);
        }
        private function _MonsterCardImage_SmoothBitmapImage4_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.y = 71;
            _local1.x = 6;
            _local1.width = 72;
            _local1.height = 14;
            _local1.initialized(this, "rareImg");
            this.rareImg = _local1;
            BindingManager.executeBindings(this, "rareImg", this.rareImg);
            return (_local1);
        }
        private function _MonsterCardImage_CardCountrySign1_i():CardCountrySign{
            var _local1:CardCountrySign = new CardCountrySign();
            _local1.x = 3;
            _local1.y = 3;
            _local1.width = 20;
            _local1.height = 25;
            _local1.initialized(this, "cardCountry");
            this.cardCountry = _local1;
            BindingManager.executeBindings(this, "cardCountry", this.cardCountry);
            return (_local1);
        }
        private function _MonsterCardImage_CardTypeSign1_i():CardTypeSign{
            var _local1:CardTypeSign = new CardTypeSign();
            _local1.x = 59;
            _local1.y = -2;
            _local1.width = 23;
            _local1.height = 23;
            _local1.initialized(this, "cardType");
            this.cardType = _local1;
            BindingManager.executeBindings(this, "cardType", this.cardType);
            return (_local1);
        }
        private function _MonsterCardImage_CardStarSign1_i():CardStarSign{
            var _local1:CardStarSign = new CardStarSign();
            _local1.x = 22;
            _local1.y = 5;
            _local1.scaleX = 0.8;
            _local1.scaleY = 0.8;
            _local1.id = "cardStar";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardStar = _local1;
            BindingManager.executeBindings(this, "cardStar", this.cardStar);
            return (_local1);
        }
        private function _MonsterCardImage_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.horizontalCenter = 0;
            _local1.y = 69;
            _local1.width = 74;
            _local1.height = 19;
            _local1.filters = [this._MonsterCardImage_GlowFilter5_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("color", 0xFFFFFF);
            _local1.id = "cardName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardName = _local1;
            BindingManager.executeBindings(this, "cardName", this.cardName);
            return (_local1);
        }
        private function _MonsterCardImage_GlowFilter5_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 4;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_SmoothBitmapImage5_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 4;
            _local1.y = 84;
            _local1.width = 23;
            _local1.height = 23;
            _local1.source = this._embed_mxml_source_cardUI_str_int_wuli_png_2079155649;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_SmoothBitmapImage6_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 40;
            _local1.y = 84;
            _local1.width = 23;
            _local1.height = 23;
            _local1.source = this._embed_mxml_source_cardUI_str_int_zhili_png_1660085053;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _MonsterCardImage_RollNumGroup1_i():RollNumGroup{
            var _local1:RollNumGroup = new RollNumGroup();
            _local1.x = 32;
            _local1.y = 93;
            _local1.setStyle("fontSize", 12);
            _local1.setStyle("fontFamily", "Times New Roman");
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "strInfo";
            if (!_local1.document){
                _local1.document = this;
            };
            this.strInfo = _local1;
            BindingManager.executeBindings(this, "strInfo", this.strInfo);
            return (_local1);
        }
        private function _MonsterCardImage_RollNumGroup2_i():RollNumGroup{
            var _local1:RollNumGroup = new RollNumGroup();
            _local1.x = 68;
            _local1.y = 93;
            _local1.setStyle("fontSize", 12);
            _local1.setStyle("fontFamily", "Times New Roman");
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "intInfo";
            if (!_local1.document){
                _local1.document = this;
            };
            this.intInfo = _local1;
            BindingManager.executeBindings(this, "intInfo", this.intInfo);
            return (_local1);
        }
        public function ___MonsterCardImage_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _MonsterCardImage_bindingsSetup():Array{
            var _local1:Array = [];
            _local1[0] = new Binding(this, null, null, "strChangeEffect.target", "strInfo");
            _local1[1] = new Binding(this, null, null, "intChangeEffect.target", "intInfo");
            _local1[2] = new Binding(this, null, null, "agnameChangeEffect.target", "cardAgname");
            return (_local1);
        }
        public function get agnameChangeEffect():Parallel{
            return (this._422349746agnameChangeEffect);
        }
        public function set agnameChangeEffect(_arg1:Parallel):void{
            var _local2:Object = this._422349746agnameChangeEffect;
            if (_local2 !== _arg1){
                this._422349746agnameChangeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "agnameChangeEffect", _local2, _arg1));
                };
            };
        }
        public function get backgroundImg():SmoothBitmapImage{
            return (this._1893624907backgroundImg);
        }
        public function set backgroundImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1893624907backgroundImg;
            if (_local2 !== _arg1){
                this._1893624907backgroundImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundImg", _local2, _arg1));
                };
            };
        }
        public function get cardAgname():Label{
            return (this._122937057cardAgname);
        }
        public function set cardAgname(_arg1:Label):void{
            var _local2:Object = this._122937057cardAgname;
            if (_local2 !== _arg1){
                this._122937057cardAgname = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardAgname", _local2, _arg1));
                };
            };
        }
        public function get cardCountry():CardCountrySign{
            return (this._1526981222cardCountry);
        }
        public function set cardCountry(_arg1:CardCountrySign):void{
            var _local2:Object = this._1526981222cardCountry;
            if (_local2 !== _arg1){
                this._1526981222cardCountry = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardCountry", _local2, _arg1));
                };
            };
        }
        public function get cardName():Label{
            return (this._8429125cardName);
        }
        public function set cardName(_arg1:Label):void{
            var _local2:Object = this._8429125cardName;
            if (_local2 !== _arg1){
                this._8429125cardName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardName", _local2, _arg1));
                };
            };
        }
        public function get cardStar():CardStarSign{
            return (this._8262270cardStar);
        }
        public function set cardStar(_arg1:CardStarSign):void{
            var _local2:Object = this._8262270cardStar;
            if (_local2 !== _arg1){
                this._8262270cardStar = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardStar", _local2, _arg1));
                };
            };
        }
        public function get cardType():CardTypeSign{
            return (this._8227222cardType);
        }
        public function set cardType(_arg1:CardTypeSign):void{
            var _local2:Object = this._8227222cardType;
            if (_local2 !== _arg1){
                this._8227222cardType = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardType", _local2, _arg1));
                };
            };
        }
        public function get countryBgDown():SmoothBitmapImage{
            return (this._2135733693countryBgDown);
        }
        public function set countryBgDown(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._2135733693countryBgDown;
            if (_local2 !== _arg1){
                this._2135733693countryBgDown = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "countryBgDown", _local2, _arg1));
                };
            };
        }
        public function get countryBgUp():SmoothBitmapImage{
            return (this._1477105034countryBgUp);
        }
        public function set countryBgUp(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1477105034countryBgUp;
            if (_local2 !== _arg1){
                this._1477105034countryBgUp = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "countryBgUp", _local2, _arg1));
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
        public function get intChangeEffect():AnimateFilter{
            return (this._414797072intChangeEffect);
        }
        public function set intChangeEffect(_arg1:AnimateFilter):void{
            var _local2:Object = this._414797072intChangeEffect;
            if (_local2 !== _arg1){
                this._414797072intChangeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "intChangeEffect", _local2, _arg1));
                };
            };
        }
        public function get intInfo():RollNumGroup{
            return (this._1957224765intInfo);
        }
        public function set intInfo(_arg1:RollNumGroup):void{
            var _local2:Object = this._1957224765intInfo;
            if (_local2 !== _arg1){
                this._1957224765intInfo = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "intInfo", _local2, _arg1));
                };
            };
        }
        public function get rareImg():SmoothBitmapImage{
            return (this._981596097rareImg);
        }
        public function set rareImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._981596097rareImg;
            if (_local2 !== _arg1){
                this._981596097rareImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rareImg", _local2, _arg1));
                };
            };
        }
        public function get strChangeEffect():AnimateFilter{
            return (this._670726606strChangeEffect);
        }
        public function set strChangeEffect(_arg1:AnimateFilter):void{
            var _local2:Object = this._670726606strChangeEffect;
            if (_local2 !== _arg1){
                this._670726606strChangeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "strChangeEffect", _local2, _arg1));
                };
            };
        }
        public function get strInfo():RollNumGroup{
            return (this._1882712449strInfo);
        }
        public function set strInfo(_arg1:RollNumGroup):void{
            var _local2:Object = this._1882712449strInfo;
            if (_local2 !== _arg1){
                this._1882712449strInfo = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "strInfo", _local2, _arg1));
                };
            };
        }

    }
}//package card_ui 
