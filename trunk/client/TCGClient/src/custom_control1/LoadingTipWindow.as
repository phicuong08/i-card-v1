//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import flash.utils.*;
    import flash.text.*;
    import flash.events.*;

    public class LoadingTipWindow extends TextField {

        protected static var currentIndex:int = 0;
        protected static var startTime:int = -1;
        protected static var currentState:String;

        protected var tipArray:Array;
        protected var stayDuration:int = 5000;
        protected var fadeOutDuration:int = 1000;
        protected var fadeInDuration:int = 1000;

        public function LoadingTipWindow(){
            this.tipArray = ["与普通卡牌游戏不同，在这里你可以挑选喜欢的卡，设计个性化的战术。", "“擂鼓”之后武将才能攻击。", "“鸣金”会结束自己的回合，轮到对方操作。", "卡组的卡片如果全部抽光，也算作失败。", "点击聊天栏里的玩家名称，可以选择私聊、交易、对战等。", "与银色武将不同，金色武将拥有自己的特殊技能。", "武力在攻击阵型时生效，智力在防守阵型时生效。", "游戏规则在“新手战役”中有生动、详尽的展现。", "游戏中获得的积分、金币，可以在商店里购买卡片和道具。", "为了比赛的公平，先手玩家第一回合不能进攻。", "武将的“星级”，决定了出战耗费的粮草数。", "某些计策和特殊技能可以让墓地的武将复活。", "“整编”可以让武将返回卡组，同时获得1点粮草。"];
            super();
            this.defaultTextFormat = new TextFormat("宋体", 18, 4294967295, null, null, null, null, null, "center");
            this.width = 640;
            this.selectable = false;
            this.text = this.tipArray[currentIndex];
            this.addEventListener(Event.ADDED_TO_STAGE, this.addToStageHandler);
            this.addEventListener(Event.REMOVED_FROM_STAGE, this.removeFromStageHandler);
        }
        protected function setText():void{
            var _local1:int = int((Math.random() * this.tipArray.length));
            if (_local1 == currentIndex){
                _local1 = (currentIndex + 1);
                if (_local1 >= this.tipArray.length){
                    _local1 = 0;
                };
            };
            currentIndex = _local1;
            this.text = this.tipArray[currentIndex];
        }
        protected function addToStageHandler(_arg1:Event):void{
            if (startTime == -1){
                startTime = getTimer();
            };
            this.addEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
            this.enterFrameHandler(null);
        }
        protected function removeFromStageHandler(_arg1:Event):void{
            this.removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
        }
        protected function enterFrameHandler(_arg1:Event):void{
            var _local2:int = ((this.fadeInDuration + this.stayDuration) + this.fadeOutDuration);
            var _local3:int = ((getTimer() - startTime) % _local2);
            if (_local3 > (this.fadeInDuration + this.stayDuration)){
                currentState = "fadeOut";
                alpha = this.easeOut((_local2 - _local3), this.fadeOutDuration);
            } else {
                if (_local3 > this.fadeInDuration){
                    currentState = "stay";
                    alpha = 1;
                } else {
                    if (currentState != "fadeIn"){
                        this.setText();
                        currentState = "fadeIn";
                    };
                    alpha = this.easeOut(_local3, this.fadeInDuration);
                };
            };
        }
        private function easeOut(_arg1:Number, _arg2:Number):Number{
            _arg1 = (1 - (_arg1 / _arg2));
            return ((1 - (_arg1 * _arg1)));
        }

    }
}//package custom_control 
