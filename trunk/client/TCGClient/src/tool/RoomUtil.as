//Created by Action Script Viewer - http://www.buraks.com/asv
package tool {

    public class RoomUtil {

        public static function getRoomIndexByInfo(_arg1:Object):String{
            var _local2:String = (_arg1["room_type"]) ? "room_type" : "type";
            var _local3:String = (_arg1["room_number"]) ? "room_number" : "number";
            var _local4:String = (_arg1["group_index"]) ? "group_index" : (_arg1["index"]) ? "index" : "group";
            if (_arg1[_local2] == "competition"){
                return (((_arg1[_local4] + "-") + _arg1[_local3]));
            };
            return (String(_arg1[_local3]));
        }
        public static function getRoomNameByInfo(_arg1:Object):String{
            var _local2:String = (_arg1["room_type"]) ? "room_type" : "type";
            var _local3:String = (_arg1["room_number"]) ? "room_number" : "number";
            var _local4:String = (_arg1["group_index"]) ? "group_index" : (_arg1["index"]) ? "index" : "group";
            switch (_arg1[_local2]){
                case "normal":
                    return (("新手场" + _arg1[_local3]));
                case "official":
                    return (("决斗场" + _arg1[_local3]));
                case "freedom":
                    return (("自由场" + _arg1[_local3]));
                case "normal_4":
                    return (("四人场" + _arg1[_local3]));
                default:
                    return (((("竞赛场" + _arg1[_local4]) + "-") + _arg1[_local3]));
            };
        }
        public static function isCompetitionModeRoom(_arg1:String):Boolean{
            if (_arg1 == "competition"){
                return (true);
            };
            return (false);
        }
        public static function isTwoPlayerModeRoom(_arg1:String):Boolean{
            if (_arg1 == "normal_4"){
                return (false);
            };
            return (true);
        }
        public static function isRoomAllowTrain(_arg1:String):Boolean{
            if ((((((_arg1 == "freedom")) || ((_arg1 == "official")))) || ((_arg1 == "normal")))){
                return (true);
            };
            return (false);
        }

    }
}//package tool 
