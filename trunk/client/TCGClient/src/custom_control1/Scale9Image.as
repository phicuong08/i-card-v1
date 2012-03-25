//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;
    import flash.display.*;
    import flash.geom.*;

    public class Scale9Image extends UIComponent {

        protected var imageSource:BitmapData;
        protected var cutRect:Rectangle;
        protected var needDrawMiddleArea:Boolean;

        public function Scale9Image(_arg1:BitmapData, _arg2:Rectangle, _arg3:Boolean=true){
            this.mouseChildren = false;
            this.mouseEnabled = false;
            this.imageSource = _arg1;
            this.cutRect = _arg2;
            this.needDrawMiddleArea = _arg3;
        }
        override public function set width(_arg1:Number):void{
            super.width = _arg1;
            this.buildImage();
        }
        override public function set height(_arg1:Number):void{
            super.height = _arg1;
            this.buildImage();
        }
        public function set size(_arg1:Array):void{
            super.width = _arg1[0];
            super.height = _arg1[1];
            this.buildImage();
        }
        protected function buildImage():void{
            if (((!((width == 0))) && (!((height == 0))))){
                while (this.numChildren > 0) {
                    this.removeChildAt(0);
                };
                this.graphics.clear();
                this.drawGraphicsImage();
                this.copyGraphicsImageAsBitmap();
                this.graphics.clear();
            };
        }
        protected function drawGraphicsImage():void{
            var _local1:Matrix;
            var _local2:Point = new Point();
            var _local3:Number = this.cutRect.x;
            var _local4:Number = this.cutRect.y;
            var _local5:BitmapData = new BitmapData(_local3, _local4, true, 0);
            _local5.copyPixels(this.imageSource, new Rectangle(0, 0, _local3, _local4), _local2);
            _local1 = new Matrix();
            this.graphics.beginBitmapFill(_local5, _local1, false, true);
            this.graphics.drawRect(0, 0, _local3, _local4);
            _local3 = ((this.imageSource.width - this.cutRect.x) - this.cutRect.width);
            _local4 = this.cutRect.y;
            _local5 = new BitmapData(_local3, _local4, true, 0);
            _local5.copyPixels(this.imageSource, new Rectangle((this.cutRect.x + this.cutRect.width), 0, _local3, _local4), _local2);
            _local1 = new Matrix();
            _local1.tx = (width - _local3);
            this.graphics.beginBitmapFill(_local5, _local1, false, true);
            this.graphics.drawRect(_local1.tx, _local1.ty, _local3, _local4);
            _local3 = this.cutRect.x;
            _local4 = ((this.imageSource.height - this.cutRect.y) - this.cutRect.height);
            _local5 = new BitmapData(_local3, _local4, true, 0);
            _local5.copyPixels(this.imageSource, new Rectangle(0, (this.cutRect.y + this.cutRect.height), _local3, _local4), _local2);
            _local1 = new Matrix();
            _local1.ty = (height - _local4);
            this.graphics.beginBitmapFill(_local5, _local1, false, true);
            this.graphics.drawRect(_local1.tx, _local1.ty, _local3, _local4);
            _local3 = ((this.imageSource.width - this.cutRect.x) - this.cutRect.width);
            _local4 = ((this.imageSource.height - this.cutRect.y) - this.cutRect.height);
            _local5 = new BitmapData(_local3, _local4, true, 0);
            _local5.copyPixels(this.imageSource, new Rectangle((this.cutRect.x + this.cutRect.width), (this.cutRect.y + this.cutRect.height), _local3, _local4), _local2);
            _local1 = new Matrix();
            _local1.tx = (width - _local3);
            _local1.ty = (height - _local4);
            this.graphics.beginBitmapFill(_local5, _local1, false, true);
            this.graphics.drawRect(_local1.tx, _local1.ty, _local3, _local4);
            _local3 = this.cutRect.width;
            _local4 = this.cutRect.y;
            _local5 = new BitmapData(_local3, _local4, true, 0);
            _local5.copyPixels(this.imageSource, new Rectangle(this.cutRect.x, 0, _local3, _local4), _local2);
            _local1 = new Matrix();
            _local1.tx = this.cutRect.x;
            this.graphics.beginBitmapFill(_local5, _local1, true, true);
            this.graphics.drawRect(_local1.tx, _local1.ty, ((width - this.cutRect.x) - ((this.imageSource.width - this.cutRect.x) - this.cutRect.width)), _local4);
            _local3 = this.cutRect.x;
            _local4 = this.cutRect.height;
            _local5 = new BitmapData(_local3, _local4, true, 0);
            _local5.copyPixels(this.imageSource, new Rectangle(0, this.cutRect.y, _local3, _local4), _local2);
            _local1 = new Matrix();
            _local1.ty = this.cutRect.y;
            this.graphics.beginBitmapFill(_local5, _local1, true, true);
            this.graphics.drawRect(_local1.tx, _local1.ty, _local3, ((height - this.cutRect.y) - ((this.imageSource.height - this.cutRect.y) - this.cutRect.height)));
            _local3 = ((this.imageSource.width - this.cutRect.x) - this.cutRect.width);
            _local4 = this.cutRect.height;
            _local5 = new BitmapData(_local3, _local4, true, 0);
            _local5.copyPixels(this.imageSource, new Rectangle((this.cutRect.x + this.cutRect.width), this.cutRect.y, _local3, _local4), _local2);
            _local1 = new Matrix();
            _local1.tx = (width - _local3);
            _local1.ty = this.cutRect.y;
            this.graphics.beginBitmapFill(_local5, _local1, true, true);
            this.graphics.drawRect(_local1.tx, _local1.ty, _local3, ((height - this.cutRect.y) - ((this.imageSource.height - this.cutRect.y) - this.cutRect.height)));
            _local3 = this.cutRect.width;
            _local4 = ((this.imageSource.height - this.cutRect.y) - this.cutRect.height);
            _local5 = new BitmapData(_local3, _local4, true, 0);
            _local5.copyPixels(this.imageSource, new Rectangle(this.cutRect.x, (this.cutRect.y + this.cutRect.height), _local3, _local4), _local2);
            _local1 = new Matrix();
            _local1.tx = this.cutRect.x;
            _local1.ty = (height - _local4);
            this.graphics.beginBitmapFill(_local5, _local1, true, true);
            this.graphics.drawRect(_local1.tx, _local1.ty, ((width - this.cutRect.x) - ((this.imageSource.width - this.cutRect.x) - this.cutRect.width)), _local4);
            if (this.needDrawMiddleArea){
                _local3 = this.cutRect.width;
                _local4 = this.cutRect.height;
                _local5 = new BitmapData(_local3, _local4, true, 0);
                _local5.copyPixels(this.imageSource, new Rectangle(this.cutRect.x, this.cutRect.y, _local3, _local4), _local2);
                _local1 = new Matrix();
                _local1.tx = this.cutRect.x;
                _local1.ty = this.cutRect.y;
                this.graphics.beginBitmapFill(_local5, _local1, true, true);
                this.graphics.drawRect(_local1.tx, _local1.ty, ((width - this.cutRect.x) - ((this.imageSource.width - this.cutRect.x) - this.cutRect.width)), ((height - this.cutRect.y) - ((this.imageSource.height - this.cutRect.y) - this.cutRect.height)));
            };
            this.graphics.endFill();
        }
        protected function copyGraphicsImageAsBitmap():void{
            var _local1:BitmapData = new BitmapData(width, height, true, 0);
            _local1.draw(this);
            this.addChild(new Bitmap(_local1, "auto", true));
        }

    }
}//package custom_control 
