﻿//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import auction_system.*;

    public class _auction_system_AuctionItemsContainerWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            AuctionItemsContainer.watcherSetupUtil = new (_auction_system_AuctionItemsContainerWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[1] = new PropertyWatcher("currentDisplayItems", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[1].updateParent(_arg1);
        }

    }
}//package 
