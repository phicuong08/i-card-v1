//Created by Action Script Viewer - http://www.buraks.com/asv
package card_smelt {
    import ui_element.*;
    import source_manager.*;

    public class CardSmeltStyleButton extends ClickScaleButton {

        private static var _skinParts:Object = {labelDisplay:false};

        public function CardSmeltStyleButton(){
            buttonImage = JudgeCardsSourceMgr.getInstance().getSourceClass("smeltBtnImg");
            setStyle("fontSize", 16);
            setStyle("color", 15971955);
        }
        override protected function get skinParts():Object{
            return (_skinParts);
        }

    }
}//package card_smelt 
