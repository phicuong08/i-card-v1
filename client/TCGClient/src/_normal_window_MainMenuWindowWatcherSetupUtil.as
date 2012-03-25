//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import normal_window.*;

    public class _normal_window_MainMenuWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            MainMenuWindow.watcherSetupUtil = new (_normal_window_MainMenuWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[4] = new PropertyWatcher("itemGroup1", {propertyChange:true}, [_arg4[4]], _arg2);
            _arg5[2] = new PropertyWatcher("playerInfoWindow", {propertyChange:true}, [_arg4[2]], _arg2);
            _arg5[0] = new PropertyWatcher("addEffect", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[6] = new PropertyWatcher("itemGroup3", {propertyChange:true}, [_arg4[6]], _arg2);
            _arg5[5] = new PropertyWatcher("itemGroup2", {propertyChange:true}, [_arg4[5]], _arg2);
            _arg5[8] = new PropertyWatcher("itemGroup5", {propertyChange:true}, [_arg4[8]], _arg2);
            _arg5[7] = new PropertyWatcher("itemGroup4", {propertyChange:true}, [_arg4[7]], _arg2);
            _arg5[3] = new PropertyWatcher("bgImg", {propertyChange:true}, [_arg4[3]], _arg2);
            _arg5[1] = new PropertyWatcher("removeEffect", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[9] = new PropertyWatcher("itemGroup6", {propertyChange:true}, [_arg4[9]], _arg2);
            _arg5[4].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
            _arg5[6].updateParent(_arg1);
            _arg5[5].updateParent(_arg1);
            _arg5[8].updateParent(_arg1);
            _arg5[7].updateParent(_arg1);
            _arg5[3].updateParent(_arg1);
            _arg5[1].updateParent(_arg1);
            _arg5[9].updateParent(_arg1);
        }

    }
}//package 
