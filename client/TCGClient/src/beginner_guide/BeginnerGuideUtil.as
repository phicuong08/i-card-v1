//Created by Action Script Viewer - http://www.buraks.com/asv
package beginner_guide {
    import flash.geom.*;
    import flash.events.*;
    import combat_element_script.*;
    import tool.*;

    public class BeginnerGuideUtil {

        public static const NOTICE_WINDOW_DEPTH:int = 21;

        private static var operationCount:int = 0;
        private static var operations:Object = new Object();

        public static function reset():void{
            operations = new Object();
        }
        public static function dispatchLuaEvent(_arg1:String, _arg2:Object=null, _arg3:Boolean=false):void{
            var func:* = null;
            var eventName:* = _arg1;
            var param = _arg2;
            var direct:Boolean = _arg3;
            func = function ():void{
                LuaAgent.getInstance().run((((("if u then u.beginner_guide:dispatch_event(\"" + eventName) + "\", ") + LuaAgent.objectToLuaString(param)) + "); end"));
            };
            if (direct){
                func();
            } else {
                TCGClient.getInstance().callLater(func);
            };
        }
        private static function addOperation(_arg1:IBeginnerGuideOperation):String{
            operationCount++;
            operations[operationCount.toString()] = _arg1;
            return (operationCount.toString());
        }
        public static function removeOperationByKey(_arg1:String):void{
            var _local2:IBeginnerGuideOperation = operations[_arg1];
            if (_local2){
                _local2.removeOperation();
                delete operations[_arg1];
            };
        }
        public static function removeOperationByOp(_arg1:IBeginnerGuideOperation):void{
            var _local2:String;
            var _local3:IBeginnerGuideOperation;
            for (_local2 in operations) {
                _local3 = operations[_local2];
                if (_local3 == _arg1){
                    _local3.removeOperation();
                    delete operations[_local2];
                    return;
                };
            };
        }
        public static function doCmdByKey(_arg1:String, _arg2:Object=null):void{
            var _local3:IBeginnerGuideOperation = operations[_arg1];
            if (_local3){
                _local3.doCmd(_arg2);
            };
        }
        public static function addStageClickListener():void{
            var clickHandler:* = null;
            clickHandler = function (_arg1:MouseEvent):void{
                TCGClient.getInstance().removeEventListener(MouseEvent.CLICK, clickHandler);
                dispatchLuaEvent("stageClick");
            };
            TCGClient.getInstance().addEventListener(MouseEvent.CLICK, clickHandler);
        }
        public static function showHeadNoticeWindow(_arg1:Object):String{
            var _local2:HeadNoticeWindow = new HeadNoticeWindow();
            _local2.setInfo(_arg1);
            TCGClient.getInstance().mainGroup.addElement(_local2);
            return (addOperation(_local2));
        }
        public static function showEasyNoticeWindow(_arg1:Object):String{
            var _local2:EasyNoticeWindow = new EasyNoticeWindow();
            _local2.setInfo(_arg1);
            TCGClient.getInstance().mainGroup.addElement(_local2);
            return (addOperation(_local2));
        }
        public static function showTitleNoticeWindow(_arg1:Object):String{
            var _local2:TitleNoticeWindow = new TitleNoticeWindow();
            _local2.setInfo(_arg1);
            TCGClient.getInstance().mainGroup.addElement(_local2);
            return (addOperation(_local2));
        }
        public static function showHightLightEffect(_arg1:Object):String{
            var _local2:HightLightEffectWindow = new HightLightEffectWindow();
            _local2.setInfo(_arg1);
            TCGClient.getInstance().mainGroup.addElement(_local2);
            return (addOperation(_local2));
        }
        public static function showCardImage(_arg1:Object):String{
            var _local2:CardShowImage = new CardShowImage();
            _local2.setInfo(_arg1);
            TCGClient.getInstance().mainGroup.addElement(_local2);
            return (addOperation(_local2));
        }
        public static function showSurroundEffect(_arg1:Object):String{
            var _local2:Rectangle = new Rectangle(_arg1["x"], _arg1["y"], _arg1["width"], _arg1["height"]);
            var _local3:BeginnerGuideSurroundEffect = new BeginnerGuideSurroundEffect(_local2, _arg1["moveSpeed"], _arg1["glowColor"], _arg1["lineColor"], _arg1["lineSize"]);
            _local3.play();
            return (addOperation(_local3));
        }
        public static function showLabel(_arg1:Object):String{
            var _local2:GuideLabel = new GuideLabel();
            _local2.setInfo(_arg1);
            TCGClient.getInstance().mainGroup.addElement(_local2);
            return (addOperation(_local2));
        }
        public static function showLine(_arg1:Object):String{
            var _local2:GuideEasyLine = new GuideEasyLine();
            _local2.setInfo(_arg1);
            TCGClient.getInstance().mainGroup.addElement(_local2);
            return (addOperation(_local2));
        }
        public static function addTimerEvent(_arg1:int, _arg2:String):void{
            var timerHandler:* = null;
            var duration:* = _arg1;
            var event:* = _arg2;
            timerHandler = function ():void{
                dispatchLuaEvent(event);
            };
            CommonUtil.addTimerLaterCall(duration, timerHandler);
        }
        public static function callFlashFunction(_arg1:Function, ... _args){
            return (TCGClient.getInstance().callLater(_arg1, _args));
        }

    }
}//package beginner_guide 
