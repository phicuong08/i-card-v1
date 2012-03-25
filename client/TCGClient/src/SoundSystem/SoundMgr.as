//Created by Action Script Viewer - http://www.buraks.com/asv
package SoundSystem {
    import flash.events.*;
    import flash.media.*;
    import flash.utils.*;

    public class SoundMgr {

        private static var _instance:SoundMgr = new (SoundMgr)();
;

        private var _effectVolume:Number = 0.6;
        private var _bgVolume:Number = 0.6;
        private var activeEffectSound:Dictionary;
        private var activeBgSound:Dictionary;
        private var currentBgSound:String = "";

        public function SoundMgr(){
            this.activeEffectSound = new Dictionary();
            this.activeBgSound = new Dictionary();
            super();
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():SoundMgr{
            return (_instance);
        }

        public function playEffectSound(_arg1:String, _arg2:Number=0, _arg3:int=1):void{
            this.playSound(_arg1, _arg2, _arg3, "effect");
        }
        public function playBgSound(_arg1:String, _arg2:Number=0, _arg3:int=-1):void{
            if (this.currentBgSound.length > 0){
                this.stopBgSound(this.currentBgSound);
            };
            this.currentBgSound = _arg1;
            this.playSound(_arg1, _arg2, _arg3, "bg");
        }
        protected function playSound(_arg1:String, _arg2:Number, _arg3:int, _arg4:String):void{
            var soundChannelContainer:* = null;
            var channel:* = null;
            var soundCompleteListener:* = null;
            var sound:* = null;
            var name:* = _arg1;
            var startTime:* = _arg2;
            var loopTime:* = _arg3;
            var soundStyle:* = _arg4;
            soundCompleteListener = function (_arg1:Event):void{
                channel.removeEventListener(Event.SOUND_COMPLETE, soundCompleteListener);
                delete soundChannelContainer[channel];
            };
            soundChannelContainer = ((soundStyle == "effect")) ? this.activeEffectSound : this.activeBgSound;
            var soundVolume:* = ((soundStyle == "effect")) ? this._effectVolume : this._bgVolume;
            var soundSouceOb:* = ((soundStyle == "effect")) ? SoundSource.allEffectSoundOb : SoundSource.allBgSoundOb;
            try {
                sound = soundSouceOb[name];
                if (!sound){
                    return;
                };
                channel = sound.play(startTime, ((loopTime)==-1) ? int.MAX_VALUE : loopTime);
                if (channel){
                    if (loopTime > 0){
                        channel.addEventListener(Event.SOUND_COMPLETE, soundCompleteListener);
                    };
                    soundChannelContainer[channel] = name;
                    channel.soundTransform = new SoundTransform(soundVolume);
                };
            } catch(e:Error) {
            };
        }
        public function set effectVolume(_arg1:Number):void{
            var _local2:*;
            this._effectVolume = _arg1;
            for (_local2 in this.activeEffectSound) {
                (_local2 as SoundChannel).soundTransform = new SoundTransform(_arg1);
            };
        }
        public function get effectVolume():Number{
            return (this._effectVolume);
        }
        public function set bgVolume(_arg1:Number):void{
            var _local2:*;
            this._bgVolume = _arg1;
            for (_local2 in this.activeBgSound) {
                (_local2 as SoundChannel).soundTransform = new SoundTransform(_arg1);
            };
        }
        public function get bgVolume():Number{
            return (this._bgVolume);
        }
        public function stopEffectSound(_arg1:String):void{
            this.stopSound(_arg1, this.activeEffectSound);
        }
        public function stopBgSound(_arg1:String=""):void{
            if (_arg1.length == 0){
                _arg1 = this.currentBgSound;
            };
            this.stopSound(_arg1, this.activeBgSound);
        }
        protected function stopSound(_arg1:String, _arg2:Dictionary):void{
            var _local4:*;
            var _local5:SoundChannel;
            var _local3:Array = new Array();
            for (_local4 in _arg2) {
                if (_arg2[_local4] == _arg1){
                    _local3.push(_local4);
                };
            };
            for each (_local5 in _local3) {
                _local5.stop();
                delete _arg2[_local5];
            };
        }

    }
}//package SoundSystem 
