//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import custom_control1.*;

    public class _custom_control_CommonCardsSelectWindowItemWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            CommonCardsSelectWindowItem.watcherSetupUtil = new (_custom_control_CommonCardsSelectWindowItemWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[0] = new PropertyWatcher("bgImg", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[0].updateParent(_arg1);
        }

    }
}//package 
