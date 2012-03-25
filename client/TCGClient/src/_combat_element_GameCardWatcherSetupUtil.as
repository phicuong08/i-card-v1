//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.binding.*;
    import combat_element.*;

    public class _combat_element_GameCardWatcherSetupUtil implements IWatcherSetupUtil2 {

        public static function init(_arg1:IFlexModuleFactory):void{
            GameCard.watcherSetupUtil = new (_combat_element_GameCardWatcherSetupUtil)();
        }

        public function setup(_arg1:Object, _arg2:Function, _arg3:Function, _arg4:Array, _arg5:Array):void{
            var target:* = _arg1;
            var propertyGetter:* = _arg2;
            var staticPropertyGetter:* = _arg3;
            var bindings:* = _arg4;
            var watchers:* = _arg5;
            watchers[0] = new PropertyWatcher("cardImage", {propertyChange:true}, [bindings[0], bindings[1], bindings[2], bindings[4]], propertyGetter);
            watchers[1] = new PropertyWatcher("scaleY", {scaleYChanged:true}, [bindings[4]], null);
            watchers[6] = new PropertyWatcher("reversedImg", {propertyChange:true}, [bindings[7]], propertyGetter);
            watchers[2] = new FunctionReturnWatcher("getInstance", target, function ():Array{
                return ([]);
            }, null, [bindings[4]], null);
            watchers[3] = new PropertyWatcher("mainGroup", {propertyChange:true}, [bindings[4]], null);
            watchers[4] = new PropertyWatcher("scaleY", {scaleYChanged:true}, [bindings[4]], null);
            watchers[0].updateParent(target);
            watchers[0].addChild(watchers[1]);
            watchers[6].updateParent(target);
            watchers[2].updateParent(TCGClient);
            watchers[2].addChild(watchers[3]);
            watchers[3].addChild(watchers[4]);
        }

    }
}//package 
