//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
    import mx.core.*;
    import flash.display.*;
    import flash.geom.*;

    public class GuideMapLine extends UIComponent {

        private static var pointCls:Class = GuideMapLine_pointCls;

        public function GuideMapLine(){
            width = 0x0500;
            height = 800;
            mouseEnabled = false;
            mouseChildren = false;
        }
        public function drawLines(_arg1:Array):void{
            var _local2:Object;
            var _local3:BitmapData;
            for each (_local2 in _arg1) {
                this.drawLineBetweenItems(_local2.item1, _local2.item2, _local2.isCornerUp);
            };
            _local3 = new BitmapData(width, height, true, 0);
            _local3.draw(this);
            this.addChild(new Bitmap(_local3));
            this.graphics.clear();
        }
        public function drawLineBetweenItems(_arg1:Object, _arg2:Object, _arg3:Boolean=true):void{
            this.drawLineBetweenPoints(new Point((_arg1.x + (_arg1.width / 2)), (_arg1.y + (_arg1.height / 2))), new Point((_arg2.x + (_arg2.width / 2)), (_arg2.y + (_arg2.height / 2))), _arg3);
        }
        public function drawLineBetweenPoints(_arg1:Point, _arg2:Point, _arg3:Boolean=true):void{
            if ((((_arg1.x == _arg2.x)) || ((_arg1.y == _arg2.y)))){
                this.drawStraightLineBetweenPoints(_arg1, _arg2);
            } else {
                this.drawAngleLineBetweenPoints(_arg1, _arg2, _arg3);
            };
        }
        private function drawStraightLineBetweenPoints(_arg1:Point, _arg2:Point):void{
            var _local3:Point = new Point(((_arg1.x + _arg2.x) / 2), ((_arg1.y + _arg2.y) / 2));
            this.drawEasyLineBetweenPoints(_arg1, _arg2);
            this.drawSign(_local3);
        }
        private function drawAngleLineBetweenPoints(_arg1:Point, _arg2:Point, _arg3:Boolean):void{
            var _local4:Point = new Point();
            var _local5:Point = ((_arg1.y < _arg2.y)) ? _arg1 : _arg2;
            var _local6:Point = ((_arg1 == _local5)) ? _arg2 : _arg1;
            _local4.y = (_arg3) ? _local5.y : _local6.y;
            _local4.x = (_arg3) ? _local6.x : _local5.x;
            this.drawEasyLineBetweenPoints(_arg1, _local4);
            this.drawEasyLineBetweenPoints(_local4, _arg2);
            this.drawSign(_local4);
        }
        private function drawEasyLineBetweenPoints(_arg1:Point, _arg2:Point):void{
            this.graphics.lineStyle(1, 65795);
            this.graphics.moveTo((_arg1.x - 1), (_arg1.y - 1));
            this.graphics.lineTo((_arg2.x - 1), (_arg2.y - 1));
            this.graphics.moveTo((_arg1.x + 1), (_arg1.y + 1));
            this.graphics.lineTo((_arg2.x + 1), (_arg2.y + 1));
            this.graphics.lineStyle(1, 8351835);
            this.graphics.moveTo(_arg1.x, _arg1.y);
            this.graphics.lineTo(_arg2.x, _arg2.y);
        }
        private function drawSign(_arg1:Point):void{
            this.graphics.lineStyle(0, 0, 0);
            var _local2:BitmapData = (new pointCls() as Bitmap).bitmapData;
            var _local3:Matrix = new Matrix();
            _local3.tx = Math.ceil((_arg1.x - (_local2.width / 2)));
            _local3.ty = Math.ceil((_arg1.y - (_local2.height / 2)));
            this.graphics.beginBitmapFill(_local2, _local3, false);
            this.graphics.drawRect(_local3.tx, _local3.ty, _local2.width, _local2.height);
            this.graphics.endFill();
        }

    }
}//package task_guide 
