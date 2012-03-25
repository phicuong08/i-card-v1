//Created by Action Script Viewer - http://www.buraks.com/asv
package task {
    import flash.geom.*;
    import flash.events.*;
    import flash.utils.*;
    import combat_element_script.*;

    public class TaskNoticeScript {

        public static function doStateChangeTaskNoticeScript(_arg1:Object, _arg2:String, _arg3:String):void{
            var _local4:String;
            var _local5:Object;
            var _local6:*;
            for (_local4 in _arg1) {
                _local5 = _arg1[_local4];
                _local6 = TaskNoticeScript[("stateChangeScript" + _local4)];
                if (((_local6) && (!(_local5.complete_flag)))){
                    _local6(_local5, _arg2, _arg3);
                };
            };
        }
        public static function doDuelEndTaskNoticeScript(_arg1:Object, _arg2:Object):void{
            var _local3:String;
            var _local4:Object;
            var _local5:*;
            for (_local3 in _arg1) {
                _local4 = _arg1[_local3];
                _local5 = TaskNoticeScript[("duelEndScript" + _local3)];
                if (((_local5) && (!(_local4.complete_flag)))){
                    _local5(_local4, _arg2);
                };
            };
        }
        private static function addTaskNoticeTimerLater(_arg1:Object, _arg2:Number=1000):void{
            var t:* = null;
            var timerHandler:* = null;
            var noticeInfo:* = _arg1;
            var delay:int = _arg2;
            timerHandler = function (_arg1:TimerEvent):void{
                t.removeEventListener(TimerEvent.TIMER, timerHandler);
                t.stop();
                if (TCGClient.getInstance().customCurrentState != "loginWindow"){
                    TaskMgr.getInstance().showTaskNoticeWindow(noticeInfo);
                };
            };
            t = new Timer(delay, 1);
            t.addEventListener(TimerEvent.TIMER, timerHandler);
            t.start();
        }
        private static function stateChangeScript100(_arg1:Object, _arg2:String, _arg3:String):void{
            var _local4:String;
            if (_arg2 == "mainMenu"){
                _local4 = "你有一个尚未完成的主线任务，可点击任务按钮查看。完成主线任务有助于快速熟悉游戏，并可获得丰厚奖励。";
                addTaskNoticeTimerLater({
                    id:"100_1",
                    content:_local4,
                    guideLine:new Point(1063, 758)
                });
            };
        }
        private static function duelEndScript110(_arg1:Object, _arg2:Object):void{
            var _local3:String;
            if (((!(_arg2.duel_result)) && (_arg2.is_guide))){
                _local3 = "相比前面的战役，该战役有一定难度。但我军实力在黄巾军之上，请继续尝试。若对战斗规则有疑惑，可以回顾前面的战役。";
                addTaskNoticeTimerLater({
                    id:"110_1",
                    content:_local3
                });
            };
        }
        private static function stateChangeScript120(_arg1:Object, _arg2:String, _arg3:String):void{
            var _local4:String;
            var _local5:String;
            var _local6:String;
            switch (UserObject.camp){
                case "曹操":
                    _local5 = "典韦";
                    _local6 = "李典";
                    break;
                case "刘备":
                    _local5 = "青龙偃月刀";
                    _local6 = "丈八蛇矛";
                    break;
                case "孙权":
                    _local5 = "长江";
                    _local6 = "战船修补";
                    break;
            };
            if (_arg2 == "mainMenu"){
                if (((_arg1.buy_card1) && (_arg1.buy_card2))){
                    _local4 = "所需的卡片已经买到，现在进入组卡界面，把它们加入到我们使用的卡组中。";
                    addTaskNoticeTimerLater({
                        id:"120_2",
                        content:_local4
                    });
                } else {
                    _local4 = "当前任务是#o“备战”#n，为完成此任务，需要首先到商店购买任务需要的卡片。";
                    addTaskNoticeTimerLater({
                        id:"120_1",
                        content:_local4
                    });
                };
            } else {
                if (_arg2 == "shopWindow"){
                    if (((!(_arg1.buy_card1)) || (!(_arg1.buy_card2)))){
                        _local4 = (((("在#o“卡片”#n标签分页中找到卡片#g【" + _local5) + "】#n与#g【") + _local6) + "】#n，将它们放入预购栏#g(单击卡片可将其加入预购栏)#n，再点击#o购买#n按钮即可成功购买卡片。");
                        addTaskNoticeTimerLater({
                            id:"120_3",
                            content:_local4
                        });
                    };
                } else {
                    if (_arg2 == "judgeCard"){
                        if (((_arg1.buy_card1) && (_arg1.buy_card2))){
                            _local4 = (((("在右侧的仓库中找到#g【" + _local5) + "】#n与#g【") + _local6) + "】#n，将它们拖动到左侧的卡组中，并保存下新的卡组配置。");
                            addTaskNoticeTimerLater({
                                id:"120_4",
                                content:_local4
                            });
                        };
                    };
                };
            };
        }
        private static function stateChangeScript140(_arg1:Object, _arg2:String, _arg3:String):void{
            var _local4:String;
            if (_arg2 == "mainMenu"){
                _local4 = "当前任务是“不打不相识”，点击对战可进入对战大厅。";
                addTaskNoticeTimerLater({
                    id:"140_1",
                    content:_local4
                });
            } else {
                if (_arg2 == "roomsList"){
                    _local4 = "可以选择未满的房间点击#o“参战”#n，或直接使用右下方的#o“快速进入”#n功能以快速开始 PVP 战斗。";
                    addTaskNoticeTimerLater({
                        id:"140_2",
                        content:_local4
                    });
                };
            };
        }

    }
}//package task 
