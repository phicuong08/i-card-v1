//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import train_system.*;

    public class _train_system_TrainListWindowItemWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            TrainListWindowItem.watcherSetupUtil = new (_train_system_TrainListWindowItemWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[3] = new PropertyWatcher("_headImg", {propertyChange:true}, [_arg4[4]], _arg2);
            _arg5[4] = new PropertyWatcher("_trainName", {propertyChange:true}, [_arg4[5]], _arg2);
            _arg5[0] = new PropertyWatcher("_active", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[1] = new PropertyWatcher("grayFilter", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[2] = new PropertyWatcher("_select", {propertyChange:true}, [_arg4[3]], _arg2);
            _arg5[3].updateParent(_arg1);
            _arg5[4].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
            _arg5[1].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
        }

    }
}//package 
