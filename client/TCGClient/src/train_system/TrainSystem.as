//Created by Action Script Viewer - http://www.buraks.com/asv
package train_system {
    import flash.events.*;
    import custom_control1.*;
    import chat_system.*;
    import combat_element.*;
    import combat_element_script.*;

    public class TrainSystem extends EventDispatcher {

        private static var _instance:TrainSystem = new (TrainSystem)();
;

        public var isTraining:Boolean = false;
        private var waitWatchTrainWindow:WaitWatchTrainWindow;
        public var currentTrainSection:int;

        public function TrainSystem(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():TrainSystem{
            return (_instance);
        }

        public function trainClean():void{
            this.isTraining = false;
        }
        public function trainBegin(_arg1:int, _arg2:String):Array{
            CombatStage.getInstance().cleanStage();
            var _local3 = (((("return u.train_mgr:start_train(" + _arg1) + ", \"") + _arg2) + "\")");
            var _local4:Array = LuaAgent.getInstance().run(_local3);
            if (_local4[1]){
                this.isTraining = true;
                this.currentTrainSection = _arg1;
                ChatWindowMgr.getInstance().addSystemContent("进入训练。(对战房间中也可以和 NPC 进行训练战斗，若有其他玩家加入房间，则将直接转入 PVP 对战！)");
                CombatConsole.getInstance().addActionList([1300, [TCGClient.getInstance().enterCombatStage]]);
                CombatConsole.getInstance().addActionList([1500, [CombatStageCommonEffectMgr.showTrainBeginEffect]]);
            };
            return (_local4);
        }
        public function leaveTrain():void{
            this.trainClean();
            ChatWindowMgr.getInstance().addSystemContent("退出训练。");
            CombatConsole.getInstance().enableActionList = false;
            TCGClient.getInstance().enterTrainListWindow();
            CombatConsole.getInstance().clearConsole();
        }
        public function trainEnd(_arg1:Object, _arg2:Boolean=false):void{
            this.trainClean();
            if (_arg1["duel_result"]){
                CombatConsole.getInstance().addActionList([15, [ChatWindowMgr.getInstance().addSystemContent, "训练战获胜。"]]);
            } else {
                CombatConsole.getInstance().addActionList([15, [ChatWindowMgr.getInstance().addSystemContent, "训练战失败。"]]);
            };
            CombatConsole.getInstance().addActionList([50, [CombatConsole.getInstance().showDuelEndWindow, _arg1]]);
            if (_arg2){
                CombatConsole.getInstance().addActionList([50, [TCGClient.getInstance().enterRoom], [CombatConsole.getInstance().clearConsole]]);
            } else {
                CombatConsole.getInstance().addActionList([50, [TCGClient.getInstance().enterTrainListWindow], [CombatConsole.getInstance().clearConsole]]);
            };
        }
        public function waitWatchTrain():void{
            if (!this.waitWatchTrainWindow){
                this.waitWatchTrainWindow = new WaitWatchTrainWindow();
            };
            if (!this.waitWatchTrainWindow.parent){
                TCGClient.getInstance().mainGroup.addElement(this.waitWatchTrainWindow);
            };
        }
        public function stopWatchTrain(_arg1:String):void{
            CombatConsole.getInstance().enableActionList = false;
            TCGClient.getInstance().enterWindowByCustomCurrentState(_arg1);
            CombatConsole.getInstance().clearConsole();
            if (this.waitWatchTrainWindow){
                this.waitWatchTrainWindow.removeSelf();
                this.waitWatchTrainWindow = null;
            };
        }
        public function watchTrainEnd(_arg1:String):void{
            CombatConsole.getInstance().showMessage("训练结束");
            CombatConsole.getInstance().addActionList([50, [TCGClient.getInstance().enterWindowByCustomCurrentState, _arg1], [CombatConsole.getInstance().clearConsole]]);
        }
        public function trainUserLeave(_arg1:String):void{
            CombatConsole.getInstance().showMessage("玩家退出");
            CombatConsole.getInstance().addActionList([50, [TCGClient.getInstance().enterWindowByCustomCurrentState, _arg1], [CombatConsole.getInstance().clearConsole]]);
        }
        public function watchTrain(_arg1:int):void{
            this.currentTrainSection = _arg1;
            if (this.waitWatchTrainWindow){
                this.waitWatchTrainWindow.removeSelf();
                this.waitWatchTrainWindow = null;
            };
            CombatStage.getInstance().cleanStage();
            TCGClient.getInstance().enterCombatStage();
            CombatConsole.getInstance().addActionList([1500, [CombatStageCommonEffectMgr.showTrainBeginEffect]]);
        }
        public function getTrainHeadInfo(_arg1=null):Array{
            var _local2:Object = new Object();
            var _local3:Object = new Object();
            _arg1 = (_arg1) ? _arg1 : this.currentTrainSection;
            switch (_arg1){
                case 1:
                    _local2.headIcon = "source/cardImages/200.jpg";
                    _local2.tooltip = "程远志";
                    _local2.name = "程远志";
                    break;
                case 2:
                    _local2.headIcon = "source/cardImages/190.jpg";
                    _local2.tooltip = "张角";
                    _local2.name = "张角";
                    break;
                case 3:
                    _local2.headIcon = "source/cardImages/601.jpg";
                    _local2.tooltip = "董卓";
                    _local2.name = "董卓";
                    break;
                case 4:
                    _local2.headIcon = "source/cardImages/46.jpg";
                    _local2.tooltip = "追随玄德的义军";
                    _local2.name = "追随玄德的义军";
                    break;
                case 5:
                    _local2.headIcon = "source/cardImages/41.jpg";
                    _local2.tooltip = "刘备";
                    _local2.name = "刘备";
                    break;
                case 6:
                    _local2.headIcon = "source/cardImages/7.jpg";
                    _local2.tooltip = "曹操";
                    _local2.name = "曹操";
                    break;
                case 7:
                    _local2.headIcon = "source/cardImages/81.jpg";
                    _local2.tooltip = "孙坚";
                    _local2.name = "孙坚";
                    break;
                case 9:
                    _local2.headIcon = "source/cardImages/655.jpg";
                    _local2.tooltip = "臧霸";
                    _local2.name = "臧霸";
                    break;
                case 10:
                    _local2.headIcon = "source/cardImages/83.jpg";
                    _local2.tooltip = "孙策";
                    _local2.name = "孙策";
                    break;
                case 11:
                    _local2.headIcon = "source/cardImages/315.jpg";
                    _local2.tooltip = "荀彧";
                    _local2.name = "荀彧";
                    break;
                default:
                    _local2.headIcon = MyImage.defaultImage;
                    _local2.tooltip = "未知";
                    _local2.name = "未知";
            };
            _local3.headIcon = (("source/userHead/" + UserObject.headIcon) + ".jpg");
            _local3.tooltip = "这个是我~";
            _local3.name = UserObject.name;
            return ([_local2, _local3]);
        }
        public function getTrainName(_arg1:int):String{
            switch (_arg1){
                case 1:
                    return ("黄巾徒众");
                case 2:
                    return ("黄天当立");
                case 3:
                    return ("董卓进京");
                case 4:
                    return ("义军的团结");
                case 5:
                    return ("桃园结义");
                case 6:
                    return ("陈留起兵");
                case 7:
                    return ("破虏将军");
                case 8:
                    return ("生存模式");
                case 9:
                    return ("八健将");
                case 10:
                    return ("霸王再临");
                case 11:
                    return ("上兵伐谋");
                case 12:
                    return ("深沟高垒");
                case 13:
                    return ("狼行天下");
                case 14:
                    return ("袁谭");
                case 15:
                    return ("袁尚");
                case 16:
                    return ("关公战关公");
                default:
                    return ("未知");
            };
        }

    }
}//package train_system 
