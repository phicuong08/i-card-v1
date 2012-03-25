//Created by Action Script Viewer - http://www.buraks.com/asv
package flash.text.ime {

    public final class CompositionAttributeRange {

        public var relativeStart:int;
        public var relativeEnd:int;
        public var selected:Boolean;
        public var converted:Boolean;

        public function CompositionAttributeRange(_arg1:int, _arg2:int, _arg3:Boolean, _arg4:Boolean):void{
            this.relativeStart = _arg1;
            this.relativeEnd = _arg2;
            this.selected = _arg3;
            this.converted = _arg4;
        }
    }
}//package flash.text.ime 
