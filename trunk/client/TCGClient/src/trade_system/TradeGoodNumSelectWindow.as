//Created by Action Script Viewer - http://www.buraks.com/asv
package trade_system {
    import custom_control1.*;

    public class TradeGoodNumSelectWindow extends GoodNumSelectWindow {

        override protected function clickConfirmBtn():void{
            TradeMgr.getInstance().putGoodsInDeal(goodsInfo.id, userSelectNum);
            super.clickConfirmBtn();
        }
        override protected function autodepthgroup1_creationCompleteHandler():void{
            descLabel.text = "请选择参与交易的数量：";
        }

    }
}//package trade_system 
