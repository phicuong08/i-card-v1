//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import beginner_guide.*;

    public class _beginner_guide_HightLightEffectWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            HightLightEffectWindow.watcherSetupUtil = new (_beginner_guide_HightLightEffectWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[1] = new PropertyWatcher("fadeInEffect", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[1].updateParent(_arg1);
        }

    }
}//package 
