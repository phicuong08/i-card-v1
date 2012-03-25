//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element_script {
    import flash.utils.*;
    import tool.*;

    public class UserObject {

        public static var isNewUser:Boolean = false;

        public static function get isVip():Boolean{
            var _local1:Array = LuaAgent.getInstance().run("return u:is_vip()");
            return (_local1[1]);
        }
        public static function get isBeginnerGuideUser():Boolean{
            var _local1:Array = LuaAgent.getInstance().run("return u.task_mgr:is_beginner_guide_user()");
            return (_local1[1]);
        }
        public static function get meDetailInfo():Object{
            var _local1:Array = LuaAgent.getInstance().run("return u:flash_get_me_detail_info()");
            return (_local1[1]);
        }
        public static function checkIgnore(_arg1:String):Boolean{
            var _local2:Array = LuaAgent.getInstance().run((("if u then return u.social_contact_mgr:check_ignore(\"" + _arg1) + "\") else return false end"));
            return (_local2[1]);
        }
        public static function getPvpInfo(_arg1:String):Object{
            var _local2:Array = LuaAgent.getInstance().run((("return as3.toobject(u.duel_mgr.pvp_info[\"" + _arg1) + "\"])"));
            return (_local2[1]);
        }
        public static function get activeTrainList():Array{
            var _local1:Array = LuaAgent.getInstance().run("return as3.toarray(u.train_mgr:get_active_train_list())");
            return (_local1[1]);
        }
        public static function get trainRecord():Object{
            var _local1:Array = LuaAgent.getInstance().run("return as3.toobject(translate_table_number_key_to_string(u.train_mgr.train_record))");
            return (_local1[1]);
        }
        public static function get selectCardGroup():String{
            var _local1:Array = LuaAgent.getInstance().run("return u.config_mgr.config_info.select_card_group");
            return (_local1[1]);
        }
        public static function set selectCardGroup(_arg1:String):void{
            LuaAgent.getInstance().run((("u.config_mgr:set_select_card_group(\"" + _arg1) + "\")"));
        }
        public static function get duelRole():String{
            var _local1:Array = LuaAgent.getInstance().run("return u.duel_role");
            return (_local1[1]);
        }
        public static function get item():Object{
            var _local1:Array = LuaAgent.getInstance().run("return as3.toobject(translate_table_number_key_to_string(u.item_mgr.all_item))");
            return (_local1[1]);
        }
        public static function get cardBackImg():String{
            var _local1:Array = LuaAgent.getInstance().run("return u:get_card_back_img()");
            return (_local1[1]);
        }
        public static function get level():int{
            var _local1:Array = LuaAgent.getInstance().run("return u.level");
            return (_local1[1]);
        }
        public static function get name():String{
            var _local1:Array = LuaAgent.getInstance().run("return u.name");
            return (_local1[1]);
        }
        public static function get roomName():String{
            var _local1:Array = LuaAgent.getInstance().run("return u.hall_room_mgr.current_room");
            return (_local1[1]);
        }
        public static function get groupCardsInfo():Object{
            var _local1:Array = LuaAgent.getInstance().run("return as3.toobject(translate_table_number_key_to_string(u.user_card_mgr.group_card_info))");
            return (_local1[1]);
        }
        public static function get allCardsInfo():Object{
            var _local1:Array = LuaAgent.getInstance().run("return as3.toobject(translate_table_number_key_to_string(u.user_card_mgr.all_card_info))");
            return (_local1[1]);
        }
        public static function get newCardsInfo():Object{
            var _local1:Array = LuaAgent.getInstance().run("return as3.toobject(translate_table_number_key_to_string(u.user_card_mgr.new_card_info))");
            return (_local1[1]);
        }
        public static function get allCardsNum():int{
            var _local1:Array = LuaAgent.getInstance().run("return u.user_card_mgr:get_all_card_num()");
            return (_local1[1]);
        }
        public static function get campaignOpenInfo():Object{
            var _local1:Array = LuaAgent.getInstance().run("return as3.toobject(translate_table_number_key_to_string(u.guide_mgr:get_all_open_campaign()))");
            return (_local1[1]);
        }
        public static function get campaignCompleteInfo():Object{
            var _local1:Array = LuaAgent.getInstance().run("return as3.toobject(translate_table_number_key_to_string(u.guide_mgr.campaign_complete_info))");
            return (_local1[1]);
        }
        public static function get camp():String{
            var _local1:Array = LuaAgent.getInstance().run("return u.camp");
            return (translateUserCamp(_local1[1]));
        }
        public static function translateUserCamp(_arg1:String):String{
            switch (_arg1){
                case "caocao":
                    return ("曹操");
                case "liubei":
                    return ("刘备");
                default:
                    return ("孙权");
            };
        }
        public static function get competitionExploit():int{
            var _local1:Array = LuaAgent.getInstance().run("return u.competition_exploit");
            return (_local1[1]);
        }
        public static function get money():int{
            var _local1:Array = LuaAgent.getInstance().run("return u.money");
            return (_local1[1]);
        }
        public static function get remainScore():int{
            var _local1:Array = LuaAgent.getInstance().run("return u.remain_score");
            return (_local1[1]);
        }
        public static function get allScore():int{
            var _local1:Array = LuaAgent.getInstance().run("return u.all_score");
            return (_local1[1]);
        }
        public static function getLevelUpScore(_arg1:int):int{
            var _local2:Array = LuaAgent.getInstance().run((("return get_level_up_score(" + _arg1) + ")"));
            return (_local2[1]);
        }
        public static function get headIcon():int{
            var _local1:Array = LuaAgent.getInstance().run("return u.head_icon");
            return (_local1[1]);
        }
        public static function get achievement():Array{
            var _local1:Array = LuaAgent.getInstance().run("return as3.toarray(u.achievement_info)");
            return (_local1[1]);
        }
        public static function get state():String{
            var _local1:Array = LuaAgent.getInstance().run("return u.state_mgr:get_user_state()");
            return (_local1[1]);
        }
        public static function transUserState(_arg1:String):Object{
            var _local2:Object = new Object();
            switch (_arg1){
                case "hall":
                    _local2["state_index"] = 10;
                    _local2["state_color"] = 8126251;
                    _local2["state_desc"] = "对战大厅";
                    break;
                case "competition_hall":
                    _local2["state_index"] = 20;
                    _local2["state_color"] = 8126251;
                    _local2["state_desc"] = "竞赛大厅";
                    break;
                case "free":
                    _local2["state_index"] = 30;
                    _local2["state_color"] = 14466179;
                    _local2["state_desc"] = "空闲";
                    break;
                case "watch_train":
                    _local2["state_index"] = 40;
                    _local2["state_color"] = 14466179;
                    _local2["state_desc"] = "观看训练";
                    break;
                case "viewer":
                    _local2["state_index"] = 50;
                    _local2["state_color"] = 14466179;
                    _local2["state_desc"] = "观看对战";
                    break;
                case "competition_viewer":
                    _local2["state_index"] = 60;
                    _local2["state_color"] = 14466179;
                    _local2["state_desc"] = "观看竞赛";
                    break;
                case "prepare":
                case "prepare_ok":
                    _local2["state_index"] = 70;
                    _local2["state_color"] = 14466179;
                    _local2["state_desc"] = "对战准备";
                    break;
                case "competition_prepare":
                case "competition_prepare_ok":
                    _local2["state_index"] = 80;
                    _local2["state_color"] = 14466179;
                    _local2["state_desc"] = "竞赛准备";
                    break;
                case "duel":
                    _local2["state_index"] = 90;
                    _local2["state_color"] = 16725799;
                    _local2["state_desc"] = "对战决斗";
                    break;
                case "competition_duel":
                    _local2["state_index"] = 100;
                    _local2["state_color"] = 16725799;
                    _local2["state_desc"] = "竞赛决斗";
                    break;
                case "campaign":
                    _local2["state_index"] = 110;
                    _local2["state_color"] = 16725799;
                    _local2["state_desc"] = "战役";
                    break;
                case "train":
                    _local2["state_index"] = 120;
                    _local2["state_color"] = 16725799;
                    _local2["state_desc"] = "训练";
                    break;
            };
            return (_local2);
        }
        public static function transUserCardName(_arg1:String):String{
            var _local2:String;
            switch (_arg1){
                case "caocao":
                case "曹操":
                    _local2 = "陈留起兵";
                    break;
                case "liubei":
                case "刘备":
                    _local2 = "桃园结义";
                    break;
                case "sunquan":
                case "孙权":
                    _local2 = "破虏将军";
                    break;
            };
            return (_local2);
        }
        public static function checkUserName(_arg1:String){
            var _local2:* = HeXie.hasSensitiveWord(_arg1);
            if (_local2){
                return (_local2[2]);
            };
            var _local3:ByteArray = new ByteArray();
            _local3.writeMultiByte(_arg1, "gb2312");
            if (_arg1.length == 0){
                return ("请输入昵称。");
            };
            if (_local3.length > 12){
                return ("昵称过长，最多包含 12 个字母或 6 个汉字。");
            };
            if (_arg1.indexOf(",") != -1){
                return ("昵称不允许包含逗号！");
            };
            if (_arg1.indexOf("'") != -1){
                return ("昵称不允许包含单引号！！");
            };
            if (_arg1.indexOf("\"") != -1){
                return ("昵称不允许包含双引号！");
            };
            if (_arg1.indexOf(" ") != -1){
                return ("昵称不允许含有空格符！");
            };
            return (true);
        }
        public static function transUserWinPercent(_arg1, _arg2, _arg3):String{
            var _local4:Number = ((int(_arg1) == 0)) ? 0 : (int(_arg1) / ((int(_arg1) + int(_arg2)) + int(_arg3)));
            return (((_local4 * 100).toFixed(1) + "%"));
        }
        public static function transUserEscapePercent(_arg1, _arg2, _arg3):String{
            var _local4:Number = ((int(_arg3) == 0)) ? 0 : (int(_arg3) / ((int(_arg1) + int(_arg2)) + int(_arg3)));
            return (((_local4 * 100).toFixed(1) + "%"));
        }

    }
}//package combat_element_script 
