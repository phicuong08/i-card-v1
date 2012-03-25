//Created by Action Script Viewer - http://www.buraks.com/asv
package task {
    import flash.geom.*;
    import flash.events.*;
    import normal_window.*;
    import combat_element_script.*;
    import notice_system.*;

    public class TaskMgr extends EventDispatcher {

        private static var _instance:TaskMgr = new (TaskMgr)();
;

        private var taskWindow:TaskWindow;
        private var currentTaskListInfo:Object;

        public function TaskMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
            this.reset();
        }
        public static function getInstance():TaskMgr{
            return (_instance);
        }

        public function reset():void{
            this.currentTaskListInfo = new Object();
            TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.stateChangeHandler);
            CombatConsole.getInstance().addEventListener(MyEvent.SHOW_DUEL_END_WINDOW, this.showDuelEndWindowHandler);
            CombatConsole.getInstance().addEventListener(MyEvent.CLEAR_CONSOLE, this.clearConsoleHandler);
            if (BasicOperationBar.getInstance().taskBtn){
                BasicOperationBar.getInstance().taskBtn.playFlashEffect(false);
            };
        }
        private function stateChangeHandler(_arg1:CustomStateChangeEvent):void{
            var fuc:* = null;
            var e:* = _arg1;
            fuc = function ():void{
                TaskNoticeScript.doStateChangeTaskNoticeScript(currentTaskListInfo, e.newState, e.oldState);
            };
            TCGClient.getInstance().callLater(fuc);
        }
        private function clearConsoleHandler(_arg1:MyEvent):void{
            var _local2:CombatConsole = _arg1.message.oldInstance;
            var _local3:CombatConsole = _arg1.message.newInstance;
            _local2.removeEventListener(MyEvent.SHOW_DUEL_END_WINDOW, this.showDuelEndWindowHandler);
            _local2.removeEventListener(MyEvent.CLEAR_CONSOLE, this.clearConsoleHandler);
            _local3.addEventListener(MyEvent.SHOW_DUEL_END_WINDOW, this.showDuelEndWindowHandler);
            _local3.addEventListener(MyEvent.CLEAR_CONSOLE, this.clearConsoleHandler);
        }
        private function showDuelEndWindowHandler(_arg1:MyEvent):void{
            TaskNoticeScript.doDuelEndTaskNoticeScript(this.currentTaskListInfo, _arg1.message);
        }
        public function showTaskNoticeWindow(_arg1:Object):void{
            NoticeMgr.getInstance().showNoticeWindow(_arg1);
        }
        public function showTaskWindow():void{
            if (!this.taskWindow){
                this.taskWindow = new TaskWindow();
                this.taskWindow.x = 355;
                this.taskWindow.y = 220;
            };
            if (!this.taskWindow.parent){
                TCGClient.getInstance().mainGroup.addElement(this.taskWindow);
                NoticeMgr.getInstance().removeAllNoticeWindow();
            };
        }
        public function hideTaskWindow():void{
            if (this.taskWindow){
                this.taskWindow.removeSelf();
            };
        }
        public function autoShowHideTaskWindow():void{
            var _local1:Array;
            if (((this.taskWindow) && (this.taskWindow.parent))){
                this.hideTaskWindow();
            } else {
                this.showTaskWindow();
                _local1 = LuaAgent.getInstance().run("return u.task_mgr:get_all_task_flash_info()");
                this.setAllTaskInfo(_local1[1]);
            };
        }
        public function setAllTaskInfo(_arg1:Object):void{
            this.currentTaskListInfo = _arg1;
            if (((this.taskWindow) && (this.taskWindow.parent))){
                this.taskWindow.setAllTaskInfo(_arg1);
            };
        }
        public function doTaskBonus(_arg1:int):void{
            LuaAgent.getInstance().run((("return u.task_mgr:do_task_bonus(" + _arg1) + ")"));
        }
        public function taskAdd(_arg1:int, _arg2:Object):void{
            var _local3:Object;
            var _local4:String;
            var _local5:String;
            if (_arg2[_arg1.toString()].type != "daily"){
                TaskWindow.needDisplayTaskId = _arg1;
                TaskWindow.displayTaskType = _arg2[_arg1.toString()].type;
                _local3 = TaskDescScript.getTaskDescScript(_arg2[_arg1.toString()], true);
                if (_local3){
                    _local4 = _local3.name;
                    _local5 = (("获得新任务#o【" + _local4) + "】#n。#g(可打开任务界面查看任务详细信息)#n");
                    if (((this.taskWindow) && (this.taskWindow.parent))){
                        this.showTaskNoticeWindow({
                            content:_local5,
                            disableActionList:true
                        });
                    } else {
                        BasicOperationBar.getInstance().taskBtn.playFlashEffect(true);
                        this.showTaskNoticeWindow({
                            content:_local5,
                            guideLine:new Point(1063, 758),
                            disableActionList:true
                        });
                    };
                };
            };
            this.setAllTaskInfo(_arg2);
        }
        public function taskUpdate(_arg1:int, _arg2:Object):void{
            this.setAllTaskInfo(_arg2);
        }
        public function taskComplete(_arg1:int, _arg2:Array, _arg3:Object):void{
            var _local5:String;
            var _local6:String;
            var _local4:Object = TaskDescScript.getTaskDescScript(_arg3[_arg1.toString()], true);
            if (_local4){
                _local5 = TaskDescScript.getTaskDescScript(_arg3[_arg1.toString()], true).name;
                _local6 = (("完成任务#o【" + _local5) + "】#n。");
                this.showTaskNoticeWindow({content:_local6});
                this.setAllTaskInfo(_arg3);
                TaskCompleteScript.doTaskCompleteScript(_arg1, _arg2);
            };
        }
        public function taskBonus(_arg1:int, _arg2:Object, _arg3:Object):void{
            this.setAllTaskInfo(_arg3);
        }
        public function addNewTask(_arg1:Array):void{
            var _local2:int;
            for each (_local2 in _arg1) {
                LuaAgent.getInstance().run((("u.task_mgr:add_task(" + _local2) + ")"));
            };
        }
        public function getUnfinishedTaskDesc():String{
            var _local3:Object;
            var _local1:Array = new Array();
            var _local2:Object = {
                main_line:0,
                branch:0,
                daily:0
            };
            for each (_local3 in this.currentTaskListInfo) {
                if (!_local3.complete_flag){
                    _local2[_local3.type] = (_local2[_local3.type] + 1);
                };
            };
            if (_local2["main_line"]){
                _local1.push((("未完成的“主线任务” #r" + _local2["main_line"]) + "#n 个。"));
            };
            if (_local2["branch"]){
                _local1.push((("未完成的“支线任务” #r" + _local2["branch"]) + "#n 个。"));
            };
            if (_local2["daily"]){
                _local1.push((("未完成的“日常任务” #r" + _local2["daily"]) + "#n 个。"));
            };
            return (_local1.join("<br>"));
        }

    }
}//package task 
