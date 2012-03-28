//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {

    public class MissionPracticeData extends Base {

        private var _practiceInfo:Array;
        private var _startPractice:Array;
        private var _cancelPractice:Array;
        private var _quickly:Array;
        private var _notify:Array;
        private var _continuePracticeInfo:Array;
        private var _continuePractice:Array;
        public var SetAutoSale:Array;
        public var CancelAutoSale:Array;

        public function get practiceInfo():Array{
            return (this._practiceInfo);
        }
        public function get startPractice():Array{
            return (this._startPractice);
        }
        public function get cancelPractice():Array{
            return (this._cancelPractice);
        }
        public function get getQuickly():Array{
            return (this._quickly);
        }
        public function get getNotify():Array{
            return (this._notify);
        }
        public function get continuePracticeInfo():Array{
            return (this._continuePracticeInfo);
        }
        public function get continuePractice():Array{
            return (this._continuePractice);
        }
        public function get_practice_info(_arg1:Array):void{
            this._practiceInfo = _arg1;
        }
        public function start_practice(_arg1:Array):void{
            this._startPractice = _arg1;
        }
        public function cancel_practice(_arg1:Array):void{
            this._cancelPractice = _arg1;
        }
        public function quickly(_arg1:Array):void{
            this._quickly = _arg1;
        }
        public function notify(_arg1:Array):void{
            this._notify = _arg1;
        }
        public function get_continue_practice_info(_arg1:Array):void{
            this._continuePracticeInfo = _arg1;
        }
        public function continue_practice(_arg1:Array):void{
            this._continuePractice = _arg1;
        }
        public function set_auto_sale_item(_arg1:Array):void{
            this.SetAutoSale = _arg1;
        }
        public function cancel_auto_sale_item(_arg1:Array):void{
            this.CancelAutoSale = _arg1;
        }

    }
}//package com.datas 
