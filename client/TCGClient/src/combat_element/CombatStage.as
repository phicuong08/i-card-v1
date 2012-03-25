//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import mx.binding.*;
    import normal_window.*;
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import __AS3__.vec.*;
    import source_manager.*;
    import spark.effects.*;
    import train_system.*;
    import task_guide.*;
    import card_ui.*;
    import custom_effect.*;
    import SoundSystem.*;
    import flash.utils.*;
    import combat_element_script.*;
    import item_system.*;
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

    public class CombatStage extends MyGroup implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Fade;
        private var _1712192010battleButton:BattleButton;
        private var _93647166bgImg:CombatStageBackground;
        private var _1303775710cardDisplayWindow:CombatStageCardInfoWindow;
        private var _252786159chainWindow:ChainNoticeWindow;
        private var _1123503085endButton:EndRoundButton;
        private var _1093881377enemyCardBorn:CardDeckArea;
        private var _863724822groupWith3D:CombatStage3DGroup;
        private var _629059706playerCardBorn:CardDeckArea;
        private var _574321024playersInfo:DuelPlayersInfo;
        private var _1267520715removeEffect:Fade;
        private var _5261926roundMask:RoundMask;
        private var __moduleFactoryInitialized:Boolean = false;
        private var mainGroupBasicElementNum:int;
        private var group3DBasicElementNum:int;
        public var graveCardDisplayWindow:Array;
        public var currentMouseOverCard:GameCard;
        public var cardButtons:CardButtons;
        public var cardTableBySn:Object;
        private var attackEffectEndPoint:Point;
        public var playerHandCards:Array;
        public var playerMagicCards:Array;
        public var playerMonsterCards:Array;
        public var playerFoodCards:Array;
        public var playerGraveCards:Array;
        public var enemyHandCards:Array;
        public var enemyMagicCards:Array;
        public var enemyMonsterCards:Array;
        public var enemyFoodCards:Array;
        public var enemyGraveCards:Array;
        private var allCards:Object;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CombatStage(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.cardButtons = new CardButtons();
            this.cardTableBySn = new Object();
            this.attackEffectEndPoint = new Point();
            this.playerHandCards = new Array();
            this.playerMagicCards = new Array(5);
            this.playerMonsterCards = new Array(5);
            this.playerFoodCards = new Array(10);
            this.playerGraveCards = new Array();
            this.enemyHandCards = new Array();
            this.enemyMagicCards = new Array(5);
            this.enemyMonsterCards = new Array(5);
            this.enemyFoodCards = new Array(10);
            this.enemyGraveCards = new Array();
            this.allCards = {
                playerhand:this.playerHandCards,
                playermagic:this.playerMagicCards,
                playermonster:this.playerMonsterCards,
                playerfood:this.playerFoodCards,
                playergrave:this.playerGraveCards,
                enemyhand:this.enemyHandCards,
                enemymagic:this.enemyMagicCards,
                enemymonster:this.enemyMonsterCards,
                enemyfood:this.enemyFoodCards,
                enemygrave:this.enemyGraveCards
            };
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CombatStage_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_CombatStageWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (CombatStage[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.mxmlContent = [this._CombatStage_CombatStageBackground1_i(), this._CombatStage_RoundMask1_i(), this._CombatStage_CombatStage3DGroup1_i(), this._CombatStage_BattleButton1_i(), this._CombatStage_EndRoundButton1_i(), this._CombatStage_ChainNoticeWindow1_i(), this._CombatStage_DuelPlayersInfo1_i(), this._CombatStage_CombatStageCardInfoWindow1_i()];
            this._CombatStage_Fade1_i();
            this._CombatStage_Fade2_i();
            this.addEventListener("initialize", this.___CombatStage_MyGroup1_initialize);
            this.addEventListener("creationComplete", this.___CombatStage_MyGroup1_creationComplete);
            this.addEventListener("click", this.___CombatStage_MyGroup1_click);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function getInstance():CombatStage{
            return (TCGClient.getInstance().combatStage);
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CombatStage._watcherSetupUtil = _arg1;
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
        private function init():void{
            mouseChildren = false;
            alpha = 0;
            var _local1:PerspectiveProjection = new PerspectiveProjection();
            _local1.fieldOfView = 22;
            _local1.projectionCenter = new Point(640, 280);
            this.transform.perspectiveProjection = _local1;
        }
        protected function mygroup1_creationCompleteHandler(_arg1:FlexEvent):void{
            var setImage:* = null;
            var event:* = _arg1;
            setImage = function (_arg1:Event):void{
                CombatStageSourceMgr.getInstance().removeEventListener(Event.COMPLETE, setImage);
                bgImg.setDefaultBgImg(CombatStageSourceMgr.getInstance().getSourceClass("combatStageMap"));
            };
            this.mainGroupBasicElementNum = this.numElements;
            if (CombatStageSourceMgr.getInstance().loadingComplete){
                setImage(null);
            } else {
                CombatStageSourceMgr.getInstance().addEventListener(Event.COMPLETE, setImage);
            };
        }
        private function addEffectEndHandler():void{
            if (TCGClient.getInstance().customCurrentState != "combatStage"){
                return;
            };
            TipManager.startShowTip();
            BasicOperationBar.getInstance().registerLeaveFunc(this.clickLeaveBtn);
            this.mouseChildren = true;
            this.setStageInfo();
        }
        public function setPlayerInfoByDetailInfo(_arg1:Boolean, _arg2:Object, _arg3:Boolean=true):void{
            var setInfo:* = null;
            var isPlayer:* = _arg1;
            var info:* = _arg2;
            var putIntoActionList:Boolean = _arg3;
            setInfo = function ():void{
                if (isPlayer){
                    playersInfo.setPlayerInfo(info, playersInfo.userHead);
                } else {
                    playersInfo.setPlayerInfo(info, playersInfo.enemyHead);
                };
            };
            if (putIntoActionList){
                CombatConsole.getInstance().addActionList([15, [setInfo]]);
            } else {
                setInfo();
            };
        }
        public function setPlayerInfoById(_arg1:String, _arg2:int):void{
            var _local3:Object = ItemCardLib.getItemInfoById(_arg2);
            var _local4:String = _local3.name;
            var _local5 = (("source/cardImages/" + _local3.image) + ".jpg");
            var _local6:String = _local3.info;
            CombatConsole.getInstance().addActionList([15, [this.setPlayerInfo, _arg1, _local4, _local5, _local6]]);
        }
        public function setPlayerInfoAction(_arg1:String, _arg2:String, _arg3:String, _arg4:String):void{
            CombatConsole.getInstance().addActionList([15, [this.setPlayerInfo, _arg1, _arg2, _arg3, _arg4]]);
        }
        public function setPlayerInfo(_arg1:String, _arg2:String, _arg3:String, _arg4:String):void{
            var _local5:CombatStageHeadWindowBase;
            if (_arg1 == "enemy"){
                _local5 = this.playersInfo.enemyHead;
            } else {
                _local5 = this.playersInfo.userHead;
            };
            var _local6:Object = new Object();
            _local6.name = _arg2;
            _local6.headIcon = _arg3;
            _local6.tooltip = _arg4;
            this.playersInfo.setPlayerInfo(_local6, _local5);
        }
        public function setStageInfo():void{
            var _local1:Array;
            var _local5:GameCard;
            var _local6:Object;
            var _local7:Object;
            if (((((!(this.playersInfo)) || (!(this.enemyCardBorn)))) || (!(this.playerCardBorn)))){
                return;
            };
            var _local2:String = UserObject.cardBackImg;
            var _local3 = "source/cardImages/card_back.png";
            var _local4:String = UserObject.state;
            if (_local4 == "campaign"){
                _local1 = GuideFunctions.getGuideHeadInfo();
                this.playersInfo.setPlayerInfo(_local1[0], this.playersInfo.enemyHead);
                this.playersInfo.setPlayerInfo(_local1[1], this.playersInfo.userHead);
            } else {
                if ((((((((_local4 == "duel")) || ((_local4 == "viewer")))) || ((_local4 == "competition_duel")))) || ((_local4 == "competition_viewer")))){
                    _local1 = LuaAgent.getInstance().run("return as3.toobject(u.duel_mgr.up_player_info)");
                    _local6 = ((_local1.length < 2)) ? null : _local1[1];
                    _local1 = LuaAgent.getInstance().run("return as3.toobject(u.duel_mgr.down_player_info)");
                    _local7 = ((_local1.length < 2)) ? null : _local1[1];
                    if (((_local6) && (_local7))){
                        this.playersInfo.setPlayerInfo(_local6, this.playersInfo.enemyHead);
                        this.playersInfo.setPlayerInfo(_local7, this.playersInfo.userHead);
                        _local3 = _local6.card_back_img;
                        _local2 = _local7.card_back_img;
                    };
                } else {
                    if (_local4 == "watch_train"){
                        _local1 = LuaAgent.getInstance().run("return as3.toobject(u.train_mgr.trainer_info)");
                        this.playersInfo.setPlayerInfo(_local1[1], this.playersInfo.enemyHead);
                        this.playersInfo.setPlayerInfo(TrainSystem.getInstance().getTrainHeadInfo()[0], this.playersInfo.userHead);
                    } else {
                        _local1 = TrainSystem.getInstance().getTrainHeadInfo();
                        this.playersInfo.setPlayerInfo(_local1[0], this.playersInfo.enemyHead);
                        this.playersInfo.setPlayerInfo(_local1[1], this.playersInfo.userHead);
                    };
                };
            };
            this.enemyCardBorn.setCardImage(_local3);
            this.playerCardBorn.setCardImage(_local2);
            for each (_local5 in this.cardTableBySn) {
                _local5.reversedImg = ((_local5.cardInfo.camp == "enemy")) ? _local3 : _local2;
            };
        }
        public function createCard(_arg1:Object, _arg2:int=0):GameCard{
            var _local3:GameCard = new GameCard();
            _local3.sn = _arg2;
            _local3.cardInfo = _arg1;
            if (_arg1.camp == "player"){
                _local3.x = (this.playerCardBorn.getXPos() + 90);
                _local3.y = this.playerCardBorn.getYPos();
            } else {
                _local3.x = this.enemyCardBorn.getXPos();
                _local3.y = this.enemyCardBorn.getYPos();
            };
            return (_local3);
        }
        public function rejustHandCard(_arg1:Boolean):void{
            var _local2:Array;
            var _local3:Number;
            var _local4:Number;
            var _local5:Number;
            var _local8:Number;
            var _local9:int;
            var _local6 = -1;
            if (_arg1){
                _local2 = this.playerHandCards;
                _local3 = CombatStagePosInfo.PLAYER_HAND_CARD_X_POS;
                _local4 = CombatStagePosInfo.PLAYER_HAND_CARD_Y_POS;
                _local5 = 125;
                _local6 = (GameOptionsWindnow.strongHandCardEffect) ? this.playerHandCards.indexOf(this.currentMouseOverCard) : -1;
            } else {
                _local2 = this.enemyHandCards;
                _local3 = CombatStagePosInfo.PLAYER_HAND_CARD_X_POS;
                _local4 = (this.groupWith3D.is3D) ? CombatStagePosInfo.ENEMY_HAND_CARD_Y_POS_3D : CombatStagePosInfo.ENEMY_HAND_CARD_Y_POS;
                _local5 = 125;
            };
            var _local7:int = _local2.length;
            if (_local7){
                if (_local7 <= 6){
                    _local8 = _local5;
                } else {
                    _local8 = ((_local5 / _local7) * (5 + (6 / _local7)));
                };
                _local9 = 0;
                while (_local9 < _local7) {
                    if (_local2[_local9].parent){
                        _local2[_local9].startMove((_local3 + this.getExtention(_local6, _local9, _local8, _local7)), _local4, (CombatStageDepthInfo.DEPTH_OF_HAND_CARD + _local9));
                        _local3 = (_local3 + _local8);
                    };
                    _local9++;
                };
            };
        }
        public function addCardsToHand2(_arg1:Boolean, _arg2:Array):void{
            var _local3:Array;
            var _local4:Number;
            var _local5:Number;
            var _local6:Number;
            var _local8:Number;
            var _local9:int;
            var _local10:GameCard;
            var _local11:int;
            if (_arg1){
                _local3 = this.playerHandCards;
                _local4 = CombatStagePosInfo.PLAYER_HAND_CARD_X_POS;
                _local5 = CombatStagePosInfo.PLAYER_HAND_CARD_2_Y_POS;
                _local6 = 125;
            } else {
                _local3 = this.enemyHandCards;
                _local4 = CombatStagePosInfo.PLAYER_HAND_CARD_X_POS;
                _local5 = CombatStagePosInfo.ENEMY_HAND_CARD_2_Y_POS;
                _local6 = 125;
            };
            var _local7:int = _arg2.length;
            if (_local7){
                if (_local7 <= 6){
                    _local8 = _local6;
                } else {
                    _local8 = ((_local6 / _local7) * (5 + (6 / _local7)));
                };
                _local9 = 0;
                while (_local9 < _local7) {
                    _local10 = (_arg2[_local9] as GameCard);
                    _local11 = _local3.indexOf(_local10);
                    if (_local11 >= 0){
                        _local3.splice(_local11, 1);
                    };
                    _local10.cardInfo.old_slot = _local10.cardInfo.slot;
                    _local10.cardInfo.slot = "hand_2";
                    _local10.startMove(_local4, _local5, (CombatStageDepthInfo.DEPTH_OF_HAND_CARD + _local9));
                    _local4 = (_local4 + _local8);
                    _local9++;
                };
            };
        }
        private function getExtention(_arg1:int, _arg2:int, _arg3:int, _arg4:int):Number{
            if ((((_arg1 == -1)) || ((_arg1 == _arg2)))){
                return (0);
            };
            var _local5:int = (_arg2 - _arg1);
            var _local6:Number = 140;
            var _local7:Number = ((_arg4 - Math.abs(_local5)) / (_arg4 - 1));
            return (((_local5 > 0)) ? ((_local6 - _arg3) * _local7) : ((_arg3 - _local6) * _local7));
        }
        public function addHandCard(_arg1:GameCard, _arg2:Boolean):void{
            var _local3:Array;
            var _local4 = (_arg1.cardInfo.camp == "player");
            _arg1.cardInfo["slot"] = "hand";
            if (_local4){
                _local3 = this.playerHandCards;
                this.addElement(_arg1);
            } else {
                _local3 = this.enemyHandCards;
                this.groupWith3D.addElement(_arg1);
            };
            _local3.push(_arg1);
            this.rejustHandCard(_local4);
            _arg1.changePosition(_arg2, true);
        }
        public function addMonsterCard(_arg1:GameCard, _arg2:Boolean, _arg3:Boolean, _arg4:int=-1):void{
            var _local5:int;
            var _local6:Array;
            var _local7:Number;
            var _local8:int;
            if (_arg1.cardInfo.camp == "player"){
                _local6 = this.playerMonsterCards;
                _local7 = CombatStagePosInfo.PLAYER_MONSTER_CARD_Y_POS;
            } else {
                _local6 = this.enemyMonsterCards;
                _local7 = CombatStagePosInfo.ENEMY_MONSTER_CARD_Y_POS;
            };
            _local5 = 0;
            while (_local5 < 5) {
                if ((((_local5 == _arg4)) || ((((_arg4 == -1)) && ((_local6[_local5] == null)))))){
                    _local6[_local5] = _arg1;
                    if (_arg1.cardInfo.move_sound){
                        SoundMgr.getInstance().playEffectSound(_arg1.cardInfo.move_sound);
                        _arg1.cardInfo.move_sound = null;
                    };
                    _local8 = this.getXByPos(_local5);
                    this.groupWith3D.addElement(_arg1);
                    _arg1.changePosition(_arg2, _arg3);
                    _arg1.startMove(_local8, _local7, CombatStageDepthInfo.DEPTH_OF_MONSTER_CARD);
                    return;
                };
                _local5++;
            };
        }
        public function addMagicCard(_arg1:GameCard, _arg2:Boolean, _arg3:Boolean, _arg4:int=-1):void{
            var _local5:int;
            var _local6:Array;
            var _local7:Number;
            var _local8:int;
            if (_arg1.cardInfo.camp == "player"){
                _local6 = this.playerMagicCards;
                _local7 = CombatStagePosInfo.PLAYER_MAGIC_CARD_Y_POS;
            } else {
                _local6 = this.enemyMagicCards;
                _local7 = CombatStagePosInfo.ENEMY_MAGIC_CARD_Y_POS;
            };
            _local5 = 0;
            while (_local5 < 5) {
                if ((((_local5 == _arg4)) || ((((_arg4 == -1)) && ((_local6[_local5] == null)))))){
                    _local6[_local5] = _arg1;
                    _local8 = this.getXByPos(_local5);
                    this.groupWith3D.addElement(_arg1);
                    _arg1.changePosition(_arg2, _arg3);
                    _arg1.startMove(_local8, _local7, CombatStageDepthInfo.DEPTH_OF_MAGIC_CARD);
                    return;
                };
                _local5++;
            };
        }
        public function addFoodCard(_arg1:GameCard, _arg2:Boolean, _arg3:Boolean, _arg4:int=-1):void{
            var _local5:Array;
            var _local6:Number;
            var _local7:Number;
            if (_arg1.cardInfo.camp == "player"){
                _local5 = this.playerFoodCards;
                _local7 = CombatStagePosInfo.PLAYER_FOOD_CARD_X_POS;
                _local6 = CombatStagePosInfo.PLAYER_FOOD_CARD_Y_POS;
            } else {
                _local5 = this.enemyFoodCards;
                _local7 = CombatStagePosInfo.ENEMY_FOOD_CARD_X_POS;
                _local6 = CombatStagePosInfo.ENEMY_FOOD_CARD_Y_POS;
            };
            var _local8:int;
            while (_local8 < _local5.length) {
                if ((((_local8 == _arg4)) || ((((_arg4 == -1)) && ((_local5[_local8] == null)))))){
                    _local5[_local8] = _arg1;
                    if (_arg1.cardInfo.move_sound){
                        SoundMgr.getInstance().playEffectSound(_arg1.cardInfo.move_sound);
                        _arg1.cardInfo.move_sound = null;
                    };
                    addElement(_arg1);
                    _arg1.changePosition(_arg2, _arg3);
                    _arg1.startMove((_local7 + (_local8 * 34)), (_local6 + (_local8 * 11)), CombatStageDepthInfo.DEPTH_OF_FOOD_CARD);
                    return;
                };
                _local8++;
            };
        }
        public function addGraveCard(_arg1:GameCard):void{
            var _local2:Number;
            var _local3:Number;
            var _local4:Array;
            var _local6:GameCard;
            if (_arg1.cardInfo.camp == "player"){
                _local2 = 1180;
                _local4 = this.playerGraveCards;
                _local3 = CombatStagePosInfo.PLAYER_GRAVE_CARD_Y_POS;
            } else {
                _local2 = 1160;
                _local4 = this.enemyGraveCards;
                _local3 = CombatStagePosInfo.ENEMY_GRAVE_CARD_Y_POS;
            };
            _local4.push(_arg1);
            this.groupWith3D.addElement(_arg1);
            _arg1.changePosition(true, true);
            _arg1.startMove(_local2, _local3);
            var _local5:int;
            while (_local5 < _local4.length) {
                _local6 = (_local4[_local5] as GameCard);
                if (_local6.isMoving){
                    _local6._depth = (CombatStageDepthInfo.DEPTH_OF_GRAVE_CARD + _local5);
                } else {
                    _local6.depth = (CombatStageDepthInfo.DEPTH_OF_GRAVE_CARD + _local5);
                };
                _local5++;
            };
        }
        public function addDeckCard(_arg1:GameCard):void{
            var toX:* = NaN;
            var toY:* = NaN;
            var removeCard:* = null;
            var addCard:* = _arg1;
            removeCard = function ():void{
                addCard.removeEventListener(GameCard.MOVE_ARRIVED, removeCard);
                addCard.removeSelf();
            };
            var isPlayer:* = (addCard.cardInfo.camp == "player");
            if (isPlayer){
                toX = this.playerCardBorn.getXPos();
                toY = this.playerCardBorn.getYPos();
            } else {
                toX = this.enemyCardBorn.getXPos();
                toY = this.enemyCardBorn.getYPos();
            };
            this.groupWith3D.addElement(addCard);
            addCard.changePosition(false, true);
            addCard.startMove(toX, toY);
            addCard.addEventListener(GameCard.MOVE_ARRIVED, removeCard);
        }
        public function removeGroupCard(_arg1:GameCard):void{
            var _local2:String = (_arg1.cardInfo.camp + _arg1.cardInfo.slot);
            if (this.allCards[_local2] == null){
                return;
            };
            var _local3:int = this.allCards[_local2].indexOf(_arg1);
            if (_local3 >= 0){
                if (_arg1.cardInfo.slot == "hand"){
                    this.allCards[_local2].splice(_local3, 1);
                    this.rejustHandCard((_arg1.cardInfo.camp == "player"));
                } else {
                    if (_arg1.cardInfo.slot == "grave"){
                        this.allCards[_local2].splice(_local3, 1);
                    } else {
                        this.allCards[_local2][_local3] = null;
                    };
                };
            };
        }
        public function getCardPos(_arg1:GameCard):int{
            var _local2:String = (_arg1.cardInfo.camp + _arg1.cardInfo.slot);
            var _local3:int = this.allCards[_local2].indexOf(_arg1);
            if (_local3 == -1){
                throw (new Error("卡片位置获取错误!!"));
            };
            return ((_local3 + 1));
        }
        private function getGridByPos(_arg1:int):int{
            switch (_arg1){
                case 0:
                    return (2);
                case 1:
                    return (1);
                case 2:
                    return (3);
                case 3:
                    return (0);
                case 4:
                    return (4);
                default:
                    return (-1);
            };
        }
        public function getXByPos(_arg1:int):int{
            var _local2 = 270;
            var _local3 = 160;
            return ((_local2 + (_local3 * this.getGridByPos(_arg1))));
        }
        public function cleanStageAction(_arg1:Boolean):void{
            CombatConsole.getInstance().addActionList([500, [this.cleanStage, _arg1]]);
        }
        public function cleanStage(_arg1:Boolean=true):void{
            if ((((this.mainGroupBasicElementNum == 0)) || ((this.group3DBasicElementNum == 0)))){
                return;
            };
            var _local2:int = (this.numElements - 1);
            while (_local2 >= this.mainGroupBasicElementNum) {
                this.removeElementAt(_local2);
                _local2--;
            };
            _local2 = (this.groupWith3D.numElements - 1);
            while (_local2 >= this.group3DBasicElementNum) {
                this.groupWith3D.removeElementAt(_local2);
                _local2--;
            };
            this.playerHandCards.length = 0;
            this.resetCardArray(this.playerMagicCards);
            this.resetCardArray(this.playerMonsterCards);
            this.resetCardArray(this.playerFoodCards);
            this.playerGraveCards.length = 0;
            this.enemyHandCards.length = 0;
            this.resetCardArray(this.enemyMagicCards);
            this.resetCardArray(this.enemyMonsterCards);
            this.resetCardArray(this.enemyFoodCards);
            this.enemyGraveCards.length = 0;
            if (_arg1){
                this.enemyCardBorn.reset();
                this.playerCardBorn.reset();
            };
            this.playersInfo.reset();
            this.cardDisplayWindow.reset();
            this.chainWindow.reset();
            this.graveCardDisplayWindow = null;
            this.currentMouseOverCard = null;
            this.attackEffectEndPoint = new Point();
            AchievementReachWindow.reset();
            this.roundMask.reset();
            this.groupWith3D.depth = 0;
        }
        private function resetCardArray(_arg1:Array):void{
            var _local2:int;
            while (_local2 < _arg1.length) {
                _arg1[_local2] = null;
                _local2++;
            };
        }
        public function mouseClickCard(_arg1:GameCard):void{
            dispatchEvent(new MyEvent(MyEvent.MOUSE_CLICK_CARD, {card:_arg1}));
            if (_arg1.cardInfo.slot == "grave"){
                if (_arg1.cardInfo.camp == "enemy"){
                    this.clickGraveArea("enemygrave", "敌方墓地卡牌");
                } else {
                    this.clickGraveArea("playergrave", "我方墓地卡牌");
                };
            };
        }
        public function mouseOverCard(_arg1:GameCard):void{
            if (this.currentMouseOverCard == _arg1){
                return;
            };
            if (this.currentMouseOverCard){
                this.currentMouseOverCard.mouseOutCardHandler(true);
            };
            this.currentMouseOverCard = _arg1;
            this.cardDisplayWindow.mouseOverCard(_arg1);
            dispatchEvent(new MyEvent(MyEvent.MOUSE_OVER_CARD, {card:_arg1}));
        }
        public function mouseOutCard(_arg1:GameCard):void{
            this.currentMouseOverCard = null;
            this.cardDisplayWindow.mouseOutCard();
            dispatchEvent(new MyEvent(MyEvent.MOUSE_OUT_CARD, {card:_arg1}));
        }
        public function setHpAction(_arg1:String, _arg2:int):void{
            CombatConsole.getInstance().addActionList([15, [this.setHp, _arg1, _arg2]]);
        }
        public function setHp(_arg1:String, _arg2:int):void{
            this.playersInfo.setHp(_arg1, _arg2);
        }
        public function changeHp(_arg1:String, _arg2:int, _arg3:int, _arg4:String=""):void{
            CombatConsole.getInstance().addActionList([700, [this.changeHpAction, _arg1, _arg2, _arg3, _arg4]]);
        }
        private function changeHpAction(_arg1:String, _arg2:int, _arg3:int, _arg4:String=""):void{
            if (((!((_arg4 == "beat"))) && (!((_arg4 == "defense"))))){
                SoundMgr.getInstance().playEffectSound(((_arg2 > 0)) ? "heal" : "hurt");
            };
            var _local5:HpChangeWindow = new HpChangeWindow();
            _local5.hpCamp = _arg1;
            _local5.hpChange = _arg2;
            _local5.hpPos = _arg3;
            addElement(_local5);
        }
        public function setFoodAction(_arg1:String, _arg2:int):void{
            CombatConsole.getInstance().addActionList([15, [this.setFood, _arg1, _arg2]]);
        }
        public function setFood(_arg1:String, _arg2:int):void{
            this.playersInfo.setFood(_arg1, _arg2);
        }
        public function changeFood(_arg1:String, _arg2:int):void{
            CombatConsole.getInstance().addActionList([15, [this.changeFoodAction, _arg1, _arg2]]);
        }
        private function changeFoodAction(_arg1:String, _arg2:int):void{
            this.playersInfo.changeFood(_arg1, _arg2);
        }
        public function clearClock(_arg1:String):void{
            this.playersInfo.clearClock(_arg1);
        }
        public function stopClock(_arg1:String, _arg2:int=-1):void{
            this.playersInfo.stopClock(_arg1, _arg2);
        }
        public function startClock(_arg1:String, _arg2:int, _arg3:int):void{
            this.playersInfo.startClock(_arg1, _arg2, _arg3);
        }
        public function setCardInfo(_arg1:CardImage):void{
            this.cardDisplayWindow.setCardInfo(_arg1);
        }
        public function hideCardInfo():void{
            this.cardDisplayWindow.mouseOutCard();
        }
        public function chainRemind(_arg1:Boolean, _arg2:Boolean=false, _arg3:Boolean=false, _arg4:Boolean=false, _arg5:String="", _arg6:Boolean=false, _arg7:Array=null):void{
            this.chainWindow.chainRemind(_arg1, _arg2, _arg3, _arg4, _arg5, _arg6, _arg7);
        }
        public function showNotice(_arg1:Boolean):void{
            if (TCGClient.getInstance().customCurrentState != "combatStage"){
                return;
            };
            this.chainWindow.showNotice(_arg1);
        }
        private function clickGraveArea(_arg1:String, _arg2:String=null):void{
            var _local3:GraveCardDisplayWindow;
            var _local4:Array;
            var _local5:int;
            if (!CombatConsole.getInstance().enableActionList){
                return;
            };
            SoundMgr.getInstance().playEffectSound("click_1");
            if (((!((this.graveCardDisplayWindow == null))) && ((_arg1 == this.graveCardDisplayWindow[0])))){
                removeElement(this.graveCardDisplayWindow[1]);
                this.graveCardDisplayWindow = null;
                return;
            };
            if (this.allCards[_arg1].length > 0){
                if (this.graveCardDisplayWindow != null){
                    _local3 = this.graveCardDisplayWindow[1];
                    _local3.cleanCards();
                } else {
                    _local3 = new GraveCardDisplayWindow();
                    addElement(_local3);
                };
                _local3.title = _arg2;
                _local4 = new Array();
                _local5 = 0;
                while (_local5 < this.allCards[_arg1].length) {
                    _local4.push(this.allCards[_arg1][_local5].cardInfo.id);
                    _local5++;
                };
                _local3.addCards(_local4);
                this.graveCardDisplayWindow = [_arg1, _local3];
            };
        }
        private function removeGraveDisplayWindow(_arg1:Event):void{
            this.graveCardDisplayWindow = null;
        }
        public function showAttackArc(_arg1:int, _arg2:int, _arg3:Boolean=true):void{
            CombatConsole.getInstance().addActionList([350, [AttackEffectManager.showAttackArc, _arg1, _arg2, _arg3]]);
        }
        public function hideAttackArc():void{
            CombatConsole.getInstance().addActionList([350, [AttackEffectManager.hideAttackArc]]);
        }
        public function showAttackSuccessEffect(_arg1:int, _arg2:int):void{
            this.hideAttackArc();
            CombatConsole.getInstance().addActionList([400, [AttackEffectManager.doAttackSuccessEffect, _arg1, _arg2]]);
            CombatConsole.getInstance().addActionList([500, [AttackEffectManager.showEasyAttackEffect]]);
        }
        public function hideAttackSuccessEffect():void{
            CombatConsole.getInstance().addActionList([350, [AttackEffectManager.hideAttackSuccessEffect]]);
        }
        private function clickLeaveBtn():void{
            var dealFunc:* = null;
            dealFunc = function (_arg1:Array):Boolean{
                var _local2:String;
                if (_arg1[0] == true){
                    _local2 = UserObject.state;
                    if (_local2 == "campaign"){
                        LuaAgent.getInstance().run("u.guide_mgr:leave_guide()");
                    } else {
                        if (_local2 == "train"){
                            LuaAgent.getInstance().run("u.train_mgr:leave_train()");
                        } else {
                            if (_local2 == "watch_train"){
                                LuaAgent.getInstance().run("u.train_mgr:stop_watch_train()");
                            } else {
                                if ((((_local2 == "competition_duel")) || ((_local2 == "competition_viewer")))){
                                    LuaAgent.getInstance().run("u.competition_mgr:leave_room()");
                                } else {
                                    if (_local2 == "prepare_ok"){
                                        LuaAgent.getInstance().run("u.hall_room_mgr:stop_room_train()");
                                    } else {
                                        LuaAgent.getInstance().run("u.hall_room_mgr:leave_room()");
                                    };
                                };
                            };
                        };
                    };
                    BasicOperationBar.getInstance().clearLeaveFunc(clickLeaveBtn);
                };
                return (true);
            };
            if (!parent){
                return;
            };
            MessageBox.showMessageBox(MessageBox.SELECT, "操作提醒：", "你确定要退出决斗吗？退出决斗按战败处理(观战例外)。", dealFunc);
        }
        public function change3DActor():void{
            var _local1:GameCard;
            var _local2:int;
            var _local3:*;
            var _local4:Vector.<Number>;
            var _local5:Number;
            if (this.groupWith3D.is3D){
                this.groupWith3D.rotationX = 0;
                this.groupWith3D.y = 0;
                this.groupWith3D.transform.matrix3D = null;
                _local2 = 0;
                while (_local2 < this.groupWith3D.numElements) {
                    _local3 = this.groupWith3D.getElementAt(_local2);
                    _local4 = _local3.transform.matrix3D.rawData;
                    _local3.transform.matrix = new Matrix(_local4[0], _local4[4], _local4[1], _local4[5], _local4[12], _local4[13]);
                    _local2++;
                };
            } else {
                this.groupWith3D.y = -25;
                this.groupWith3D.rotationX = -20;
            };
            for each (_local1 in this.enemyHandCards) {
                _local5 = (this.groupWith3D.is3D) ? CombatStagePosInfo.ENEMY_HAND_CARD_Y_POS_3D : CombatStagePosInfo.ENEMY_HAND_CARD_Y_POS;
                if (_local1.isMoving){
                    _local1._yPositon = _local5;
                } else {
                    _local1.y = _local5;
                };
            };
        }
        override public function addElementAt(_arg1:IVisualElement, _arg2:int):IVisualElement{
            var _local3:Point;
            var _local4:Point;
            if (((this.groupWith3D) && ((_arg1.parent == this.groupWith3D)))){
                _local3 = new Point(_arg1.x, _arg1.y);
                _local4 = globalToLocal(this.groupWith3D.localToGlobal(_local3));
                _arg1.x = _local4.x;
                _arg1.y = _local4.y;
            };
            return (super.addElementAt(_arg1, _arg2));
        }
        protected function stage_clickHandler(_arg1:MouseEvent):void{
            if (debugWindow.getInstance()){
                if (debugWindow.getInstance().clickSkipSwitch.selected){
                    CombatConsole.getInstance().actionTimerHandler();
                };
            };
        }
        private function _CombatStage_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.startDelay = 500;
            _local1.duration = 500;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.addEffectEndHandler();
        }
        private function _CombatStage_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 500;
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
            TipManager.stopShowTip();
            this.cleanStage();
            SoundMgr.getInstance().playBgSound("bg_main");
        }
        private function _CombatStage_CombatStageBackground1_i():CombatStageBackground{
            var _local1:CombatStageBackground = new CombatStageBackground();
            _local1.initialized(this, "bgImg");
            this.bgImg = _local1;
            BindingManager.executeBindings(this, "bgImg", this.bgImg);
            return (_local1);
        }
        private function _CombatStage_RoundMask1_i():RoundMask{
            var _local1:RoundMask = new RoundMask();
            _local1.id = "roundMask";
            if (!_local1.document){
                _local1.document = this;
            };
            this.roundMask = _local1;
            BindingManager.executeBindings(this, "roundMask", this.roundMask);
            return (_local1);
        }
        private function _CombatStage_CombatStage3DGroup1_i():CombatStage3DGroup{
            var _local1:CombatStage3DGroup = new CombatStage3DGroup();
            _local1.mouseEnabled = false;
            _local1.width = 0x0500;
            _local1.height = 800;
            _local1.y = -60;
            _local1.rotationX = -40;
            _local1.transformX = 640;
            _local1.transformY = 800;
            _local1.mxmlContent = [this._CombatStage_UIComponent1_c(), this._CombatStage_CardDeckArea1_i(), this._CombatStage_CardDeckArea2_i()];
            _local1.id = "groupWith3D";
            if (!_local1.document){
                _local1.document = this;
            };
            this.groupWith3D = _local1;
            BindingManager.executeBindings(this, "groupWith3D", this.groupWith3D);
            return (_local1);
        }
        private function _CombatStage_UIComponent1_c():UIComponent{
            var _local1:UIComponent = new UIComponent();
            _local1.rotationX = 1;
            _local1.visible = false;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CombatStage_CardDeckArea1_i():CardDeckArea{
            var _local1:CardDeckArea = new CardDeckArea();
            _local1.x = 32;
            _local1.y = -165;
            _local1.id = "enemyCardBorn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.enemyCardBorn = _local1;
            BindingManager.executeBindings(this, "enemyCardBorn", this.enemyCardBorn);
            return (_local1);
        }
        private function _CombatStage_CardDeckArea2_i():CardDeckArea{
            var _local1:CardDeckArea = new CardDeckArea();
            _local1.x = 19;
            _local1.y = 480;
            _local1.addEventListener("creationComplete", this.__playerCardBorn_creationComplete);
            _local1.id = "playerCardBorn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playerCardBorn = _local1;
            BindingManager.executeBindings(this, "playerCardBorn", this.playerCardBorn);
            return (_local1);
        }
        public function __playerCardBorn_creationComplete(_arg1:FlexEvent):void{
            this.group3DBasicElementNum = this.groupWith3D.numElements;
        }
        private function _CombatStage_BattleButton1_i():BattleButton{
            var _local1:BattleButton = new BattleButton();
            _local1.x = 69;
            _local1.y = 0;
            _local1.addEventListener("click", this.__battleButton_click);
            _local1.addEventListener("mouseDown", this.__battleButton_mouseDown);
            _local1.id = "battleButton";
            if (!_local1.document){
                _local1.document = this;
            };
            this.battleButton = _local1;
            BindingManager.executeBindings(this, "battleButton", this.battleButton);
            return (_local1);
        }
        public function __battleButton_click(_arg1:MouseEvent):void{
            CombatConsole.getInstance().prepareAttack();
        }
        public function __battleButton_mouseDown(_arg1:MouseEvent):void{
            SoundMgr.getInstance().playEffectSound("double_drum");
        }
        private function _CombatStage_EndRoundButton1_i():EndRoundButton{
            var _local1:EndRoundButton = new EndRoundButton();
            _local1.x = 971;
            _local1.y = 0;
            _local1.addEventListener("click", this.__endButton_click);
            _local1.addEventListener("mouseDown", this.__endButton_mouseDown);
            _local1.id = "endButton";
            if (!_local1.document){
                _local1.document = this;
            };
            this.endButton = _local1;
            BindingManager.executeBindings(this, "endButton", this.endButton);
            return (_local1);
        }
        public function __endButton_click(_arg1:MouseEvent):void{
            CombatConsole.getInstance().endRound();
        }
        public function __endButton_mouseDown(_arg1:MouseEvent):void{
            SoundMgr.getInstance().playEffectSound("ring");
        }
        private function _CombatStage_ChainNoticeWindow1_i():ChainNoticeWindow{
            var _local1:ChainNoticeWindow = new ChainNoticeWindow();
            _local1.id = "chainWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.chainWindow = _local1;
            BindingManager.executeBindings(this, "chainWindow", this.chainWindow);
            return (_local1);
        }
        private function _CombatStage_DuelPlayersInfo1_i():DuelPlayersInfo{
            var _local1:DuelPlayersInfo = new DuelPlayersInfo();
            _local1.id = "playersInfo";
            if (!_local1.document){
                _local1.document = this;
            };
            this.playersInfo = _local1;
            BindingManager.executeBindings(this, "playersInfo", this.playersInfo);
            return (_local1);
        }
        private function _CombatStage_CombatStageCardInfoWindow1_i():CombatStageCardInfoWindow{
            var _local1:CombatStageCardInfoWindow = new CombatStageCardInfoWindow();
            _local1.id = "cardDisplayWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardDisplayWindow = _local1;
            BindingManager.executeBindings(this, "cardDisplayWindow", this.cardDisplayWindow);
            return (_local1);
        }
        public function ___CombatStage_MyGroup1_initialize(_arg1:FlexEvent):void{
            this.init();
        }
        public function ___CombatStage_MyGroup1_creationComplete(_arg1:FlexEvent):void{
            this.mygroup1_creationCompleteHandler(_arg1);
        }
        public function ___CombatStage_MyGroup1_click(_arg1:MouseEvent):void{
            this.stage_clickHandler(_arg1);
        }
        private function _CombatStage_bindingsSetup():Array{
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
        public function get battleButton():BattleButton{
            return (this._1712192010battleButton);
        }
        public function set battleButton(_arg1:BattleButton):void{
            var _local2:Object = this._1712192010battleButton;
            if (_local2 !== _arg1){
                this._1712192010battleButton = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battleButton", _local2, _arg1));
                };
            };
        }
        public function get bgImg():CombatStageBackground{
            return (this._93647166bgImg);
        }
        public function set bgImg(_arg1:CombatStageBackground):void{
            var _local2:Object = this._93647166bgImg;
            if (_local2 !== _arg1){
                this._93647166bgImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgImg", _local2, _arg1));
                };
            };
        }
        public function get cardDisplayWindow():CombatStageCardInfoWindow{
            return (this._1303775710cardDisplayWindow);
        }
        public function set cardDisplayWindow(_arg1:CombatStageCardInfoWindow):void{
            var _local2:Object = this._1303775710cardDisplayWindow;
            if (_local2 !== _arg1){
                this._1303775710cardDisplayWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardDisplayWindow", _local2, _arg1));
                };
            };
        }
        public function get chainWindow():ChainNoticeWindow{
            return (this._252786159chainWindow);
        }
        public function set chainWindow(_arg1:ChainNoticeWindow):void{
            var _local2:Object = this._252786159chainWindow;
            if (_local2 !== _arg1){
                this._252786159chainWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chainWindow", _local2, _arg1));
                };
            };
        }
        public function get endButton():EndRoundButton{
            return (this._1123503085endButton);
        }
        public function set endButton(_arg1:EndRoundButton):void{
            var _local2:Object = this._1123503085endButton;
            if (_local2 !== _arg1){
                this._1123503085endButton = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "endButton", _local2, _arg1));
                };
            };
        }
        public function get enemyCardBorn():CardDeckArea{
            return (this._1093881377enemyCardBorn);
        }
        public function set enemyCardBorn(_arg1:CardDeckArea):void{
            var _local2:Object = this._1093881377enemyCardBorn;
            if (_local2 !== _arg1){
                this._1093881377enemyCardBorn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enemyCardBorn", _local2, _arg1));
                };
            };
        }
        public function get groupWith3D():CombatStage3DGroup{
            return (this._863724822groupWith3D);
        }
        public function set groupWith3D(_arg1:CombatStage3DGroup):void{
            var _local2:Object = this._863724822groupWith3D;
            if (_local2 !== _arg1){
                this._863724822groupWith3D = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupWith3D", _local2, _arg1));
                };
            };
        }
        public function get playerCardBorn():CardDeckArea{
            return (this._629059706playerCardBorn);
        }
        public function set playerCardBorn(_arg1:CardDeckArea):void{
            var _local2:Object = this._629059706playerCardBorn;
            if (_local2 !== _arg1){
                this._629059706playerCardBorn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerCardBorn", _local2, _arg1));
                };
            };
        }
        public function get playersInfo():DuelPlayersInfo{
            return (this._574321024playersInfo);
        }
        public function set playersInfo(_arg1:DuelPlayersInfo):void{
            var _local2:Object = this._574321024playersInfo;
            if (_local2 !== _arg1){
                this._574321024playersInfo = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playersInfo", _local2, _arg1));
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
        public function get roundMask():RoundMask{
            return (this._5261926roundMask);
        }
        public function set roundMask(_arg1:RoundMask):void{
            var _local2:Object = this._5261926roundMask;
            if (_local2 !== _arg1){
                this._5261926roundMask = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roundMask", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 
