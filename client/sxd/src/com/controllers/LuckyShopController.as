//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {

    public class LuckyShopController extends Base {

        public function getLuckyShopItemList():Object{
            return (this._data.luckyShop.getLuckyShopItemList());
        }
        public function getLuckyShopRecordList():Array{
            return (this._data.luckyShop.getLuckyShopRecordList());
        }
        public function buyLuckyShopItem():Object{
            return (this._data.luckyShop.buyLuckyShopItem());
        }
        public function refreshLuckyShop():Object{
            return (this._data.luckyShop.refreshLuckyShop());
        }
        public function get isItemDataReturn():Boolean{
            return (this._data.luckyShop.isItemDataReturn);
        }

    }
}//package com.controllers 
