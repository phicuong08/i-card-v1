//Created by Action Script Viewer - http://www.buraks.com/asv
package card_collection {
    import mx.events.*;
    import flash.events.*;
    import combat_element_script.*;

    public class CardCollectionMgr extends EventDispatcher {

        private static var _instance:CardCollectionMgr = new (CardCollectionMgr)();
;

        private var cardCollectionMainWindow:CardCollectionMainWindow;

        public function CardCollectionMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
            this.reset();
        }
        public static function getInstance():CardCollectionMgr{
            return (_instance);
        }

        public function reset():void{
        }
        public function showCardCollectionMainWindow():void{
            var clearWindow:* = null;
            if (!this.cardCollectionMainWindow){
                clearWindow = function (_arg1:FlexEvent):void{
                    cardCollectionMainWindow.removeEventListener(FlexEvent.REMOVE, clearWindow);
                    cardCollectionMainWindow = null;
                    reset();
                };
                this.cardCollectionMainWindow = new CardCollectionMainWindow();
                this.cardCollectionMainWindow.addEventListener(FlexEvent.REMOVE, clearWindow);
            };
            if (!this.cardCollectionMainWindow.parent){
                TCGClient.getInstance().mainGroup.addElement(this.cardCollectionMainWindow);
            };
        }
        public function hideCardCollectionMainWindow():void{
            if (this.cardCollectionMainWindow){
                this.cardCollectionMainWindow.removeSelf();
            };
        }
        public function getCollectionDetailData():Object{
            var _local1:Array = LuaAgent.getInstance().run("return u.card_collection_mgr:get_detail_info()");
            return (_local1[1]);
        }
        public function check_submit(_arg1:int, _arg2:int):Array{
            var _local3:Array = LuaAgent.getInstance().run((((("return u.card_collection_mgr:check_submit(" + _arg1) + ",") + _arg2) + ")"));
            return (_local3);
        }
        public function submitCard(_arg1:int, _arg2:int):void{
            LuaAgent.getInstance().run((((("return u.card_collection_mgr:submit_card(" + _arg1) + ",") + _arg2) + ")"));
        }
        public function refreshCollection(_arg1:Object):void{
            if (this.cardCollectionMainWindow){
                this.cardCollectionMainWindow.refreshCollection(_arg1);
            };
        }

    }
}//package card_collection 
