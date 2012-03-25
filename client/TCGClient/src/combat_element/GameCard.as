//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    
	import mx.effects.Sequence;
    import spark.components.*;
    import mx.binding.*;
    import normal_window.*;
    import flash.system.*;
    import flash.media.*;
    import __AS3__.vec.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import card_ui.*;
    import custom_effect.*;
    import SoundSystem.*;
    import flash.utils.*;
    import combat_element_script.*;
    import spark.effects.animation.*;
    import org.gonta.filters.*;
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

	use namespace mx_internal;
    public class GameCard extends Group implements IBindingClient {

        public static const CARD_IMAGE_SCALE:Number = 1.4;
        public static const MOVE_ARRIVED:String = "移动抵达";

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _980106146arrivedEffect:AnimateFilter;
        private var _265574357cardImage:CardImage;
        private var _207684226glowEffect:AnimateFilter;
        private var _736810656reflector:WetFloorFilter;
        private var _1206112972rotateEffect:spark.effects.Rotate;
        private var _903579360shadow:DropShadowFilter;
        private var _335484983shakeEffect:Sequence;
        private var __moduleFactoryInitialized:Boolean = false;
        public var relatedEffect:GlowInsideEffect;
        public var prepareAttackEffect:GameCardPrepareAttackEffect;
        public var cardInfo:Object;
        public var sn:int;
        public var selectState:Boolean = false;
        public var isMoving:Boolean = false;
        public var createCamp:String;
        private var _1521788577reversedImg:String;
        public var _xPositon:Number;
        public var _yPositon:Number;
        public var _depth:int;
        private var relatedCardArr:Array;
        private var surroundElf:SurroundElfEffect;
        private var scaleEffect:ScaleEffect;
        private var moveEffect:MoveEffect;
        private var _needBomb:Boolean = false;
        private var _needTwirl:Boolean = false;
        private var isConditionMouseOverEffectPlaying:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function GameCard(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.prepareAttackEffect = new GameCardPrepareAttackEffect(this);
            this.relatedCardArr = new Array();
            this.moveEffect = new MoveEffect(this, 300);
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GameCard_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_GameCardWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (GameCard[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 84;
            this.height = 112;
            this.layout = this._GameCard_BasicLayout1_c();
            this.mxmlContent = [this._GameCard_CardImage1_i()];
            this._GameCard_AnimateFilter2_i();
            this._GameCard_AnimateFilter1_i();
            this._GameCard_WetFloorFilter1_i();
            this._GameCard_Rotate1_i();
            this._GameCard_DropShadowFilter1_i();
            this._GameCard_Sequence1_i();
            this.addEventListener("initialize", this.___GameCard_Group1_initialize);
            this.addEventListener("rollOut", this.___GameCard_Group1_rollOut);
            this.addEventListener("rollOver", this.___GameCard_Group1_rollOver);
            this.addEventListener("click", this.___GameCard_Group1_click);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GameCard._watcherSetupUtil = _arg1;
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
        protected function group1_initHandler():void{
            this.moveEffect.addEventListener(CustomEffectEvent.END, this.moveEffectEndHandler);
        }
        private function moveEffectEndHandler(_arg1:CustomEffectEvent):void{
            this.moveArrived();
        }
        protected function cardImage_creationCompleteHandler(_arg1:FlexEvent):void{
            this.relatedEffect = new GlowInsideEffect(this.cardImage, 1000, 0xFF6600, 0, 0.4, 0, true);
            this.relatedEffect.effectContainer.depth = 1;
        }
        public function setImage():void{
            this.cardImage.isPositive = this.cardInfo.isPositive;
        }
        public function changePosition(_arg1:Boolean, _arg2:Boolean):void{
            var rotationYEffect:* = null;
            var effectEndhandler:* = null;
            var toPositive:* = _arg1;
            var toAttack:* = _arg2;
            if (((!(this._needBomb)) && (!(this._needTwirl)))){
                if (((!((toAttack == this.cardInfo.isAttack))) || (!((toPositive == this.cardInfo.isPositive))))){
                    SoundMgr.getInstance().playEffectSound("move");
                };
                if (toAttack != this.cardInfo.isAttack){
                    if (toAttack){
                        this.rotateEffect.angleTo = 0;
                    } else {
                        this.rotateEffect.angleTo = 90;
                    };
                    this.rotateEffect.play();
                };
                if (toPositive != this.cardInfo.isPositive){
                    effectEndhandler = function (_arg1:CustomEffectEvent):void{
                        rotationYEffect.removeEventListener(CustomEffectEvent.END, effectEndhandler);
                        setImage();
                        var _local2:RotateY3DEffect = new RotateY3DEffect(cardImage, -90, 0, 150);
                        _local2.play();
                    };
                    rotationYEffect = new RotateY3DEffect(this.cardImage, 0, 90, 150);
                    rotationYEffect.addEventListener(CustomEffectEvent.END, effectEndhandler);
                    rotationYEffect.play();
                };
            };
            this.cardInfo.isAttack = toAttack;
            this.cardInfo.isPositive = toPositive;
        }
        public function set needBomb(_arg1:Boolean):void{
            var setBombSign:* = null;
            var b:* = _arg1;
            setBombSign = function ():void{
                _needBomb = b;
            };
            CombatConsole.getInstance().addActionList([15, [setBombSign]]);
        }
        public function set needTwirl(_arg1:Boolean):void{
            var setTwirlSign:* = null;
            var b:* = _arg1;
            setTwirlSign = function ():void{
                _needTwirl = b;
            };
            CombatConsole.getInstance().addActionList([15, [setTwirlSign]]);
        }
        public function startMove(_arg1:Number, _arg2:Number, _arg3:int=0, _arg4:Boolean=true):void{
            if (((((((this.moveEffect.isPlaying) && ((_arg1 == this._xPositon)))) && ((_arg2 == this._yPositon)))) || (((((!(this.moveEffect.isPlaying)) && ((_arg1 == this.x)))) && ((_arg2 == this.y)))))){
                return;
            };
            this.isMoving = true;
            this.shakeEffect.end();
            this._xPositon = _arg1;
            this._yPositon = _arg2;
            this._depth = _arg3;
            if (this._needBomb){
                this._needBomb = false;
                this.doBomb((_arg1 - x), (_arg2 - y));
            } else {
                if (this._needTwirl){
                    this._needTwirl = false;
                    this.doTwirl();
                } else {
                    this.moveEffect.xTo = _arg1;
                    this.moveEffect.yTo = _arg2;
                    this.moveEffect.play();
                    if (this.depth < 350){
                        this.depth = (this._depth + 30);
                    };
                    if (this.cardInfo.slot != "hand"){
                        this.clearDefaultFilter();
                    };
                };
            };
            if (_arg4){
                this.playScaleEffect(CARD_IMAGE_SCALE, CARD_IMAGE_SCALE);
            };
        }
        public function doBomb(_arg1:Number, _arg2:Number):void{
            var bombEffect:* = null;
            var bombEndHandler:* = null;
            var xChange:* = _arg1;
            var yChange:* = _arg2;
            bombEndHandler = function (_arg1:CustomEffectEvent):void{
                bombEffect.removeEventListener(CustomEffectEvent.END, bombEndHandler);
                visible = true;
                moveArrived(false);
            };
            SoundMgr.getInstance().playEffectSound("destroy");
            bombEffect = new CardBombEffect(this.cardImage, x, y, xChange, yChange);
            bombEffect.attach(CombatStage.getInstance().groupWith3D);
            bombEffect.play();
            bombEffect.effectContainer.depth = 100;
            bombEffect.addEventListener(CustomEffectEvent.END, bombEndHandler);
            this.visible = false;
        }
        public function destroyCardDirectly(_arg1:int=-1):void{
            CombatConsole.getInstance().addActionList([((_arg1)!=-1) ? _arg1 : 300, [this._destroyCardDirectly]]);
        }
        private function _destroyCardDirectly():void{
            CombatStage.getInstance().removeGroupCard(this);
            this.doBomb2();
            this.removeSelf();
        }
        public function doBomb2():void{
            SoundMgr.getInstance().playEffectSound("destroy");
            var _local1:CardBombEffect2 = new CardBombEffect2(this.cardImage, x, y);
            _local1.attach(CombatStage.getInstance().groupWith3D);
            _local1.play();
            _local1.effectContainer.depth = 100;
        }
        public function doTwirl():void{
            var halfWidth:* = NaN;
            var halfHeight:* = NaN;
            var f:* = null;
            var twirlEndHandler:* = null;
            twirlEndHandler = function (_arg1:CustomEffectEvent):void{
                f.removeEventListener(CustomEffectEvent.END, twirlEndHandler);
                moveArrived();
                f = new PixelBenderTwirlEffect(cardImage, 500, new Point(halfWidth, halfHeight), true);
                f.play();
            };
            SoundMgr.getInstance().playEffectSound("sacrifice");
            halfWidth = ((this.cardImage.width * this.cardImage.scaleX) / 2);
            halfHeight = ((this.cardImage.height * this.cardImage.scaleY) / 2);
            var centerPoint:* = ((this.cardImage.rotation == 0)) ? new Point(halfWidth, halfHeight) : new Point(halfHeight, halfWidth);
            f = new PixelBenderTwirlEffect(this.cardImage, 500, centerPoint);
            f.play();
            f.addEventListener(CustomEffectEvent.END, twirlEndHandler);
        }
        private function moveArrived(_arg1:Boolean=true):void{
            if (((!(this.cardInfo.isPositive)) && ((((this.cardInfo.slot == "monster")) || ((this.cardInfo.slot == "magic")))))){
                SoundMgr.getInstance().playEffectSound("set");
            };
            this.setImage();
            this.isMoving = false;
            rotationY = 0;
            this.x = this._xPositon;
            this.y = this._yPositon;
            this.cardImage.rotation = (this.cardInfo.isAttack) ? 0 : 90;
            if (this.depth < 350){
                this.depth = this._depth;
            };
            if (((_arg1) && (!((this.cardInfo["slot"] == "hand"))))){
                this.arrivedEffect.play();
            };
            this.createFilter();
            dispatchEvent(new Event(MOVE_ARRIVED));
        }
        public function clearDefaultFilter():void{
            this.addFilter(this.shadow, false);
            this.addFilter(this.reflector, false);
        }
        public function createFilter():void{
            var _local1:int;
            if ((((this.cardInfo["slot"] == "hand")) && ((this.cardInfo["camp"] == "player")))){
                this.addFilter(this.shadow, false);
                this.addFilter(this.reflector);
            } else {
                this.addFilter(this.reflector, false);
                this.addFilter(this.shadow);
            };
        }
        private function addFilter(_arg1, _arg2:Boolean=true):void{
            var _local3:Array = this.cardImage.filters;
            var _local4:int = _local3.indexOf(_arg1);
            if ((((_local4 == -1)) && (_arg2))){
                _local3.push(_arg1);
                this.cardImage.filters = _local3;
            } else {
                if (((!((_local4 == -1))) && (!(_arg2)))){
                    _local3.splice(_local4, 1);
                    this.cardImage.filters = _local3;
                };
            };
        }
        private function mouseOverCardHandler():void{
            var _local1:int;
            if (this.cardInfo.slot == "grave"){
                _local1 = ((this.cardInfo.camp == "player")) ? CombatStage.getInstance().playerGraveCards.length : CombatStage.getInstance().enemyGraveCards.length;
                this.toolTip = (("墓地卡片 " + _local1) + " 张，\n点击可查看全部。");
            } else {
                if ((((this.cardInfo.slot == "hand")) && ((this.cardInfo.camp == "enemy")))){
                    this.toolTip = "对方手牌，不可见。";
                } else {
                    this.toolTip = null;
                };
            };
            CombatStage.getInstance().mouseOverCard(this);
            if (this.cardInfo.slot != "hand_2"){
                this.showRelatedCard(true);
            };
        }
        public function doMouseOverActionInCondition():void{
            if (!this.isConditionMouseOverEffectPlaying){
                this.isConditionMouseOverEffectPlaying = true;
                if ((((this.cardInfo.camp == "player")) && ((this.cardInfo.slot == "hand")))){
                    this.playScaleEffect(1.6, 1.6);
                    if (GameOptionsWindnow.strongHandCardEffect){
                        CombatStage.getInstance().rejustHandCard(true);
                    };
                } else {
                    this.glowEffect.play();
                };
            };
            if (((!(this.scaleEffect)) || (!(this.scaleEffect.isPlaying)))){
                CombatStage.getInstance().cardButtons.attachCard(this);
            };
        }
        public function mouseOutCardHandler(_arg1:Boolean=false):void{
            if (((((!(_arg1)) && ((parent == CombatStage.getInstance().groupWith3D)))) && ((CombatStage.getInstance().cardButtons.belongCard == this)))){
                return;
            };
            this.isConditionMouseOverEffectPlaying = false;
            CombatStage.getInstance().mouseOutCard(this);
            CombatStage.getInstance().cardButtons.separateCard();
            this.glowEffect.end();
            this.showRelatedCard(false);
            if ((((this.cardInfo.camp == "player")) && ((this.cardInfo.slot == "hand")))){
                this.playScaleEffect(CARD_IMAGE_SCALE, CARD_IMAGE_SCALE);
                if (GameOptionsWindnow.strongHandCardEffect){
                    CombatStage.getInstance().rejustHandCard(true);
                };
            };
        }
        public function setCardId(_arg1:String):void{
            this.cardInfo["id"] = _arg1;
            if (_arg1 != "0"){
                CardsInfo.addAttribById(this.cardInfo);
                this.cardImage.setCardById(_arg1);
            };
        }
        public function putAttackFlag(_arg1:Boolean=true):void{
            CombatConsole.getInstance().addActionList([this.prepareAttackEffect.duration, [this._putAttackFlag, _arg1]]);
        }
        private function _putAttackFlag(_arg1:Boolean=true):void{
            if (_arg1){
                this.prepareAttackEffect.showAttackState();
            } else {
                this.prepareAttackEffect.hideAttackState();
            };
        }
        public function shaking(_arg1:int=-1):void{
            var _local2:int;
            if (_arg1 == -1){
                _local2 = 500;
            } else {
                _local2 = _arg1;
            };
            CombatConsole.getInstance().addActionList([_local2, [this.shakeEffect.play]]);
        }
        public function getPos():int{
            var _local1:String;
            if (this.cardInfo.camp == "player"){
                _local1 = UserObject.duelRole;
            } else {
                if (UserObject.duelRole == "a"){
                    _local1 = "b";
                } else {
                    _local1 = "a";
                };
            };
            var _local2:String = this.cardInfo.slot;
            var _local3:int = CombatStage.getInstance().getCardPos(this);
            switch (_local2){
                case "monster":
                    _local3 = (_local3 + 10);
                    break;
                case "magic":
                    _local3 = (_local3 + 20);
                    break;
                case "hand":
                    _local3 = (_local3 + 30);
                    break;
                case "grave":
                    _local3 = (_local3 + 100);
                    break;
            };
            if (_local1 == "b"){
                _local3 = (_local3 + 500);
            };
            return (_local3);
        }
        private function showRelatedCard(_arg1:Boolean):void{
            var _local2:int;
            var _local3:GameCard;
            var _local4:String;
            var _local5:Array;
            if (this.relatedCardArr){
                for each (_local2 in this.relatedCardArr) {
                    _local3 = CombatStage.getInstance().cardTableBySn[_local2];
                    if (_local3){
                        if (_local3.relatedEffect){
                            _local3.relatedEffect.end();
                        };
                    };
                };
                this.relatedCardArr = null;
            };
            if (_arg1){
                _local4 = (("return d:get_related_card(" + this.sn.toString()) + ");");
                _local5 = LuaAgent.getInstance().run(_local4, true, false);
                if (_local5[0] == true){
                    if ((((_local5.length == 2)) && ((_local5[1] == null)))){
                        return;
                    };
                    this.relatedCardArr = _local5[1];
                    for each (_local2 in this.relatedCardArr) {
                        _local3 = CombatStage.getInstance().cardTableBySn[_local2];
                        if (_local3){
                            if (_local3.relatedEffect){
                                _local3.relatedEffect.play();
                            };
                        };
                    };
                };
            };
        }
        public function setCardAttrib(_arg1:int, _arg2:int):void{
            CombatConsole.getInstance().addActionList([150, [this.cardImage.setAttribInfo, _arg1, _arg2]]);
        }
        public function setMark(_arg1:int):void{
            CombatConsole.getInstance().addActionList([500, [this.cardImage.setMark, _arg1]]);
        }
        public function setMarkType(_arg1:String):void{
            this.cardImage.setMarkType(_arg1);
        }
        public function removeMark():void{
            CombatConsole.getInstance().addActionList([500, [this.cardImage.removeMark]]);
        }
        public function addBuff(_arg1:String):void{
            CombatConsole.getInstance().addActionList([500, [this.cardImage.addBuff, _arg1]]);
        }
        public function removeBuff(_arg1:String):void{
            CombatConsole.getInstance().addActionList([500, [this.cardImage.removeBuff, _arg1]]);
        }
        public function removeAllBuff():void{
            if ((((this.cardImage.buffWindow == null)) || ((this.cardImage.buffWindow.getAllBuffText().length == 0)))){
                return;
            };
            CombatConsole.getInstance().addActionList([500, [this.cardImage.removeAllBuff]]);
        }
        public function setSelectState(_arg1:Boolean, _arg2:Boolean=true):void{
            if (_arg2){
                CombatConsole.getInstance().addActionList([15, [this._setSelectState, _arg1]]);
            } else {
                this._setSelectState(_arg1);
            };
        }
        private function _setSelectState(_arg1:Boolean):void{
            this.selectState = _arg1;
            this.playSurroundEffect(_arg1);
        }
        public function playScaleEffect(_arg1:Number, _arg2:Number):void{
            if (!this.scaleEffect){
                this.scaleEffect = new ScaleEffect(this.cardImage, 200, 1, 1);
                this.scaleEffect.addEventListener(CustomEffectEvent.END, this.scaleEffectEndHandler);
            };
            if (((((((!(this.scaleEffect.isPlaying)) && ((this.cardImage.scaleX == _arg1)))) && ((this.cardImage.scaleY == _arg2)))) || (((((this.scaleEffect.isPlaying) && ((this.scaleEffect.scaleXTo == _arg1)))) && ((this.scaleEffect.scaleYTo == _arg2)))))){
                return;
            };
            if (this.depth < 350){
                this.depth = (this._depth + 30);
            };
            this.scaleEffect.scaleXTo = _arg1;
            this.scaleEffect.scaleYTo = _arg2;
            this.scaleEffect.play();
        }
        private function scaleEffectEndHandler(_arg1:CustomEffectEvent):void{
            if ((((this.depth < 350)) && ((this.cardImage.scaleX == CARD_IMAGE_SCALE)))){
                this.depth = this._depth;
            };
        }
        public function playSurroundEffect(_arg1:Boolean=true):void{
            if (_arg1){
                if (!this.surroundElf){
                    this.surroundElf = new SurroundElfEffect(this.cardImage);
                };
                this.surroundElf.attach(this);
                this.surroundElf.play();
                this.surroundElf.effectContainer.transform.matrix = this.cardImage.transform.matrix.clone();
            } else {
                if (this.surroundElf){
                    this.surroundElf.end();
                };
                this.surroundElf = null;
            };
        }
        protected function group1_mouseWheelHandler(_arg1:MouseEvent):void{
        }
        private function playShakeSound():void{
            var _local1:String;
            switch (this.cardInfo.body){
                case "wen":
                    _local1 = "die_wen";
                    break;
                case "wu":
                    _local1 = "die_wu";
                    break;
                case "female":
                    _local1 = "die_female";
                    break;
            };
            if (_local1){
                SoundMgr.getInstance().playEffectSound(_local1);
            };
        }
        public function setMoveSound(_arg1:String):void{
            this.cardInfo.move_sound = _arg1;
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1 != null){
                _local1.removeElement(this);
            };
        }
        private function _GameCard_AnimateFilter2_i():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 1000;
            _local1.bitmapFilter = this._GameCard_GlowFilter2_c();
            new Vector.<MotionPath>(3)[0] = this._GameCard_SimpleMotionPath2_c();
            new Vector.<MotionPath>(3)[1] = this._GameCard_SimpleMotionPath3_c();
            new Vector.<MotionPath>(3)[2] = this._GameCard_SimpleMotionPath4_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            this.arrivedEffect = _local1;
            BindingManager.executeBindings(this, "arrivedEffect", this.arrivedEffect);
            return (_local1);
        }
        private function _GameCard_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFF0000;
            _local1.strength = 3;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameCard_SimpleMotionPath2_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 1;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameCard_SimpleMotionPath3_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameCard_SimpleMotionPath4_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameCard_AnimateFilter1_i():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.repeatCount = 0;
            _local1.repeatBehavior = "reverse";
            _local1.duration = 1000;
            _local1.bitmapFilter = this._GameCard_GlowFilter1_c();
            new Vector.<MotionPath>(1)[0] = this._GameCard_SimpleMotionPath1_c();
            _local1.motionPaths = new Vector.<MotionPath>(1);
            this.glowEffect = _local1;
            BindingManager.executeBindings(this, "glowEffect", this.glowEffect);
            return (_local1);
        }
        private function _GameCard_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xC000FF;
            _local1.strength = 3;
            _local1.blurX = 30;
            _local1.blurY = 30;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameCard_SimpleMotionPath1_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 0;
            _local1.valueTo = 0.6;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameCard_WetFloorFilter1_i():WetFloorFilter{
            var _local1:WetFloorFilter = new WetFloorFilter();
            _local1.alpha = 0.6;
            _local1.y = undefined;
            _local1.height = 30;
            this.reflector = _local1;
            BindingManager.executeBindings(this, "reflector", this.reflector);
            return (_local1);
        }
        private function _GameCard_Rotate1_i():spark.effects.Rotate{
            var _local1:Rotate = new Rotate();
            _local1.duration = 300;
            this.rotateEffect = _local1;
            BindingManager.executeBindings(this, "rotateEffect", this.rotateEffect);
            return (_local1);
        }
        private function _GameCard_DropShadowFilter1_i():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.color = 0;
            _local1.distance = 4;
            _local1.alpha = 0.8;
            this.shadow = _local1;
            BindingManager.executeBindings(this, "shadow", this.shadow);
            return (_local1);
        }
        private function _GameCard_Sequence1_i():Sequence{
            var _local1:Sequence = new Sequence();
            _local1.children = [this._GameCard_Move1_c(), this._GameCard_Move2_c(), this._GameCard_Move3_c(), this._GameCard_Move4_c(), this._GameCard_Move5_c(), this._GameCard_Move6_c()];
            _local1.addEventListener("effectStart", this.__shakeEffect_effectStart);
            this.shakeEffect = _local1;
            BindingManager.executeBindings(this, "shakeEffect", this.shakeEffect);
            return (_local1);
        }
        private function _GameCard_Move1_c():spark.effects.Move{
            var _local1:Move = new Move();
            _local1.xBy = 20;
            _local1.duration = 20;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameCard_Move2_c():Move{
            var _local1:Move = new Move();
            _local1.xBy = -20;
            _local1.duration = 20;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameCard_Move3_c():Move{
            var _local1:Move = new Move();
            _local1.xBy = 20;
            _local1.duration = 20;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameCard_Move4_c():Move{
            var _local1:Move = new Move();
            _local1.xBy = -20;
            _local1.duration = 20;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameCard_Move5_c():Move{
            var _local1:Move = new Move();
            _local1.xBy = 20;
            _local1.duration = 20;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameCard_Move6_c():Move{
            var _local1:Move = new Move();
            _local1.xBy = -20;
            _local1.duration = 20;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function __shakeEffect_effectStart(_arg1:EffectEvent):void{
            this.playShakeSound();
        }
        private function _GameCard_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GameCard_CardImage1_i():CardImage{
            var _local1:CardImage = new CardImage();
            _local1.x = 0;
            _local1.y = 0;
            _local1.transformX = 42;
            _local1.transformY = 56;
            _local1.isPositive = false;
            _local1.addEventListener("creationComplete", this.__cardImage_creationComplete);
            _local1.id = "cardImage";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardImage = _local1;
            BindingManager.executeBindings(this, "cardImage", this.cardImage);
            return (_local1);
        }
        public function __cardImage_creationComplete(_arg1:FlexEvent):void{
            this.cardImage_creationCompleteHandler(_arg1);
        }
        public function ___GameCard_Group1_initialize(_arg1:FlexEvent):void{
            this.group1_initHandler();
        }
        public function ___GameCard_Group1_rollOut(_arg1:MouseEvent):void{
            this.mouseOutCardHandler();
        }
        public function ___GameCard_Group1_rollOver(_arg1:MouseEvent):void{
            this.mouseOverCardHandler();
        }
        public function ___GameCard_Group1_click(_arg1:MouseEvent):void{
            CombatStage.getInstance().mouseClickCard(this);
        }
        private function _GameCard_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, null, "rotateEffect.target", "cardImage");
            result[1] = new Binding(this, null, null, "glowEffect.target", "cardImage");
            result[2] = new Binding(this, null, null, "arrivedEffect.target", "cardImage");
            result[3] = new Binding(this, function ():Object{
                return (this);
            }, null, "shakeEffect.target");
            result[4] = new Binding(this, function ():Number{
                return (((114 * cardImage.scaleY) * TCGClient.getInstance().mainGroup.scaleY));
            }, null, "reflector.y");
            result[5] = new Binding(this, function ():Number{
                return (CARD_IMAGE_SCALE);
            }, null, "cardImage.scaleX");
            result[6] = new Binding(this, function ():Number{
                return (CARD_IMAGE_SCALE);
            }, null, "cardImage.scaleY");
            result[7] = new Binding(this, null, null, "cardImage.reversedSource", "reversedImg");
            return (result);
        }
        public function get arrivedEffect():AnimateFilter{
            return (this._980106146arrivedEffect);
        }
        public function set arrivedEffect(_arg1:AnimateFilter):void{
            var _local2:Object = this._980106146arrivedEffect;
            if (_local2 !== _arg1){
                this._980106146arrivedEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "arrivedEffect", _local2, _arg1));
                };
            };
        }
        public function get cardImage():CardImage{
            return (this._265574357cardImage);
        }
        public function set cardImage(_arg1:CardImage):void{
            var _local2:Object = this._265574357cardImage;
            if (_local2 !== _arg1){
                this._265574357cardImage = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardImage", _local2, _arg1));
                };
            };
        }
        public function get glowEffect():AnimateFilter{
            return (this._207684226glowEffect);
        }
        public function set glowEffect(_arg1:AnimateFilter):void{
            var _local2:Object = this._207684226glowEffect;
            if (_local2 !== _arg1){
                this._207684226glowEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowEffect", _local2, _arg1));
                };
            };
        }
        public function get reflector():WetFloorFilter{
            return (this._736810656reflector);
        }
        public function set reflector(_arg1:WetFloorFilter):void{
            var _local2:Object = this._736810656reflector;
            if (_local2 !== _arg1){
                this._736810656reflector = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reflector", _local2, _arg1));
                };
            };
        }
        public function get rotateEffect():Rotate{
            return (this._1206112972rotateEffect);
        }
        public function set rotateEffect(_arg1:Rotate):void{
            var _local2:Object = this._1206112972rotateEffect;
            if (_local2 !== _arg1){
                this._1206112972rotateEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rotateEffect", _local2, _arg1));
                };
            };
        }
        public function get shadow():DropShadowFilter{
            return (this._903579360shadow);
        }
        public function set shadow(_arg1:DropShadowFilter):void{
            var _local2:Object = this._903579360shadow;
            if (_local2 !== _arg1){
                this._903579360shadow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shadow", _local2, _arg1));
                };
            };
        }
        public function get shakeEffect():Sequence{
            return (this._335484983shakeEffect);
        }
        public function set shakeEffect(_arg1:Sequence):void{
            var _local2:Object = this._335484983shakeEffect;
            if (_local2 !== _arg1){
                this._335484983shakeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shakeEffect", _local2, _arg1));
                };
            };
        }
        public function get reversedImg():String{
            return (this._1521788577reversedImg);
        }
        public function set reversedImg(_arg1:String):void{
            var _local2:Object = this._1521788577reversedImg;
            if (_local2 !== _arg1){
                this._1521788577reversedImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reversedImg", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 
