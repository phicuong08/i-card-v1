//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import combat_element.*;

    public class _combat_element_DuelEndWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            DuelEndWindow.watcherSetupUtil = new (_combat_element_DuelEndWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[2] = new PropertyWatcher("bottomDesc", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[1] = new PropertyWatcher("topDesc", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[2].updateParent(_arg1);
            _arg5[1].updateParent(_arg1);
        }

    }
}//package 
