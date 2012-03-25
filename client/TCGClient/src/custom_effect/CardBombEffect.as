//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.display.*;
    import flash.geom.*;
    import flash.events.*;
    import __AS3__.vec.*;
    import spark.primitives.*;

    public class CardBombEffect extends CustomEffectBase {

        public var row:int = 23;
        public var col:int = 17;
        public var target;
        public var effectContainer:BitmapImage;
        protected var bombFrame:int = 4;
        protected var retractFrame:int = 30;
        protected var totalFrame:int;
        private var targetBitmapdata:BitmapData;
        private var effectBitmapdata:BitmapData;
        private var addToWindow;
        private var piecesLogicArray:Vector.<Vector.<CardBombEffectItem>>;
        private var pieceWidth:int;
        private var pieceHeight:int;
        private var bombInitSpeed:Number = 20;
        private var effectExpandSize:int = 200;
        private var passFrame:int;
        private var xFrom:Number;
        private var yFrom:Number;
        private var xChange:Number;
        private var yChange:Number;
        private var xOriginal:Number;
        private var yOriginal:Number;

        public function CardBombEffect(_arg1, _arg2:Number, _arg3:Number, _arg4:Number, _arg5:Number){
            this.totalFrame = (this.bombFrame + this.retractFrame);
            super();
            this.target = _arg1;
            this.xFrom = _arg2;
            this.yFrom = _arg3;
            this.xChange = _arg4;
            this.yChange = _arg5;
            this.pieceWidth = Math.ceil((_arg1.width / this.col));
            this.pieceHeight = Math.ceil((_arg1.height / this.row));
            this.effectBitmapdata = new BitmapData((_arg1.width + (this.effectExpandSize * 2)), (_arg1.height + (this.effectExpandSize * 2)), true, 0);
            this.effectContainer = new BitmapImage();
            this.effectContainer.source = this.effectBitmapdata;
        }
        override public function play():void{
            this.buildSource();
            this.passFrame = 0;
            var _local1:* = this.addToWindow;
            if (!_local1){
                _local1 = this.target.parent;
                if (!_local1){
                    throw (new Error("特效没有指定播放窗口,传入对象也没有父窗口,特效无处播放!"));
                };
            };
            this.effectContainer.x = (this.xOriginal = (this.xFrom - this.effectExpandSize));
            this.effectContainer.y = (this.yOriginal = (this.yFrom - this.effectExpandSize));
            _local1.addElement(this.effectContainer);
            super.play();
        }
        override public function end():void{
            var _local1:* = this.effectContainer.parent;
            if (_local1){
                _local1.removeElement(this.effectContainer);
            };
            super.end();
        }
        public function buildSource():void{
            var _local1:*;
            var _local2:CardBombEffectItem;
            var _local3:int;
            var _local4:Vector.<CardBombEffectItem>;
            var _local5:int;
            this.targetBitmapdata = new BitmapData(this.target.width, this.target.height, true, 0);
            this.targetBitmapdata.draw(this.target);
            if (this.piecesLogicArray){
                for each (_local1 in this.piecesLogicArray) {
                    for each (_local2 in _local1) {
                        _local2.restore();
                    };
                };
            } else {
                this.piecesLogicArray = new Vector.<Vector.<CardBombEffectItem>>(this.row);
                _local3 = 0;
                while (_local3 < this.row) {
                    _local4 = new Vector.<CardBombEffectItem>(this.col);
                    _local5 = 0;
                    while (_local5 < this.col) {
                        _local4[_local5] = new CardBombEffectItem((this.effectExpandSize + (this.pieceWidth * _local5)), (this.effectExpandSize + (this.pieceHeight * _local3)), this.bombInitSpeed);
                        _local5++;
                    };
                    this.piecesLogicArray[_local3] = _local4;
                    _local3++;
                };
            };
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            var _local2:Number;
            var _local3:Vector.<CardBombEffectItem>;
            var _local4:int;
            var _local5:int;
            if (this.passFrame == this.totalFrame){
                this.end();
                return;
            };
            if (this.passFrame > this.bombFrame){
                _local2 = this.easeOut((this.totalFrame - this.passFrame), this.retractFrame);
                this.effectContainer.x = (this.xOriginal + (this.xChange * _local2));
                this.effectContainer.y = (this.yOriginal + (this.yChange * _local2));
            } else {
                if (this.passFrame == this.bombFrame){
                    _local4 = 0;
                    while (_local4 < this.row) {
                        _local3 = (this.piecesLogicArray[_local4] as Vector.<CardBombEffectItem>);
                        _local5 = 0;
                        while (_local5 < this.col) {
                            this.changeItemFlySpeed(_local3[_local5], (((this.row + this.col) - _local4) - _local5));
                            _local5++;
                        };
                        _local4++;
                    };
                };
            };
            this.changeAlpha(this.passFrame, this.totalFrame);
            this.drawEffectBitMapData();
            this.passFrame++;
        }
        protected function changeAlpha(_arg1:int, _arg2:int):void{
            if (_arg1 < (_arg2 / 2)){
                this.effectContainer.alpha = this.easeOut(_arg1, _arg2);
            } else {
                this.effectContainer.alpha = this.easeOut((_arg2 - _arg1), _arg2);
            };
        }
        protected function changeItemFlySpeed(_arg1:CardBombEffectItem, _arg2:int):void{
            var _local3:Number = (this.retractFrame - (_arg2 / 3));
            var _local4:Number = (2 / (_local3 * _local3));
            _arg1.xSpeedArg = (((_arg1.originalX - _arg1.x) - (_arg1.vx * _local3)) * _local4);
            _arg1.ySpeedArg = (((_arg1.originalY - _arg1.y) - (_arg1.vy * _local3)) * _local4);
        }
        protected function drawEffectBitMapData():void{
            var _local1:Number;
            var _local2:Number;
            var _local3:Vector.<CardBombEffectItem>;
            var _local5:int;
            var _local6:CardBombEffectItem;
            this.effectBitmapdata.lock();
            this.effectBitmapdata.fillRect(new Rectangle(0, 0, this.effectBitmapdata.width, this.effectBitmapdata.height), 0);
            var _local4:int;
            while (_local4 < this.row) {
                _local2 = (_local4 * this.pieceHeight);
                _local3 = (this.piecesLogicArray[_local4] as Vector.<CardBombEffectItem>);
                _local5 = 0;
                while (_local5 < this.col) {
                    _local6 = (_local3[_local5] as CardBombEffectItem);
                    _local6.update();
                    _local1 = (_local5 * this.pieceWidth);
                    this.effectBitmapdata.copyPixels(this.targetBitmapdata, new Rectangle(_local1, _local2, this.pieceWidth, this.pieceHeight), new Point(_local6.x, _local6.y));
                    _local5++;
                };
                _local4++;
            };
            this.effectBitmapdata.unlock();
        }
        public function attach(_arg1):void{
            this.addToWindow = _arg1;
        }
        protected function easeOut(_arg1:Number, _arg2:Number):Number{
            _arg1 = (1 - (_arg1 / _arg2));
            return ((_arg1 * _arg1));
        }

    }
}//package custom_effect 
