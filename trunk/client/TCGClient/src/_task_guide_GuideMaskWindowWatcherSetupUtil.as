//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import task_guide.*;

    public class _task_guide_GuideMaskWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            GuideMaskWindow.watcherSetupUtil = new (_task_guide_GuideMaskWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
        }

    }
}//package 
