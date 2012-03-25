//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import social_contact.*;

    public class _social_contact_SocialContactWindowItemWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            SocialContactWindowItem.watcherSetupUtil = new (_social_contact_SocialContactWindowItemWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            _arg5[3] = new PropertyWatcher("_isMouseOver", {propertyChange:true}, [_arg4[2]], _arg2);
            _arg5[1] = new PropertyWatcher("grayFilter", {propertyChange:true}, [_arg4[1]], _arg2);
            _arg5[2] = new PropertyWatcher("_isSelected", {propertyChange:true}, [_arg4[2], _arg4[3]], _arg2);
            _arg5[3].updateParent(_arg1);
            _arg5[1].updateParent(_arg1);
            _arg5[2].updateParent(_arg1);
        }

    }
}//package 
