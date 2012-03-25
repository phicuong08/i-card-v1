//Created by Action Script Viewer - http://www.buraks.com/asv
package baggage {
    import custom_control1.*;

    public class BaggageItemUseConfirmScript {

        public static function doConfirmScript(_arg1:String, _arg2:Function):void{
            var _local3:* = BaggageItemUseConfirmScript[("script" + _arg1)];
            if (_local3){
                _local3(_arg1, _arg2);
            } else {
                _arg2();
            };
        }
        public static function script10400(_arg1:String, _arg2:Function):void{
            MessageBox.showMessageBox(MessageBox.EASY_NOTICE, "提示：", "该物品无法直接使用！可通过点击炼卡炉上的#g加速按钮#n消耗本道具。");
        }
        public static function script10500(_arg1:String, _arg2:Function):void{
            BaggageMgr.getInstance().userItemByIdNum(_arg1, 1);
        }
        public static function script30000(_arg1:String, _arg2:Function):void{
            BaggageMgr.getInstance().userItemByIdNum(_arg1, 1);
        }
        public static function script30001(_arg1:String, _arg2:Function):void{
            BaggageMgr.getInstance().userItemByIdNum(_arg1, 1);
        }
        public static function script30002(_arg1:String, _arg2:Function):void{
            BaggageMgr.getInstance().userItemByIdNum(_arg1, 1);
        }
        public static function script30003(_arg1:String, _arg2:Function):void{
            BaggageMgr.getInstance().userItemByIdNum(_arg1, 1);
        }
        public static function script30004(_arg1:String, _arg2:Function):void{
            BaggageMgr.getInstance().userItemByIdNum(_arg1, 1);
        }
        public static function script30005(_arg1:String, _arg2:Function):void{
            BaggageMgr.getInstance().userItemByIdNum(_arg1, 1);
        }
        public static function script30006(_arg1:String, _arg2:Function):void{
            BaggageMgr.getInstance().userItemByIdNum(_arg1, 1);
        }

    }
}//package baggage 
