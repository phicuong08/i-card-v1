//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import flash.utils.*;
    import mx.core.*;
    import mx.managers.*;
    import flash.system.*;
    import flashx.textLayout.compose.*;
    import custom_control1.*;

    public class _newTCGClient_mx_managers_SystemManager extends SystemManager implements IFlexModuleFactory, ISWFContext {

        private var _preloadedRSLs:Dictionary;

        override public function callInContext(_arg1:Function, _arg2:Object, _arg3:Array, _arg4:Boolean=true){
            if (_arg4){
                return (_arg1.apply(_arg2, _arg3));
            };
            _arg1.apply(_arg2, _arg3);
        }
        override public function create(... _args):Object{
            if ((((_args.length > 0)) && (!((_args[0] is String))))){
                return (super.create.apply(this, _args));
            };
            var _local2:String = ((_args.length == 0)) ? "TCGClient" : String(_args[0]);
            var _local3:Class = Class(getDefinitionByName(_local2));
            if (!_local3){
                return (null);
            };
            var _local4:Object = new (_local3)();
            if ((_local4 is IFlexModule)){
                IFlexModule(_local4).moduleFactory = this;
            };
            return (_local4);
        }
        override public function info():Object{
            return ({
                applicationComplete:"createComplete()",
                backgroundColor:"0x181613",
                compiledLocales:["zh_CN"],
                compiledResourceBundleNames:["SharedResources", "collections", "components", "controls", "core", "effects", "formatters", "layout", "skins", "sparkEffects", "styles", "textLayout"],
                currentDomain:ApplicationDomain.currentDomain,
                deactivate:"application1_deactivateHandler(event)",
                frameRate:"60",
                initialize:"init()",
                mainClassName:"TCGClient",
                mixins:["_newTCGClient_FlexInit", "_newTCGClient_Styles", "mx.managers.systemClasses.ActiveWindowManager"],
                preloader:MyDownloadProgressBar,
                resize:"stageResizeHanlder()"
            });
        }
        override public function get preloadedRSLs():Dictionary{
            if (this._preloadedRSLs == null){
                this._preloadedRSLs = new Dictionary(true);
            };
            return (this._preloadedRSLs);
        }
        override public function allowDomain(... _args):void{
            var _local2:Object;
            Security.allowDomain(_args);
            for (_local2 in this._preloadedRSLs) {
                if (((_local2.content) && (("allowDomainInRSL" in _local2.content)))){
                    var _local5 = _local2.content;
                    _local5["allowDomainInRSL"](_args);
                };
            };
        }
        override public function allowInsecureDomain(... _args):void{
            var _local2:Object;
            Security.allowInsecureDomain(_args);
            for (_local2 in this._preloadedRSLs) {
                if (((_local2.content) && (("allowInsecureDomainInRSL" in _local2.content)))){
                    var _local5 = _local2.content;
                    _local5["allowInsecureDomainInRSL"](_args);
                };
            };
        }

    }
}//package 
