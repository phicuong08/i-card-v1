//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
    import flash.utils.*;

    public class SuperSubBase {

        public function get sign():String{
            return (getQualifiedClassName(this));
        }
        public function settle(_arg1:String, _arg2:View, _arg3:Controller, _arg4:Data, _arg5:SuperBase):void{
        }
        protected function inheritError():String{
            return ((("请检查 " + this.sign) + " 是否继承了正确的基类！"));
        }

    }
}//package com 
