//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.haloer.net.*;
    import com.assist.*;

    public class LoadView extends Base implements IView {

        public function show():void{
            var file:* = new HTTP();
            file.onComplete = function (_arg1:String):void{
                URI.formatVersion(_arg1);
                File.onVersion = URI.getVersion;
                _view.login.show();
                _view.hideLoadingText();
            };
            file.load(((URI.clientUrl + "assets.txt?rnd=") + URI.assetsRnd));
        }
        public function close():void{
        }
        public function clear():void{
        }

    }
}//package com.views 
