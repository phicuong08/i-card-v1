//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import task_guide.*;

    public class _task_guide_GuideTalkWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            GuideTalkWindow.watcherSetupUtil = new (_task_guide_GuideTalkWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[5] = new PropertyWatcher("tipFlow", {propertyChange:true}, [_arg4[6]], _arg2);
            _arg5[1] = new PropertyWatcher("fadeInEffect", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[2] = new PropertyWatcher("headImg", {propertyChange:true}, [_arg4[3]], _arg2);
            _arg5[3] = new PropertyWatcher("headNameText", {propertyChange:true}, [_arg4[4]], _arg2);
            _arg5[5].updateParent(_arg1);
            _arg5[1].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
            _arg5[3].updateParent(_arg1);
        }

    }
}//package 
