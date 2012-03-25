//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
    import flash.events.*;
    import combat_element.*;
    import combat_element_script.*;
    import file_read.*;
    import tool.*;

    public class GuideFunctions {

        public static const GUIDE_COLOR:int = 16436129;
        public static const GUIDE_FONT_COLOR:int = 16767396;
        public static const GUIDE_GLOW_COLOR:int = 1387371;
        public static const GUIDE_ALPHA:Number = 0.8;

        public static function createGuideLine(_arg1):void{
            var _local2:int;
            var _local3:int;
            var _local5:GuideLineWindow;
            var _local6:int;
            var _local7:int;
            var _local8:Number;
            var _local4:String = getLastGuideWindowType(_arg1.stepInfo);
            _local5 = GuideSystem.getInstance().guideLineWindow;
            if (_local4 == "mouseSign"){
                _local2 = GuideSystem.getInstance().guideAllTypeWindow[_local4].x;
                _local3 = GuideSystem.getInstance().guideAllTypeWindow[_local4].y;
            } else {
                if (_local4 == "arrowSign"){
                    _local2 = (GuideSystem.getInstance().guideAllTypeWindow[_local4].x + 23);
                    _local3 = (GuideSystem.getInstance().guideAllTypeWindow[_local4].y + 75);
                } else {
                    return;
                };
            };
            GuideSystem.getInstance().guideWindow.addElement(_local5);
            _local6 = (_arg1.x + 90);
            _local7 = (_arg1.y + 90);
            _local5.x = _local6;
            _local5.y = _local7;
            _local8 = (_local2 - _local6);
            var _local9:Number = (_local3 - _local7);
            _local5.width = Math.sqrt(((_local8 * _local8) + (_local9 * _local9)));
            _local5.rotation = ((Math.atan2(_local9, _local8) * 180) / Math.PI);
        }
        public static function moveGuideLine(_arg1:int, _arg2:int):void{
            var _local3:GuideLineWindow = GuideSystem.getInstance().guideLineWindow;
            GuideSystem.getInstance().guideWindow.addElement(_local3);
            var _local4:int = _local3.x;
            var _local5:int = _local3.y;
            var _local6:Number = (_arg1 - _local4);
            var _local7:Number = (_arg2 - _local5);
            _local3.width = Math.sqrt(((_local6 * _local6) + (_local7 * _local7)));
            _local3.rotation = ((Math.atan2(_local7, _local6) * 180) / Math.PI);
        }
        private static function getLastGuideWindowType(_arg1:Object):String{
            var _local2:int = GuideSystem.getInstance().currentSection;
            var _local3:Array = (GuideLib.guideFlashConfig[_local2][_arg1["step"]] as Array);
            var _local4:int = _arg1["sub_step"];
            if (_local4 > 0){
                --_local4;
                return (_local3[_local4]["operation"]);
            };
            return (null);
        }
        public static function addMaskWindow():void{
            var _local1:GuideMaskWindow = GuideSystem.getInstance().getMaskWindow();
            if (_local1.parent != CombatStage.getInstance().groupWith3D){
                CombatStage.getInstance().groupWith3D.addElement(_local1);
                _local1.playAddEffect();
            };
            CombatStage.getInstance().groupWith3D.depth = 90;
        }
        public static function removeMaskWindow():void{
            CombatStage.getInstance().groupWith3D.depth = 0;
            var _local1:GuideMaskWindow = GuideSystem.getInstance().getMaskWindow();
            _local1.removeSelf();
        }
        public static function getGuideHeadInfo():Array{
            var _local1:Object = new Object();
            var _local2:Object = new Object();
            switch (GuideSystem.getInstance().currentSection){
                case 1:
                    _local1.headIcon = "source/cardImages/181.jpg";
                    _local1.tooltip = "黄巾兵";
                    _local1.name = "黄巾兵";
                    break;
                case 2:
                    _local1.headIcon = "source/cardImages/610.jpg";
                    _local1.tooltip = "华雄";
                    _local1.name = "华雄";
                    break;
                case 3:
                    _local1.headIcon = "source/cardImages/620.jpg";
                    _local1.tooltip = "吕布";
                    _local1.name = "吕布";
                    break;
                case 4:
                    _local1.headIcon = "source/cardImages/81.jpg";
                    _local1.tooltip = "孙坚";
                    _local1.name = "孙坚";
                    break;
                case 5:
                    _local1.headIcon = "source/cardImages/7.jpg";
                    _local1.tooltip = "曹操";
                    _local1.name = "曹操";
                    break;
                case 6:
                    _local1.headIcon = "source/cardImages/611.jpg";
                    _local1.tooltip = "李肃";
                    _local1.name = "李肃";
                    break;
                case 7:
                    _local1.headIcon = "source/cardImages/601.jpg";
                    _local1.tooltip = "董卓";
                    _local1.name = "董卓";
                    break;
                case 8:
                    _local1.headIcon = "source/cardImages/7.jpg";
                    _local1.tooltip = "曹操";
                    _local1.name = "曹操";
                    break;
                case 9:
                    _local1.headIcon = "source/cardImages/506.jpg";
                    _local1.tooltip = "刘繇";
                    _local1.name = "刘繇";
                    break;
                case 10:
                    _local1.headIcon = "source/cardImages/7.jpg";
                    _local1.tooltip = "曹操";
                    _local1.name = "曹操";
                    break;
                case 101:
                    _local1.headIcon = "source/cardImages/180.jpg";
                    _local1.tooltip = "黄巾兵";
                    _local1.name = "黄巾兵";
                    break;
                case 102:
                    _local1.headIcon = "source/cardImages/200.jpg";
                    _local1.tooltip = "程远志";
                    _local1.name = "程远志";
                    break;
                case 103:
                    _local1.headIcon = "source/cardImages/183.jpg";
                    _local1.tooltip = "张宝";
                    _local1.name = "张宝";
                    break;
                case 104:
                    _local1.headIcon = "source/cardImages/183.jpg";
                    _local1.tooltip = "张宝";
                    _local1.name = "张宝";
                    break;
                case 105:
                    _local1.headIcon = "source/cardImages/191.jpg";
                    _local1.tooltip = "张梁";
                    _local1.name = "张梁";
                    break;
                case 106:
                    _local1.headIcon = "source/cardImages/190.jpg";
                    _local1.tooltip = "张角";
                    _local1.name = "张角";
                    break;
                case 107:
                    _local1.headIcon = "source/cardImages/183.jpg";
                    _local1.tooltip = "张宝";
                    _local1.name = "张宝";
                    break;
                case 108:
                    _local1.headIcon = "source/cardImages/778.jpg";
                    _local1.tooltip = "公孙瓒";
                    _local1.name = "公孙瓒";
                    break;
                default:
                    _local1.headIcon = "source/cardImages/183.jpg";
                    _local1.tooltip = "张宝";
                    _local1.name = "张宝";
            };
            _local2.headIcon = (("source/userHead/" + UserObject.headIcon) + ".jpg");
            _local2.tooltip = "这个是我~";
            _local2.name = UserObject.name;
            return ([_local1, _local2]);
        }
        public static function guideFunc1_1_1(_arg1):void{
            TipManager.stopShowTip();
        }
        public static function guideFunc1_2_1(_arg1):void{
            TipManager.stopShowTip();
        }
        public static function guideFunc1_3_1(_arg1):void{
            TipManager.stopShowTip();
        }
        public static function guideFunc1_5_1(_arg1):void{
            TipManager.stopShowTip();
        }
        public static function guideFunc1_6_1(_arg1):void{
            TipManager.stopShowTip();
        }
        public static function guideFunc3_1(_arg1):void{
            var cardArray:* = null;
            var card:* = undefined;
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                var _local2:*;
                param.removeEventListener("finishTask", removeMask);
                removeMaskWindow();
                for each (_local2 in cardArray) {
                    _local2.depth = _local2._depth;
                };
            };
            cardArray = CombatStage.getInstance().enemyMonsterCards;
            for each (card in cardArray) {
                card.depth = 350;
            };
            addMaskWindow();
            param.addEventListener("finishTask", removeMask);
        }
        public static function guideFunc5_3(_arg1):void{
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                param.removeEventListener("finishTask", removeMask);
                removeMaskWindow();
                CombatStage.getInstance().playersInfo.depth = CombatStageDepthInfo.DEPTH_OF_DUEL_PALYERS_INFO;
            };
            CombatStage.getInstance().playersInfo.depth = 350;
            addMaskWindow();
            param.addEventListener("finishTask", removeMask);
        }
        public static function guideFunc6_4(_arg1):void{
            var card:* = null;
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:MyEvent):void{
                CombatConsole.getInstance().removeEventListener(MyEvent.ADD_CARD_STAGE, removeMask);
                removeMaskWindow();
                GuideSystem.getInstance().hideAll();
                card.depth = card._depth;
            };
            var cardArray:* = CombatStage.getInstance().playerHandCards;
            card = cardArray[0];
            card.depth = 350;
            addMaskWindow();
            CombatConsole.getInstance().addEventListener(MyEvent.ADD_CARD_STAGE, removeMask);
        }
        public static function guideFunc7_1(_arg1):void{
            var card:* = null;
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                param.removeEventListener("finishTask", removeMask);
                removeMaskWindow();
                card.depth = card._depth;
            };
            var cardArray:* = CombatStage.getInstance().playerHandCards;
            card = cardArray[0];
            card.depth = 350;
            addMaskWindow();
            param.addEventListener("finishTask", removeMask);
        }
        public static function guideFunc7_3(_arg1):void{
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:MyEvent):void{
                CombatConsole.getInstance().removeEventListener(MyEvent.BEGIN_ATTACK, removeMask);
                removeMaskWindow();
                GuideSystem.getInstance().hideAll();
                CombatStage.getInstance().battleButton.depth = 0;
            };
            CombatStage.getInstance().battleButton.depth = 350;
            addMaskWindow();
            CombatConsole.getInstance().addEventListener(MyEvent.BEGIN_ATTACK, removeMask);
        }
        public static function guideFunc8_1(_arg1):void{
            var card1:* = null;
            var card2:* = null;
            var tipWindow:* = null;
            var changeDepth1:* = null;
            var changeDepth2:* = null;
            var finishTask:* = null;
            var param:* = _arg1;
            changeDepth1 = function (_arg1=null):void{
                card1.depth = 350;
                card2.depth = card2._depth;
                tipWindow.setTipContent("将鼠标移动到我方的<font color='0xff8800'>东汉长枪兵</font>上会出现<font color='0xff0000'>攻击</font>按钮，点击以发动攻击");
                CombatConsole.getInstance().addEventListener(MyEvent.SHOW_ATTACK_WINDOW, changeDepth2);
            };
            changeDepth2 = function (_arg1:MyEvent):void{
                CombatConsole.getInstance().removeEventListener(MyEvent.SHOW_ATTACK_WINDOW, changeDepth2);
                tipWindow.setTipContent("选择对方场上的<font color='0xff8800'>黄巾兵精锐</font>为攻击对象");
                moveGuideLine(403, 271);
                GuideSystem.getInstance().guideAllTypeWindow.mouseSign.x = 403;
                GuideSystem.getInstance().guideAllTypeWindow.mouseSign.y = 271;
                card1.depth = card1._depth;
                card2.depth = 350;
                var _local2:AttackWindow = (_arg1.message["attackWindow"] as AttackWindow);
                _local2.addEventListener(MyEvent.CANCEL_ATTACK, changeDepth1);
                _local2.addEventListener(MyEvent.DO_ATTACK, finishTask);
            };
            finishTask = function (_arg1:MyEvent):void{
                removeMaskWindow();
                card1.depth = card1._depth;
                card2.depth = card2._depth;
                tipWindow.removeSelf();
                var _local2:AttackWindow = (_arg1.message["attackWindow"] as AttackWindow);
                _local2.removeEventListener(MyEvent.CANCEL_ATTACK, changeDepth1);
                _local2.removeEventListener(MyEvent.DO_ATTACK, finishTask);
            };
            var cardArray:* = CombatStage.getInstance().playerMonsterCards;
            card1 = cardArray[0];
            cardArray = CombatStage.getInstance().enemyMonsterCards;
            card2 = cardArray[3];
            tipWindow = (param as GuideTipWindow);
            addMaskWindow();
            changeDepth1();
        }
        public static function guideFunc9_4(_arg1):void{
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:MyEvent):void{
                CombatConsole.getInstance().removeEventListener(MyEvent.END_ROUND, removeMask);
                removeMaskWindow();
                GuideSystem.getInstance().hideAll();
                CombatStage.getInstance().endButton.depth = 0;
            };
            CombatStage.getInstance().endButton.depth = 350;
            addMaskWindow();
            CombatConsole.getInstance().addEventListener(MyEvent.END_ROUND, removeMask);
        }
        public static function guideFunc12_3(_arg1):void{
            guideFunc6_4(_arg1);
        }
        public static function guideFunc13_2(_arg1):void{
            guideFunc6_4(_arg1);
        }
        public static function guideFunc22_4(_arg1):void{
            var _local2:CardCloseness = new CardCloseness();
            _local2.setCardById(182);
            CombatStage.getInstance().addElement(_local2);
        }
        public static function guideFunc23_1(_arg1):void{
            guideFunc7_1(_arg1);
        }
        public static function guideFunc33_1(_arg1):void{
            var _local2:CardCloseness = new CardCloseness();
            _local2.setCardById(130);
            CombatStage.getInstance().addElement(_local2);
        }
        public static function guideFunc33_2(_arg1):void{
            var _local2:CardCloseness = new CardCloseness();
            _local2.setCardById(121);
            CombatStage.getInstance().addElement(_local2);
        }
        public static function guide1Func34():void{
            var showCardClosenes:* = null;
            showCardClosenes = function (_arg1:MyEvent):void{
                var _local2:GameCard = _arg1.message["card"];
                if ((((_local2.cardInfo.id.toString() == "129")) || ((_local2.cardInfo.id.toString() == "130")))){
                    if (num++ == 2){
                        CombatConsole.getInstance().removeEventListener(MyEvent.ADD_CARD_LOGIC, showCardClosenes);
                    };
                    CombatConsole.getInstance().showCardCloseness(_local2.cardInfo.id);
                };
            };
            CombatConsole.getInstance().addEventListener(MyEvent.ADD_CARD_LOGIC, showCardClosenes);
            var num:* = 1;
        }
        public static function guideFunc39_1(_arg1):void{
            var card:* = null;
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                GuideSystem.getInstance().removeEventListener("hide_all", removeMask);
                removeMaskWindow();
                card.depth = card._depth;
            };
            var cardArray:* = CombatStage.getInstance().playerMagicCards;
            card = cardArray[0];
            card.depth = 350;
            addMaskWindow();
            GuideSystem.getInstance().addEventListener("hide_all", removeMask);
        }
        public static function guideFunc2_2_1(_arg1):void{
            var cardArray:* = null;
            var card:* = undefined;
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                var _local2:*;
                param.removeEventListener("finishTask", removeMask);
                removeMaskWindow();
                for each (_local2 in cardArray) {
                    _local2.depth = _local2._depth;
                };
            };
            cardArray = CombatStage.getInstance().playerHandCards;
            for each (card in cardArray) {
                card.depth = 350;
            };
            addMaskWindow();
            param.addEventListener("finishTask", removeMask);
        }
        public static function guideFunc2_2_2(_arg1):void{
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                param.removeEventListener("finishTask", removeMask);
                removeMaskWindow();
                CombatStage.getInstance().playerCardBorn.depth = 0;
            };
            CombatStage.getInstance().playerCardBorn.depth = 350;
            addMaskWindow();
            param.addEventListener("finishTask", removeMask);
        }
        public static function guideFunc_enemyDeck(_arg1):void{
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                param.removeEventListener("finishTask", removeMask);
                removeMaskWindow();
                CombatStage.getInstance().enemyCardBorn.depth = 0;
            };
            CombatStage.getInstance().enemyCardBorn.depth = 350;
            addMaskWindow();
            param.addEventListener("finishTask", removeMask);
        }
        public static function guideFunc2_2_3(_arg1):void{
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                param.removeEventListener("finishTask", removeMask);
                removeMaskWindow();
                CombatStage.getInstance().playerCardBorn.depth = 0;
                CombatStage.getInstance().enemyCardBorn.depth = 0;
            };
            CombatStage.getInstance().playerCardBorn.depth = 350;
            CombatStage.getInstance().enemyCardBorn.depth = 350;
            addMaskWindow();
            param.addEventListener("finishTask", removeMask);
        }
        public static function guideFunc2_3_1(_arg1):void{
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                param.removeEventListener("finishTask", removeMask);
                var _local2:CardCloseness = new CardCloseness();
                _local2.setCardById(190);
                CombatStage.getInstance().addElement(_local2);
            };
            param.addEventListener("finishTask", removeMask);
        }
        public static function guideFunc3_1_1(_arg1):void{
            var _local2:CardCloseness = new CardCloseness();
            _local2.setCardById(610);
            CombatStage.getInstance().addElement(_local2);
        }
        public static function guideFunc3_10_1(_arg1):void{
            var _local2:CardCloseness = new CardCloseness();
            _local2.setCardById(45);
            CombatStage.getInstance().addElement(_local2);
        }
        public static function guideFunc1_1_3_1(_arg1):void{
            CombatStage.getInstance().playersInfo.depth = 350;
            addMaskWindow();
        }
        public static function guideFunc1_1_3_2(_arg1):void{
            var _local3:*;
            addMaskWindow();
            CombatStage.getInstance().playersInfo.depth = CombatStageDepthInfo.DEPTH_OF_DUEL_PALYERS_INFO;
            var _local2:Array = CombatStage.getInstance().playerHandCards;
            for each (_local3 in _local2) {
                _local3.depth = 350;
            };
        }
        public static function guideFunc_clear_1_1_3_2(_arg1):void{
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                var _local3:*;
                param.removeEventListener("finishTask", removeMask);
                CombatStage.getInstance().playersInfo.depth = CombatStageDepthInfo.DEPTH_OF_DUEL_PALYERS_INFO;
                var _local2:Array = CombatStage.getInstance().playerHandCards;
                for each (_local3 in _local2) {
                    _local3.depth = _local3._depth;
                };
            };
            removeMaskWindow();
            param.addEventListener("finishTask", removeMask);
        }
        public static function guideFunc1_1_3_3(_arg1):void{
            var _local2:Array = CombatStage.getInstance().playerHandCards;
            _local2[0].depth = 350;
            (_local2[0] as GameCard).playSurroundEffect();
            _local2[1].depth = 350;
            (_local2[1] as GameCard).playSurroundEffect();
            _local2[2].depth = _local2[2]._depth;
            _local2[3].depth = _local2[3]._depth;
            _local2[4].depth = _local2[4]._depth;
            _local2[5].depth = 350;
            (_local2[5] as GameCard).playSurroundEffect();
        }
        public static function guideFunc1_1_3_4(_arg1):void{
            var _local2:Array = CombatStage.getInstance().playerHandCards;
            _local2[0].depth = _local2[0]._depth;
            (_local2[0] as GameCard).playSurroundEffect(false);
            _local2[1].depth = _local2[1]._depth;
            (_local2[1] as GameCard).playSurroundEffect(false);
            _local2[2].depth = 350;
            (_local2[2] as GameCard).playSurroundEffect();
            _local2[3].depth = 350;
            (_local2[3] as GameCard).playSurroundEffect();
            _local2[4].depth = 350;
            (_local2[4] as GameCard).playSurroundEffect();
            _local2[5].depth = _local2[5]._depth;
            (_local2[5] as GameCard).playSurroundEffect(false);
        }
        public static function guideFunc1_1_3_5(_arg1):void{
            var card:* = undefined;
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                var _local3:*;
                param.removeEventListener("finishTask", removeMask);
                CombatStage.getInstance().playersInfo.depth = CombatStageDepthInfo.DEPTH_OF_DUEL_PALYERS_INFO;
                var _local2:Array = CombatStage.getInstance().playerHandCards;
                for each (_local3 in _local2) {
                    _local3.depth = _local3._depth;
                };
            };
            CombatStage.getInstance().playersInfo.depth = 350;
            var cardArray:* = CombatStage.getInstance().playerHandCards;
            for each (card in cardArray) {
                card.depth = 350;
            };
            (cardArray[2] as GameCard).playSurroundEffect(false);
            (cardArray[3] as GameCard).playSurroundEffect(false);
            (cardArray[4] as GameCard).playSurroundEffect(false);
            param.addEventListener("finishTask", removeMask);
        }
        public static function guideFunc1_1_3_6(_arg1):void{
            CombatStage.getInstance().playerCardBorn.depth = 350;
        }
        public static function guideFunc1_1_3_7(_arg1):void{
            var card:* = undefined;
            var a1:* = null;
            var a2:* = null;
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                param.removeEventListener("finishTask", removeMask);
                GuideSystem.getInstance().guideWindow.removeElement(a1);
                GuideSystem.getInstance().guideWindow.removeElement(a2);
            };
            CombatStage.getInstance().enemyCardBorn.depth = 350;
            var cardArray:* = CombatStage.getInstance().playerHandCards;
            for each (card in cardArray) {
                card.depth = card._depth;
            };
            a1 = new GuideArrowSign();
            a2 = new GuideArrowSign();
            a1.x = (GuideSystem.getInstance().getPosById("@deck_up_x") - 23);
            a1.y = (GuideSystem.getInstance().getPosById("@deck_up_y") - 45);
            a2.x = (GuideSystem.getInstance().getPosById("@deck_down_x") - 23);
            a2.y = (GuideSystem.getInstance().getPosById("@deck_down_y") - 45);
            GuideSystem.getInstance().guideWindow.addElement(a1);
            GuideSystem.getInstance().guideWindow.addElement(a2);
            param.addEventListener("finishTask", removeMask);
        }
        public static function guideFunc1_1_3_8(_arg1):void{
            CombatStage.getInstance().enemyCardBorn.depth = 0;
        }
        public static function guideFunc1_1_3_9(_arg1):void{
            CombatStage.getInstance().enemyCardBorn.depth = 350;
            CombatStage.getInstance().playerCardBorn.depth = 0;
        }
        public static function guideFunc1_1_3_10(_arg1):void{
            CombatStage.getInstance().playerCardBorn.depth = 350;
        }
        public static function guideFunc1_1_3_11(_arg1):void{
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                param.removeEventListener("finishTask", removeMask);
                CombatStage.getInstance().enemyCardBorn.depth = 0;
                CombatStage.getInstance().playerCardBorn.depth = 0;
            };
            removeMaskWindow();
            param.addEventListener("finishTask", removeMask);
        }
        public static function guideFunc1_1_5_1(_arg1):void{
            var card1:* = null;
            var showAttackEffectHandler:* = null;
            var changeDepth1:* = null;
            var changeDepth2:* = null;
            var finishTask:* = null;
            var param:* = _arg1;
            showAttackEffectHandler = function (_arg1:MyEvent):void{
                var a1:* = null;
                var a2:* = null;
                var talkWindow:* = null;
                var finishTask:* = null;
                var event:* = _arg1;
                finishTask = function (_arg1:Event):void{
                    GuideSystem.getInstance().guideWindow.removeElement(a1);
                    GuideSystem.getInstance().guideWindow.removeElement(a2);
                    talkWindow.removeEventListener("finishTask", finishTask);
                    CombatConsole.getInstance().enableActionList = true;
                };
                CombatConsole.getInstance().removeEventListener(MyEvent.DO_ATTACK_SUCCESS_EFFECT, showAttackEffectHandler);
                if (GuideSystem.getInstance().currentSection == 0){
                    CombatConsole.getInstance().enableActionList = true;
                    return;
                };
                CombatConsole.getInstance().enableActionList = false;
                a1 = new GuideArrowSign();
                a2 = new GuideArrowSign();
                a1.x = (448 - 23);
                a1.y = (455 - 45);
                a2.x = (720 - 23);
                a2.y = (455 - 45);
                GuideSystem.getInstance().guideWindow.addElement(a1);
                GuideSystem.getInstance().guideWindow.addElement(a2);
                talkWindow = GuideSystem.getInstance().guideAllTypeWindow["talk"];
                var text:* = StringUtils.parseColor((("战斗中决定胜负的是#g武力#n。<br>#o_monster_1_1#n武力是#g" + card1.cardInfo.str) + "#n，可以轻松击败武力只有#g1#n的#o黄巾军#n。"));
                var info:* = {
                    content:text,
                    head_icon:"_junzhu",
                    head_name:"_junzhu"
                };
                GuideLib.analyzeSpecialInfo(info);
                talkWindow.stepInfo = info;
                GuideSystem.getInstance().guideWindow.addElement(talkWindow);
                talkWindow.addEventListener("finishTask", finishTask);
            };
            changeDepth1 = function (_arg1=null):void{
                card1.depth = 350;
                CombatConsole.getInstance().addEventListener(MyEvent.SHOW_ATTACK_WINDOW, changeDepth2);
            };
            changeDepth2 = function (_arg1:MyEvent):void{
                CombatConsole.getInstance().removeEventListener(MyEvent.SHOW_ATTACK_WINDOW, changeDepth2);
                var _local2:AttackWindow = (_arg1.message["attackWindow"] as AttackWindow);
                _local2.addEventListener(MyEvent.CANCEL_ATTACK, changeDepth1);
                _local2.addEventListener(MyEvent.DO_ATTACK, finishTask);
            };
            finishTask = function (_arg1:MyEvent):void{
                card1.depth = card1._depth;
                var _local2:AttackWindow = (_arg1.message["attackWindow"] as AttackWindow);
                _local2.removeEventListener(MyEvent.CANCEL_ATTACK, changeDepth1);
                _local2.removeEventListener(MyEvent.DO_ATTACK, finishTask);
            };
            var cardArray:* = CombatStage.getInstance().playerMonsterCards;
            card1 = cardArray[0];
            cardArray = CombatStage.getInstance().enemyMonsterCards;
            var card2:* = cardArray[0];
            changeDepth1();
            CombatConsole.getInstance().addEventListener(MyEvent.DO_ATTACK_SUCCESS_EFFECT, showAttackEffectHandler);
        }
        public static function guideFunc_equal(_arg1):void{
            var showAttackEffectHandler:* = null;
            var changeDepth1:* = null;
            var changeDepth2:* = null;
            var finishTask:* = null;
            var param:* = _arg1;
            showAttackEffectHandler = function (_arg1:MyEvent):void{
                var a1:* = null;
                var a2:* = null;
                var talkWindow:* = null;
                var finishTask:* = null;
                var event:* = _arg1;
                finishTask = function (_arg1:Event):void{
                    GuideSystem.getInstance().guideWindow.removeElement(a1);
                    GuideSystem.getInstance().guideWindow.removeElement(a2);
                    talkWindow.removeEventListener("finishTask", finishTask);
                    CombatConsole.getInstance().enableActionList = true;
                };
                CombatConsole.getInstance().removeEventListener(MyEvent.DO_ATTACK_SUCCESS_EFFECT, showAttackEffectHandler);
                if (GuideSystem.getInstance().currentSection == 0){
                    CombatConsole.getInstance().enableActionList = true;
                    return;
                };
                CombatConsole.getInstance().enableActionList = false;
                a1 = new GuideArrowSign();
                a2 = new GuideArrowSign();
                a1.x = (448 - 23);
                a1.y = (455 - 45);
                a2.x = (720 - 23);
                a2.y = (455 - 45);
                GuideSystem.getInstance().guideWindow.addElement(a1);
                GuideSystem.getInstance().guideWindow.addElement(a2);
                talkWindow = GuideSystem.getInstance().guideAllTypeWindow["talk"];
                var text:* = StringUtils.parseColor("双方武力相等时，同归于尽。");
                var info:* = {
                    content:text,
                    head_icon:"_junzhu",
                    head_name:"_junzhu"
                };
                GuideLib.analyzeSpecialInfo(info);
                talkWindow.stepInfo = info;
                GuideSystem.getInstance().guideWindow.addElement(talkWindow);
                talkWindow.addEventListener("finishTask", finishTask);
            };
            changeDepth1 = function (_arg1=null):void{
                CombatConsole.getInstance().addEventListener(MyEvent.SHOW_ATTACK_WINDOW, changeDepth2);
            };
            changeDepth2 = function (_arg1:MyEvent):void{
                CombatConsole.getInstance().removeEventListener(MyEvent.SHOW_ATTACK_WINDOW, changeDepth2);
                var _local2:AttackWindow = (_arg1.message["attackWindow"] as AttackWindow);
                _local2.addEventListener(MyEvent.CANCEL_ATTACK, changeDepth1);
                _local2.addEventListener(MyEvent.DO_ATTACK, finishTask);
            };
            finishTask = function (_arg1:MyEvent):void{
                var _local2:AttackWindow = (_arg1.message["attackWindow"] as AttackWindow);
                _local2.removeEventListener(MyEvent.CANCEL_ATTACK, changeDepth1);
                _local2.removeEventListener(MyEvent.DO_ATTACK, finishTask);
            };
            changeDepth1();
            CombatConsole.getInstance().addEventListener(MyEvent.DO_ATTACK_SUCCESS_EFFECT, showAttackEffectHandler);
        }
        public static function guideFunc1_1_14_1(_arg1):void{
            var _local2:Array = CombatStage.getInstance().playerHandCards;
            _local2[0].depth = _local2[0]._depth;
            _local2[1].depth = 350;
            _local2[2].depth = 350;
            _local2[3].depth = 350;
            _local2[4].depth = _local2[4]._depth;
            addMaskWindow();
        }
        public static function guideFunc1_1_14_2(_arg1):void{
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                var _local3:*;
                param.removeEventListener("finishTask", removeMask);
                var _local2:Array = CombatStage.getInstance().playerHandCards;
                for each (_local3 in _local2) {
                    _local3.depth = _local3._depth;
                };
            };
            removeMaskWindow();
            param.addEventListener("finishTask", removeMask);
        }
        public static function guideFunc1_2_8(_arg1):void{
            var showAttackEffectHandler:* = null;
            var param:* = _arg1;
            showAttackEffectHandler = function (_arg1:MyEvent):void{
                var a1:* = null;
                var a2:* = null;
                var talkWindow:* = null;
                var finishTask1:* = null;
                var event:* = _arg1;
                finishTask1 = function (_arg1:Event):void{
                    var finishTask2:* = null;
                    var event:* = _arg1;
                    finishTask2 = function (_arg1:Event):void{
                        GuideSystem.getInstance().guideWindow.removeElement(a1);
                        GuideSystem.getInstance().guideWindow.removeElement(a2);
                        talkWindow.removeEventListener("finishTask", finishTask2);
                        CombatConsole.getInstance().enableActionList = true;
                    };
                    talkWindow.removeEventListener("finishTask", finishTask1);
                    if (GuideSystem.getInstance().currentSection == 0){
                        CombatConsole.getInstance().enableActionList = true;
                        return;
                    };
                    GuideSystem.getInstance().guideWindow.addElement(a1);
                    var text:* = StringUtils.parseColor("#o黄巾兵#n武力为 #g1#n ，对战智力为 #g3#n 的#o守城士兵#n，敌军阵营要受到#r差值 2 #n的HP伤害");
                    var info:* = {
                        content:text,
                        head_icon:"185",
                        head_name:"皇甫嵩"
                    };
                    GuideLib.analyzeSpecialInfo(info);
                    talkWindow.stepInfo = info;
                    GuideSystem.getInstance().guideWindow.addElement(talkWindow);
                    talkWindow.addEventListener("finishTask", finishTask2);
                };
                CombatConsole.getInstance().removeEventListener(MyEvent.DO_ATTACK_SUCCESS_EFFECT, showAttackEffectHandler);
                if (GuideSystem.getInstance().currentSection == 0){
                    CombatConsole.getInstance().enableActionList = true;
                    return;
                };
                CombatConsole.getInstance().enableActionList = false;
                a1 = new GuideArrowSign();
                a2 = new GuideArrowSign();
                a1.x = (718 - 23);
                a1.y = (455 - 45);
                a2.x = (380 - 23);
                a2.y = (432 - 45);
                GuideSystem.getInstance().guideWindow.addElement(a2);
                talkWindow = GuideSystem.getInstance().guideAllTypeWindow["talk"];
                var text:* = StringUtils.parseColor("#g防守阵型#n的部队，战斗时要看武将的#g智力#n。<br>因为智力会影响#g防守战术#n的发挥和#g守城器械#n的使用。");
                var info:* = {
                    content:text,
                    head_icon:"185",
                    head_name:"皇甫嵩"
                };
                GuideLib.analyzeSpecialInfo(info);
                talkWindow.stepInfo = info;
                GuideSystem.getInstance().guideWindow.addElement(talkWindow);
                talkWindow.addEventListener("finishTask", finishTask1);
            };
            CombatConsole.getInstance().addEventListener(MyEvent.DO_ATTACK_SUCCESS_EFFECT, showAttackEffectHandler);
        }
        public static function guideFunc1_2_9(_arg1):void{
            var showAttackEffectHandler:* = null;
            var param:* = _arg1;
            showAttackEffectHandler = function (_arg1:MyEvent):void{
                var a1:* = null;
                var a2:* = null;
                var talkWindow:* = null;
                var finishTask1:* = null;
                var event:* = _arg1;
                finishTask1 = function (_arg1:Event):void{
                    var finishTask2:* = null;
                    var event:* = _arg1;
                    finishTask2 = function (_arg1:Event):void{
                        GuideSystem.getInstance().guideWindow.removeElement(a1);
                        GuideSystem.getInstance().guideWindow.removeElement(a2);
                        talkWindow.removeEventListener("finishTask", finishTask2);
                        CombatConsole.getInstance().enableActionList = true;
                    };
                    talkWindow.removeEventListener("finishTask", finishTask1);
                    if (GuideSystem.getInstance().currentSection == 0){
                        CombatConsole.getInstance().enableActionList = true;
                        return;
                    };
                    var text:* = StringUtils.parseColor("这种情况两者#g势均力敌#n，谁都不会被破坏，也不会受到生命损伤。");
                    var info:* = {
                        content:text,
                        head_icon:"185",
                        head_name:"皇甫嵩"
                    };
                    GuideLib.analyzeSpecialInfo(info);
                    talkWindow.stepInfo = info;
                    GuideSystem.getInstance().guideWindow.addElement(talkWindow);
                    talkWindow.addEventListener("finishTask", finishTask2);
                };
                CombatConsole.getInstance().removeEventListener(MyEvent.DO_ATTACK_SUCCESS_EFFECT, showAttackEffectHandler);
                if (GuideSystem.getInstance().currentSection == 0){
                    CombatConsole.getInstance().enableActionList = true;
                    return;
                };
                CombatConsole.getInstance().enableActionList = false;
                a1 = new GuideArrowSign();
                a2 = new GuideArrowSign();
                a1.x = (718 - 23);
                a1.y = (455 - 45);
                a2.x = (380 - 23);
                a2.y = (432 - 45);
                GuideSystem.getInstance().guideWindow.addElement(a1);
                GuideSystem.getInstance().guideWindow.addElement(a2);
                talkWindow = GuideSystem.getInstance().guideAllTypeWindow["talk"];
                var text:* = StringUtils.parseColor("#o韩忠#n武力为 #g3#n ，与#o守城士兵#n的智力相等。");
                var info:* = {
                    content:text,
                    head_icon:"185",
                    head_name:"皇甫嵩"
                };
                GuideLib.analyzeSpecialInfo(info);
                talkWindow.stepInfo = info;
                GuideSystem.getInstance().guideWindow.addElement(talkWindow);
                talkWindow.addEventListener("finishTask", finishTask1);
            };
            CombatConsole.getInstance().addEventListener(MyEvent.DO_ATTACK_SUCCESS_EFFECT, showAttackEffectHandler);
        }
        public static function guideFunc1_2_24(_arg1):void{
            var showAttackEffectHandler:* = null;
            var param:* = _arg1;
            showAttackEffectHandler = function (_arg1:MyEvent):void{
                var a1:* = null;
                var talkWindow:* = null;
                var finishTask:* = null;
                var event:* = _arg1;
                finishTask = function (_arg1:Event):void{
                    GuideSystem.getInstance().guideWindow.removeElement(a1);
                    talkWindow.removeEventListener("finishTask", finishTask);
                    CombatConsole.getInstance().enableActionList = true;
                };
                CombatConsole.getInstance().removeEventListener(MyEvent.DO_ATTACK_SUCCESS_EFFECT, showAttackEffectHandler);
                if (GuideSystem.getInstance().currentSection == 0){
                    CombatConsole.getInstance().enableActionList = true;
                    return;
                };
                CombatConsole.getInstance().enableActionList = false;
                a1 = new GuideArrowSign();
                a1.x = (787 - 23);
                a1.y = (453 - 45);
                GuideSystem.getInstance().guideWindow.addElement(a1);
                talkWindow = GuideSystem.getInstance().guideAllTypeWindow["talk"];
                var text:* = StringUtils.parseColor("#o张宝#n虽然#g智力#n更高，但无奈他现在仅凭#r蛮力#n攻城，智力不起作用，要按#r武力 4 #n计算。");
                var info:* = {
                    content:text,
                    head_icon:"185",
                    head_name:"皇甫嵩"
                };
                GuideLib.analyzeSpecialInfo(info);
                talkWindow.stepInfo = info;
                GuideSystem.getInstance().guideWindow.addElement(talkWindow);
                talkWindow.addEventListener("finishTask", finishTask);
            };
            CombatConsole.getInstance().addEventListener(MyEvent.DO_ATTACK_SUCCESS_EFFECT, showAttackEffectHandler);
        }
        public static function guide3Func2():void{
            var showCardClosenes:* = null;
            showCardClosenes = function (_arg1:MyEvent):void{
                var _local2:GameCard = _arg1.message["card"];
                if (_local2.cardInfo.id.toString() == "185"){
                    CombatConsole.getInstance().removeEventListener(MyEvent.ADD_CARD_LOGIC, showCardClosenes);
                    CombatConsole.getInstance().showCardCloseness(_local2.cardInfo.id);
                };
            };
            CombatConsole.getInstance().addEventListener(MyEvent.ADD_CARD_LOGIC, showCardClosenes);
        }
        public static function guideFunc0_6_1(_arg1):void{
            var _local2:Array = CombatStage.getInstance().enemyMonsterCards;
            var _local3:GameCard = _local2[0];
            _local3.depth = 350;
            CombatStage.getInstance().cardDisplayWindow.depth = 350;
            addMaskWindow();
        }
        public static function guideFunc0_6_2(_arg1):void{
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                param.removeEventListener("finishTask", removeMask);
                removeMaskWindow();
                var _local2:Array = CombatStage.getInstance().enemyMonsterCards;
                var _local3:GameCard = _local2[0];
                _local3.depth = _local3._depth;
                CombatStage.getInstance().cardDisplayWindow.depth = CombatStageDepthInfo.DEPTH_OF_CARD_INFO_WINDOW;
            };
            param.addEventListener("finishTask", removeMask);
        }
        public static function guideFuncAddMask(_arg1):void{
            addMaskWindow();
        }
        public static function guideFuncRemoveMaskAtEnd(_arg1):void{
            var removeMask:* = null;
            var param:* = _arg1;
            removeMask = function (_arg1:Event):void{
                param.removeEventListener("finishTask", removeMask);
                removeMaskWindow();
            };
            param.addEventListener("finishTask", removeMask);
        }
        public static function hideAll():void{
            GuideSystem.getInstance().hideAll();
            GuideSystem.getInstance().dispatchEvent(new Event("hide_all"));
        }

    }
}//package task_guide 
