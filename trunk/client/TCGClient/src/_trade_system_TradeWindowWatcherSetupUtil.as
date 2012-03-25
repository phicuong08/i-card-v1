//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import trade_system.*;

    public class _trade_system_TradeWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            TradeWindow.watcherSetupUtil = new (_trade_system_TradeWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[0] = new PropertyWatcher("addEffect", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[0].updateParent(_arg1);
        }

    }
}//package 
