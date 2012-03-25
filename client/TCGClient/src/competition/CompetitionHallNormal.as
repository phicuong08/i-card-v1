//Created by Action Script Viewer - http://www.buraks.com/asv
package competition {
    import mx.core.*;
    import mx.events.*;
    import flash.events.*;
    import tool.*;

    public class CompetitionHallNormal extends CompetitionHallNEWindow {

        private var __moduleFactoryInitialized:Boolean = false;

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
            var _local2 = "";
            _local2 = (_local2 + "每天#g 19 点 30 分#n竞赛报名开始，持续半个小时。<br>");
            _local2 = (_local2 + "#g20 点整#n准时开启竞赛，随机分配 8 名玩家到一个竞赛小组。<br>");
            _local2 = (_local2 + "竞赛的小组总数由#g报名玩家总数#n决定。<br>");
            _local2 = (_local2 + "若竞赛开启时你#r不在线上#n，将无法被分配入竞赛小组。<br>");
            _local2 = (_local2 + "取得小组竞赛冠军将获得#g丰厚的奖励#n。");
            tips.textFlow = StringUtils.createTFByHtmlText(_local2);
            startBtn.enabled = false;
        }
        override protected function timerHandler(_arg1:TimerEvent):void{
            var _local2 = "距报名开始还有：";
            var _local3:Date = new Date();
            var _local4:Number = (Date.UTC(_local3.fullYearUTC, _local3.monthUTC, _local3.dateUTC, 19, 30) - Date.UTC(_local3.fullYear, _local3.month, _local3.date, _local3.hours, _local3.minutes, _local3.seconds, _local3.milliseconds));
            _local4 = ((_local4 < -300000)) ? (_local4 + 86400000) : _local4;
            if (_local4 <= 0){
                _local2 = (_local2 + "#g00 时 00 分 00 秒#n");
            } else {
                _local2 = (_local2 + "#g");
                _local3 = new Date(_local4);
                _local2 = (_local2 + (("0" + _local3.hoursUTC).substr(-2) + " 时 "));
                _local2 = (_local2 + (("0" + _local3.minutesUTC).substr(-2) + " 分 "));
                _local2 = (_local2 + (("0" + _local3.secondsUTC).substr(-2) + " 秒#n"));
            };
            leftTimeText.textFlow = StringUtils.createTFByHtmlText(_local2);
        }

    }
}//package competition 
