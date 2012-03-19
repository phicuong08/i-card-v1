//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.serverWar {
    import com.assist.view.info.*;
    import com.assist.view.interfaces.base.*;

    public interface IServerWarRecord extends IContent, IDragTitleBar {

        function set onClose(_arg1:Function):void;
        function set onLink(_arg1:Function):void;
        function update(_arg1:ServerWarInfo):void;

    }
}//package com.assist.view.interfaces.serverWar 
