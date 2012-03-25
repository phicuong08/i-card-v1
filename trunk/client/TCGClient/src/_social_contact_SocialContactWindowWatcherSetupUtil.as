//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import social_contact.*;

    public class _social_contact_SocialContactWindowWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            SocialContactWindow.watcherSetupUtil = new (_social_contact_SocialContactWindowWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[0] = new PropertyWatcher("addEffect", {propertyChange:true}, [_arg4[0]], _arg2);
            _arg5[1] = new PropertyWatcher("currentDisplayType", {propertyChange:true}, [_arg4[4], _arg4[5]], _arg2);
            _arg5[0].updateParent(_arg1);
            _arg5[1].updateParent(_arg1);
        }

    }
}//package 
