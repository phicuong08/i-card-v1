//Created by Action Script Viewer - http://www.buraks.com/asv
package chat_system {
    import flash.events.*;
    import spark.components.*;
    import flashx.textLayout.elements.*;
    import flash.utils.*;

    public class ChatWindowTextArea extends TextArea {

        private static var _skinParts_:Object = {
            scroller:false,
            textDisplay:false
        };

        public var currentDisplayMode:String = "all";
        protected var updateSBTimer:Timer;
        protected var paragraphInfo:Object;
        protected var _allowUpdateScollerPos:Boolean = true;
        protected var myTxtFlow:TextFlow;

        public function ChatWindowTextArea(){
            this.paragraphInfo = new Object();
            super();
            this.updateSBTimer = new Timer(50);
            this.updateSBTimer.addEventListener(TimerEvent.TIMER, this.timerHandler);
        }
        public function set allowUpdateScollerPos(_arg1:Boolean):void{
            this._allowUpdateScollerPos = _arg1;
            if ((((_arg1 == false)) && (this.updateSBTimer.running))){
                this.updateSBTimer.stop();
            };
        }
        public function reset():void{
            this.paragraphInfo = new Object();
            this.resetMyTxtFlow();
        }
        protected function resetMyTxtFlow():void{
            this.myTxtFlow = new TextFlow();
            this.myTxtFlow.paddingBottom = 5;
            textFlow = this.myTxtFlow;
            var _local1:ParagraphElement = new ParagraphElement();
            var _local2:LinkElement = new LinkElement();
            _local1.addChild(_local2);
            this.myTxtFlow.addChild(_local1);
        }
        protected function getModeParagraphList(_arg1:String):Array{
            if (!this.paragraphInfo[_arg1]){
                this.paragraphInfo[_arg1] = new Array();
            };
            return (this.paragraphInfo[_arg1]);
        }
        protected function addPEInParagraphList(_arg1:String, _arg2:ParagraphElement):void{
            var _local5:int;
            var _local3 = 50;
            var _local4:Array = this.getModeParagraphList(_arg1);
            if (_local4.length > 300){
                if (_arg1 == this.currentDisplayMode){
                    this.invalidateDisplayList();
                    _local5 = 0;
                    while (_local5 < _local3) {
                        this.myTxtFlow.removeChildAt(1);
                        _local5++;
                    };
                    this.validateDisplayList();
                };
                _local4.splice(0, _local3);
            };
            if (_arg1 == this.currentDisplayMode){
                this.addPEInDisplayList(_arg2);
            };
            _local4.push(_arg2);
        }
        public function changeDisplayMode(_arg1:String):void{
            if (this.currentDisplayMode == _arg1){
                return;
            };
            this.currentDisplayMode = _arg1;
            this.resetMyTxtFlow();
            this.addAllPEByMode(_arg1);
        }
        protected function addAllPEByMode(_arg1:String):void{
            var _local2:Array = this.getModeParagraphList(_arg1);
            var _local3:int = _local2.length;
            var _local4:int;
            while (_local4 < _local3) {
                this.addPEInDisplayList((_local2[_local4] as ParagraphElement), false);
                _local4++;
            };
            this.updateScrollBar();
        }
        protected function addPEInDisplayList(_arg1:ParagraphElement, _arg2:Boolean=true):void{
            this.myTxtFlow.addChild(_arg1);
            if (_arg2){
                this.updateScrollBar();
            };
        }
        public function addParagraphElementWithChannel(_arg1:ParagraphElement, _arg2:String):void{
            this.addPEInParagraphList("all", _arg1);
            this.addPEInParagraphList(_arg2, _arg1);
        }
        private function updateScrollBar():void{
            if (((this._allowUpdateScollerPos) && (!(this.updateSBTimer.running)))){
                this.updateSBTimer.start();
            };
        }
        private function timerHandler(_arg1:TimerEvent):void{
            if (scroller.verticalScrollBar.value != scroller.verticalScrollBar.maximum){
                scroller.verticalScrollBar.value = scroller.verticalScrollBar.maximum;
            } else {
                this.updateSBTimer.stop();
            };
        }
//        override protected function get skinParts():Object{
//            return (_skinParts_);
//        }

    }
}//package chat_system 
