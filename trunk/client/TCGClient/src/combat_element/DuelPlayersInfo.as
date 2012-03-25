//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import combat_element_script.*;
    
    import flash.accessibility.*;
    import flash.debugger.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;
    
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.filters.*;
    import mx.styles.*;
    
    import spark.components.*;
    import spark.layouts.*;
    
    import task_guide.*;

    public class DuelPlayersInfo extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1050538616enemyHead:CombatStageHeadUpward;
        private var _266842037userHead:CombatStageHeadDownward;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function DuelPlayersInfo(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._DuelPlayersInfo_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_DuelPlayersInfoWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.layout = this._DuelPlayersInfo_BasicLayout1_c();
            this.mxmlContent = [this._DuelPlayersInfo_CombatStageHeadUpward1_i(), this._DuelPlayersInfo_CombatStageHeadDownward1_i()];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            DuelPlayersInfo._watcherSetupUtil = _arg1;
        }

        override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
            super.moduleFactory = _arg1;
            if (this.__moduleFactoryInitialized){
                return;
            };
            this.__moduleFactoryInitialized = true;
        }
        override public function initialize():void{
            super.initialize();
        }
        public function changeHp(_arg1:String, _arg2:int):void{
            if (_arg1 == "player"){
                this.userHead.changeHpNum(_arg2);
            } else {
                this.enemyHead.changeHpNum(_arg2);
            };
        }
        public function setHp(_arg1:String, _arg2:int):void{
            if (_arg1 == "player"){
                this.userHead.setHpNum(_arg2);
            } else {
                this.enemyHead.setHpNum(_arg2);
            };
        }
        public function changeFood(_arg1:String, _arg2:int):void{
            if (_arg1 == "player"){
                this.userHead.changeFoodNum(_arg2);
            } else {
                this.enemyHead.changeFoodNum(_arg2);
            };
        }
        public function setFood(_arg1:String, _arg2:int):void{
            if (_arg1 == "player"){
                this.userHead.setFoodNum(_arg2);
            } else {
                this.enemyHead.setFoodNum(_arg2);
            };
        }
        public function reset():void{
            this.enemyHead.reset();
            this.userHead.reset();
        }
        public function setPlayerInfo(_arg1:Object, _arg2:CombatStageHeadWindowBase):void{
            if (!_arg1){
                return;
            };
            _arg2.playHeadCrossFadeEffect();
            if (!_arg1.level){
                _arg2.headName = _arg1.name;
                _arg2.headSource = _arg1.headIcon;
                _arg2.headTooltip = _arg1.tooltip;
            } else {
                _arg2.headName = _arg1.name;
                _arg2.headSource = (("source/userHead/" + _arg1.head_icon) + ".jpg");
                _arg2.headTooltip = ((((((((("昵称：" + _arg1.name) + "\n等级：") + _arg1.level) + "\n胜率：") + UserObject.transUserWinPercent(_arg1.win_duel, _arg1.lose_duel, _arg1.escape_duel)) + "\n逃跑率：") + UserObject.transUserEscapePercent(_arg1.win_duel, _arg1.lose_duel, _arg1.escape_duel)) + "\n卡组：") + _arg1.duel_group_name);
            };
        }
        public function clearClock(_arg1:String):void{
            if (_arg1 == "player"){
                this.userHead.clearClock();
            } else {
                this.enemyHead.clearClock();
            };
        }
        public function stopClock(_arg1:String, _arg2:int=-1):void{
            if (_arg1 == "player"){
                this.userHead.stopClock(_arg2);
            } else {
                this.enemyHead.stopClock(_arg2);
            };
        }
        public function startClock(_arg1:String, _arg2:int, _arg3:int):void{
            if (_arg1 == "player"){
                this.userHead.startClock(_arg2, _arg3);
            } else {
                this.enemyHead.startClock(_arg2, _arg3);
            };
        }
        private function _DuelPlayersInfo_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelPlayersInfo_CombatStageHeadUpward1_i():CombatStageHeadUpward{
            var _local1:CombatStageHeadUpward;
            _local1 = new CombatStageHeadUpward();
            _local1.x = 1063;
            _local1.y = 0;
            _local1.id = "enemyHead";
            if (!_local1.document){
                _local1.document = this;
            };
            this.enemyHead = _local1;
            BindingManager.executeBindings(this, "enemyHead", this.enemyHead);
            return (_local1);
        }
        private function _DuelPlayersInfo_CombatStageHeadDownward1_i():CombatStageHeadDownward{
            var _local1:CombatStageHeadDownward = new CombatStageHeadDownward();
            _local1.x = 0;
            _local1.y = 617;
            _local1.id = "userHead";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userHead = _local1;
            BindingManager.executeBindings(this, "userHead", this.userHead);
            return (_local1);
        }
        private function _DuelPlayersInfo_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_DUEL_PALYERS_INFO);
            }, null, "this.depth");
            return (result);
        }
        public function get enemyHead():CombatStageHeadUpward{
            return (this._1050538616enemyHead);
        }
        public function set enemyHead(_arg1:CombatStageHeadUpward):void{
            var _local2:Object = this._1050538616enemyHead;
            if (_local2 !== _arg1){
                this._1050538616enemyHead = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enemyHead", _local2, _arg1));
                };
            };
        }
        public function get userHead():CombatStageHeadDownward{
            return (this._266842037userHead);
        }
        public function set userHead(_arg1:CombatStageHeadDownward):void{
            var _local2:Object = this._266842037userHead;
            if (_local2 !== _arg1){
                this._266842037userHead = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userHead", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 
