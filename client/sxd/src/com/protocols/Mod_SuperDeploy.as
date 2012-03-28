//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_SuperDeploy {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_SuperDeploy_Base.super_deploy_list, _arg1.superDeploy.super_deploy_list);
            _arg1.registerDataCallback(Mod_SuperDeploy_Base.up_deploy, _arg1.superDeploy.up_deploy);
            _arg1.registerDataCallback(Mod_SuperDeploy_Base.down_deploy, _arg1.superDeploy.down_deploy);
            _arg1.registerDataCallback(Mod_SuperDeploy_Base.deploy_research_and_first_attack, _arg1.superDeploy.deploy_research_and_first_attack);
            _arg1.registerDataCallback(Mod_SuperDeploy_Base.new_deploy_grid_open_notify, _arg1.superDeploy.new_deploy_grid_open_notify);
        }

    }
}//package com.protocols 
