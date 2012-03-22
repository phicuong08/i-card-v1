//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.sound {
    import flash.events.*;
    import flash.media.*;
    import flash.net.*;

    public class SoundEffect {

        public static const Button:int = 0;
        public static const MissionChest:int = 1;
        public static const SellItem:int = 2;
        public static const AcceptQuest:int = 3;
        public static const ResearchUpgrade:int = 4;
        public static const LevelUp:int = 5;
        public static const Equip:int = 6;
        public static const CompleteQuest:int = 7;
        public static const AchievementComplete:int = 8;

        public static var url:String;
        public static var onVersion:Function;
        private static var _sounds:Object = {};

        private static function init():void{
            _sounds[Button] = {
                url:"ui/button.mp3",
                sound:null
            };
            _sounds[MissionChest] = {
                url:"ui/mission_chest.mp3",
                sound:null
            };
            _sounds[SellItem] = {
                url:"ui/sell_item.mp3",
                sound:null
            };
            _sounds[AcceptQuest] = {
                url:"ui/accept_quest.mp3",
                sound:null
            };
            _sounds[ResearchUpgrade] = {
                url:"ui/research_upgrade.mp3",
                sound:null
            };
            _sounds[LevelUp] = {
                url:"ui/level_up.mp3",
                sound:null
            };
            _sounds[Equip] = {
                url:"ui/equip.mp3",
                sound:null
            };
            _sounds[CompleteQuest] = {
                url:"ui/complete_quest.mp3",
                sound:null
            };
            _sounds[AchievementComplete] = {
                url:"ui/achievement_complete.mp3",
                sound:null
            };
        }
        public static function load():void{
            var _local1:String;
            var _local2:Sound;
            var _local3:String;
            for (_local1 in _sounds) {
                _local2 = new Sound();
                _sounds[_local1]["sound"] = _local2;
                _local2.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
                _local2.addEventListener(Event.COMPLETE, completeHandler);
                _local3 = (SoundEffect.url + _sounds[_local1]["url"]);
                _local2.load(new URLRequest(((_local3 + "?v=") + onVersion(_local3))));
            };
        }
        private static function ioErrorHandler(_arg1:IOErrorEvent):void{
            removeListener((_arg1.currentTarget as Sound));
        }
        private static function completeHandler(_arg1:Event):void{
            removeListener((_arg1.currentTarget as Sound));
        }
        private static function removeListener(_arg1:Sound):void{
            _arg1.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            _arg1.removeEventListener(Event.COMPLETE, completeHandler);
        }
        public static function play(_arg1:int):void{
            var type:* = _arg1;
            if (SoundManage.mute == 0){
                return;
            };
            var sound:* = _sounds[type]["sound"];
            if (sound){
                try {
                    sound.play(0, 0, new SoundTransform((SoundManage.gameVolume * 0.01)));
                } catch(e:ErrorEvent) {
                };
            };
        }

        init();
    }
}//package com.assist.view.sound 
