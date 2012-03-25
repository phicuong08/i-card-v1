//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element_script {
    import flash.events.*;
    import combat_element.*;
    import flash.utils.*;
    import file_read.*;

    public class TipManager {

        public static var tipConfig:Array;
        private static var tipWindow:TipWindow;
        private static var showTimer:Timer = new Timer(40000);
        private static var tipConfigFile:Class = TipManager_tipConfigFile;

        public static function buildTipConfig():void{
            var _local1:Csv = new Csv();
            debugWindow.myTrace("开始读取 tip.csv 文件\n");
            _local1.addEventListener(Event.COMPLETE, tipConfigLoadComplete);
            if (TCGClient.isDebugMode){
                _local1.loadURL("../src/source/etc/tip.csv");
            } else {
                _local1.loadLocalFile(tipConfigFile);
            };
        }
        private static function tipConfigLoadComplete(_arg1:Event):void{
            var _local2:Csv = (_arg1.currentTarget as Csv);
            _local2.removeEventListener(Event.COMPLETE, tipConfigLoadComplete);
            tipConfig = _local2.getData();
            debugWindow.myTrace("tip.csv 表载入成功!");
        }
        public static function startShowTip():void{
            if (!tipWindow){
                tipWindow = new TipWindow();
            };
            showTimer.addEventListener(TimerEvent.TIMER, showTip);
            showTimer.start();
        }
        public static function stopShowTip():void{
            if (tipWindow){
                tipWindow.group1_clickHandler();
            };
            tipWindow = null;
            showTimer.removeEventListener(TimerEvent.TIMER, showTip);
            showTimer.stop();
        }
        private static function showTip(_arg1:TimerEvent):void{
            if (Math.random() < 0.5){
                return;
            };
            tipWindow.tipText = tipConfig[int((Math.random() * tipConfig.length))].content;
            CombatStage.getInstance().addElement(tipWindow);
        }

    }
}//package combat_element_script 
