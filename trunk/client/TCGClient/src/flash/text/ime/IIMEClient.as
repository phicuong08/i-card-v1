//Created by Action Script Viewer - http://www.buraks.com/asv
package flash.text.ime {
    import flash.geom.*;
    import __AS3__.vec.*;

    public interface IIMEClient {

        function updateComposition(_arg1:String, _arg2:Vector.<CompositionAttributeRange>, _arg3:int, _arg4:int):void;
        function confirmComposition(_arg1:String=null, _arg2:Boolean=false):void;
        function getTextBounds(_arg1:int, _arg2:int):Rectangle;
        function get compositionStartIndex():int;
        function get compositionEndIndex():int;
        function get verticalTextLayout():Boolean;
        function get selectionAnchorIndex():int;
        function get selectionActiveIndex():int;
        function selectRange(_arg1:int, _arg2:int):void;
        function getTextInRange(_arg1:int, _arg2:int):String;

    }
}//package flash.text.ime 
