//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.haloer.data.*;

    public class SealSoulData extends Base {

        public var SoulInfoList:Array;
        public var itemInfo:Array;
        public var equipPlayerSoul:Array;
        public var removePlayerSoul:Array;
        public var swapSoul:Array;
        public var moveSoul:Array;
        public var openSoulKey:Array;
        public var getResetCount:Array;
        public var getStoneCount:Array;
        public var soulAtributeReset:Array;
        public var getTowerKey:Array;
        public var sellPlayerSoul:Array;
        public var tenTimesReset:Array;
        public var playerSoulValue:Array;
        public var notifyGet:Object;
        public var getDayStone:Object;
        public var dayStoneCount:Object;
        public var swapSealSoul:Object;
        public var LockData:Array;
        public var WillToUnlock:Array;
        public var SaveLock:Array;

        public function SealSoulData(){
            this.notifyGet = {};
            this.getDayStone = {};
            this.dayStoneCount = {};
            this.swapSealSoul = {};
            super();
        }
        public function soul_info_by_location(_arg1:Array):void{
            this.SoulInfoList = _arg1[0];
        }
        public function get_item_info_by_role_id(_arg1:Array):void{
            this.itemInfo = _arg1;
        }
        public function equip_player_soul(_arg1:Array):void{
            this.equipPlayerSoul = _arg1;
        }
        public function remove_player_soul(_arg1:Array):void{
            this.removePlayerSoul = _arg1;
        }
        public function swap_soul(_arg1:Array):void{
            this.swapSoul = _arg1;
        }
        public function move_soul(_arg1:Array):void{
            this.moveSoul = _arg1;
        }
        public function open_player_soul_key(_arg1:Array):void{
            this.openSoulKey = _arg1;
        }
        public function soul_attribute_reset(_arg1:Array):void{
            this.soulAtributeReset = _arg1;
        }
        public function get_tower_key(_arg1:Array):void{
            this.getTowerKey = _arg1;
        }
        public function sell_player_soul(_arg1:Array):void{
            this.sellPlayerSoul = _arg1;
        }
        public function get_ten_times_reset_value(_arg1:Array):void{
            this.tenTimesReset = _arg1;
        }
        public function set_player_soul_value(_arg1:Array):void{
            this.playerSoulValue = _arg1;
        }
        public function get_reset_count(_arg1:Array):void{
            this.getResetCount = _arg1;
        }
        public function get_stone_count(_arg1:Array):void{
            this.getStoneCount = _arg1;
        }
        public function lock(_arg1:Array):void{
            this.LockData = _arg1;
        }
        public function will_to_unlock(_arg1:Array):void{
            this.WillToUnlock = _arg1;
        }
        public function get_item_info_by_player_item_id(_arg1:Array):void{
            _data.item.get_item_info_by_player_item_id(_arg1);
        }
        public function notify_get(_arg1:Array):void{
            oObject.list(_arg1, this.notifyGet, ["state"]);
        }
        public function get_day_stone(_arg1:Array):void{
            oObject.list(_arg1, this.getDayStone, ["state", "stone_coun"]);
        }
        public function day_stone_count(_arg1:Array):void{
            oObject.list(_arg1, this.dayStoneCount, ["count"]);
        }
        public function swap_seal_soul(_arg1:Array):void{
            oObject.list(_arg1, this.swapSealSoul, ["state"]);
        }
        public function save_lock(_arg1:Array):void{
            this.SaveLock = _arg1;
        }

    }
}//package com.datas 
