//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import chat_system.*;

    public class _chat_system_ChatWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            ChatWindow.watcherSetupUtil = new (_chat_system_ChatWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[4] = new PropertyWatcher("channelText", {propertyChange:true}, [_arg4[7], _arg4[8]], _arg2);
            _arg5[5] = new PropertyWatcher("width", {widthChanged:true}, [_arg4[7], _arg4[8]], null);
            _arg5[3] = new PropertyWatcher("height", {heightChanged:true}, [_arg4[6], _arg4[9]], _arg2);
            _arg5[2] = new PropertyWatcher("width", {widthChanged:true}, [_arg4[5], _arg4[7]], _arg2);
            _arg5[4].updateParent(_arg1);
            _arg5[4].addChild(_arg5[5]);
            _arg5[3].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
        }

    }
}//package 
