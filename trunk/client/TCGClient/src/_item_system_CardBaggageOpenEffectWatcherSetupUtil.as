//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import item_system.*;

    public class _item_system_CardBaggageOpenEffectWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            CardBaggageOpenEffect.watcherSetupUtil = new (_item_system_CardBaggageOpenEffectWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[0] = new PropertyWatcher("coverImg", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[0].updateParent(_arg1);
        }

    }
}//package 
