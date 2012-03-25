//Created by Action Script Viewer - http://www.buraks.com/asv
package card_smelt {
    import flash.events.*;
    import normal_window.*;

    public class SmeltDataGridItem extends JudgeCardDataGridItem {

        override protected function showHideAddRemoveBtn(_arg1:Boolean):void{
        }
        override protected function group1_mouseDownHandler(_arg1:MouseEvent):void{
        }
        override protected function showDisplayCard(_arg1:String):void{
            CardSmeltMgr.getInstance().setDisplayCardId(_arg1);
        }
        override protected function setEnabledByUserLevel():void{
        }

    }
}//package card_smelt 
