//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_StudyStunt {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_StudyStunt_Base.player_stunt_info, _arg1.studyStunt.player_stunt_info);
            _arg1.registerDataCallback(Mod_StudyStunt_Base.player_study_stunt, _arg1.studyStunt.player_study_stunt);
            _arg1.registerDataCallback(Mod_StudyStunt_Base.player_use_role_stunt_id, _arg1.studyStunt.player_use_role_stunt_id);
            _arg1.registerDataCallback(Mod_StudyStunt_Base.player_can_study_stunt, _arg1.studyStunt.player_can_study_stunt);
        }

    }
}//package com.protocols 
