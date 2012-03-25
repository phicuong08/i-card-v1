//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import combat_element.*;

    public class _combat_element_ChainNoticeWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            ChainNoticeWindow.watcherSetupUtil = new (_combat_element_ChainNoticeWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[1] = new PropertyWatcher("chainNoticeText", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[2] = new PropertyWatcher("isBtnVisible", {propertyChange:true}, [_arg4[2]], _arg2);
            _arg5[1].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
        }

    }
}//package 
