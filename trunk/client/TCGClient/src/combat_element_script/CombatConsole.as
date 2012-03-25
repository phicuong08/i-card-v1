//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element_script {
    import flash.events.*;
    import normal_window.*;
    import combat_element.*;
    import SoundSystem.*;
    import flash.utils.*;
    import tool.*;
    import achievement_system.*;
    import swf_effect.*;

    public class CombatConsole extends EventDispatcher {

        public static const CLEAR_ALL_SELECT_WINDOW:String = "clear_all_select_window";

        private static var _instance:CombatConsole = new (CombatConsole)();
;

        public var actionTimer:Timer;
        public var actionList:Array;
        public var enableActionList:Boolean = true;
        public var inMyRound:Boolean;
        private var mEnableBattleButton:Boolean = true;
        private var mEnableEndButton:Boolean = true;
        public var operationMenuFlags:Object;
        public var enableTraceOperateMenu:Boolean = false;

        public function CombatConsole(){
            this.actionList = new Array();
            this.operationMenuFlags = new Object();
            super();
            this.actionTimer = new Timer(50);
            this.actionTimer.addEventListener(TimerEvent.TIMER, this.actionTimerHandler);
            this.actionTimer.start();
        }
        public static function getInstance():CombatConsole{
            return (_instance);
        }

        public function addActionList(_arg1:Array, _arg2:Boolean=true):void{
            if (_arg2){
                this.actionList.push(_arg1);
            } else {
                this.actionList.unshift(_arg1);
            };
        }
        public function actionTimerHandler(_arg1:TimerEvent=null):void{
            var _local2:Array;
            var _local3:int;
            var _local4:Function;
            if (((!(this.enableActionList)) || ((CombatStage.getInstance() == null)))){
                this.actionTimer.delay = 50;
                return;
            };
            if (this.actionList.length > 0){
                CombatStage.getInstance().showNotice(false);
                this.setOperationMenuFlag("action", true);
                _local2 = this.actionList.shift();
                this.actionTimer.delay = _local2[0];
                _local3 = 1;
                while (_local3 < _local2.length) {
                    if (_local2[_local3].length){
                        _local4 = (_local2[_local3].shift() as Function);
                        _local4.apply(null, _local2[_local3]);
                    };
                    _local3++;
                };
            } else {
                this.setOperationMenuFlag("action", false);
                CombatStage.getInstance().showNotice(true);
                this.updateOperationMenu();
                this.actionTimer.delay = 50;
            };
        }
        public function clearAllSelectWindow():void{
            this.dispatchEvent(new Event(CLEAR_ALL_SELECT_WINDOW));
        }
        public function createCard(_arg1:String, _arg2:String="0", _arg3:int=0):GameCard{
            var _local4:Object = new Object();
            _local4["camp"] = _arg1;
            _local4["id"] = _arg2;
            _local4["isAttack"] = true;
            _local4["isPositive"] = false;
            CardsInfo.addAttribById(_local4);
            var _local5:GameCard = CombatStage.getInstance().createCard(_local4, _arg3);
            _local5.createCamp = _arg1;
            _local5.setCardId(_arg2);
            dispatchEvent(new MyEvent(MyEvent.CREATE_CARD, {card:_local4}));
            return (_local5);
        }
        public function addCard(_arg1:GameCard, _arg2:String, _arg3:Boolean=true, _arg4:Boolean=true, _arg5:int=-1, _arg6:String="", _arg7:int=-1):void{
            var _local8:int;
            if (_arg7 != -1){
                _local8 = _arg7;
            } else {
                _local8 = ((_arg2 == "hand")) ? 120 : 300;
            };
            this.addActionList([_local8, [this._addCard, _arg1, _arg2, _arg3, _arg4, _arg5, _arg6]]);
            dispatchEvent(new MyEvent(MyEvent.ADD_CARD_LOGIC, {
                card:_arg1,
                slot:_arg2,
                toBack:_arg3,
                toDefensive:_arg4,
                pos:_arg5,
                camp:_arg6
            }));
        }
        private function _addCard(_arg1:GameCard, _arg2:String, _arg3:Boolean=true, _arg4:Boolean=true, _arg5:int=-1, _arg6:String=""):void{
            SoundMgr.getInstance().playEffectSound("move");
            CombatStage.getInstance().cardTableBySn[_arg1.sn] = _arg1;
            if (!_arg1.reversedImg){
                _arg1.reversedImg = ((_arg1.createCamp == "enemy")) ? CombatStage.getInstance().enemyCardBorn.cardImage : CombatStage.getInstance().playerCardBorn.cardImage;
            };
            CombatStage.getInstance().removeGroupCard(_arg1);
            if (_arg6 != ""){
                _arg1.cardInfo.camp = _arg6;
            };
            _arg1.cardInfo.old_slot = _arg1.cardInfo.slot;
            _arg1.cardInfo.slot = _arg2;
            switch (_arg2){
                case "hand":
                    CombatStage.getInstance().addHandCard(_arg1, !(_arg3));
                    break;
                case "monster":
                    CombatStage.getInstance().addMonsterCard(_arg1, !(_arg3), !(_arg4), _arg5);
                    break;
                case "grave":
                    CombatStage.getInstance().addGraveCard(_arg1);
                    break;
                case "magic":
                    CombatStage.getInstance().addMagicCard(_arg1, !(_arg3), !(_arg4), _arg5);
                    break;
                case "food":
                    CombatStage.getInstance().addFoodCard(_arg1, !(_arg3), !(_arg4), _arg5);
                    break;
                case "deck":
                    CombatStage.getInstance().addDeckCard(_arg1);
                    break;
            };
            dispatchEvent(new MyEvent(MyEvent.ADD_CARD_STAGE, {
                card:_arg1,
                slot:_arg2,
                toBack:_arg3,
                toDefensive:_arg4,
                pos:_arg5,
                camp:_arg6
            }));
        }
        public function addCardArray(_arg1:Array, _arg2:String, _arg3:Boolean=true, _arg4:Boolean=true, _arg5:int=-1, _arg6:String="", _arg7:int=-1):void{
            var _local8:int;
            while (_local8 < _arg1.length) {
                if (_local8 == (_arg1.length - 1)){
                } else {
                    _arg7 = 50;
                };
                this.addCard(_arg1[_local8], _arg2, _arg3, _arg4, _arg5, _arg6, _arg7);
                _local8++;
            };
        }
        public function addCardsToHand2(_arg1:Boolean, _arg2:Array):void{
            var addCard:* = null;
            var isPlayerCard:* = _arg1;
            var handCards:* = _arg2;
            addCard = function ():void{
                CommonUtil.addTimerLaterCall(200, CombatStage.getInstance().addCardsToHand2, [isPlayerCard, handCards]);
            };
            this.addActionList([600, [addCard]]);
        }
        public function restoreHandCard2(_arg1:Boolean, _arg2:Array):void{
            var restore:* = null;
            var isPlayerCard:* = _arg1;
            var handCards:* = _arg2;
            restore = function ():void{
                var _local3:GameCard;
                var _local1:Array = (isPlayerCard) ? CombatStage.getInstance().playerHandCards : CombatStage.getInstance().enemyHandCards;
                var _local2:int;
                while (_local2 < handCards.length) {
                    _local3 = (handCards[_local2] as GameCard);
                    _local3.cardInfo.old_slot = _local3.cardInfo.slot;
                    _local3.cardInfo.slot = "hand";
                    if (_local1.indexOf(_local3) == -1){
                        _local1.push(_local3);
                    };
                    _local2++;
                };
                CombatStage.getInstance().rejustHandCard(isPlayerCard);
            };
            this.addActionList([400, [restore]]);
        }
        public function playerSelect(_arg1:String, _arg2:int=0, _arg3:int=0, _arg4:Boolean=false, _arg5:Array=null, _arg6:String=null, _arg7=null):void{
            var _local8:*;
            switch (_arg1){
                case "select card":
                    _local8 = new SelectCardOnStage();
                    break;
                case "y/n":
                    _local8 = new SelectCardYesOrNo();
                    break;
                case "select number":
                    _local8 = new SelectCardWithOptions();
                    break;
                case "select card by id":
                    _local8 = new SelectCardInWindow();
                    break;
                default:
                    throw (new Error("未知的select问题名。"));
            };
            dispatchEvent(new MyEvent(MyEvent.PLAYER_SELECT, {
                type:_arg1,
                selectWindow:_local8
            }));
            this.addActionList([500, [CombatStage.getInstance().addElement, _local8], [_local8.setInfo, _arg2, _arg3, _arg4, _arg5, _arg6, _arg7]]);
        }
        public function showCardCloseness(_arg1, _arg2:int=1):void{
            var _local3:CardCloseness = new CardCloseness();
            _local3.setCardById(_arg1);
            _local3.type = _arg2;
            this.addActionList([1400, [CombatStage.getInstance().addElement, _local3]]);
        }
        public function showCardArousal(_arg1, _arg2):void{
            var _local3:CardArousalEffect = new CardArousalEffect();
            var _local4:int = _local3.setCardId(_arg1, _arg2);
            this.addActionList([_local4, [CombatStage.getInstance().addElement, _local3]]);
        }
        public function playerPrepareAttack(_arg1:Boolean):void{
            this.addActionList([15, [CombatStage.getInstance().roundMask.changeColor, false]]);
            if (_arg1){
                this.showMessage("playerAttack");
            } else {
                this.showMessage("enemyAttack");
            };
        }
        public function showMessage(_arg1:String, _arg2=null):void{
            if (this.showSwfEffectMessage(_arg1)){
                return;
            };
            this.addActionList([1200, [this.showMessageText, _arg1, _arg2]]);
        }
        private function showSwfEffectMessage(_arg1:String):Boolean{
            var show:* = null;
            var str:* = _arg1;
            show = function ():void{
                var _local1:CombatMessageEffect = new CombatMessageEffect(str);
                _local1.y = 200;
                CombatStage.getInstance().addElement(_local1);
            };
            switch (str){
                case "playerRound":
                case "enemyRound":
                case "playerAttack":
                case "enemyAttack":
                case "roundEnd":
                    this.addActionList([1200, [show]]);
                    return (true);
                default:
                    return (false);
            };
        }
        private function showMessageText(_arg1:String, _arg2=null):void{
            var _local3:CombatMessageText = new CombatMessageText();
            _local3.setInfo(_arg1, _arg2);
            CombatStage.getInstance().addElement(_local3);
        }
        public function newRound(_arg1:Boolean, _arg2:Boolean=true):void{
            this.inMyRound = ((_arg1) && (_arg2));
            this.addActionList([15, [CombatStage.getInstance().roundMask.startMove, _arg1], [CombatStageCommonEffectMgr.showHeadEffect, _arg1]]);
            if (_arg1){
                this.showMessage("playerRound");
            } else {
                this.showMessage("enemyRound");
            };
            this.enableRoundControl(this.inMyRound);
            this.clearOperationMenuFlag();
        }
        public function playerResign(_arg1:Object):void{
            if (_arg1.is_user_resign){
                this.clearConsole();
            } else {
                if (_arg1["is_partner_resign"]){
                    this.showMessage("盟友逃跑");
                } else {
                    if (((!((_arg1["user_state"] == "viewer"))) && (!((_arg1["user_state"] == "competition_viewer"))))){
                        this.showMessage("enemyEscape");
                    } else {
                        this.showMessage((_arg1["escaper_name"] + "逃跑"));
                    };
                };
                this.addActionList([50, [this.clearConsole], [TCGClient.getInstance().enterRoom]]);
            };
        }
        public function duelEnd(_arg1:Object):void{
            if (_arg1.reason == "time_over"){
                this.showMessage("操作时间用尽");
            };
            if (((!((_arg1["user_state"] == "viewer"))) && (!((_arg1["user_state"] == "competition_viewer"))))){
                this.addActionList([50, [this.showDuelEndWindow, _arg1]]);
            } else {
                if (_arg1["winner"]){
                    this.showMessage((_arg1["winner"] + "获胜"));
                } else {
                    this.showMessage("决斗结束");
                };
            };
            this.addActionList([50, [this.clearConsole], [TCGClient.getInstance().enterRoom]]);
        }
        public function changeCardPosition(_arg1:GameCard, _arg2:Boolean, _arg3:Boolean):void{
            this.addActionList([500, [_arg1.changePosition, _arg2, _arg3]]);
        }
        public function playAttackDirectEffect(_arg1:Boolean):void{
        }
        public function setOperationMenuFlag(_arg1:String, _arg2:Boolean):void{
            this.operationMenuFlags[_arg1] = _arg2;
            if (((_arg2) && (this.inMyRound))){
                this.enableRoundControl(false);
            };
        }
        public function clearOperationMenuFlag():void{
            this.operationMenuFlags = new Object();
            if (this.inMyRound){
                this.enableRoundControl(true);
            };
        }
        public function updateOperationMenu():void{
            var _local1:String;
            for (_local1 in this.operationMenuFlags) {
                if (this.operationMenuFlags[_local1]){
                    return;
                };
            };
            if (this.inMyRound){
                this.enableRoundControl(true);
            };
            var _local2:GameCard = CombatStage.getInstance().currentMouseOverCard;
            if (_local2 != null){
                _local2.doMouseOverActionInCondition();
            };
        }
        public function enableBattle(_arg1:Boolean):void{
            this.mEnableBattleButton = _arg1;
        }
        public function enableEnd(_arg1:Boolean):void{
            this.mEnableEndButton = _arg1;
        }
        public function startAttack(_arg1:GameCard):void{
            var c:* = undefined;
            var cmd2:* = null;
            var cmd:* = null;
            var result:* = null;
            var confirmWindow:* = null;
            var removeHandler:* = null;
            var card:* = _arg1;
            var enemyHasMonster:* = false;
            for each (c in CombatStage.getInstance().enemyMonsterCards) {
                if (c){
                    enemyHasMonster = true;
                };
            };
            if (!enemyHasMonster){
                cmd2 = (("return d:do_operation('', 'attack'," + CombatStage.getInstance().getCardPos(card).toString()) + ", 0);");
                LuaAgent.getInstance().run(cmd2);
            } else {
                cmd = (("return d:check_operation('', 'attack'," + CombatStage.getInstance().getCardPos(card).toString()) + ", 0);");
                result = LuaAgent.getInstance().run(cmd);
                if ((((result.length > 1)) && ((result[1] == true)))){
                    removeHandler = function (_arg1):void{
                        confirmWindow.removeEventListener(Event.REMOVED_FROM_STAGE, removeHandler);
                        setOperationMenuFlag("AttackDirectlyConfirmWindow", false);
                    };
                    confirmWindow = new AttackDirectlyConfirmWindow();
                    confirmWindow.setInfo(card);
                    CombatStage.getInstance().addElement(confirmWindow);
                    this.setOperationMenuFlag("AttackDirectlyConfirmWindow", true);
                    confirmWindow.addEventListener(Event.REMOVED_FROM_STAGE, removeHandler);
                } else {
                    this.showAttackWindow(card);
                };
            };
        }
        public function showAttackWindow(_arg1:GameCard):void{
            var _local2:AttackWindow = new AttackWindow();
            _local2.belongCard = _arg1;
            CombatStage.getInstance().addElement(_local2);
            dispatchEvent(new MyEvent(MyEvent.SHOW_ATTACK_WINDOW, {
                card:_arg1,
                attackWindow:_local2
            }));
        }
        public function prepareAttack():void{
            var _local1 = "return d:do_operation('', 'begin_attack');";
            var _local2:Array = LuaAgent.getInstance().run(_local1);
            if ((((_local2.length > 1)) && ((_local2[1] == true)))){
                dispatchEvent(new MyEvent(MyEvent.BEGIN_ATTACK));
            } else {
                CombatStage.getInstance().battleButton.enabled = false;
            };
        }
        public function endRound():Boolean{
            var _local1:Array = LuaAgent.getInstance().run("return d:end_round();");
            if ((((_local1.length > 1)) && ((_local1[1] == true)))){
                dispatchEvent(new MyEvent(MyEvent.END_ROUND));
                return (true);
            };
            return (false);
        }
        public function showDuelEndWindow(_arg1:Object):void{
            var d:* = null;
            var removedHandler:* = null;
            var tip:* = null;
            var param:* = _arg1;
            removedHandler = function (_arg1:Event):void{
                d.removeEventListener(DuelEndWindow.FINISH_TASK, removedHandler);
                enableActionList = true;
            };
            BasicOperationBar.getInstance().clearLeaveFuncInViolence();
            TipManager.stopShowTip();
            if (((UserObject.isNewUser) && (!(param.duel_result)))){
                tip = new TipWindow();
                tip.hideTimer = new Timer(10000);
                tip.tipText = "胜败乃兵家常事，可进一步完成指引任务，或利用积分兑换新卡片强化卡组。";
                CombatStage.getInstance().addElement(tip);
            };
            this.enableActionList = false;
            d = new DuelEndWindow();
            d.setInfo(param);
            CombatStage.getInstance().addElement(d);
            d.addEventListener(DuelEndWindow.FINISH_TASK, removedHandler);
            dispatchEvent(new MyEvent(MyEvent.SHOW_DUEL_END_WINDOW, param));
        }
        public function showAchievementWindow(_arg1:int):void{
            this.addActionList([50, [AchievementReachWindow.addAchievementWindow, _arg1]]);
        }
        public function enableRoundControl(_arg1:Boolean):void{
            if (_arg1){
                if (this.mEnableBattleButton){
                    CombatStage.getInstance().battleButton.enabled = true;
                };
                if (this.mEnableEndButton){
                    CombatStage.getInstance().endButton.enabled = true;
                };
            } else {
                CombatStage.getInstance().battleButton.enabled = false;
                CombatStage.getInstance().endButton.enabled = false;
            };
        }
        public function setDeckCardNum(_arg1:Boolean, _arg2:int):void{
            if (_arg1){
                this.addActionList([15, [CombatStage.getInstance().playerCardBorn.setCardNum, _arg2]]);
            } else {
                this.addActionList([15, [CombatStage.getInstance().enemyCardBorn.setCardNum, _arg2]]);
            };
        }
        public function setCardGroupBackImage(_arg1:Boolean, _arg2:String):void{
            if (_arg1){
                this.addActionList([15, [CombatStage.getInstance().playerCardBorn.setCardImage, _arg2]]);
            } else {
                this.addActionList([15, [CombatStage.getInstance().enemyCardBorn.setCardImage, _arg2]]);
            };
        }
        public function setCombatStageBackground(_arg1:String):void{
        }
        public function showCoinRotationEffect(_arg1:Boolean):void{
            this.addActionList([2000, [CombatStageCommonEffectMgr.showCoinRotationEffect, _arg1]]);
        }
        public function showSelectDeckToHandEffect():void{
            SelectCardToHandMgr.registerCreateCardHook();
        }
        public function clearConsole():void{
            this.actionList = new Array();
            this.actionTimer.stop();
            this.actionTimer.removeEventListener(TimerEvent.TIMER, this.actionTimerHandler);
            _instance = new CombatConsole();
            dispatchEvent(new MyEvent(MyEvent.CLEAR_CONSOLE, {
                oldInstance:this,
                newInstance:_instance
            }));
        }

    }
}//package combat_element_script 
