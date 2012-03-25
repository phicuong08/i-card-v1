//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import custom_control1.*;

    public class _custom_control_ApplicationLoadingBarWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            ApplicationLoadingBar.watcherSetupUtil = new (_custom_control_ApplicationLoadingBarWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[1] = new PropertyWatcher("img2", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[0] = new PropertyWatcher("img1", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[6] = new PropertyWatcher("img7", {propertyChange:true}, [_arg4[3]], _arg2);
            _arg5[4] = new PropertyWatcher("img5", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[5] = new PropertyWatcher("img6", {propertyChange:true}, [_arg4[2]], _arg2);
            _arg5[2] = new PropertyWatcher("img3", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[3] = new PropertyWatcher("img4", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[1].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
            _arg5[6].updateParent(_arg1);
            _arg5[4].updateParent(_arg1);
            _arg5[5].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
            _arg5[3].updateParent(_arg1);
        }

    }
}//package 
