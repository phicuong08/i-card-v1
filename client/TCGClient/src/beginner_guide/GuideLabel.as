//Created by Action Script Viewer - http://www.buraks.com/asv
package beginner_guide {
    import spark.components.*;
    import spark.effects.*;
    import custom_effect.*;
    import flashx.textLayout.conversion.*;
    import tool.*;

    public class GuideLabel extends RichText implements IBeginnerGuideOperation {

        protected var info:Object;

        public function GuideLabel(){
            mouseEnabled = false;
            depth = BeginnerGuideUtil.NOTICE_WINDOW_DEPTH;
        }
        public function setInfo(_arg1:Object):void{
            var _local2:String;
            var _local3:Fade;
            this.info = _arg1;
            for (_local2 in _arg1) {
                if ((((_local2 == "x")) || ((_local2 == "y")))){
                    this[_local2] = _arg1[_local2];
                } else {
                    if (_local2 == "text"){
                        textFlow = TextConverter.importToFlow(StringUtils.parseColor(_arg1[_local2]), TextConverter.TEXT_FIELD_HTML_FORMAT);
                    } else {
                        this.setStyle(_local2, _arg1[_local2]);
                    };
                };
                if (_local2 == "fadeDuration"){
                    _local3 = new Fade(this);
                    _local3.duration = _arg1[_local2];
                    _local3.alphaFrom = 0;
                    _local3.alphaTo = 1;
                    _local3.play();
                };
            };
        }
        public function removeOperation(_arg1:Object=null):void{
            var fadeOutEffect:* = null;
            var effectHandler:* = null;
            var param = _arg1;
            if (this.info["fadeOutDuration"]){
                effectHandler = function (_arg1):void{
                    fadeOutEffect.removeEventListener(CustomEffectEvent.END, effectHandler);
                    removeSelf();
                };
                fadeOutEffect = new FadeEffect(this, this.info["fadeOutDuration"], 1, 0);
                fadeOutEffect.play();
                fadeOutEffect.addEventListener(CustomEffectEvent.END, effectHandler);
            } else {
                this.removeSelf();
            };
        }
        public function doCmd(_arg1:Object=null){
            var _local2:Scale;
            var _local3:Move;
            if (_arg1.type == "scale"){
                _local2 = new Scale(this);
                _local2.duration = _arg1.duration;
                _local2.scaleXTo = _arg1.scaleX;
                _local2.scaleYTo = _arg1.scaleY;
                _local2.play();
            } else {
                if (_arg1.type == "move"){
                    _local3 = new Move(this);
                    _local3.duration = _arg1.duration;
                    _local3.xTo = _arg1.xTo;
                    _local3.yTo = _arg1.yTo;
                    _local3.play();
                };
            };
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1 != null){
                _local1.removeElement(this);
            };
        }

    }
}//package beginner_guide 
