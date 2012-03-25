//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import flash.filters.*;
    import spark.effects.*;
    import custom_effect.*;

    public class RoundMask extends UIComponent {

        protected var moveEffect:MoveEffect;
        private var downCircleYPos:Number = 1500;
        private var blackBmp:Bitmap;
        private var redBmp:Bitmap;
        private var _currentVisibleBmp:Bitmap;

        public function RoundMask(){
            mouseEnabled = false;
            mouseChildren = false;
            this.drawImage();
            this.moveEffect = new MoveEffect(this, 500);
            this.reset();
        }
        protected function drawImage():void{
            var _local3:Number;
            var _local9:Number;
            var _local1:Number = (2000 * 2000);
            var _local2:Matrix = new Matrix();
            var _local4:Number = Math.sqrt((_local1 - (640 * 640)));
            var _local5:int;
            while (_local5 < 0x0500) {
                _local9 = Math.sqrt((_local1 - ((640 - _local5) * (640 - _local5))));
                _local3 = (_local4 - _local9);
                _local2.createGradientBox(1, 530, (Math.PI / 2), _local5, _local3);
                this.graphics.beginGradientFill(GradientType.LINEAR, [0, 0], [0.5, 0], [170, 0xFF], _local2);
                this.graphics.drawRect(_local5, _local3, 1, 530);
                _local3 = (this.downCircleYPos - _local3);
                _local2.createGradientBox(1, 800, (Math.PI / 2), _local5, _local3);
                this.graphics.beginGradientFill(GradientType.LINEAR, [0, 0], [0, 0.5], [0, 60], _local2);
                this.graphics.drawRect(_local5, _local3, 1, 800);
                _local5++;
            };
            this.graphics.endFill();
            var _local6:BitmapData = new BitmapData(0x0500, (this.downCircleYPos + 800), true, 0);
            _local6.draw(this);
            this.graphics.clear();
            this.blackBmp = new Bitmap(_local6);
            var _local7:BitmapData = new BitmapData(_local6.width, _local6.height, true, 0);
            var _local8:ColorMatrixFilter = new ColorMatrixFilter();
            _local8.matrix = [0, 0, 0, 0, 139, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.4, 0];
            _local7.applyFilter(_local6, new Rectangle(0, 0, _local6.width, _local6.height), new Point(), _local8);
            this.redBmp = new Bitmap(_local7);
            this.addChild(this.blackBmp);
            this.addChild(this.redBmp);
        }
        public function startMove(_arg1:Boolean, _arg2:Boolean=true):void{
            var _local3:Number = (_arg1) ? 0 : (-(this.downCircleYPos) + 100);
            if (!_arg2){
                this.moveEffect.stop();
                y = _local3;
                return;
            };
            if (((((this.moveEffect.isPlaying) && ((this.moveEffect.yTo == _local3)))) || (((!(this.moveEffect.isPlaying)) && ((y == _local3)))))){
                return;
            };
            this.moveEffect.xTo = x;
            this.moveEffect.yTo = _local3;
            this.moveEffect.play();
            this.changeColor(true);
        }
        public function reset():void{
            this.changeColor(true, false);
            this.startMove(true, false);
        }
        public function changeColor(_arg1:Boolean, _arg2:Boolean=true):void{
            var hideBmp:* = null;
            var setVisible:* = null;
            var f1:* = null;
            var f2:* = null;
            var isBlack:* = _arg1;
            var needEffect:Boolean = _arg2;
            setVisible = function (_arg1:EffectEvent=null):void{
                if (_arg1){
                    (_arg1.currentTarget as Fade).removeEventListener(EffectEvent.EFFECT_END, setVisible);
                };
                _currentVisibleBmp.alpha = 1;
                hideBmp.visible = false;
            };
            if (isBlack == (this._currentVisibleBmp == this.blackBmp)){
                return;
            };
            this._currentVisibleBmp = (isBlack) ? this.blackBmp : this.redBmp;
            this._currentVisibleBmp.visible = true;
            hideBmp = (isBlack) ? this.redBmp : this.blackBmp;
            if (needEffect){
                f1 = new Fade(this._currentVisibleBmp);
                f1.alphaFrom = 0;
                f1.alphaTo = 1;
                f1.duration = (isBlack) ? 500 : 1200;
                f1.play();
                f2 = new Fade(hideBmp);
                f2.alphaFrom = 1;
                f2.alphaTo = 0;
                f2.duration = f1.duration;
                f2.play();
                f2.addEventListener(EffectEvent.EFFECT_END, setVisible);
            } else {
                setVisible();
            };
        }

    }
}//package combat_element 
