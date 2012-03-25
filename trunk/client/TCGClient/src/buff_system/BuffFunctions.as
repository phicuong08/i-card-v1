//Created by Action Script Viewer - http://www.buraks.com/asv
package buff_system {
    import combat_element_script.*;

    public class BuffFunctions {

        public static function createTooltip(_arg1:int):String{
            return (BuffFunctions[("func" + _arg1)](_arg1));
        }
        private static function getBuffDetailInfo(_arg1:int):Object{
            var _local2 = (("return as3.toobject(u.buff_mgr.all_buff[" + _arg1) + "]:get_buff_info())");
            var _local3:Array = LuaAgent.getInstance().run(_local2);
            if (((_local3[0]) && ((_local3.length > 1)))){
                return (_local3[1]);
            };
            return (null);
        }
        private static function func10000(_arg1:int):String{
            var _local3:String;
            var _local2:Object = getBuffDetailInfo(_arg1);
            switch (_local2.card_back){
                case "source/cardImages/card_back2.png":
                    _local3 = "#g【蓝色卡背】#n<br>#o将卡背变更为蓝色图片。#n";
                    break;
                case "source/cardImages/black_card_back.png":
                    _local3 = "#g【黑色卡背】#n<br>#o将卡背变更为黑色图片。#n";
                    break;
                case "source/cardImages/red_card_back.png":
                    _local3 = "#g【红色卡背】#n<br>#o将卡背变更为红色图片。#n";
                    break;
                case "source/cardImages/pink_card_back.png":
                    _local3 = "#g【粉色卡背】#n<br>#o将卡背变更为粉色图片。#n";
                    break;
                case "source/cardImages/white_card_back.png":
                    _local3 = "#g【纯白卡背】#n<br>#o将卡背变更为纯白色图片。#n";
                    break;
                case "source/cardImages/black_card_back2.png":
                    _local3 = "#g【纯黑卡背】#n<br>#o将卡背变更为纯黑色图片。#n";
                    break;
                case "source/cardImages/guanyu_card_back.png":
                    _local3 = "#g【关羽卡背】#n<br>#o将卡片背面图片变更为关羽风格。#n";
                    break;
                case "source/cardImages/youxiwang_card_back.png":
                    _local3 = "#g【游戏王卡背】#n<br>#o将卡片背面图片变更为游戏王风格。#n";
                    break;
            };
            if (_local2){
                _local3 = (_local3 + (("<br>剩余次数：#r" + _local2.left_time) + "#n"));
            };
            return (_local3);
        }
        private static function func10100(_arg1:int):String{
            var _local2 = ("#g【双倍积分】#n<br>" + "#o通过对战和训练获胜所得的积分提升至原来的两倍。#n");
            var _local3:Object = getBuffDetailInfo(_arg1);
            if (_local3){
                _local2 = (_local2 + (("<br>剩余次数：#r" + _local3.left_time) + "#n"));
            };
            return (_local2);
        }
        private static function func10200(_arg1:int):String{
            var _local2 = ("#g【紫色名称背景】#n<br>" + "#o通过世界或房间频道发言时，名称背景色将变为紫色。#n");
            var _local3:Object = getBuffDetailInfo(_arg1);
            if (_local3){
                _local2 = (_local2 + (("<br>剩余次数：#r" + _local3.left_time) + "#n"));
            };
            return (_local2);
        }
        private static function func10300(_arg1:int):String{
            var _local2 = "#g【对战免罚】#n<br>";
            var _local3:Object = getBuffDetailInfo(_arg1);
            if (_local3){
                _local2 = (_local2 + "#o在#d正式区#n对战失败时可免除积分惩罚。");
                _local2 = (_local2 + (("<br>剩余次数：#r" + _local3.left_time) + "#n"));
            };
            return (_local2);
        }
        private static function func10400(_arg1:int):String{
            var _local2 = "#g【日常任务】#n<br>";
            var _local3:Object = getBuffDetailInfo(_arg1);
            if (_local3){
                _local2 = (_local2 + (("<br>当前拥有：#r" + _local3.left_time) + "#n 个日常"));
            };
            return (_local2);
        }
        private static function func10500(_arg1:int):String{
            var _local4:Number;
            var _local2 = "#g【VIP】#n";
            _local2 = (_local2 + "<br>#o聊天栏名字颜色变更");
            _local2 = (_local2 + "<br>作为房主可以请离玩家");
            _local2 = (_local2 + "<br>战斗、熔炼获得稀有卡概率提升15%#n");
            var _local3:Object = getBuffDetailInfo(_arg1);
            if (_local3){
                _local2 = (_local2 + "<br>剩余时间：#r");
                _local4 = (((_local3.total_duration + _local3.buff_start_time) * 1000) - new Date().time);
                _local4 = ((_local4 < 0)) ? 0 : _local4;
                if (_local4 > ((24 * 3600) * 1000)){
                    _local2 = (_local2 + (int((_local4 / ((24 * 3600) * 1000))) + "天#n"));
                } else {
                    if (_local4 > (3600 * 1000)){
                        _local2 = (_local2 + (int((_local4 / (3600 * 1000))) + "小时#n"));
                    } else {
                        _local2 = (_local2 + (int((_local4 / (60 * 1000))) + "分钟#n"));
                    };
                };
            };
            return (_local2);
        }

    }
}//package buff_system 
