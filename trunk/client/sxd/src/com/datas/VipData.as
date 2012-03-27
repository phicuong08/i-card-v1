//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {

    public class VipData extends Base {

        private var _playerVipLevel:int;
        private var _moneyToNextLevel:int;

        public function get moneyToNextLevel():int{
            return (this._moneyToNextLevel);
        }
        public function get playerVipLevel():int{
            return (this._playerVipLevel);
        }
        public function get_player_vip_info(_arg1:Array):void{
            this._playerVipLevel = _arg1[0];
            this._moneyToNextLevel = _arg1[1];
        }

    }
}//package com.datas 
