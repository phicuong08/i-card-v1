//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import normal_window.*;

    public class _normal_window_RoomWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            RoomWindow.watcherSetupUtil = new (_normal_window_RoomWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[3] = new PropertyWatcher("bounceEasing", {propertyChange:true}, [_arg4[3], _arg4[5]], _arg2);
            _arg5[0] = new PropertyWatcher("addEffect", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[5] = new PropertyWatcher("topGroup", {propertyChange:true}, [_arg4[6], _arg4[10]], _arg2);
            _arg5[4] = new PropertyWatcher("downUserAreaList", {propertyChange:true}, [_arg4[4], _arg4[9]], _arg2);
            _arg5[2] = new PropertyWatcher("upUserAreaList", {propertyChange:true}, [_arg4[2], _arg4[8]], _arg2);
            _arg5[6] = new PropertyWatcher("viewerAreaWindow", {propertyChange:true}, [_arg4[7], _arg4[11]], _arg2);
            _arg5[1] = new PropertyWatcher("removeEffect", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[3].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
            _arg5[5].updateParent(_arg1);
            _arg5[4].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
            _arg5[6].updateParent(_arg1);
            _arg5[1].updateParent(_arg1);
        }

    }
}//package 
