//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Deploy {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Deploy_Base.deploy_list, _arg1.deploy.deploy_list);
            _arg1.registerDataCallback(Mod_Deploy_Base.up_deploy, _arg1.deploy.up_deploy);
            _arg1.registerDataCallback(Mod_Deploy_Base.down_deploy, _arg1.deploy.down_deploy);
            _arg1.registerDataCallback(Mod_Deploy_Base.all_down_deploy, _arg1.deploy.all_down_deploy);
            _arg1.registerDataCallback(Mod_Deploy_Base.set_defaut_deploy, _arg1.deploy.set_defaut_deploy);
        }

    }
}//package com.protocols 
