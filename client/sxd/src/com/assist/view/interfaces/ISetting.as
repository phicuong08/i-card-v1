//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces {
    import com.assist.view.interfaces.base.*;

    public interface ISetting extends IContent, IDragTitleBar {

        function set onVolume(_arg1:Function):void;
        function set onCount(_arg1:Function):void;
        function set onClose(_arg1:Function):void;
        function set onMute(_arg1:Function):void;
        function set onConsume(_arg1:Function):void;
        function openSound():void;
        function closeSound():void;
        function set bgVolume(_arg1:int):void;
        function set gameVolume(_arg1:int):void;

    }
}//package com.assist.view.interfaces 
