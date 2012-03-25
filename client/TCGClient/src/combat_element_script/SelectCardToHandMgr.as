//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element_script {
    import flash.events.*;
    import combat_element.*;
    import custom_effect.*;

    public class SelectCardToHandMgr {

        public static function registerCreateCardHook():void{
            CombatConsole.getInstance().addEventListener(MyEvent.ADD_CARD_LOGIC, showCardInCentral);
        }
        private static function showCardInCentral(_arg1:MyEvent):void{
            var _showCardInCentral:* = null;
            var e:* = _arg1;
            _showCardInCentral = function ():void{
                var card:* = null;
                var m:* = null;
                var moveEffectEndHandler:* = null;
                var enableMouse:* = null;
                moveEffectEndHandler = function (_arg1:CustomEffectEvent):void{
                    card.arrivedEffect.play();
                    m.removeEventListener(CustomEffectEvent.END, moveEffectEndHandler);
                };
                enableMouse = function (_arg1:Event):void{
                    card.mouseChildren = true;
                    card.mouseEnabled = true;
                    card.removeEventListener(GameCard.MOVE_ARRIVED, enableMouse);
                };
                card = e.message.card;
                CombatStage.getInstance().addElement(card);
                card.changePosition(true, true);
                m = new MoveEffect(card, 300);
                m.addEventListener(CustomEffectEvent.END, moveEffectEndHandler);
                m.xTo = 598;
                m.yTo = 344;
                m.play();
                card.depth = 10;
                card._depth = 10;
                card.mouseChildren = false;
                card.mouseEnabled = false;
                card.addEventListener(GameCard.MOVE_ARRIVED, enableMouse);
                card.playScaleEffect(1.8, 1.8);
            };
            CombatConsole.getInstance().removeEventListener(MyEvent.ADD_CARD_LOGIC, showCardInCentral);
            var action:* = [1500, [_showCardInCentral]];
            var actionList:* = CombatConsole.getInstance().actionList;
            actionList.splice((actionList.length - 1), 0, action);
        }

    }
}//package combat_element_script 
