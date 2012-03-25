//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import combat_element.*;

    public class _combat_element_SelectCardWithOptionsWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            SelectCardWithOptions.watcherSetupUtil = new (_combat_element_SelectCardWithOptionsWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[5] = new PropertyWatcher("cancelBtnEnabled", {propertyChange:true}, [_arg4[7]], _arg2);
            _arg5[3] = new PropertyWatcher("tipTexs", {propertyChange:true}, [_arg4[5]], _arg2);
            _arg5[4] = new PropertyWatcher("ensureBtnEnabled", {propertyChange:true}, [_arg4[6]], _arg2);
            _arg5[2] = new PropertyWatcher("_scaleEffect", {propertyChange:true}, [_arg4[2]], _arg2);
            _arg5[1] = new PropertyWatcher("scaleEffect", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[5].updateParent(_arg1);
            _arg5[3].updateParent(_arg1);
            _arg5[4].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
            _arg5[1].updateParent(_arg1);
        }

    }
}//package 
