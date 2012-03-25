//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import mx.core.*;
    import flash.events.*;

    public class FoldEffect extends InsideEffectBase {

        public var maxFoldNum:int = 3;
        public var row:int;
        public var col:int;
        private var sourceArr:Array;
        private var currentFoldArray:Array;
        private var waitFoldArray:Array;
        public var childDuration:int;

        public function FoldEffect(_arg1, _arg2:int=500, _arg3:int=1, _arg4:int=1){
            super(_arg1);
            this.row = _arg3;
            this.col = _arg4;
            this.childDuration = _arg2;
        }
        override public function play():void{
            this.buildSourceArray();
            super.play();
        }
        public function buildSourceArray():void{
            var _local2:Array;
            var _local3:FoldEffectItem;
            var _local4:Number;
            var _local5:Array;
            var _local6:int;
            var _local7:Array;
            var _local8:int;
            var _local9:UIComponent;
            this.currentFoldArray = new Array();
            this.waitFoldArray = new Array();
            if (this.sourceArr){
                for each (_local2 in this.sourceArr) {
                    for each (_local3 in _local2) {
                        _local3.restore();
                    };
                };
            } else {
                _local4 = (90 / ((this.childDuration / 1000) * FRAME_RATE));
                _local5 = DrawUtil.divide(target, this.row, this.col, true);
                this.sourceArr = new Array();
                _local6 = 0;
                while (_local6 < this.row) {
                    _local7 = new Array();
                    _local8 = 0;
                    while (_local8 < this.col) {
                        _local9 = new UIComponent();
                        _local9.visible = false;
                        _local9.x = _local5[_local6][_local8].x;
                        _local9.y = _local5[_local6][_local8].y;
                        _local5[_local6][_local8].x = 0;
                        _local5[_local6][_local8].y = 0;
                        _local9.addChild(_local5[_local6][_local8]);
                        effectContainer.addChild(_local9);
                        _local9.width = _local5[_local6][_local8].width;
                        _local9.height = _local5[_local6][_local8].height;
                        _local7.push(new FoldEffectItem(_local9, _local4, _local6, _local8));
                        _local8++;
                    };
                    this.sourceArr.push(_local7);
                    _local6++;
                };
            };
            var _local1:FoldEffectItem = this.sourceArr[Math.floor((this.row / 2))][Math.floor((this.col / 2))];
            _local1.source.visible = true;
            _local1.hasComplete = true;
            this.currentFoldArray.push(_local1);
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            var _local4:FoldEffectItem;
            var _local5:int;
            var _local6:Array;
            var _local7:FoldEffectItem;
            if (this.currentFoldArray.length == 0){
                end();
            };
            var _local2:Array = this.currentFoldArray.slice();
            var _local3:int;
            while (_local3 < this.maxFoldNum) {
                if (_local3 < _local2.length){
                    _local4 = _local2[_local3];
                    if (_local4.hasComplete){
                        this.currentFoldArray.splice(this.currentFoldArray.indexOf(_local4), 1);
                        this.addAdjacentItem(_local4.i, _local4.j);
                    } else {
                        _local4.update();
                    };
                } else {
                    if (this.waitFoldArray.length > 0){
                        _local5 = (Math.random() * this.waitFoldArray.length);
                        _local6 = this.waitFoldArray.splice(_local5, 1)[0];
                        _local7 = (_local6[0] as FoldEffectItem);
                        _local7.startRotation(_local6[1]);
                        this.currentFoldArray.push(_local7);
                    };
                };
                _local3++;
            };
        }
        private function addAdjacentItem(_arg1:int, _arg2:int):void{
            this.tryAddItemToWaitFoldArray((_arg1 - 1), _arg2, "down");
            this.tryAddItemToWaitFoldArray((_arg1 + 1), _arg2, "up");
            this.tryAddItemToWaitFoldArray(_arg1, (_arg2 - 1), "right");
            this.tryAddItemToWaitFoldArray(_arg1, (_arg2 + 1), "left");
        }
        private function tryAddItemToWaitFoldArray(_arg1:int, _arg2:int, _arg3:String):void{
            if ((((((((_arg1 < 0)) || ((_arg1 >= this.row)))) || ((_arg2 < 0)))) || ((_arg2 >= this.col)))){
                return;
            };
            var _local4:FoldEffectItem = this.sourceArr[_arg1][_arg2];
            if (((!(_local4.hasComplete)) && (!(_local4.isFolding)))){
                _local4.isFolding = true;
                this.waitFoldArray.push([_local4, _arg3]);
            };
        }

    }
}//package custom_effect 
