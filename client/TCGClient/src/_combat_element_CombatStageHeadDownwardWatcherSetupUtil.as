//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import combat_element.*;

    public class _combat_element_CombatStageHeadDownwardWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            CombatStageHeadDownward.watcherSetupUtil = new (_combat_element_CombatStageHeadDownwardWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[1] = new PropertyWatcher("headSource", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[2] = new PropertyWatcher("headName", {propertyChange:true}, [_arg4[2]], _arg2);
            _arg5[0] = new PropertyWatcher("headTooltip", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[1].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
            _arg5[0].updateParent(_arg1);
        }

    }
}//package 
