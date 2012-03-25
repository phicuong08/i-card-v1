//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import task_guide.*;

    public class _task_guide_GuideMapWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            GuideMapWindow.watcherSetupUtil = new (_task_guide_GuideMapWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[1] = new PropertyWatcher("buttonGroup", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[2] = new PropertyWatcher("btnGroupfadeIn", {propertyChange:true}, [_arg4[2]], _arg2);
            _arg5[0] = new PropertyWatcher("fadeIn", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[3] = new PropertyWatcher("guide2UnLock", {propertyChange:true}, [_arg4[3]], _arg2);
            _arg5[5] = new PropertyWatcher("guide4UnLock", {propertyChange:true}, [_arg4[5]], _arg2);
            _arg5[4] = new PropertyWatcher("guide3UnLock", {propertyChange:true}, [_arg4[4]], _arg2);
            _arg5[1].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
            _arg5[3].updateParent(_arg1);
            _arg5[5].updateParent(_arg1);
            _arg5[4].updateParent(_arg1);
        }

    }
}//package 
