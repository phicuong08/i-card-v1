//Created by Action Script Viewer - http://www.buraks.com/asv
package SoundSystem {
    import flash.events.*;
    import custom_control1.*;
    import flash.media.*;
    import flash.net.*;

    public class SoundSource {

        public static var allBgSoundOb:Object = new Object();
        public static var allEffectSoundOb:Object = new Object();

        public static function startLoadAllSound():void{
            startLoadBgSound();
            startLoadEffectSound();
        }
        private static function startLoadBgSound():void{
            var _local2:String;
            var _local3:Sound;
            var _local1:Array = new Array();
            _local1.push("source/sound/bg_main.mp3");
            _local1.push("source/sound/bg_duel.mp3");
            for each (_local2 in _local1) {
                _local3 = new Sound(new URLRequest(_local2));
                allBgSoundOb[translateUrlStringToKeyName(_local2)] = _local3;
            };
        }
        private static function startLoadEffectSound():void{
            var effectSoundPathArray:* = null;
            var path:* = null;
            var soundLoadComplete:* = null;
            var ioErrorHandler:* = null;
            var loadSound:* = function ():void{
                if (effectSoundPathArray.length == 0){
                    return;
                };
                path = effectSoundPathArray.shift();
                var _local1:Sound = new Sound(new URLRequest(path));
                _local1.addEventListener(Event.COMPLETE, soundLoadComplete);
                _local1.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            };
            soundLoadComplete = function (_arg1:Event):void{
                var _local2:Sound = (_arg1.target as Sound);
                _local2.removeEventListener(Event.COMPLETE, soundLoadComplete);
                _local2.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
                allEffectSoundOb[translateUrlStringToKeyName(path)] = _local2;
                loadSound();
            };
            ioErrorHandler = function (_arg1:IOErrorEvent):void{
                var _local2:Sound = (_arg1.target as Sound);
                _local2.removeEventListener(Event.COMPLETE, soundLoadComplete);
                _local2.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
                NoticeWindow.showNotice((path + "音效文件载入失败!"));
            };
            effectSoundPathArray = new Array();
            effectSoundPathArray.push("source/sound/beat.mp3");
            effectSoundPathArray.push("source/sound/chain.mp3");
            effectSoundPathArray.push("source/sound/destroy.mp3");
            effectSoundPathArray.push("source/sound/duel_begin.mp3");
            effectSoundPathArray.push("source/sound/money.mp3");
            effectSoundPathArray.push("source/sound/move.mp3");
            effectSoundPathArray.push("source/sound/sacrifice.mp3");
            effectSoundPathArray.push("source/sound/set.mp3");
            effectSoundPathArray.push("source/sound/recruit.mp3");
            effectSoundPathArray.push("source/sound/step.mp3");
            effectSoundPathArray.push("source/sound/draw.mp3");
            effectSoundPathArray.push("source/sound/ready.mp3");
            effectSoundPathArray.push("source/sound/click_1.mp3");
            effectSoundPathArray.push("source/sound/click_2.mp3");
            effectSoundPathArray.push("source/sound/click_3.mp3");
            effectSoundPathArray.push("source/sound/click_4.mp3");
            effectSoundPathArray.push("source/sound/item_weapon.mp3");
            effectSoundPathArray.push("source/sound/begin_attack.mp3");
            effectSoundPathArray.push("source/sound/round_end.mp3");
            effectSoundPathArray.push("source/sound/card_mouse_enter.mp3");
            effectSoundPathArray.push("source/sound/numberChange.mp3");
            effectSoundPathArray.push("source/sound/hurt.mp3");
            effectSoundPathArray.push("source/sound/heal.mp3");
            effectSoundPathArray.push("source/sound/light_drum.mp3");
            effectSoundPathArray.push("source/sound/double_drum.mp3");
            effectSoundPathArray.push("source/sound/window_show.mp3");
            effectSoundPathArray.push("source/sound/window_close.mp3");
            effectSoundPathArray.push("source/sound/bellow_wen.mp3");
            effectSoundPathArray.push("source/sound/bellow_wu.mp3");
            effectSoundPathArray.push("source/sound/bellow_female.mp3");
            effectSoundPathArray.push("source/sound/die_wen.mp3");
            effectSoundPathArray.push("source/sound/die_wu.mp3");
            effectSoundPathArray.push("source/sound/die_female.mp3");
            effectSoundPathArray.push("source/sound/success.mp3");
            effectSoundPathArray.push("source/sound/fail.mp3");
            effectSoundPathArray.push("source/sound/cast.mp3");
            effectSoundPathArray.push("source/sound/hp.mp3");
            effectSoundPathArray.push("source/sound/ring.mp3");
            loadSound();
        }
        private static function translateUrlStringToKeyName(_arg1:String):String{
            _arg1 = _arg1.replace("source/sound/", "");
            _arg1 = _arg1.replace(".mp3", "");
            return (_arg1);
        }

    }
}//package SoundSystem 
