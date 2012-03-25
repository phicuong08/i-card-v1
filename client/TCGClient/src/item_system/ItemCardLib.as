//Created by Action Script Viewer - http://www.buraks.com/asv
package item_system {
    import combat_element_script.*;
    import shop_system.*;
    import tool.*;

    public class ItemCardLib {

        public static function getItemInfoById(_arg1):Object{
            var _local2:Object;
            if (_arg1.toString() < 10000){
                _local2 = CommonUtil.cloneObject(CardsInfo.getAllCardsInfo()[_arg1.toString()]);
                _local2.isCard = true;
            } else {
                _local2 = CommonUtil.cloneObject(ShopLib.getItemShopConfig()[_arg1.toString()]);
                _local2.isCard = false;
            };
            return (_local2);
        }
        public static function getItemTypeText(_arg1, _arg2:Boolean=true):String{
            var _local3:Object = getItemInfoById(_arg1);
            if (_local3.isCard){
                switch (_local3.color){
                    case "red":
                        return ((_arg2) ? "#r陷阱卡#n" : "陷阱卡");
                    case "green":
                        return ((_arg2) ? "#g计策卡#n" : "计策卡");
                    case "gold":
                        return ((_arg2) ? "#y金色武将卡#n" : "金色武将卡");
                    default:
                        return ((_arg2) ? "#s银色武将卡#n" : "银色武将卡");
                };
            };
            return ((_arg2) ? "#p道具#n" : "道具");
        }
        public static function getItemFullName(_arg1):String{
            var _local2:Object = getItemInfoById(_arg1);
            if (((_local2["agname"]) && (!((_local2["agname"] == ""))))){
                return (((_local2["name"] + "·") + _local2["agname"]));
            };
            return (_local2["name"]);
        }

    }
}//package item_system 
