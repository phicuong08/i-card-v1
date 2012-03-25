//Created by Action Script Viewer - http://www.buraks.com/asv
package buff_system {
    import flash.events.*;

    public class BuffSystem extends EventDispatcher {

        private static var _instance:BuffSystem = new (BuffSystem)();
;

        private var buffWindow:BuffMainWindow;
        private var allBuff:Object;

        public function BuffSystem(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
            this.reset();
        }
        public static function getInstance():BuffSystem{
            return (_instance);
        }

        public function reset():void{
            var _local1:*;
            if (this.buffWindow){
                _local1 = this.buffWindow.parent;
                if (_local1){
                    _local1.removeElement(this.buffWindow);
                };
            };
            this.allBuff = new Object();
            this.buffWindow = new BuffMainWindow();
            this.showBuffMainWindow();
        }
        private function showBuffMainWindow():void{
            if (!this.buffWindow.parent){
                TCGClient.getInstance().mainGroup.addElement(this.buffWindow);
            };
        }
        public function addBuff(_arg1:int):void{
            var _local2:BuffIconWindow = new BuffIconWindow();
            _local2.setBuffId(_arg1);
            this.buffWindow.addBuffIcon(_local2);
            this.allBuff[_arg1] = _local2;
            this.showBuffMainWindow();
        }
        public function removeBuff(_arg1:int):void{
            var _local2:BuffIconWindow = this.allBuff[_arg1];
            if (_local2){
                this.buffWindow.removeBuffIcon(_local2);
                delete this.allBuff[_arg1];
            };
        }
        public function refreshBuff(_arg1:int):void{
            var _local2:BuffIconWindow = this.allBuff[_arg1];
            if (_local2){
                _local2.playRefreshEffect();
            };
        }

    }
}//package buff_system 
