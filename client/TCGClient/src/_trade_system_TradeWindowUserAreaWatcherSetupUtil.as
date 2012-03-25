//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import trade_system.*;

    public class _trade_system_TradeWindowUserAreaWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            TradeWindowUserArea.watcherSetupUtil = new (_trade_system_TradeWindowUserAreaWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[4] = new PropertyWatcher("confirmState", {propertyChange:true}, [_arg4[7]], _arg2);
            _arg5[0] = new PropertyWatcher("userHeadIconPath", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[1] = new PropertyWatcher("userName", {propertyChange:true}, [_arg4[2]], _arg2);
            _arg5[3] = new PropertyWatcher("_isUserMode", {propertyChange:true}, [_arg4[4], _arg4[5], _arg4[6]], _arg2);
            _arg5[2] = new PropertyWatcher("userMoney", {propertyChange:true}, [_arg4[3]], _arg2);
            _arg5[4].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
            _arg5[1].updateParent(_arg1);
            _arg5[3].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
        }

    }
}//package 
