//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import skins.*;

    public class _skins_universalImageButtonSkinWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            universalImageButtonSkin.watcherSetupUtil = new (_skins_universalImageButtonSkinWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            var target:* = _arg1;
            var propertyGetter:* = _arg2;
            var staticPropertyGetter:* = _arg3;
            var bindings:* = _arg4;
            var watchers:* = _arg5;
            watchers[0] = new PropertyWatcher("hostComponent", {propertyChange:true}, [bindings[0], bindings[1], bindings[2], bindings[3]], propertyGetter);
            watchers[1] = new FunctionReturnWatcher("getStyle", target, function ():Array{
                return (["btnScale"]);
            }, null, [bindings[0]], null, true);
            watchers[2] = new FunctionReturnWatcher("getStyle", target, function ():Array{
                return (["btnScale"]);
            }, null, [bindings[1]], null, true);
            watchers[3] = new FunctionReturnWatcher("getStyle", target, function ():Array{
                return (["btnScale"]);
            }, null, [bindings[2]], null, true);
            watchers[4] = new FunctionReturnWatcher("getStyle", target, function ():Array{
                return (["btnScale"]);
            }, null, [bindings[3]], null, true);
            watchers[0].updateParent(target);
            watchers[1].parentWatcher = watchers[0];
            watchers[0].addChild(watchers[1]);
            watchers[2].parentWatcher = watchers[0];
            watchers[0].addChild(watchers[2]);
            watchers[3].parentWatcher = watchers[0];
            watchers[0].addChild(watchers[3]);
            watchers[4].parentWatcher = watchers[0];
            watchers[0].addChild(watchers[4]);
        }

    }
}//package 
