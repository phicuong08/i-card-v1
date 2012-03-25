//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.events.*;

    public class BreakPiecesEffect extends InsideEffectBase {

        public var row:int;
        public var col:int;
        protected var sourceArr:Array;
        public var initSpeedArg:Number = 50;
        public var xSpeedArg:Number = 0;
        public var ySpeedArg:Number = 0;
        public var rotateArg:Number = 0;

        public function BreakPiecesEffect(_arg1, _arg2:int=1000, _arg3:int=1, _arg4:int=1){
            super(_arg1, _arg2);
            this.row = _arg3;
            this.col = _arg4;
        }
        override public function play():void{
            this.buildSourceArray();
            super.play();
        }
        public function buildSourceArray():void{
            var _local1:Array;
            var _local2:BreakPiecesEffectItem;
            var _local3:Array;
            var _local4:int;
            var _local5:int;
            if (this.sourceArr){
                for each (_local1 in this.sourceArr) {
                    for each (_local2 in _local1) {
                        _local2.restore();
                    };
                };
            } else {
                _local3 = DrawUtil.divide(target, this.row, this.col, true, effectContainer);
                this.sourceArr = new Array(this.row);
                _local4 = 0;
                while (_local4 < this.row) {
                    this.sourceArr[_local4] = new Array(this.col);
                    _local5 = 0;
                    while (_local5 < this.col) {
                        this.sourceArr[_local4][_local5] = new BreakPiecesEffectItem(_local3[_local4][_local5], this.initSpeedArg, this.xSpeedArg, this.ySpeedArg, this.rotateArg);
                        _local5++;
                    };
                    _local4++;
                };
            };
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            var _local2:Array;
            var _local3:BreakPiecesEffectItem;
            for each (_local2 in this.sourceArr) {
                for each (_local3 in _local2) {
                    _local3.update();
                };
            };
            super.enterFrameHandler(_arg1);
        }

    }
}//package custom_effect 
