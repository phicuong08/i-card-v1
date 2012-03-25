﻿//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import normal_window.*;

    public class _normal_window_JudgeCardsWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            JudgeCards.watcherSetupUtil = new (_normal_window_JudgeCardsWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[3] = new PropertyWatcher("duelCardGroups", {propertyChange:true}, [_arg4[4]], _arg2);
            _arg5[1] = new PropertyWatcher("judgeWindow", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[0] = new PropertyWatcher("addEffect", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[2] = new PropertyWatcher("loadingBar", {propertyChange:true}, [_arg4[2]], _arg2);
            _arg5[3].updateParent(_arg1);
            _arg5[1].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
        }

    }
}//package 
