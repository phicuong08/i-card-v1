//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import shop_system.*;

    public class _shop_system_ShopCardWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            ShopCard.watcherSetupUtil = new (_shop_system_ShopCardWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[1] = new PropertyWatcher("goodsNum", {propertyChange:true}, [_arg4[4], _arg4[5]], _arg2);
            _arg5[0] = new PropertyWatcher("grayFilter", {propertyChange:true}, [_arg4[3]], _arg2);
            _arg5[1].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
        }

    }
}//package 
