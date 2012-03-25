//Created by Action Script Viewer - http://www.buraks.com/asv
package trade_system {
    import mx.core.*;
    import custom_control1.*;
    import combat_element_script.*;

    public class TradeAddCardWindow extends CommonCardsSelectWindow {

        override protected function getTargetCards():Object{
            var _local1:Array = LuaAgent.getInstance().run("return as3.toobject(translate_table_number_key_to_string(u.trade_mgr:get_all_trade_cards()))");
            return (_local1[1]);
        }
        override protected function doClickFunc(_arg1, _arg2):void{
            TradeMgr.getInstance().showGoodsNumAddWindow({
                id:_arg1,
                num:_arg2
            });
        }
        override protected function group1_creationCompleteHandler():void{
            descLabel.text = "只有“未编入卡组”的“非稀有卡片”才能参与交易！";
            super.group1_creationCompleteHandler();
        }
        override protected function commonouterframe1_mouseDownHandler():void{
            (parent as UIComponent).startDrag();
        }
        override protected function commonouterframe1_mouseUpHandler():void{
            (parent as UIComponent).stopDrag();
        }

    }
}//package trade_system 
