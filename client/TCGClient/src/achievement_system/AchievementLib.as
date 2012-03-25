//Created by Action Script Viewer - http://www.buraks.com/asv
package achievement_system {
    import flash.events.*;
    import file_read.*;

    public class AchievementLib {

        private static var achievementConfigFile:Class = AchievementLib_achievementConfigFile;
        public static var achievementConfig:Object;

        public static function buildAchievementConfig():void{
            achievementConfig = new Object();
            var _local1:Csv = new Csv();
            //debugWindow.myTrace("开始读取 achievement.csv 文件\n");
            _local1.addEventListener(Event.COMPLETE, achievementConfigLoadComplete);
            if (TCGClient.isDebugMode){
                _local1.loadURL("../src/source/etc/achievement.csv");
            } else {
                _local1.loadLocalFile(achievementConfigFile);
            };
        }
        private static function achievementConfigLoadComplete(_arg1:Event):void{
            var _local4:Object;
            var _local2:Csv = (_arg1.currentTarget as Csv);
            _local2.removeEventListener(Event.COMPLETE, achievementConfigLoadComplete);
            var _local3:Array = _local2.getData();
            for each (_local4 in _local3) {
                if (achievementConfig[_local4.id]){
                    throw (new Error(("achievement.csv 表中 id 配置重复, 重复的 id 为" + _local4.id)));
                };
                achievementConfig[_local4.id] = _local4;
            };
            //debugWindow.myTrace("achievement.csv 表载入成功!");
        }

    }
}//package achievement_system 
