﻿//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import normal_window.*;

    public class _normal_window_BasicOperationBarWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            BasicOperationBar.watcherSetupUtil = new (_normal_window_BasicOperationBarWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
        }

    }
}//package 
