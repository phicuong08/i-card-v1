//Created by Action Script Viewer - http://www.buraks.com/asv
package trade_system {
    import mx.events.*;
    import flash.events.*;
    import custom_control1.*;
    import chat_system.*;
    import combat_element_script.*;
    import baggage.*;

    public class TradeMgr extends EventDispatcher {

        private static var _instance:TradeMgr = new (TradeMgr)();
;

        private var tradeWindow:TradeWindow;

        public function TradeMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
            this.reset();
        }
        public static function getInstance():TradeMgr{
            return (_instance);
        }

        public function reset():void{
        }
        public function showTradeWindow(_arg1:Object, _arg2:Object):void{
            var clearWindow:* = null;
            var targetInfo:* = _arg1;
            var meInfo:* = _arg2;
            if (!this.tradeWindow){
                clearWindow = function (_arg1:FlexEvent):void{
                    tradeWindow.removeEventListener(FlexEvent.REMOVE, clearWindow);
                    tradeWindow = null;
                };
                BaggageMgr.getInstance().showBaggage();
                this.tradeWindow = new TradeWindow();
                this.tradeWindow.x = 400;
                this.tradeWindow.y = 150;
                this.tradeWindow.addEventListener(FlexEvent.REMOVE, clearWindow);
                this.tradeWindow.setUsersInfo(targetInfo, meInfo);
                TCGClient.getInstance().mainGroup.addElement(this.tradeWindow);
            };
        }
        public function hideTradeWindow():void{
            if (this.tradeWindow){
                this.tradeWindow.removeSelf();
                this.tradeWindow = null;
            };
        }
        public function tryStartDeal(_arg1:String):void{
            LuaAgent.getInstance().run((("u.trade_mgr:try_start_deal(\"" + _arg1) + "\")"));
        }
        public function tryCancelDeal():void{
            LuaAgent.getInstance().run("u.trade_mgr:cancel_deal()");
        }
        public function tryConfirmDeal():void{
            LuaAgent.getInstance().run("u.trade_mgr:deal_confirm()");
        }
        public function tradeOpen(_arg1:Object, _arg2:Object):void{
            this.showTradeWindow(_arg1, _arg2);
        }
        public function tradeCanceled():void{
            this.hideTradeWindow();
        }
        public function tradeComplete():void{
            ChatWindowMgr.getInstance().addSystemContent("交易成功。");
            this.hideTradeWindow();
        }
        public function refreshTradeMoney(_arg1:int, _arg2:int):void{
            if (this.tradeWindow){
                this.tradeWindow.setTradeMoney(_arg1, _arg2);
            };
        }
        public function refreshTradeGoods(_arg1:Object, _arg2:Object):void{
            if (this.tradeWindow){
                this.tradeWindow.setTradeGoods(_arg1, _arg2);
            };
        }
        public function refreshTradeState(_arg1:Boolean, _arg2:Boolean):void{
            if (this.tradeWindow){
                this.tradeWindow.setTradeState(_arg1, _arg2);
            };
        }
        public function showGoodsNumAddWindow(_arg1:Object):void{
            var _local3:TradeGoodNumSelectWindow;
            if (((!(this.tradeWindow)) || (!(this.tradeWindow.parent)))){
                return;
            };
            var _local2:Array = this.checkTradeGood(_arg1.id, _arg1.num);
            if (!_local2[1]){
                MessageBox.showMessageBox(MessageBox.EASY_NOTICE, "提示：", _local2[2]);
                return;
            };
            if (_arg1.num == 1){
                this.putGoodsInDeal(_arg1.id, _arg1.num);
            } else {
                _local3 = new TradeGoodNumSelectWindow();
                _local3.setInfo(_arg1);
                TCGClient.getInstance().mainGroup.addElement(_local3);
                _local3.x = TCGClient.getInstance().mainGroup.mouseX;
                _local3.y = TCGClient.getInstance().mainGroup.mouseY;
            };
        }
        public function checkTradeGood(_arg1:String, _arg2:int):Array{
            var _local3:Array = LuaAgent.getInstance().run((((("return u.trade_mgr:check_trade_good(" + _arg1) + ",") + _arg2) + ")"));
            return (_local3);
        }
        public function putGoodsInDeal(_arg1:String, _arg2:int):void{
            LuaAgent.getInstance().run((((("u.trade_mgr:put_goods_in_deal(" + _arg1) + " , ") + _arg2) + ")"));
        }
        public function putMoneyInDeal(_arg1:int):void{
            LuaAgent.getInstance().run((("u.trade_mgr:put_money_in_deal(" + _arg1) + ")"));
        }

    }
}//package trade_system 
