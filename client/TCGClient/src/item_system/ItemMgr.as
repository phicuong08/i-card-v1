//Created by Action Script Viewer - http://www.buraks.com/asv
package item_system {
    import flash.events.*;
    import normal_window.*;
    import combat_element_script.*;
    import shop_system.*;

    public class ItemMgr {

        private static var _instance:ItemMgr = new (ItemMgr)();
;

        public function ItemMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():ItemMgr{
            return (_instance);
        }

        public function reset():void{
        }
        public function showCardBaggaeOpenWindow(_arg1:Object, _arg2:Object):void{
            var effectWindow:* = null;
            var oneBaggageOpenResult:* = null;
            var eventHandler:* = null;
            var cardId:* = null;
            var allBaggageOpenResult:* = _arg1;
            var newCardInfo:* = _arg2;
            eventHandler = function (_arg1:Event):void{
                effectWindow.removeEventListener(CardBaggageOpenEffect.REMOVE_EFFECT_START, eventHandler);
                var _local2:CardBaggageOpenWindow = new CardBaggageOpenWindow();
                _local2.allBaggageOpenResult = allBaggageOpenResult;
                _local2.newCardInfo = newCardInfo;
                TCGClient.getInstance().mainGroup.addElement(_local2);
                if (ShopMainWindow.getInstance()){
                    ShopMainWindow.getInstance().refreshCardBaggageCollenctionRate();
                };
                JudgeCards.getInstance().refreshAllCardInfo(UserObject.allCardsInfo, UserObject.newCardsInfo);
            };
            effectWindow = new CardBaggageOpenEffect();
            for each (oneBaggageOpenResult in allBaggageOpenResult) {
                for (cardId in oneBaggageOpenResult.get_card_info) {
                    effectWindow.cardId = cardId;
                    break;
                };
                break;
            };
            TCGClient.getInstance().mainGroup.addElement(effectWindow);
            effectWindow.addEventListener(CardBaggageOpenEffect.REMOVE_EFFECT_START, eventHandler);
        }
        public function getItemTooltip(_arg1):String{
            if ((_arg1 is String)){
                _arg1 = ItemCardLib.getItemInfoById(_arg1);
            };
            if (!_arg1.name){
                throw (new Error("生成道具 tooltip 文本异常!"));
            };
            return (((((((("#g【" + _arg1.name) + "】#n<br>") + "#d使用等级：") + _arg1.level_request) + "#n<br>#o") + _arg1.desc) + "#n"));
        }

    }
}//package item_system 
