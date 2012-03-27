//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_Role {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_Role_Base.get_role_list, _arg1.rolemsg.get_role_list);
            _arg1.registerDataCallback(Mod_Role_Base.get_role_list_simpe, _arg1.rolemsg.get_role_list_simpe);
            _arg1.registerDataCallback(Mod_Role_Base.down_partners, _arg1.rolemsg.down_partners);
            _arg1.registerDataCallback(Mod_Role_Base.set_follow_role, _arg1.rolemsg.set_follow_role);
            _arg1.registerDataCallback(Mod_Training_Base.panel_show, _arg1.rolemsg.panel_show);
            _arg1.registerDataCallback(Mod_Training_Base.training, _arg1.rolemsg.training);
            _arg1.registerDataCallback(Mod_Training_Base.modify_role_data, _arg1.rolemsg.modify_role_data);
            _arg1.registerDataCallback(Mod_Role_Base.get_role_id_list, _arg1.rolemsg.get_role_id_list);
            _arg1.registerDataCallback(Mod_Role_Base.exp_change_notify, _arg1.rolemsg.exp_change_notify);
            _arg1.registerDataCallback(Mod_Role_Base.get_simple_role_list, _arg1.rolemsg.get_simple_role_list);
            _arg1.registerDataCallback(Mod_Role_Base.get_role_war_attribute, _arg1.rolemsg.get_role_war_attribute);
            _arg1.registerDataCallback(Mod_Role_Base.get_default_deploy_first_attack, _arg1.rolemsg.get_default_deploy_first_attack);
        }

    }
}//package com.protocols 
