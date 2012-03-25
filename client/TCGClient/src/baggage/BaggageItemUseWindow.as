//Created by Action Script Viewer - http://www.buraks.com/asv
package baggage {
    import custom_control1.*;

    public class BaggageItemUseWindow extends GoodNumSelectWindow {

        override protected function clickConfirmBtn():void{
            BaggageMgr.getInstance().userItemByIdNum(goodsInfo.id, userSelectNum);
            super.clickConfirmBtn();
        }
        override protected function autodepthgroup1_creationCompleteHandler():void{
            descLabel.text = "请选择要使用的数量：";
        }

    }
}//package baggage 
