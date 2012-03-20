package {
    import com.assist.server.*;
    import flash.display.*;
    import flash.text.*;
    import flash.events.*;
    import flash.geom.*;
    import com.assist.view.interfaces.*;

    public class Activities extends MovieClip implements IActivities {

        private const _priority:Array;

        private var _buttonEffect:Class;
        private var _activityData:Object;
        private var _activityList:Array;
        private var _tip:ITip;
        private var _activityVisible:Boolean = false;
        private var _onActivityStart:Function;
        private var _onActivityTimerClick:Function;
        private var _onDownTimeEnd:Function;
        private var _onMinute:Function;
        private var _diffTime:int = 0;
        private var _mcHeight:int = 82;
        private var _btnEffectData:Object;
        private var _xy:Array;
        private var _width:int = 0;
        private var _isScr:Boolean = false;

        public function Activities():void{
            this._priority = [FunctionType.Rune, FunctionType.WorshipMars, FunctionType.RollCake, FunctionType.GetPeach, ActivityType.ServerWar, FunctionType.StudyStunt, ActivityType.FactionWarSee, ActivityType.FactionWarSignUp, ActivityType.FactionWarInto, ActivityType.FactionAll, TownType.All, FunctionType.Zodiac, FunctionType.Tower, FunctionType.TakeBible, FunctionType.Sport, FunctionType.SuperSport, TownType.DailyQuest];
            this._onActivityStart = new Function();
            this._onActivityTimerClick = new Function();
            this._onDownTimeEnd = new Function();
            this._onMinute = new Function();
            this._btnEffectData = {};
            this._xy = [684, 9];
            super();
            x = this._xy[0];
            y = this._xy[1];
            this._activityList = [];
            this._activityData = {};
        }
        public function clear():void{
            var _local1:int = this._activityList.length;
            var _local2:int = (_local1 - 1);
            while (_local2 >= 0) {
                this.removeActivity(this._activityList[_local2]);
                _local2--;
            };
        }
        public function addActivity(_arg1:String):void{
            var _local2:int = this._activityList.length;
            var _local3:int;
            while (_local3 < _local2) {
                if (_arg1 == this._activityList[_local3]){
                    return;
                };
                _local3++;
            };
            this.loadActivity(_arg1);
        }
        public function set onDownTimeEnd(_arg1:Function):void{
            this._onDownTimeEnd = _arg1;
        }
        public function set onMinute(_arg1:Function):void{
            this._onMinute = _arg1;
        }
        public function set diffTime(_arg1:int):void{
            this._diffTime = _arg1;
        }
        private function loadActivity(_arg1:String):void{
            var type:* = _arg1;
            var obj:* = {};
            var activityBtn:* = this.getActivityButton(type);
            addChild(activityBtn);
            activityBtn.buttonMode = true;
            var _downTimer:* = new ActivityDownTimer();
            activityBtn.addChild(_downTimer);
            _downTimer.x = 9;
            _downTimer.y = 68;
            _downTimer.isShowBtn = false;
            var effect:* = new this._buttonEffect();
            activityBtn.addChild(effect);
            effect.scaleY = 0.99;
            effect.y = -1;
            effect.visible = false;
            obj.buttonEffect = effect;
            obj.visibleEffect = false;
            var textField:* = new TextField();
            obj.textField = textField;
            var textFormat:* = new TextFormat();
            obj.textFormat = textFormat;
            activityBtn.visible = this._activityVisible;
            _downTimer.onClick = function (_arg1:String):void{
                _onActivityTimerClick(_arg1);
            };
            _downTimer.onDownTimeEnd = function (_arg1:String):void{
                _onDownTimeEnd(_arg1);
            };
            _downTimer.onMinute = function (_arg1:String, _arg2:Number):void{
                _onMinute(_arg1, _arg2);
            };
            _downTimer.diffTime = this._diffTime;
            obj.mc = activityBtn;
            obj.isTip = false;
            obj.downTimer = _downTimer;
            obj.mouseClick = this.mouseClick(type);
            obj.mouseOver = this.mouseOver(obj);
            obj.mouseOut = this.mouseOut(obj);
            obj.mc.addEventListener(MouseEvent.CLICK, obj.mouseClick);
            obj.mc.addEventListener(MouseEvent.MOUSE_OVER, obj.mouseOver);
            obj.mc.addEventListener(MouseEvent.MOUSE_OUT, obj.mouseOut);
            this._activityList.push(type);
            this._activityData[type] = obj;
            this.sortActivity();
        }
        private function getActivityButton(_arg1:String):MovieClip{
            var _local2:MovieClip;
            switch (_arg1){
                case TownType.MultiMission:
                    _local2 = new MultiMissionActivity();
                    break;
                case TownType.DailyQuest:
                    _local2 = new DailyQuestActivity();
                    break;
                case TownType.Sport:
                    _local2 = new SportActivity();
                    break;
                case TownType.PreventIndulge:
                    _local2 = new PreventIndulgeActivity();
                    break;
                case TownType.OnlineGift:
                    _local2 = new OnlineGiftActivity();
                    break;
                case TownType.SendIngot:
                    _local2 = new SendIngotActivity();
                    break;
                case TownType.All:
                    _local2 = new AllActivity();
                    break;
                case TownType.CampSalary:
                    _local2 = new CampSalaryActivity();
                    break;
                case ActivityType.Gift1:
                    _local2 = new SendIngotActivity();
                    break;
                case ActivityType.Gift2:
                case ActivityType.Gift3:
                case ActivityType.Gift12:
                case ActivityType.Gift13:
                case ActivityType.Gift14:
                case ActivityType.Gift15:
                case ActivityType.Gift16:
                case ActivityType.Gift17:
                case ActivityType.Gift18:
                case ActivityType.Gift19:
                case ActivityType.Gift20:
                    _local2 = new GiftType2Activity();
                    break;
                case ActivityType.Gift4:
                    _local2 = new GiftType4Activity();
                    break;
                case ActivityType.Gift5:
                    _local2 = new MCFactionWarGift2();
                    break;
                case ActivityType.Gift6:
                case ActivityType.Gift7:
                case ActivityType.Gift8:
                case ActivityType.Gift9:
                    _local2 = new MCFactionAnimal();
                    break;
                case ActivityType.Gift10:
                    _local2 = new WorldBossActivity();
                    break;
                case ActivityType.Gift11:
                    _local2 = new MCVIPGift();
                    break;
                case ActivityType.FactionWarSee:
                case ActivityType.FactionWarSignUp:
                case ActivityType.FactionWarInto:
                    _local2 = new MCFactionWar();
                    break;
                case ActivityType.FactionWarGift:
                    _local2 = new MCFactionWarGift();
                    break;
                case FunctionType.Rune:
                    _local2 = new RuneActivity();
                    break;
                case FunctionType.SuperSport:
                    _local2 = new SuperSportActivity();
                    break;
                case FunctionType.TakeBible:
                    _local2 = new TakeBibleActivity();
                    break;
                case ActivityType.FactionAll:
                    _local2 = new FactionAllActivity();
                    break;
                case FunctionType.Tower:
                    _local2 = new MCTower();
                    break;
                case ActivityType.ServerWar:
                    _local2 = new MCServerWar();
                    break;
                case FunctionType.RollCake:
                    _local2 = new RollCakeActivity();
                    break;
                case FunctionType.WorshipMars:
                    _local2 = new WorshipMarsActivity();
                    break;
                case FunctionType.GetPeach:
                    _local2 = new GetPeachActivity();
                    break;
                case ActivityType.RedEnvelopes:
                    _local2 = new RedEnvelopesActivity();
                    break;
                case FunctionType.Zodiac:
                    _local2 = new ZodiacActivity();
                    break;
                case FunctionType.SealSoul:
                    _local2 = new SealStoneActivity();
                    break;
                case FunctionType.StudyStunt:
                    _local2 = new StudyStuntActivity();
                    break;
                case FunctionType.PetAnimal:
                    _local2 = new PetAnimal();
                    break;
                default:
                    _local2 = new MCNone();
            };
            return (_local2);
        }
        private function sortActivity():void{
            var _local6:int;
            var _local7:Object;
            var _local8:int;
            var _local1:Array = [].concat(this._activityList);
            var _local2:Array = [];
            var _local3:int = this._priority.length;
            var _local4:int = (_local3 - 1);
            while (_local4 > -1) {
                _local6 = _local1.indexOf(this._priority[_local4]);
                if (_local6 > -1){
                    _local2 = _local2.concat(_local1.splice(_local6, 1));
                };
                _local4--;
            };
            _local2 = _local2.concat(_local1);
            var _local5:int;
            _local3 = _local2.length;
            _local4 = 0;
            while (_local4 < _local3) {
                _local7 = this._activityData[_local2[_local4]];
                if (_local7){
                    _local8 = (Math.floor((this._width / 100)) - 3);
                    if (_local8 > 10){
                        _local8 = 10;
                    };
                    if (_local8 < 2){
                        _local8 = 2;
                    };
                    _local7.mc.x = Math.floor((-67 * (_local4 - (Math.floor((_local4 / _local8)) * _local8))));
                    _local7.mc.y = Math.floor((this._mcHeight * Math.floor((_local4 / _local8))));
                };
                _local4++;
            };
            this._isScr = true;
        }
        private function mouseClick(_arg1:String):Function{
            var type:* = _arg1;
            var func:* = function (_arg1:MouseEvent):void{
                _onActivityStart(type);
            };
            return (func);
        }
        private function mouseOver(_arg1:Object):Function{
            var data:* = _arg1;
            var func:* = function (_arg1:MouseEvent):void{
                data.mc.gotoAndStop(2);
            };
            return (func);
        }
        private function mouseOut(_arg1:Object):Function{
            var data:* = _arg1;
            var func:* = function (_arg1:MouseEvent):void{
                data.mc.gotoAndStop(1);
            };
            return (func);
        }
        public function activityTimer(_arg1:String, _arg2:Object):void{
            var _local5:Object;
            var _local3:int = this._activityList.length;
            var _local4:int = (_local3 - 1);
            while (_local4 > -1) {
                if (this._activityList[_local4] == _arg1){
                    _local5 = this._activityData[this._activityList[_local4]];
                    _local5.downTimer.isShowBtn = _arg2.showBtn;
                    _local5.downTimer.startTimerColor = _arg2.startTimerColor;
                    _local5.downTimer.endTimerColor = _arg2.endTimerColor;
                    _local5.downTimer.endTimerStr = _arg2.endTimerStr;
                    _local5.downTimer.mcType = _arg2.sendType;
                    _local5.downTimer.downTimer = _arg2.timer;
                    _local5.showBtn = _arg2.showBtn;
                    return;
                };
                _local4--;
            };
        }
        public function hideActivityTimer(_arg1:String, _arg2:String):void{
            var _local5:Object;
            var _local3:int = this._activityList.length;
            var _local4:int = (_local3 - 1);
            while (_local4 > -1) {
                if (this._activityList[_local4] == _arg1){
                    _local5 = this._activityData[this._activityList[_local4]];
                    if (_local5.downTimer.EndTimerStr == _arg2){
                        _local5.downTimer.isShowBtn = false;
                        _local5.buttonEffect.visible = false;
                        return;
                    };
                };
                _local4--;
            };
        }
        public function isLoaderActivitie(_arg1:String):Boolean{
            var _local2:int = this._activityList.length;
            var _local3:int = (_local2 - 1);
            while (_local3 > -1) {
                if (this._activityList[_local3] == _arg1){
                    return (true);
                };
                _local3--;
            };
            return (false);
        }
        public function removeActivity(_arg1:String):void{
            var _local4:Object;
            var _local2:int = this._activityList.length;
            var _local3:int = (_local2 - 1);
            while (_local3 > -1) {
                if (this._activityList[_local3] == _arg1){
                    _local4 = this._activityData[this._activityList[_local3]];
                    removeChild(_local4.mc);
                    _local4.downTimer.parent.removeChild(_local4.downTimer);
                    _local4.downTimer.clear();
                    _local4.mc.removeEventListener(MouseEvent.CLICK, _local4.mouseClick);
                    _local4.mc.removeEventListener(MouseEvent.CLICK, _local4.mouseOver);
                    _local4.mc.removeEventListener(MouseEvent.CLICK, _local4.mouseOut);
                    if (_local4.isTip){
                        this._tip.removeTarget(_local4.mc);
                        _local4.isTip = false;
                    };
                    delete this._activityData[this._activityList[_local3]];
                    this._activityList.splice(_local3, 1);
                    break;
                };
                _local3--;
            };
            this.sortActivity();
        }
        public function set activityVisible(_arg1:Boolean):void{
            var _local4:Object;
            var _local2:int = this._activityList.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this._activityData[this._activityList[_local3]];
                _local4.mc.visible = _arg1;
                _local3++;
            };
            this._activityVisible = _arg1;
            this.refreshBtnEffect();
        }
        public function visibleBtnEffect(_arg1:String, _arg2:String, _arg3:Boolean):void{
            var _local5:Array;
            var _local6:int;
            var _local7:int;
            var _local8:Object;
            var _local4:Object = {
                sign:_arg2,
                bool:_arg3
            };
            if (this._btnEffectData[_arg1]){
                _local5 = this._btnEffectData[_arg1];
                _local6 = _local5.length;
                _local7 = 0;
                while (_local7 < _local6) {
                    _local8 = _local5[_local7];
                    if (_local8.sign == _arg2){
                        _local8.bool = _arg3;
                        this.renderBtnEffect(this._btnEffectData[_arg1], _arg1);
                        return;
                    };
                    _local7++;
                };
            } else {
                this._btnEffectData[_arg1] = [];
            };
            this._btnEffectData[_arg1].push(_local4);
            this.renderBtnEffect(this._btnEffectData[_arg1], _arg1);
        }
        private function renderBtnEffect(_arg1:Array, _arg2:String):void{
            var _local6:Object;
            var _local3:Object = this._activityData[_arg2];
            if (_arg1 == null){
                _local3.buttonEffect.visible = false;
                return;
            };
            var _local4:int = _arg1.length;
            var _local5:int;
            while (_local5 < _local4) {
                _local6 = _arg1[_local5];
                if (_local6.bool == true){
                    _local3.buttonEffect.visible = this._activityVisible;
                    return;
                };
                _local5++;
            };
            _local3.buttonEffect.visible = false;
        }
        private function refreshBtnEffect():void{
            var _local3:String;
            var _local4:Array;
            var _local1:int = this._activityList.length;
            var _local2:int = (_local1 - 1);
            while (_local2 > -1) {
                _local3 = this._activityList[_local2];
                _local4 = this._btnEffectData[_local3];
                this.renderBtnEffect(_local4, _local3);
                _local2--;
            };
        }
        public function activityTip(_arg1:String, _arg2:String):void{
            var _local5:Object;
            var _local3:int = this._activityList.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = this._activityData[this._activityList[_local4]];
                if (this._activityList[_local4] == _arg1){
                    _local5.textField.textColor = 0xFFFFFF;
                    _local5.textField.htmlText = _arg2;
                    _local5.textField.autoSize = TextFieldAutoSize.LEFT;
                    _local5.textFormat.leading = 8;
                    _local5.textField.setTextFormat(_local5.textFormat);
                    this._tip.addTarget(_local5.mc, _local5.textField);
                    _local5.isTip = true;
                    return;
                };
                _local4++;
            };
        }
        public function set activityRuneNum(_arg1:int):void{
            var _local4:Object;
            var _local2:int = this._activityList.length;
            var _local3:int = (_local2 - 1);
            while (_local3 > -1) {
                if (this._activityList[_local3] == FunctionType.Rune){
                    _local4 = this._activityData[this._activityList[_local3]];
                    _local4.mc._Num._Count.text = _arg1;
                    return;
                };
                _local3--;
            };
        }
        public function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void{
            x = Math.max((this._xy[0] - _arg5.x), (Math.min(_arg3, stage.stageWidth) - (_arg1 - this._xy[0])));
            this._width = (Math.max(_arg1, Math.min(_arg3, stage.stageWidth)) - _arg5.x);
            if (this._isScr){
                this.sortActivity();
            };
        }
        public function get content():MovieClip{
            return (this);
        }
        public function set buttonEffect(_arg1:Class):void{
            this._buttonEffect = _arg1;
        }
        public function set tip(_arg1:ITip):void{
            this._tip = _arg1;
        }
        public function set onActivityTimerClick(_arg1:Function):void{
            this._onActivityTimerClick = _arg1;
        }
        public function set onActivityStart(_arg1:Function):void{
            this._onActivityStart = _arg1;
        }

    }
}//package 
