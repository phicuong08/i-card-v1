//Created by Action Script Viewer - http://www.buraks.com/asv
package competition {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import normal_window.*;
    import flash.system.*;
    import flash.media.*;
    import spark.layouts.*;
    import custom_effect.*;
    import flash.utils.*;
    import combat_element_script.*;
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

    public class CompetitionHall extends Group {

        private var __moduleFactoryInitialized:Boolean = false;
        private var currentDisplayWindow:CompetitionHallStateWindow;
        private var refreshTimer:Timer;

        public function CompetitionHall(){
            this.refreshTimer = new Timer(10000);
            super();
            this.width = 0x0500;
            this.height = 800;
            this.layout = this._CompetitionHall_BasicLayout1_c();
            this.addEventListener("remove", this.___CompetitionHall_Group1_remove);
            this.addEventListener("creationComplete", this.___CompetitionHall_Group1_creationComplete);
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
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.askHallData();
            BasicOperationBar.getInstance().registerLeaveFunc(this.leaveFunc);
            this.refreshTimer.addEventListener(TimerEvent.TIMER, this.askHallData);
            this.refreshTimer.start();
        }
        private function askHallData(_arg1:TimerEvent=null):void{
            LuaAgent.getInstance().run("u.competition_mgr:get_competition_hall_info()");
        }
        private function addRefreshWindowByType(_arg1:String, _arg2:Object):void{
            if (((this.currentDisplayWindow) && (!((this.currentDisplayWindow.windowType == _arg1))))){
                this.currentDisplayWindow.removeSelf();
                this.currentDisplayWindow = null;
            };
            if (!this.currentDisplayWindow){
                this.currentDisplayWindow = this.createStateWindowByType(_arg1);
                addElement(this.currentDisplayWindow);
            };
            this.currentDisplayWindow.setCompetitionInfo(_arg2);
        }
        private function createStateWindowByType(_arg1:String):CompetitionHallStateWindow{
            switch (_arg1){
                case "normal":
                    return (new CompetitionHallNormal());
                case "enroll":
                    return (new CompetitionHallEnroll());
                default:
                    return (new CompetitionHallCompete());
            };
        }
        public function setCompetitionHallInfo(_arg1:Object):void{
            if (_arg1.is_competing){
                this.addRefreshWindowByType("compete", _arg1);
            } else {
                if (_arg1.is_enrolling){
                    this.addRefreshWindowByType("enroll", _arg1);
                } else {
                    this.addRefreshWindowByType("normal", _arg1);
                };
            };
        }
        protected function group1_removeHandler(_arg1:FlexEvent):void{
            BasicOperationBar.getInstance().clearLeaveFunc(this.leaveFunc);
            this.refreshTimer.removeEventListener(TimerEvent.TIMER, this.askHallData);
            this.refreshTimer.stop();
            var _local2:FakeFadeEffect = new FakeFadeEffect(this, 500, 1, 0);
            _local2.play();
        }
        protected function leaveFunc():void{
            if (parent){
                LuaAgent.getInstance().run("u.competition_mgr:leave_hall()");
            };
        }
        private function _CompetitionHall_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CompetitionHall_Group1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler(_arg1);
        }
        public function ___CompetitionHall_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }

    }
}//package competition 
