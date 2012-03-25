//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import player_view.*;

    public class _player_view_AllFreePlayerWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            AllFreePlayerWindow.watcherSetupUtil = new (_player_view_AllFreePlayerWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[1] = new PropertyWatcher("pagesData", {propertyChange:true}, [_arg4[3]], _arg2);
            _arg5[0] = new PropertyWatcher("addEffect", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[1].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
        }

    }
}//package 
