//Created by Action Script Viewer - http://www.buraks.com/asv
package card_smelt {
    import custom_control1.*;

    public class CardSmeltItemNumSelectWindow extends GoodNumSelectWindow {

        override protected function clickConfirmBtn():void{
            CardSmeltMgr.getInstance().transferCard(goodsInfo.id, userSelectNum);
            super.clickConfirmBtn();
        }
        override protected function autodepthgroup1_creationCompleteHandler():void{
            descLabel.text = "请选择移动的数量：";
        }

    }
}//package card_smelt 
