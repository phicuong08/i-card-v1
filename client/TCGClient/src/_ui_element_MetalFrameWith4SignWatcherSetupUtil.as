//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import ui_element.*;

    public class _ui_element_MetalFrameWith4SignWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            MetalFrameWith4Sign.watcherSetupUtil = new (_ui_element_MetalFrameWith4SignWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[1] = new PropertyWatcher("height", {heightChanged:true}, [_arg4[1]], _arg2);
            _arg5[5] = new PropertyWatcher("_topSignVisible", {propertyChange:true}, [_arg4[5]], _arg2);
            _arg5[0] = new PropertyWatcher("width", {widthChanged:true}, [_arg4[0]], _arg2);
            _arg5[4] = new PropertyWatcher("_bottomSignVisible", {propertyChange:true}, [_arg4[4]], _arg2);
            _arg5[3] = new PropertyWatcher("_leftSignVisible", {propertyChange:true}, [_arg4[3]], _arg2);
            _arg5[2] = new PropertyWatcher("_rightSignVisible", {propertyChange:true}, [_arg4[2]], _arg2);
            _arg5[1].updateParent(_arg1);
            _arg5[5].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
            _arg5[4].updateParent(_arg1);
            _arg5[3].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
        }

    }
}//package 
