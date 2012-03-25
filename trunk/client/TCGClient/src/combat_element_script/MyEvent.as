//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element_script {
    import flash.events.*;

    public class MyEvent extends Event {

        public static const CLEAR_CONSOLE:String = "clearConsole";
        public static const CREATE_CARD:String = "createCard";
        public static const ADD_CARD_LOGIC:String = "addCardLogic";
        public static const ADD_CARD_STAGE:String = "addCardStage";
        public static const SHOW_ATTACK_WINDOW:String = "showAttackWindow";
        public static const DO_ATTACK:String = "doAttack";
        public static const CANCEL_ATTACK:String = "cancelAttack";
        public static const BEGIN_ATTACK:String = "beginAttack";
        public static const END_ROUND:String = "endRound";
        public static const PLAYER_SELECT:String = "playerSelect";
        public static const MOUSE_CLICK_CARD:String = "mouseClickCard";
        public static const MOUSE_OVER_CARD:String = "mouseOverCard";
        public static const MOUSE_OUT_CARD:String = "mouseOutCard";
        public static const DO_ATTACK_SUCCESS_EFFECT:String = "doAttackSuccessEffect";
        public static const SHOW_DUEL_END_WINDOW:String = "showDuelEndWindow";

        public var message:Object;

        public function MyEvent(_arg1:String, _arg2:Object=null, _arg3:Boolean=false, _arg4:Boolean=false){
            this.message = _arg2;
            super(_arg1, _arg3, _arg4);
        }
    }
}//package combat_element_script 
