//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;
    import tool.*;

    public class MyToolTipWindow extends MyTooltipGroup implements IToolTip {

        protected var textString:String;
        protected var richRext:MyToolTipRichText;

        public function MyToolTipWindow(){
            this.richRext = new MyToolTipRichText();
            addElement(this.richRext);
        }
        public function set text(_arg1:String):void{
            this.textString = _arg1;
            if (_arg1){
                this.richRext.textFlow = StringUtils.createTFByHtmlText(this.textString);
            } else {
                this.richRext.textFlow = null;
            };
        }
        public function get text():String{
            return (this.textString);
        }

    }
}//package custom_control 
