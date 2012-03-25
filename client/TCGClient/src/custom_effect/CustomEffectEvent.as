//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.events.*;

    public dynamic class CustomEffectEvent extends Event {

        public static const START:String = "constom_effect_start";
        public static const END:String = "constom_effect_end";
        public static const STOP:String = "constom_effect_stop";
        public static const PAUSE:String = "constom_effect_pause";
        public static const RESUME:String = "constom_effect_resume";

        public function CustomEffectEvent(_arg1:String, _arg2:Boolean=false, _arg3:Boolean=false){
            super(_arg1, _arg2, _arg3);
        }
    }
}//package custom_effect 
