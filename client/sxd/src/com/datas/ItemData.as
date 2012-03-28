//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.info.*;
    import com.assist.view.pack.*;
    import com.lang.client.com.datas.*;
    import com.protocols.*;

    public class ItemData extends Base {

        public var result:int = 0;
        public var shopType:int = 0;
        public var shopNPCId:int = 0;
        public var gridsPack:Array;
        public var gridsPackAuto:Array;
        public var gridsWarehouse:Array;
        public var gridsWarehouseAuto:Array;
        public var gridsRole:Array;
        public var gridsRoleOther:Array;
        public var gridsShop:Array;
        public var gridsRecyle:Array;
        public var ingot_pack:int = 0;
        public var ingot_warehouse:int = 0;
        public var elixirCount:int = 0;
        public var elixirValue:int = 0;
        public var reelOutItemId:int;
        public var reelData:Array;
        public var playerRoleId:int = 0;
        public var danyaoList:Array;
        public var hasReelList:Array;
        public var hasGoldList:Array;
        public var giftUseMsg:String = "";
        public var recastList:Array;
        public var cangoldList:Array;
        public var getSoul:Object;
        public var getTheItemNum:Object;
        public var getGoldOil:Object;

        public function ItemData():void{
            this.gridsPack = [];
            this.gridsWarehouse = [];
            this.gridsRole = [];
            this.gridsRoleOther = [];
            this.gridsShop = [];
            this.gridsRecyle = [];
            this.danyaoList = [];
            this.hasReelList = [];
            this.hasGoldList = [];
            this.recastList = [];
            this.cangoldList = [];
            this.getSoul = {};
            this.getTheItemNum = {};
            this.getGoldOil = {};
            super();
            ItemTipSprite.ed.addEventListener("Item_Req", this.reqJuanZhouHandler);
            ItemTipSprite.ed.addEventListener("ItemSoul_Req", this.reqSoulHandler);
        }
        private function reqJuanZhouHandler(_arg1:JuanZhouEvent):void{
            _data.call(Mod_Item_Base.get_facture_reel_data, null, [_arg1.id]);
        }
        private function reqSoulHandler(_arg1:JuanZhouEvent):void{
            _data.call(Mod_SealSoul_Base.get_item_info_by_player_item_id, null, [_arg1.id]);
        }
        public function dismount_transport(_arg1:Array):void{
        }
        public function avatar_card_off(_arg1:Array):void{
        }
        public function add_pack_grid(_arg1:Array):void{
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            var _local2:int = _arg1[1];
            while (_local2 <= _arg1[2]) {
                this.pushPack(_local2);
                _local2++;
            };
            this.ingot_pack = _arg1[3];
        }
        public function add_warehouse_grid(_arg1:Array):void{
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            var _local2:int = _arg1[1];
            while (_local2 <= _arg1[2]) {
                this.pushWareHouse(_local2);
                _local2++;
            };
            this.ingot_warehouse = _arg1[3];
        }
        public function get_empty_grid_number(_arg1:Array):void{
        }
        public function classify_pack(_arg1:Array):void{
            var _local2:int;
            var _local3:Array;
            this.result = _arg1[0];
            if (this.result == Mod_Item_Base.ACTION_SUCCESS){
                _local2 = (this.gridsPack.length - BoxGrid.idPack);
                this.resetGrids(BoxGrid.idPack, _local2, this.gridsPack);
                for each (_local3 in this.gridsPackAuto) {
                    this.updatePackGrids(_local3);
                };
            };
            this.gridsPackAuto = [];
        }
        public function classify_warehouse(_arg1:Array):void{
            var _local2:int;
            var _local3:Array;
            this.result = _arg1[0];
            if (this.result == Mod_Item_Base.ACTION_SUCCESS){
                _local2 = (this.gridsWarehouse.length - BoxGrid.idWareHouse);
                this.resetGrids(BoxGrid.idWareHouse, _local2, this.gridsWarehouse);
                for each (_local3 in this.gridsWarehouseAuto) {
                    this.updateWarehouseGrids(_local3);
                };
            };
            this.gridsWarehouseAuto = [];
        }
        public function get_player_pack_item_list(_arg1:Array):void{
            var _local2:Array;
            this.resetGrids(BoxGrid.idPack, _arg1[0], this.gridsPack);
            this.ingot_pack = _arg1[1];
            for each (_local2 in _arg1[2]) {
                this.updateGrids(_local2);
            };
        }
        public function get_player_warehouse_grids(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            this.resetGrids(BoxGrid.idWareHouse, _arg1[1], this.gridsWarehouse);
            this.ingot_warehouse = _arg1[2];
            for each (_local2 in _arg1[3]) {
                this.updateGrids(_local2);
            };
        }
        public function get_role_equip_list(_arg1:Array):void{
            var _local3:Array;
            this.resetGrids(BoxGrid.idRole, 6, this.gridsRole);
            var _local2:int;
            while (_local2 < 6) {
                this.pushRole((_local2 + BoxGrid.idRole));
                _local2++;
            };
            for each (_local3 in _arg1[0]) {
                this.updateGrids(_local3);
            };
        }
        public function get_npc_item_list(_arg1:Array):void{
            var _local4:ItemInfo;
            var _local6:Array;
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            this.shopNPCId = _arg1[1];
            var _local2:String = TownType.getNPCSignByTownNPCId(this.shopNPCId);
            this.shopType = NPCType.getFunctionBySign(_local2);
            this.resetGrids(0, _arg1[2].length, this.gridsShop);
            var _local3:int;
            var _local5 :Boolean= (this.shopType == NPCType.CardBuyNPC);
            for each (_local6 in _arg1[2]) {
                _local4 = this.gridsShop[_local3];
                _local4.parseShop(_local6[0], 1, _local5);
                _local3++;
            };
            this.gridsShop.sortOn(["ingot", "typeId", "quality", "upgradeLevel", "itemId"], [Array.NUMERIC, Array.NUMERIC, (Array.NUMERIC | Array.DESCENDING), (Array.NUMERIC | Array.DESCENDING), Array.NUMERIC]);
        }
        public function get_npc_recycle_item_list(_arg1:Array):void{
            var _local3:Array;
            var _local4:ItemInfo;
            var _local2:int = _arg1[0].length;
            this.resetGrids(0, _local2, this.gridsRecyle);
            while (_local2 > 0) {
                _local2--;
                _local3 = _arg1[0][_local2];
                _local4 = this.gridsRecyle[_local2];
                _local4.parseRecycle(_local3);
            };
            this.gridsShop.sortOn(["ingot", "typeId", "quality", "upgradeLevel", "itemId"], [Array.NUMERIC, Array.NUMERIC, (Array.NUMERIC | Array.DESCENDING), (Array.NUMERIC | Array.DESCENDING), Array.NUMERIC]);
        }
        public function get_player_role_equip_list(_arg1:Array):void{
            var _local2:Array;
            var _local3:int;
            var _local4:ItemInfo;
            this.resetGrids(BoxGrid.idRole, 6, this.gridsRoleOther);
            for each (_local2 in _arg1[0]) {
                _local3 = _local2[2];
                _local4 = (this.gridsRoleOther[_local3] as ItemInfo);
                _local4.parsePack(_local2);
            };
        }
        public function player_buy_npc_item(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            for each (_local2 in _arg1[1]) {
                this.updateGrids(_local2);
            };
        }
        public function player_sell_item(_arg1:Array):void{
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            this.updateGrids(_arg1[1][0]);
            var _local2:ItemInfo = new ItemInfo();
            _local2.parseRecycle(_arg1[2][0]);
            this.gridsRecyle.unshift(_local2);
        }
        public function player_buy_back_item(_arg1:Array):void{
            var _local4:ItemInfo;
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            this.updateGrids(_arg1[1][0]);
            var _local2:int = _arg1[2][0][0];
            var _local3:int = this.gridsRecyle.length;
            while (_local3 > 0) {
                _local3--;
                _local4 = this.gridsRecyle[_local3];
                if (_local4.playerItemId == _local2){
                    this.gridsRecyle.splice(_local3, 1);
                };
            };
        }
        public function change_pack_item_grid(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            for each (_local2 in _arg1[1]) {
                this.updateGrids(_local2);
            };
        }
        public function change_warehouse_item_grid(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            for each (_local2 in _arg1[1]) {
                this.updateGrids(_local2);
            };
        }
        public function move_pack_grid_item_to_warehouse(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            for each (_local2 in _arg1[1]) {
                this.updateGrids(_local2);
            };
        }
        public function move_warehouse_grid_item_to_pack(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            for each (_local2 in _arg1[1]) {
                this.updateGrids(_local2);
            };
        }
        public function drop_pack_grid_item(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            for each (_local2 in _arg1[1]) {
                this.updateGrids(_local2);
            };
        }
        public function drop_warehouse_grid_item(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            for each (_local2 in _arg1[1]) {
                this.updateGrids(_local2);
            };
        }
        public function remove_player_role_equipment(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            for each (_local2 in _arg1[1]) {
                this.updateGrids(_local2);
            };
        }
        public function equip_player_role_item(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            for each (_local2 in _arg1[1]) {
                this.updateGrids(_local2);
            };
        }
        public function player_use_grid_item(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            for each (_local2 in _arg1[1]) {
                this.updateGrids(_local2);
            };
        }
        public function get_player_role_elixir_data(_arg1:Array):void{
            this.elixirCount = (_arg1[0] + 1);
            this.elixirValue = _arg1[1];
        }
        public function player_use_grid_elixir(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            for each (_local2 in _arg1[1]) {
                this.updateGrids(_local2);
            };
        }
        public function player_use_grid_reel(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            this.reelOutItemId = _arg1[1];
            if (this.result != Mod_Item_Base.ACTION_SUCCESS){
                return;
            };
            for each (_local2 in _arg1[3]) {
                this.updateGrids(_local2);
            };
        }
        public function get_facture_reel_data(_arg1:Array):void{
            this.reelData = _arg1;
            ItemTipSprite.ed.dispatchEvent(new JuanZhouEvent(_arg1, _arg1[0], ("Item_" + _arg1[0])));
        }
        public function get_player_role_elixir_record(_arg1:Array):void{
            var _local2:Array;
            var _local3:Object;
            this.playerRoleId = _arg1[0];
            this.danyaoList[ItemType.WuLiDan] = [];
            this.danyaoList[ItemType.JueJiDan] = [];
            this.danyaoList[ItemType.FaShuDan] = [];
            for each (_local2 in _arg1[1]) {
                _local3 = {};
                _local3.a = _local2[2];
                _local3.c = _local2[3];
                _local3.gid = _local2[4];
                _local3.num = _local2[5];
                _local3.url = ItemBasically.getBasic(_local2[0]).getImgUrl(0);
                _local3.itemId = _local2[0];
                _local3.ingot = _local2[6];
                _local3.lv = ItemBasically.getBasic(_local2[0]).require;
                this.danyaoList[_local2[1]].push(_local3);
            };
            this.danyaoList[ItemType.WuLiDan].sortOn("a", Array.NUMERIC);
            this.danyaoList[ItemType.JueJiDan].sortOn("a", Array.NUMERIC);
            this.danyaoList[ItemType.FaShuDan].sortOn("a", Array.NUMERIC);
        }
        public function player_use_ingot_elixir(_arg1:Array):void{
            this.result = _arg1[0];
        }
        public function get_item_basical_infos(_arg1:Array):void{
        }
        public function get_item_info_by_player_item_id(_arg1:Array):void{
            var _local4:Object;
            var _local6:Array;
            var _local2:Array = [];
            var _local3:Array = [];
            var _local5:int;
            for each (_local6 in _arg1[1]) {
                if (_local6[2] != 0){
                    _local5 = SoulType.getWarAttributeTypeId(_local6[2]);
                    _local4 = ((_local3[_local5]) || ({}));
                    _local3[_local5] = _local4;
                    _local4.id = _local5;
                    _local4.value = (_local6[3] + int(_local4.value));
                };
                if (_local6[4] != 0){
                    _local5 = SoulType.getWarAttributeTypeId(_local6[4]);
                    _local4 = ((_local3[_local5]) || ({}));
                    _local3[_local5] = _local4;
                    _local4.id = _local5;
                    _local4.value = (_local6[5] + int(_local4.value));
                };
                if (_local6[6] != 0){
                    _local5 = SoulType.getWarAttributeTypeId(_local6[6]);
                    _local4 = ((_local3[_local5]) || ({}));
                    _local3[_local5] = _local4;
                    _local4.id = _local5;
                    _local4.value = (_local6[7] + int(_local4.value));
                };
            };
            for each (_local4 in _local3) {
                _local2.push(this.renderLocationList(_local4.id, _local4.value));
            };
            _local2.sortOn("id", Array.NUMERIC);
            ItemTipSprite.ed.dispatchEvent(new JuanZhouEvent(_local2, _arg1[0], ("ItemSoul_" + _arg1[0])));
        }
        public function has_level_gift_item(_arg1:Array):void{
            _data.player.giftItemId = _arg1[0];
        }
        public function player_get_super_gift(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            for each (_local2 in _arg1[1]) {
                this.updateGrids(_local2);
            };
        }
        public function player_reel_need_item(_arg1:Array):void{
            var _local2:Array;
            var _local3:Object;
            this.hasReelList = [];
            for each (_local2 in _arg1[0]) {
                _local3 = {};
                _local3.player_item_id = _local2[0];
                _local3.item_id = _local2[1];
                _local3.need_lv = ItemType.getRequireLevel(_local2[4]);
                this.hasReelList[_local2[3]] = _local3;
            };
            this.hasGoldList = [];
            for each (_local2 in _arg1[1]) {
                _local3 = {};
                _local3.player_item_id = _local2[0];
                _local3.item_id = _local2[1];
                _local3.pro_item_id = GoldOilType.getPrevOilItemId(_local2[1]);
                _local3.require = GoldOilType.getItemLevel(_local2[1]);
                this.hasGoldList[_local3.pro_item_id] = _local3;
            };
        }
        public function player_equip_use_reel(_arg1:Array):void{
            this.player_use_grid_reel(_arg1);
        }
        public function get_player_item_facture_reel_data(_arg1:Array):void{
            this.get_facture_reel_data(_arg1);
        }
        public function notify_super_gift_items(_arg1:Array):void{
            var _local4:int;
            var _local5:String;
            var _local6:int;
            var _local7:Array;
            var _local8:Array;
            var _local2:String = "";
            var _local3:Array = [];
            if (_arg1[0] > 0){
                _local3.push((HtmlText.yellow(_arg1[0]) + ItemDataLang.Coin));
            };
            if (_arg1[1] > 0){
                _local3.push((HtmlText.yellow(_arg1[1]) + ItemDataLang.Fame));
            };
            if (_arg1[2] > 0){
                _local3.push((HtmlText.yellow(_arg1[2]) + ItemDataLang.Ingot));
            };
            for each (_local7 in _arg1[3]) {
                _local4 = ItemType.getItemColor(_local7[0]);
                _local5 = ItemType.getName(_local7[0]);
                if (_local7[1] > 1){
                    _local5 = ((_local5 + _local7[1]) + ItemDataLang.Ge);
                };
                _local3.push(HtmlText.format(_local5, _local4));
            };
            _local8 = [0, 0x999999, 2272312, 44783, 0xFF00FF, 0xFFF100, 0xFF0000];
            for each (_local6 in _arg1[4]) {
                _local4 = _local8[FateType.getFateQuality(_local6)];
                _local5 = FateType.getFateName(_local6);
                _local3.push(HtmlText.format(_local5, _local4));
            };
            for each (_local6 in _arg1[5]) {
                _local4 = SoulType.getSoulQualityColor(_local6);
                _local5 = SoulType.getSoulName(_local6);
                _local3.push(HtmlText.format(_local5, _local4));
            };
            this.giftUseMsg = ((ItemDataLang.GetItem + " ") + _local3.join(" "));
            if (_arg1[6] == 1){
                this.giftUseMsg = ((((this.giftUseMsg + " ") + HtmlText.yellow2(ItemDataLang.Star)) + " ") + HtmlText.yellow2(ItemDataLang.WorldFirst));
            };
        }
        public function change_attack_info(_arg1:Array):void{
            this.recastList = _arg1[0];
        }
        public function change_attack_item(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            for each (_local2 in _arg1[1]) {
                this.updatePackGrids(_local2);
            };
        }
        public function can_change_list(_arg1:Array):void{
            this.recastList = _arg1[0];
        }
        public function can_use_gold_info(_arg1:Array):void{
            this.cangoldList = _arg1[0];
        }
        public function use_gold_oil(_arg1:Array):void{
            var _local2:Array;
            this.result = _arg1[0];
            if (this.result == Mod_Item_Base.SUCCESS){
                for each (_local2 in _arg1[1]) {
                    this.updateGrids(_local2);
                };
            };
        }
        public function get_soul(_arg1:Array):void{
            this.getSoul["result"] = _arg1[0];
        }
        public function get_the_item_num(_arg1:Array):void{
            this.getTheItemNum["total_num"] = _arg1[0];
        }
        public function get_gold_oil(_arg1:Array):void{
            this.getGoldOil["result"] = _arg1[0];
        }
        public function pushPack(_arg1:int):void{
            if (_arg1 == 0){
                return;
            };
            var _local2:ItemInfo = (this.gridsPack[_arg1] = ((this.gridsPack[_arg1]) || (new ItemInfo())));
            _local2.gridId = _arg1;
        }
        public function pushWareHouse(_arg1:int):void{
            if (_arg1 == 0){
                return;
            };
            var _local2:ItemInfo = (this.gridsWarehouse[_arg1] = ((this.gridsWarehouse[_arg1]) || (new ItemInfo())));
            _local2.gridId = _arg1;
        }
        public function pushRole(_arg1:int):void{
            if (_arg1 == 0){
                return;
            };
            var _local2:ItemInfo = (this.gridsRole[_arg1] = ((this.gridsRole[_arg1]) || (new ItemInfo())));
            _local2.gridId = _arg1;
        }
        private function resetGrids(_arg1:int, _arg2:int, _arg3:Array):void{
            var _local4:ItemInfo;
            while (_arg3.length > _arg2) {
                _arg3.pop();
            };
            while (_arg2 > 0) {
                _local4 = (_arg3[_arg1] = ((_arg3[_arg1]) || (new ItemInfo())));
                _local4.reset();
                _local4.gridId = _arg1;
                _arg1++;
                _arg2--;
            };
        }
        private function updateGrids(_arg1:Array):void{
            var _local2:int = _arg1[2];
            if (_local2 >= BoxGrid.idRole){
                this.updateRoleGrids(_arg1);
            } else {
                if (_local2 >= BoxGrid.idWareHouse){
                    this.updateWarehouseGrids(_arg1);
                } else {
                    if (_local2 >= BoxGrid.idPack){
                        this.updatePackGrids(_arg1);
                    };
                };
            };
        }
        private function updatePackGrids(_arg1:Array):void{
            var _local2:int = _arg1[2];
            var _local3:ItemInfo = (this.gridsPack[_local2] = ((this.gridsPack[_local2]) || (new ItemInfo())));
            _local3.parsePack(_arg1);
            this.pushPack(_local2);
        }
        private function updateWarehouseGrids(_arg1:Array):void{
            var _local2:int = _arg1[2];
            var _local3:ItemInfo = (this.gridsWarehouse[_local2] = ((this.gridsWarehouse[_local2]) || (new ItemInfo())));
            _local3.parsePack(_arg1);
            this.pushWareHouse(_local2);
        }
        private function updateRoleGrids(_arg1:Array):void{
            var _local2:int = _arg1[2];
            var _local3:ItemInfo = (this.gridsRole[_local2] = ((this.gridsRole[_local2]) || (new ItemInfo())));
            _local3.parsePack(_arg1);
            this.pushRole(_local2);
        }
        public function renderLocationList(_arg1:int, _arg2:Number):Object{
            var _local3:String = SoulType.warAttributeIdToName(_arg1);
            var _local4:String = SoulType.warValueChange(_arg1, (_arg2 * 0.001));
            return ({
                name:_local3,
                info:((_local3 + " +") + _local4),
                id:_arg1
            });
        }

    }
}//package com.datas 
