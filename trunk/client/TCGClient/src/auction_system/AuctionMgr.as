//Created by Action Script Viewer - http://www.buraks.com/asv
package auction_system {
    import mx.events.*;
    import flash.events.*;
    import custom_control1.*;
    import chat_system.*;
    import combat_element_script.*;
    import item_system.*;

    public class AuctionMgr extends EventDispatcher {

        private static var _instance:AuctionMgr = new (AuctionMgr)();
;
        public static var displayType:String = "buy";

        public var lastSearchInfo:Object;
        public var lastMyAuctionInfo:Object;
        protected var departedRangeArg:Array;
        private var lastSearchName:String;
        private var lastSearchType:String;
        private var lastFromIndex:int = 1;
        private var lastToIndex:int = 20;
        private var auctionMainWindow:AuctionMainWindow;
        protected var addCardWindow:AuctionAddCardWindow;

        public function AuctionMgr(){
            this.departedRangeArg = [{
                name:"item_id",
                increase:false
            }, {
                name:"price",
                increase:false
            }];
            super();
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
            this.reset();
        }
        public static function getInstance():AuctionMgr{
            return (_instance);
        }

        public function reset():void{
            this.lastSearchInfo = null;
            this.lastMyAuctionInfo = null;
            this.lastSearchName = "";
            this.lastSearchType = "all";
            this.lastFromIndex = 1;
            this.lastToIndex = AuctionItemsContainer.PAGE_LIST_NUM;
        }
        public function showAuctionMainWindow():void{
            var clearWindow:* = null;
            if (!this.auctionMainWindow){
                clearWindow = function (_arg1:FlexEvent):void{
                    auctionMainWindow.removeEventListener(FlexEvent.REMOVE, clearWindow);
                    auctionMainWindow = null;
                    reset();
                };
                this.auctionMainWindow = new AuctionMainWindow();
                this.auctionMainWindow.x = 99;
                this.auctionMainWindow.y = 60;
                this.auctionMainWindow.addEventListener(FlexEvent.REMOVE, clearWindow);
            };
            if (!this.auctionMainWindow.parent){
                TCGClient.getInstance().mainGroup.addElement(this.auctionMainWindow);
            };
        }
        public function hideAuctionMainWindow():void{
            if (this.auctionMainWindow){
                this.auctionMainWindow.removeSelf();
            };
        }
        public function showGoodsNumAddWindow(_arg1:Object):void{
            var _local3:AuctionItemNumSelectWindow;
            if (((((!(this.auctionMainWindow)) || (!(this.auctionMainWindow.parent)))) || (!((displayType == "sell"))))){
                return;
            };
            var _local2:Array = this.checkAuctionGood(_arg1.id, _arg1.num);
            if (!_local2[1]){
                MessageBox.showMessageBox(MessageBox.EASY_NOTICE, "提示：", _local2[2]);
                return;
            };
            if (_arg1.num == 1){
                this.putGoodsInDeal(_arg1.id, _arg1.num);
            } else {
                _local3 = new AuctionItemNumSelectWindow();
                _local3.setInfo(_arg1);
                TCGClient.getInstance().mainGroup.addElement(_local3);
                _local3.x = TCGClient.getInstance().mainGroup.mouseX;
                _local3.y = TCGClient.getInstance().mainGroup.mouseY;
            };
        }
        public function checkAuctionGood(_arg1:String, _arg2:int):Array{
            var _local3:Array = LuaAgent.getInstance().run((((("return u.auction_mgr:check_auction_good(" + _arg1) + ",") + _arg2) + ")"));
            return (_local3);
        }
        public function putGoodsInDeal(_arg1:String, _arg2:int):void{
            if (((((!(this.auctionMainWindow)) || (!(this.auctionMainWindow.parent)))) || (!((displayType == "sell"))))){
                return;
            };
            this.auctionMainWindow.putGoodsInDeal(_arg1, _arg2);
        }
        private function translateObToArr(_arg1:Object):Array{
            var _local4:Object;
            var _local2:Array = new Array();
            var _local3 = 1;
            while ((_local4 = _arg1[_local3.toString()])) {
                _local2.push(_local4);
                _local3++;
            };
            return (_local2);
        }
        public function setSearchLabelText(_arg1:String):void{
            if (((((!(this.auctionMainWindow)) || (!(this.auctionMainWindow.parent)))) || (!((displayType == "buy"))))){
                return;
            };
            this.auctionMainWindow.setSearchLabelText(_arg1);
        }
        public function setItemInfoWindow(_arg1:Object):void{
            if (((!(this.auctionMainWindow)) || (!(this.auctionMainWindow.parent)))){
                return;
            };
            this.auctionMainWindow.setItemInfoWindow(_arg1);
        }
        public function setMyAuctionItemInfo(_arg1):void{
            if (((((!(this.auctionMainWindow)) || (!(this.auctionMainWindow.parent)))) || (!((displayType == "sell"))))){
                return;
            };
            if (!(_arg1 is Array)){
                _arg1 = this.translateObToArr(_arg1);
            };
            this.lastMyAuctionInfo = _arg1;
            this.auctionMainWindow.setMyAuctionItemInfo(_arg1);
        }
        public function setSearchItemInfo(_arg1:Object):void{
            if (!(_arg1.detail_info is Array)){
                _arg1.detail_info = this.translateObToArr(_arg1.detail_info);
            };
            this.lastSearchInfo = _arg1;
            if (((((!(this.auctionMainWindow)) || (!(this.auctionMainWindow.parent)))) || (!((displayType == "buy"))))){
                return;
            };
            this.auctionMainWindow.setSearchItemInfo(_arg1);
        }
        public function resetItemContainer():void{
            if (((!(this.auctionMainWindow)) || (!(this.auctionMainWindow.parent)))){
                return;
            };
            this.auctionMainWindow.resetItemContainer();
        }
        public function getRangeKeysInfoString():String{
            return ("{}");
        }
        public function startSearh(_arg1:String=null, _arg2:String=null, _arg3:int=0, _arg4:int=0):void{
            if (_arg1){
                this.lastSearchType = _arg1;
            } else {
                _arg1 = this.lastSearchType;
            };
            if (_arg2 != null){
                this.lastSearchName = _arg2;
            } else {
                _arg2 = this.lastSearchName;
            };
            if (_arg3){
                this.lastFromIndex = _arg3;
            } else {
                _arg3 = this.lastFromIndex;
            };
            if (_arg4){
                this.lastToIndex = _arg4;
            } else {
                _arg4 = this.lastToIndex;
            };
            var _local5 = (((((((((("u.auction_mgr:get_selling_item_info(\"" + _arg1) + "\",\"") + _arg2) + "\",") + _arg3) + ",") + _arg4) + ",") + this.getRangeString()) + ")");
            LuaAgent.getInstance().run(_local5);
        }
        public function getMyAuctionInfo():void{
            LuaAgent.getInstance().run("u.auction_mgr:get_my_auction_item_info()");
        }
        public function pushRangeKey(_arg1:String):void{
            var _local2:Boolean;
            var _local3:int;
            while (_local3 < this.departedRangeArg.length) {
                if (this.departedRangeArg[_local3]["name"] == _arg1){
                    _local2 = !(this.departedRangeArg[_local3]["increase"]);
                    this.departedRangeArg.splice(_local3, 1);
                    break;
                };
                _local3++;
            };
            this.departedRangeArg.unshift({
                name:_arg1,
                increase:_local2
            });
            if (this.departedRangeArg.length > 4){
                this.departedRangeArg.pop();
            };
        }
        private function getRangeString():String{
            var _local1:Array = new Array();
            var _local2:int;
            while (_local2 < this.departedRangeArg.length) {
                _local1.push(LuaAgent.objectToLuaString(this.departedRangeArg[_local2]));
                _local2++;
            };
            return (LuaAgent.arrayToLuaString(_local1));
        }
        public function rangeSelf():void{
            var rangeArr:* = function (_arg1:Array):void{
                var _local5:String;
                var _local6:uint;
                var _local7:Boolean;
                var _local2:Array = new Array();
                var _local3:Array = new Array();
                var _local4:int;
                while (_local4 < departedRangeArg.length) {
                    _local5 = departedRangeArg[_local4]["name"];
                    _local2.push(_local5);
                    _local6 = (((!((_local5 == "user_name"))) && (!((_local5 == "state"))))) ? Array.NUMERIC : 0;
                    _local7 = ((departedRangeArg.length > 0)) ? !(departedRangeArg[(departedRangeArg.length - 1)].isCend) : false;
                    if (!departedRangeArg[_local4]["increase"]){
                        _local6 = (_local6 | Array.DESCENDING);
                    };
                    _local3.push(_local6);
                    _local4++;
                };
                _arg1.sortOn(_local2, _local3);
            };
            if (displayType == "buy"){
                rangeArr(this.lastSearchInfo.detail_info);
                this.setSearchItemInfo(this.lastSearchInfo);
            } else {
                rangeArr(this.lastMyAuctionInfo);
                this.setMyAuctionItemInfo(this.lastMyAuctionInfo);
            };
        }
        public function itemTimeOut(_arg1:int):void{
            ChatWindowMgr.getInstance().addSystemContent((("您拍卖的商品“" + ItemCardLib.getItemFullName(_arg1)) + "”已经超时。"));
            if (((((this.auctionMainWindow) && (this.auctionMainWindow.parent))) && ((displayType == "sell")))){
                this.auctionMainWindow.callLater(this.getMyAuctionInfo);
            };
        }
        public function itemSellOut(_arg1:int):void{
            ChatWindowMgr.getInstance().addSystemContent((("您拍卖的商品“" + ItemCardLib.getItemFullName(_arg1)) + "”已经售出。"));
            if (((((this.auctionMainWindow) && (this.auctionMainWindow.parent))) && ((displayType == "sell")))){
                this.auctionMainWindow.callLater(this.getMyAuctionInfo);
            };
        }
        public function showAddCardWindow():void{
            if (this.auctionMainWindow){
                if (!this.addCardWindow){
                    this.addCardWindow = new AuctionAddCardWindow();
                };
                if (!this.addCardWindow.parent){
                    this.auctionMainWindow.addElement(this.addCardWindow);
                };
                this.addCardWindow.addEventListener(Event.REMOVED_FROM_STAGE, this.addCardWindowRemoveHandler);
            };
        }
        protected function addCardWindowRemoveHandler(_arg1:Event):void{
            var _local2:AuctionAddCardWindow = (_arg1.currentTarget as AuctionAddCardWindow);
            _local2.removeEventListener(Event.REMOVED_FROM_STAGE, this.addCardWindowRemoveHandler);
            if (_local2 == this.addCardWindow){
                this.addCardWindow = null;
            };
        }

    }
}//package auction_system 
