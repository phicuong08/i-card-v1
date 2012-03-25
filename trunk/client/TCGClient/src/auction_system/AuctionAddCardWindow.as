//Created by Action Script Viewer - http://www.buraks.com/asv
package auction_system {
    import custom_control1.*;
    import combat_element_script.*;

    public class AuctionAddCardWindow extends CommonCardsSelectWindow {

        public function AuctionAddCardWindow(){
            x = 251;
            y = 70;
        }
        override protected function getTargetCards():Object{
            var _local1:Array = LuaAgent.getInstance().run("return as3.toobject(translate_table_number_key_to_string(u.user_card_mgr:get_all_free_cards()))");
            return (_local1[1]);
        }
        override protected function doClickFunc(_arg1, _arg2):void{
            AuctionMgr.getInstance().showGoodsNumAddWindow({
                id:_arg1,
                num:_arg2
            });
        }
        override protected function group1_creationCompleteHandler():void{
            descLabel.text = "只有未编入卡组的卡片才能进行拍卖！";
            super.group1_creationCompleteHandler();
        }

    }
}//package auction_system 
