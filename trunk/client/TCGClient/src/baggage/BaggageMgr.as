//Created by Action Script Viewer - http://www.buraks.com/asv
package baggage {
    import flash.geom.*;
    import flash.events.*;
    import combat_element_script.*;

    public class BaggageMgr extends EventDispatcher {

        private static var _instance:BaggageMgr = new (BaggageMgr)();
;

        private var baggageWindow:BaggageWindow;
        private var itemUseWindow:BaggageItemUseWindow;

        public function BaggageMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
            this.reset();
        }
        public static function getInstance():BaggageMgr{
            return (_instance);
        }

        public function reset():void{
        }
        public function refreshBaggage():void{
            if (((this.baggageWindow) && (this.baggageWindow.parent))){
                this.baggageWindow.setAllItemInfo();
            };
        }
        public function setItem(_arg1:int, _arg2:Object):void{
            var _local3:BaggageWindowItem;
            if (((this.baggageWindow) && (this.baggageWindow.parent))){
                if (((_arg2) && (!(_arg2.id)))){
                    _arg2 = null;
                };
                _local3 = (this.baggageWindow.allItemContainer[_arg1] as BaggageWindowItem);
                _local3.itemLogicInfo = _arg2;
            };
        }
        public function refreshItemNum(_arg1:int, _arg2:int):void{
            var _local3:BaggageWindowItem;
            if (((this.baggageWindow) && (this.baggageWindow.parent))){
                _local3 = (this.baggageWindow.allItemContainer[_arg1] as BaggageWindowItem);
                _local3.refreshNum(_arg2);
            };
        }
        public function showBaggage():void{
            if (!this.baggageWindow){
                this.baggageWindow = new BaggageWindow();
                this.baggageWindow.x = 966;
                this.baggageWindow.y = 81;
            };
            if (!this.baggageWindow.parent){
                TCGClient.getInstance().mainGroup.addElement(this.baggageWindow);
            };
        }
        public function hideBaggage():void{
            if (this.baggageWindow){
                this.baggageWindow.removeSelf();
            };
        }
        public function autoShowHideBaggage():void{
            if (((this.baggageWindow) && (this.baggageWindow.parent))){
                this.hideBaggage();
            } else {
                this.showBaggage();
            };
        }
        public function useItem(_arg1:BaggageWindowItem):void{
            var showUseWindow:* = null;
            var item:* = _arg1;
            showUseWindow = function ():void{
                var _local1:Rectangle;
                itemUseWindow = new BaggageItemUseWindow();
                _local1 = item.getRect(baggageWindow);
                itemUseWindow.setInfo(item.itemLogicInfo);
                itemUseWindow.x = (_local1.x - ((itemUseWindow.width - item.width) / 2));
                itemUseWindow.y = (_local1.y - itemUseWindow.height);
                baggageWindow.addElement(itemUseWindow);
            };
            if (this.itemUseWindow){
                this.itemUseWindow.removeSelf();
            };
            if (!this.baggageWindow){
                return;
            };
            BaggageItemUseConfirmScript.doConfirmScript(item.itemInfo.id, showUseWindow);
        }
        public function userItemByIdNum(_arg1:String, _arg2:int):void{
            LuaAgent.getInstance().run((((("return u.item_mgr:use_item(" + _arg1) + ", ") + _arg2) + ")"));
        }
        public function putItemToNewPos(_arg1:int, _arg2:int):void{
            LuaAgent.getInstance().run((((("return u.item_mgr:put_item_to_new_pos(" + _arg1) + ",") + _arg2) + ")"));
        }

    }
}//package baggage 
