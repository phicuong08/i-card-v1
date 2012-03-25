//Created by Action Script Viewer - http://www.buraks.com/asv
package competition {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import flash.utils.*;
    import combat_element_script.*;
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

    public class CompetitionHallEnroll extends CompetitionHallNEWindow {

        private var __moduleFactoryInitialized:Boolean = false;
        private var creationHasComplete:Boolean = false;

        public function CompetitionHallEnroll(){
            this.addEventListener("creationComplete", this.___CompetitionHallEnroll_CompetitionHallNEWindow1_creationComplete);
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
        override protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            var _local2 = "";
            _local2 = (_local2 + "竞赛已经#r开始报名！#n请#g点击报名按钮#n报名参赛。<br>");
            _local2 = (_local2 + "#g20 点整#n准时开启竞赛，随机分配 8 名玩家到一个竞赛小组。<br>");
            _local2 = (_local2 + "竞赛的小组总数由#g报名玩家总数#n决定。<br>");
            _local2 = (_local2 + "若竞赛开启时你#r不在线上#n，将无法被分配入竞赛小组。<br>");
            _local2 = (_local2 + "取得小组竞赛冠军将获得#g丰厚的奖励#n。");
            tips.textFlow = StringUtils.createTFByHtmlText(_local2);
            this.displayCompetitionInfo();
        }
        override public function setCompetitionInfo(_arg1:Object):void{
            super.setCompetitionInfo(_arg1);
            this.displayCompetitionInfo();
        }
        override public function get windowType():String{
            return ("enroll");
        }
        private function displayCompetitionInfo():void{
            var _local1:String;
            var _local2:Date;
            var _local3:Number;
            if (((this.creationHasComplete) && (competitionInfo))){
                _local1 = "距报名结束还有：";
                _local2 = new Date();
                _local3 = (Date.UTC(_local2.fullYearUTC, _local2.monthUTC, _local2.dateUTC, 20, 0) - Date.UTC(_local2.fullYear, _local2.month, _local2.date, _local2.hours, _local2.minutes, _local2.seconds, _local2.milliseconds));
                _local3 = ((_local3 < -300000)) ? (_local3 + 86400000) : _local3;
                if (_local3 <= 0){
                    _local1 = (_local1 + "#r00 时 00 分 00 秒#n");
                } else {
                    _local1 = (_local1 + ((_local3 > 300000)) ? "#g" : "#r");
                    _local2 = new Date(_local3);
                    _local1 = (_local1 + (("0" + _local2.hoursUTC).substr(-2) + " 时 "));
                    _local1 = (_local1 + (("0" + _local2.minutesUTC).substr(-2) + " 分 "));
                    _local1 = (_local1 + (("0" + _local2.secondsUTC).substr(-2) + " 秒#n"));
                };
                _local1 = (_local1 + (("<br>已报名玩家：#g" + competitionInfo.enroll_user_num) + "#n 人，"));
                _local1 = (_local1 + (competitionInfo.is_user_enrolled) ? "#g你已经成功报名。#n" : "#r你还未报名参赛！#n");
                leftTimeText.textFlow = StringUtils.createTFByHtmlText(_local1);
            };
        }
        override protected function timerHandler(_arg1:TimerEvent):void{
            this.displayCompetitionInfo();
        }
        override protected function startBtn_clickHandler(_arg1:MouseEvent):void{
            LuaAgent.getInstance().run("u.competition_mgr:try_enroll_competition()");
        }
        public function ___CompetitionHallEnroll_CompetitionHallNEWindow1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }

    }
}//package competition 
