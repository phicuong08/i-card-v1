//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
    import flash.events.*;
    import spark.components.*;
    import normal_window.*;
    import chat_system.*;
    import combat_element.*;
    import flash.utils.*;
    import combat_element_script.*;
    import notice_system.*;

    public class GuideSystem extends EventDispatcher {

        private static var _instance:GuideSystem = new (GuideSystem)();
;

        public var isGuiding:Boolean = false;
        public var startStep:int = 0;
        public var currentSection:int = 0;
        public var guideWindow:Group;
        public var guideLineWindow:GuideLineWindow;
        public var guideMaskWindow:GuideMaskWindow;
        public var guideAllTypeWindow:Object;
        private var currentStepConfig:Array;

        public function GuideSystem(){
            this.guideAllTypeWindow = new Object();
            this.currentStepConfig = new Array();
            super();
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():GuideSystem{
            return (_instance);
        }

        public function guideClean():void{
            var _local1:*;
            if (this.guideWindow){
                _local1 = this.guideWindow.parent;
                if (_local1){
                    _local1.removeElement(this.guideWindow);
                };
            };
            if (this.guideMaskWindow){
                this.guideMaskWindow.removeSelf();
            };
            this.guideWindow = null;
            this.guideLineWindow = null;
            this.guideMaskWindow = null;
            this.guideAllTypeWindow = new Object();
            this.isGuiding = false;
        }
        public function guideStart(_arg1:int):void{
            this.currentSection = _arg1;
            ChatWindowMgr.getInstance().addSystemContent("战役开始了。");
            this.isGuiding = true;
            if (!this.guideWindow){
                this.guideWindow = new Group();
                this.guideWindow.x = 0;
                this.guideWindow.y = 0;
                this.guideWindow.height = 800;
                this.guideWindow.width = 0x0500;
                this.guideWindow.depth = 1;
                this.guideWindow.mouseEnabled = false;
                this.guideLineWindow = new GuideLineWindow();
            };
            if (!this.guideMaskWindow){
                this.guideMaskWindow = new GuideMaskWindow();
            };
            this.guideWindow.removeAllElements();
            TCGClient.getInstance().mainGroup.addElement(this.guideWindow);
            this.doStep(_arg1, 0);
        }
        public function getMaskWindow():GuideMaskWindow{
            if (!this.guideMaskWindow){
                this.guideMaskWindow = new GuideMaskWindow();
            };
            return (this.guideMaskWindow);
        }
        public function guideEnd(_arg1:Object):void{
            var showTip:* = null;
            var param:* = _arg1;
            showTip = function ():void{
                var _local1:TipWindow = new TipWindow();
                _local1.hideTimer = new Timer(10000);
                _local1.tipText = "您已经完成了第一个战役，现在可以继续下一个战役，也可以与其他玩家进行对战。";
                TCGClient.getInstance().mainGroup.addElement(_local1);
            };
            if (param["reason"] == "guide_lose"){
                CombatConsole.getInstance().addActionList([15, [ChatWindowMgr.getInstance().addSystemContent, "战役失败。"]]);
            } else {
                CombatConsole.getInstance().addActionList([15, [ChatWindowMgr.getInstance().addSystemContent, "战役完成。"]]);
            };
            CombatConsole.getInstance().addActionList([50, [CombatConsole.getInstance().showDuelEndWindow, param]]);
            var arr:* = [50, [TCGClient.getInstance().showGuideMapWindow], [this.guideClean], [CombatConsole.getInstance().clearConsole], [GuideSystem.getInstance().resetCurrentSection]];
            if (((UserObject.isNewUser) && ((GuideSystem.getInstance().currentSection == 1)))){
                arr.splice(3, 0, [showTip]);
            };
            CombatConsole.getInstance().addActionList(arr);
        }
        public function leaveGuide():void{
            ChatWindowMgr.getInstance().addSystemContent("战役中断。");
            CombatConsole.getInstance().enableActionList = false;
            TCGClient.getInstance().callLater(this.guideClean);
            TCGClient.getInstance().showGuideMapWindow();
            CombatConsole.getInstance().clearConsole();
            GuideSystem.getInstance().resetCurrentSection();
        }
        public function resetCurrentSection():void{
            this.currentSection = 0;
        }
        public function doStep(_arg1:int, _arg2:int):void{
            if (GuideFunctions[((("guide" + _arg1.toString()) + "Func") + _arg2.toString())] != null){
                var _local3 = GuideFunctions;
                _local3[((("guide" + _arg1.toString()) + "Func") + _arg2.toString())]();
            };
            if (_arg2 != 0){
                CombatConsole.getInstance().addActionList([50, [this._doStep, _arg1, _arg2]]);
            } else {
                this._doStep(_arg1, _arg2);
                CombatConsole.getInstance().addActionList([15, [TCGClient.getInstance().enterCombatStage], [CombatStage.getInstance().addEffect.end]]);
            };
        }
        private function _doStep(_arg1:int, _arg2:int):void{
            this.buildStepConfig(_arg1, _arg2);
            this.enableActionList(false);
            this.doProgress();
        }
        private function buildStepConfig(_arg1:int, _arg2:int):void{
            var _local4:int;
            var _local5:Object;
            var _local6:Object;
            var _local7:String;
            this.currentStepConfig = new Array();
            if (_arg2 < this.startStep){
                return;
            };
            var _local3:Array = GuideLib.guideFlashConfig[_arg1][_arg2];
            if (_local3){
                _local4 = 0;
                while (_local4 < _local3.length) {
                    _local5 = (_local3[_local4] as Object);
                    _local6 = new Object();
                    for (_local7 in _local5) {
                        _local6[_local7] = _local5[_local7];
                    };
                    GuideLib.analyzeSpecialInfo(_local6);
                    this.currentStepConfig.push(_local6);
                    _local4++;
                };
            };
        }
        private function enableActionList(_arg1:Boolean):void{
            CombatConsole.getInstance().enableActionList = _arg1;
            CombatConsole.getInstance().setOperationMenuFlag("guidePlaying", !(_arg1));
        }
        private function doProgress():void{
            if (!this.guideWindow){
                return;
            };
            if (this.currentStepConfig.length == 0){
                this.enableActionList(true);
                return;
            };
            this.doSubStep(this.currentStepConfig.shift());
        }
        private function doSubStep(_arg1:Object):void{
            var _local2:*;
            switch (_arg1["operation"]){
                case "prologue":
                    switch (_arg1["extra_info"]){
                        case "1":
                            _local2 = new GuidePrologueWindow1();
                            break;
                        case "3":
                            _local2 = new GuidePrologueWindow3();
                            break;
                        case "4":
                            _local2 = new GuidePrologueWindow4();
                            break;
                        case "4_2":
                            _local2 = new GuidePrologueWindow4_2();
                            break;
                        case "5":
                            _local2 = new GuidePrologueWindow5();
                            break;
                        case "7":
                            _local2 = new GuidePrologueWindow7();
                            break;
                        case "8":
                            _local2 = new GuidePrologueWindow8();
                            break;
                    };
                    break;
                case "talk":
                    _local2 = this.guideAllTypeWindow["talk"];
                    if (_local2 == null){
                        _local2 = new GuideTalkWindow();
                        this.guideAllTypeWindow["talk"] = _local2;
                    };
                    _local2.stepInfo = _arg1;
                    break;
                case "tip":
                    _local2 = this.guideAllTypeWindow["tip"];
                    if (_local2 == null){
                        _local2 = new GuideTipWindow();
                        this.guideAllTypeWindow["tip"] = _local2;
                    };
                    _local2.stepInfo = _arg1;
                    break;
                case "message":
                    _local2 = this.guideAllTypeWindow["message"];
                    if (_local2 == null){
                        _local2 = new GuideMessageWindow();
                        this.guideAllTypeWindow["message"] = _local2;
                    };
                    _local2.stepInfo = _arg1;
                    break;
                case "mouseSign":
                    _local2 = this.guideAllTypeWindow["mouseSign"];
                    if (_local2 == null){
                        _local2 = new GuideMouseSign();
                        this.guideAllTypeWindow["mouseSign"] = _local2;
                    };
                    _local2.stepInfo = _arg1;
                    break;
                case "arrowSign":
                    _local2 = this.guideAllTypeWindow["arrowSign"];
                    if (_local2 == null){
                        _local2 = new GuideArrowSign();
                        this.guideAllTypeWindow["arrowSign"] = _local2;
                    };
                    _local2.stepInfo = _arg1;
                    break;
                default:
                    throw (new Error("flash_guide 表中类型配置出错"));
            };
            this.guideWindow.addElement(_local2);
            if (_arg1["auto_end"] == "true"){
                this.doProgress();
            } else {
                _local2.addEventListener("finishTask", this.windowFinishTask);
            };
        }
        private function windowFinishTask(_arg1:Event):void{
            var _local2:* = _arg1.currentTarget;
            _local2.removeEventListener("finishTask", this.windowFinishTask);
            this.doProgress();
        }
        public function hideAll():void{
            if (this.guideAllTypeWindow.talk){
                this.guideAllTypeWindow.talk.removeSelf();
            };
            if (this.guideAllTypeWindow.tip){
                this.guideAllTypeWindow.tip.removeSelf();
            };
            if (this.guideAllTypeWindow.mouseSign){
                if (this.guideAllTypeWindow.mouseSign.parent){
                    this.guideWindow.removeElement(this.guideAllTypeWindow.mouseSign);
                };
            };
            if (this.guideAllTypeWindow.arrowSign){
                if (this.guideAllTypeWindow.arrowSign.parent){
                    this.guideWindow.removeElement(this.guideAllTypeWindow.arrowSign);
                };
            };
            if (this.guideLineWindow){
                this.guideLineWindow.removeSelf();
            };
        }
        public function getPosById(_arg1:String){
            if (_arg1.length < 1){
                return (_arg1);
            };
            if (_arg1.charAt(0) != "@"){
                return (_arg1);
            };
            _arg1 = _arg1.substr(1);
            switch (_arg1){
                case "hp_down_x":
                    return (182);
                case "hp_down_y":
                    return (731);
                case "hp_up_x":
                    return (1103);
                case "hp_up_y":
                    return (40);
                case "food_down_x":
                    return (15);
                case "food_down_y":
                    return (657);
                case "hand_button_x_1":
                    return (314);
                case "hand_button_x_6":
                    return (908);
                case "hand_star_x_1":
                    return (266);
                case "hand_star_y":
                    return (626);
                case "hand_button_y":
                    return (670);
                case "hand_cast_y":
                    return (710);
                case "hand_set_y":
                    return (746);
                case "attack_x":
                    return (176);
                case "attack_y":
                    return (319);
                case "end_x":
                    return (1096);
                case "end_y":
                    return (319);
                case "grave_down_x":
                    return (1147);
                case "grave_down_y":
                    return (450);
                case "grave_up_x":
                    return (1026);
                case "grave_up_y":
                    return (77);
                case "deck_up_x":
                    return ((CombatStage.getInstance().groupWith3D.is3D) ? 253 : 250);
                case "deck_up_y":
                    return ((CombatStage.getInstance().groupWith3D.is3D) ? 72 : 113);
                case "deck_down_x":
                    return ((CombatStage.getInstance().groupWith3D.is3D) ? 132 : 127);
                case "deck_down_y":
                    return ((CombatStage.getInstance().groupWith3D.is3D) ? 455 : 494);
                case "monster_up_1_x":
                    return ((CombatStage.getInstance().groupWith3D.is3D) ? 640 : 640);
                case "monster_up_1_y":
                    return ((CombatStage.getInstance().groupWith3D.is3D) ? 215 : 215);
                case "monster_down_1_x":
                    return ((CombatStage.getInstance().groupWith3D.is3D) ? 640 : 640);
                case "monster_down_1_y":
                    return ((CombatStage.getInstance().groupWith3D.is3D) ? 370 : 370);
                case "magic_down_cast_1_y":
                    return ((CombatStage.getInstance().groupWith3D.is3D) ? 541 : 570);
            };
        }
        public function doUnlockNotice(_arg1:int, _arg2:int):void{
            var content:* = null;
            var stateChangeHandler:* = null;
            var section:* = _arg1;
            var lastCompleteSection:* = _arg2;
            stateChangeHandler = function (_arg1:CustomStateChangeEvent):void{
                var t:* = null;
                var timerHandler:* = null;
                var e:* = _arg1;
                if (e.newState != "loadingWindow"){
                    timerHandler = function (_arg1:TimerEvent):void{
                        t.removeEventListener(TimerEvent.TIMER, timerHandler);
                        t.stop();
                        showNoticeWindow();
                    };
                    TCGClient.getInstance().removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stateChangeHandler);
                    t = new Timer(500, 1);
                    t.addEventListener(TimerEvent.TIMER, timerHandler);
                    t.start();
                };
            };
            var showNoticeWindow:* = function ():void{
                NoticeMgr.getInstance().showNoticeWindow({content:content});
            };
            TCGClient.getInstance().callLater(GuideMapWindow.checkCompleteCurtain, [lastCompleteSection]);
            content = (("解锁新战役#g【" + GuideLib[(("guide" + section) + "Name")]) + "】#n。");
            if (TCGClient.getInstance().customCurrentState == "guideMapWindow"){
                showNoticeWindow();
            } else {
                TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stateChangeHandler);
            };
        }

    }
}//package task_guide 
