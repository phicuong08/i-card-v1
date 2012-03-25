//Created by Action Script Viewer - http://www.buraks.com/asv
package auction_system {
    import custom_control1.*;

    public class AuctionItemNumSelectWindow extends GoodNumSelectWindow {

        override protected function clickConfirmBtn():void{
            AuctionMgr.getInstance().putGoodsInDeal(goodsInfo.id, userSelectNum);
            super.clickConfirmBtn();
        }
        override protected function autodepthgroup1_creationCompleteHandler():void{
            descLabel.text = "请选择进行拍卖的数量：";
        }

    }
}//package auction_system 
