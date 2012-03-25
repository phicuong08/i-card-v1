//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import notice_system.*;

    public class _notice_system_CommonNoticeTalkWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            CommonNoticeTalkWindow.watcherSetupUtil = new (_notice_system_CommonNoticeTalkWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[2] = new PropertyWatcher("tipFlow", {propertyChange:true}, [_arg4[2]], _arg2);
            _arg5[0] = new PropertyWatcher("fadeInEffect", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[1] = new PropertyWatcher("fadeOutEffect", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[2].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
            _arg5[1].updateParent(_arg1);
        }

    }
}//package 
