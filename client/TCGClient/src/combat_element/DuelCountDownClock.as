//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import flash.events.*;
    import custom_control1.*;
    import flash.utils.*;

    public class DuelCountDownClock extends CountdownClock {

        protected var roundMillisecond:int;
        protected var roundTimeCoundDown:RoundTimeCountDown;
        protected var _isUser:Boolean = false;

        public function DuelCountDownClock(){
            this.roundTimeCoundDown = new RoundTimeCountDown();
            super();
        }
        public function set isUser(_arg1:Boolean):void{
            this._isUser = _arg1;
        }
        public function get isUser():Boolean{
            return (this._isUser);
        }
        override public function clearClock():void{
            super.clearClock();
            this.roundTimeCoundDown.removeSelf();
        }
        override public function stopClock(_arg1:int=-1):void{
            super.stopClock(_arg1);
            this.roundTimeCoundDown.removeSelf();
        }
        public function startDuelClock(_arg1:int, _arg2:int):void{
            startClock(_arg1);
            this.roundMillisecond = (_arg2 * 1000);
        }
        override protected function timerHandler(_arg1:TimerEvent=null):void{
            super.timerHandler(_arg1);
            this.setRoundCountDown((this.roundMillisecond - (getTimer() - timerStartTime)));
        }
        protected function setRoundCountDown(_arg1:int):void{
            if (this._isUser){
                _arg1 = ((_arg1 < 0)) ? 0 : _arg1;
                if (_arg1 < 10000){
                    this.roundTimeCoundDown.addToStage();
                    this.roundTimeCoundDown.timeText = int((_arg1 / 1000)).toString();
                } else {
                    this.roundTimeCoundDown.removeSelf();
                };
            };
        }

    }
}//package combat_element 
