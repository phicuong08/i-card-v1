//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import task_guide.*;

    public class _task_guide_GuideTipWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            GuideTipWindow.watcherSetupUtil = new (_task_guide_GuideTipWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[2] = new PropertyWatcher("tipFlow", {propertyChange:true}, [_arg4[3]], _arg2);
            _arg5[0] = new PropertyWatcher("fadeInEffect", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[2].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
        }

    }
}//package 
