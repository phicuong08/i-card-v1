//Created by Action Script Viewer - http://www.buraks.com/asv
package card_smelt {
    import mx.core.*;
    import mx.events.*;
    import flash.events.*;
    import spark.components.*;
    import custom_control1.*;
    import combat_element_script.*;
    import item_system.*;

    public class CardSmeltMgr extends EventDispatcher {

        private static var _instance:CardSmeltMgr = new (CardSmeltMgr)();
;

        private var lastNumSelectWindow:CardSmeltItemNumSelectWindow;
        private var lastDragInitiator:IUIComponent;
        private var lastDropGroup:Group;
        private var smeltMainWindow:SmeltMainWindow;

        public function CardSmeltMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
            this.reset();
        }
        public static function getInstance():CardSmeltMgr{
            return (_instance);
        }

        public function reset():void{
            this.lastNumSelectWindow = null;
            this.lastDragInitiator = null;
            this.lastDropGroup = null;
        }
        public function showSmeltMainWindow():void{
            var clearWindow:* = null;
            if (!this.smeltMainWindow){
                clearWindow = function (_arg1:FlexEvent):void{
                    smeltMainWindow.removeEventListener(FlexEvent.REMOVE, clearWindow);
                    smeltMainWindow = null;
                    reset();
                };
                this.smeltMainWindow = new SmeltMainWindow();
                this.smeltMainWindow.addEventListener(FlexEvent.REMOVE, clearWindow);
            };
            if (!this.smeltMainWindow.parent){
                TCGClient.getInstance().mainGroup.addElement(this.smeltMainWindow);
            };
        }
        public function hideSmeltMainWindow():void{
            if (this.smeltMainWindow){
                this.smeltMainWindow.removeSelf();
            };
        }
        public function setDisplayCardId(_arg1:String):void{
            if (this.smeltMainWindow){
                this.smeltMainWindow.setDisplayCardId(_arg1);
            };
        }
        public function useSpeedUpItem(_arg1:int):void{
            var _local2 = 10400;
            var _local3:Object = {smelt_index:_arg1};
            var _local4:Array = LuaAgent.getInstance().run((("return u.item_mgr:check_item_exist(" + _local2) + ")"));
            if (_local4[1]){
                LuaAgent.getInstance().run((((("u.item_mgr:use_item(" + _local2) + ", 1, ") + LuaAgent.objectToLuaString(_local3)) + ")"));
            } else {
                MessageBox.showMessageBox(MessageBox.EASY_NOTICE, "提示：", "消耗道具#g【炼卡加速】#n可以减少熔炼剩余时间。<br>该道具在商城“道具分页”界面中出售。");
            };
        }
        public function addSmelt(_arg1:Object):void{
            if (this.smeltMainWindow){
                this.smeltMainWindow.addSmelt(_arg1);
            };
        }
        public function refreshSmelt(_arg1:int, _arg2:Object):void{
            if (this.smeltMainWindow){
                this.smeltMainWindow.refreshSmelt(_arg1, _arg2);
            };
        }
        public function getAllSmeltCards():Object{
            var _local1:Array = LuaAgent.getInstance().run("return as3.toobject(translate_table_number_key_to_string(u.user_card_mgr:get_all_free_cards()))");
            return (_local1[1]);
        }
        public function getUserSmeltInfo():Object{
            var _local1:Array = LuaAgent.getInstance().run("return u.card_smelt_mgr:get_all_smelt_info()");
            return (_local1[1]);
        }
        public function getSmeltHarvestCards(_arg1:int, _arg2, _arg3):void{
            LuaAgent.getInstance().run((((((("u.card_smelt_mgr:get_smelt_harvest_cards(" + _arg1) + ",") + _arg2) + ",") + _arg3) + ")"));
        }
        public function startSmelt(_arg1:int, _arg2:Object):void{
            LuaAgent.getInstance().run((((("u.card_smelt_mgr:start_smelt(" + _arg1) + ",") + LuaAgent.objectToLuaString(_arg2)) + ")"));
        }
        public function getHarvestCardsRare(_arg1:Object):Number{
            var _local2:Array = LuaAgent.getInstance().run((("return u.card_smelt_mgr:calc_harvest_cards_rare_power(" + LuaAgent.objectToLuaString(_arg1)) + ") * 0.1"));
            return (_local2[1]);
        }
        public function dragDropHandler(_arg1:DragEvent, _arg2:Group):void{
            var _local3:Object = (_arg1.dragSource.dataForFormat("source") as Object);
            this.lastDragInitiator = _arg1.dragInitiator;
            this.lastDropGroup = _arg2;
            if (_local3.num == 1){
                this.transferCard(_local3.id, _local3.num);
            } else {
                if (this.lastNumSelectWindow){
                    this.lastNumSelectWindow.removeSelf();
                };
                this.lastNumSelectWindow = new CardSmeltItemNumSelectWindow();
                this.lastNumSelectWindow.setInfo(_local3);
                this.smeltMainWindow.addElement(this.lastNumSelectWindow);
                this.lastNumSelectWindow.x = this.smeltMainWindow.mouseX;
                this.lastNumSelectWindow.y = this.smeltMainWindow.mouseY;
            };
        }
        public function transferCard(_arg1:String, _arg2:int):void{
            var _local4:CardSmeltCardItem;
            var _local3:Object = ItemCardLib.getItemInfoById(_arg1);
            if ((this.lastDropGroup is SmeltDataGrid)){
                (this.lastDropGroup as SmeltDataGrid).addCard(_local3, _arg2);
                (this.lastDragInitiator as CardSmeltCardItem).belongSmelt.removeCard(_arg1, _arg2);
                if ((this.lastDragInitiator as CardSmeltCardItem).isHarvestCard){
                    _local4 = (this.lastDragInitiator as CardSmeltCardItem);
                    this.getSmeltHarvestCards((_local4.belongSmelt.smeltIndex + 1), _local4.cardId, _local4.cardNum);
                };
            } else {
                (this.lastDropGroup as CardSmelt).addCard(_arg1, _arg2);
                (this.lastDragInitiator as SmeltDataGridItem).getParentDataGrid().removeCard(_local3, _arg2);
            };
        }
        public function addCardsToDataGrid(_arg1:Object, _arg2:int):void{
            if (this.smeltMainWindow){
                this.smeltMainWindow.addCardsToDataGrid(_arg1, _arg2);
            };
        }

    }
}//package card_smelt 
