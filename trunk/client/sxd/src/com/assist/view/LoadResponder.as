//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view {

    public class LoadResponder {

        public var callback:Function;
        public var progress:Function;

        public function LoadResponder(_arg1:Function=null, _arg2:Function=null):void{
            this.callback = _arg1;
            this.progress = _arg2;
        }
        public function lCallback():void{
            this.callback();
        }
        public function lProgress(_arg1:String, _arg2:int, _arg3:int, _arg4:int, _arg5:String):void{
            if ((this.progress is Function)){
                switch (this.progress.length){
                    case 2:
                        this.progress(_arg1, _arg2);
                        break;
                    case 3:
                        this.progress(_arg1, _arg2, _arg3);
                        break;
                    case 4:
                        this.progress(_arg1, _arg2, _arg3, _arg5);
                        break;
                    case 5:
                        this.progress(_arg1, _arg2, _arg3, _arg4, _arg5);
                        break;
                };
            };
        }

    }
}//package com.assist.view 
