//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element_script {
    import custom_control1.*;
    import combat_element.*;
    import custom_effect.*;
    import SoundSystem.*;
    import swf_effect.*;

    public class AttackEffectManager {

        private static var lastAttackCard:GameCard;
        private static var lastTargetCard:GameCard;

        public static function showAttackArc(_arg1:int, _arg2:int, _arg3:Boolean):void{
            var _local4:Number;
            var _local5:Number;
            var _local6:Number;
            var _local7:Number;
            var _local9:String;
            var _local13:GameCard;
            var _local8:GameCard = CombatStage.getInstance().cardTableBySn[_arg1];
            _local4 = (_local8.x + (_local8.width / 2));
            _local6 = (_local8.y + (_local8.height / 2));
            if (_arg2 != 0){
                _local13 = CombatStage.getInstance().cardTableBySn[_arg2];
                _local5 = (_local13.x + (_local13.width / 2));
                _local7 = (_local13.y + (_local13.height / 2));
            } else {
                _local5 = ((_local8.cardInfo.camp == "player")) ? 1340 : 100;
                _local7 = ((_local8.cardInfo.camp == "player")) ? -250 : 700;
            };
            switch (_local8.cardInfo.body){
                case "wen":
                    _local9 = "bellow_wen";
                    break;
                case "wu":
                    _local9 = "bellow_wu";
                    break;
                case "female":
                    _local9 = "bellow_female";
                    break;
            };
            if (_local9){
                SoundMgr.getInstance().playEffectSound(_local9);
            };
            var _local10:uint = (_arg3) ? 0xFF6C00 : 0xFFFFFF;
            var _local11:uint = (_arg3) ? 0xFF0000 : 0xFFFFFF;
            var _local12:uint = (_arg3) ? 0xFF6C00 : 0xFFFFFF;
            ArcLineWindow.showArcLineWindow(CombatStage.getInstance().groupWith3D, _local10, _local11, _local12, _local4, _local6, true, false, _local5, _local7);
        }
        public static function hideAttackArc():void{
            ArcLineWindow.hideArcLineWindow(true);
        }
        public static function doAttackSuccessEffect(_arg1:int, _arg2:int):void{
            lastAttackCard = CombatStage.getInstance().cardTableBySn[_arg1];
            if (!lastAttackCard){
                return;
            };
            var _local3 = (lastAttackCard.cardInfo.camp == "player");
            if (_arg2 != 0){
                showCardCloseness(lastAttackCard, _local3);
                lastTargetCard = CombatStage.getInstance().cardTableBySn[_arg2];
                showCardCloseness(lastTargetCard, !(_local3));
            } else {
                showCardCloseness(lastAttackCard, _local3);
                lastTargetCard = null;
            };
            CombatConsole.getInstance().dispatchEvent(new MyEvent(MyEvent.DO_ATTACK_SUCCESS_EFFECT));
            CombatStage.getInstance().cardDisplayWindow.setHideTimerDelay(2000);
        }
        public static function showEasyAttackEffect():void{
            var _local1:Number;
            var _local3:MonsterAttackEffect;
            _local1 = 0;
            var _local2:Number = 0;
            SoundMgr.getInstance().playEffectSound("beat");
            if (lastTargetCard){
                _local2 = (lastTargetCard.x - 40);
                _local1 = (lastTargetCard.y - 40);
            } else {
                _local2 = ((lastAttackCard.cardInfo.camp == "player")) ? 1080 : 0;
                _local1 = ((lastAttackCard.cardInfo.camp == "player")) ? -10 : 600;
                TCGClient.getInstance().shakeEffect.play();
            };
            _local3 = new MonsterAttackEffect();
            _local3.x = _local2;
            _local3.y = _local1;
            CombatStage.getInstance().addElement(_local3);
        }
        public static function hideAttackSuccessEffect():void{
            if (lastAttackCard){
                restoreCard(lastAttackCard);
                lastAttackCard = null;
            };
            if (lastTargetCard){
                restoreCard(lastTargetCard);
                lastTargetCard = null;
            };
            CombatStage.getInstance().cardDisplayWindow.setHideTimerDelay();
        }
        private static function showCardCloseness(_arg1:GameCard, _arg2:Boolean):void{
            _arg1.prepareAttackEffect.attackEffectMgrStartControlingCard();
            _arg1.clearDefaultFilter();
            var _local3:Number = 300;
            CombatStage.getInstance().addElement(_arg1);
            var _local4:MoveEffect = new MoveEffect(_arg1, _local3);
            _local4.xTo = (_arg2) ? 420 : 692;
            _local4.yTo = 330;
            _local4.play();
            var _local5:ScaleEffect = new ScaleEffect(_arg1.cardImage, _local3, 2, 2);
            _local5.play();
            var _local6:RotateY3DEffect = new RotateY3DEffect(_arg1, 0, -20, _local3);
            _local6.yTo = (_arg2) ? -20 : 20;
            _local6.play();
        }
        private static function restoreCard(_arg1:GameCard):void{
            var restoreComplete:* = null;
            var duration:* = NaN;
            var s:* = null;
            var r:* = null;
            var m:* = null;
            var card:* = _arg1;
            restoreComplete = function (_arg1:CustomEffectEvent=null):void{
                if (_arg1){
                    _arg1.target.removeEventListener(CustomEffectEvent.END, restoreComplete);
                };
                card.prepareAttackEffect.attackEffectMgrStopControlingCard();
                card.createFilter();
            };
            if (((card.parent) && (!((card.cardInfo.slot == "grave"))))){
                duration = 320;
                CombatStage.getInstance().groupWith3D.addElement(card);
                s = new ScaleEffect(card.cardImage, duration, GameCard.CARD_IMAGE_SCALE, GameCard.CARD_IMAGE_SCALE);
                s.play();
                r = new RotateY3DEffect(card, card.rotationY, 0, duration);
                r.play();
                m = new MoveEffect(card, duration);
                m.xTo = card._xPositon;
                m.yTo = card._yPositon;
                m.play();
                m.addEventListener(CustomEffectEvent.END, restoreComplete);
            } else {
                restoreComplete();
            };
        }

    }
}//package combat_element_script 
