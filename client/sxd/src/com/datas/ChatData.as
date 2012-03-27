//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {

    public class ChatData extends Base {

        public var message:Array;
        public var chatWithPlayers:Array;
        private var _disableTalk:Array;
        private var _shieldPlayerTalk:Array;
        private var _shieldPlayerList:Array;

        public function ChatData(){
            this.message = [];
            this.chatWithPlayers = [];
            super();
        }
        public function get disableTalk():Array{
            return (this._disableTalk);
        }
        public function get shieldPlayerTalk():Array{
            return (this._shieldPlayerTalk);
        }
        public function get shieldPlayerList():Array{
            return (this._shieldPlayerList);
        }
        public function chat_with_players(_arg1:Array):void{
            this.chatWithPlayers = _arg1;
        }
        public function bro_to_player(_arg1:Array):void{
            this.message = _arg1[0];
        }
        public function disable_player_talk(_arg1:Array):void{
            this._disableTalk = _arg1;
        }
        public function shield_player_talk(_arg1:Array):void{
            this._shieldPlayerTalk = _arg1;
        }
        public function shield_player_list(_arg1:Array):void{
            this._shieldPlayerList = _arg1[0];
        }

    }
}//package com.datas 
