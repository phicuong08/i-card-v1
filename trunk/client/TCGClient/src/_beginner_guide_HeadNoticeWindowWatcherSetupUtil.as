//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import beginner_guide.*;

    public class _beginner_guide_HeadNoticeWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            HeadNoticeWindow.watcherSetupUtil = new (_beginner_guide_HeadNoticeWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[4] = new PropertyWatcher("tipFlow", {propertyChange:true}, [_arg4[5]], _arg2);
            _arg5[2] = new PropertyWatcher("title", {propertyChange:true}, [_arg4[2]], _arg2);
            _arg5[3] = new PropertyWatcher("height", {heightChanged:true}, [_arg4[4]], _arg2);
            _arg5[6] = new PropertyWatcher("btnText1", {propertyChange:true}, [_arg4[7]], _arg2);
            _arg5[7] = new PropertyWatcher("btnText2", {propertyChange:true}, [_arg4[9]], _arg2);
            _arg5[8] = new PropertyWatcher("btnText3", {propertyChange:true}, [_arg4[10]], _arg2);
            _arg5[0] = new PropertyWatcher("width", {widthChanged:true}, [_arg4[0], _arg4[3]], _arg2);
            _arg5[1] = new PropertyWatcher("headId", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[5] = new PropertyWatcher("btnMode", {propertyChange:true}, [_arg4[6], _arg4[8]], _arg2);
            _arg5[4].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
            _arg5[3].updateParent(_arg1);
            _arg5[6].updateParent(_arg1);
            _arg5[7].updateParent(_arg1);
            _arg5[8].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
            _arg5[1].updateParent(_arg1);
            _arg5[5].updateParent(_arg1);
        }

    }
}//package 
