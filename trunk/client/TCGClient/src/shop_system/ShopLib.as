//Created by Action Script Viewer - http://www.buraks.com/asv
package shop_system {
    import flash.events.*;
    import file_read.*;

    public class ShopLib {

        protected static var cardShopConfig:Object;
        protected static var itemShopConfig:Object;
        private static var cardShopConfigFile:Class = ShopLib_cardShopConfigFile;
        private static var itemShopConfigFile:Class = ShopLib_itemShopConfigFile;

        public static function getCardShopConfig():Object{
            return (cardShopConfig);
        }
        public static function getItemShopConfig():Object{
            return (itemShopConfig);
        }
        public static function buildShopConfig():void{
            cardShopConfig = new Object();
            var _local1:Csv = new Csv();
            //debugWindow.myTrace("开始读取 card_shop.csv 文件\n");
            _local1.addEventListener(Event.COMPLETE, cardShopConfigLoadComplete);
            if (TCGClient.isDebugMode){
                _local1.loadURL("../src/source/etc/card_shop.csv");
            } else {
                _local1.loadLocalFile(cardShopConfigFile);
            };
            itemShopConfig = new Object();
            _local1 = new Csv();
            //debugWindow.myTrace("开始读取 item_shop.csv 文件\n");
            _local1.addEventListener(Event.COMPLETE, itemShopConfigLoadComplete);
            if (TCGClient.isDebugMode){
                _local1.loadURL("../src/source/etc/item_shop.csv");
            } else {
                _local1.loadLocalFile(itemShopConfigFile);
            };
        }
        private static function cardShopConfigLoadComplete(_arg1:Event):void{
            var _local3:Object;
            var _local2:Csv = (_arg1.currentTarget as Csv);
            _local2.removeEventListener(Event.COMPLETE, cardShopConfigLoadComplete);
            for each (_local3 in _local2.getData()) {
                cardShopConfig[_local3["id"]] = _local3;
            };
            //debugWindow.myTrace("card_shop.csv 表载入成功!");
        }
        private static function itemShopConfigLoadComplete(_arg1:Event):void{
            var _local3:Object;
            var _local2:Csv = (_arg1.currentTarget as Csv);
            _local2.removeEventListener(Event.COMPLETE, itemShopConfigLoadComplete);
            for each (_local3 in _local2.getData()) {
                itemShopConfig[_local3["id"]] = _local3;
            };
            debugWindow.myTrace("item_shop.csv 表载入成功!");
        }

    }
}//package shop_system 
