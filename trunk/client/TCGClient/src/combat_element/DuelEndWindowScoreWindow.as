//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import normal_window.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import custom_effect.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class DuelEndWindowScoreWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _DuelEndWindowScoreWindow_Group3:Group;
        private var _413245038addEffect:Fade;
        private var _1561662221scoreGroup:Group;
        private var __moduleFactoryInitialized:Boolean = false;
        private var param:Object;
        private var creationHasComplete:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function DuelEndWindowScoreWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._DuelEndWindowScoreWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_DuelEndWindowScoreWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (DuelEndWindowScoreWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.layout = this._DuelEndWindowScoreWindow_BasicLayout1_c();
            this.mxmlContent = [this._DuelEndWindowScoreWindow_Group2_i(), this._DuelEndWindowScoreWindow_Group3_i()];
            this._DuelEndWindowScoreWindow_Fade1_i();
            this.addEventListener("creationComplete", this.___DuelEndWindowScoreWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            DuelEndWindowScoreWindow._watcherSetupUtil = _arg1;
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
        protected function group1_creationCompleteHandler():void{
            this.creationHasComplete = true;
            this.analyzeInfo();
        }
        public function setInfo(_arg1:Object):void{
            this.param = _arg1;
            this.analyzeInfo();
        }
        private function getScoreText(_arg1:int):String{
            if (_arg1 >= 0){
                return (("+" + _arg1));
            };
            return (_arg1.toString());
        }
        private function analyzeInfo():void{
            var tooltip:* = null;
            var item:* = null;
            var allItem:* = null;
            var id:* = 0;
            var allScoreDesc:* = null;
            var expDesc:* = null;
            var currentShowItem:* = undefined;
            var showAddEffect:* = null;
            var reason:* = null;
            if (((this.creationHasComplete) && (this.param))){
                showAddEffect = function ():void{
                    currentShowItem.removeEventListener("addEffectEnd", showAddEffect);
                    if (allItem.length == 0){
                        CombatStage.getInstance().addEventListener(MouseEvent.CLICK, clickHandler);
                        BasicOperationBar.getInstance().addEventListener(BasicOperationBar.CLICK_LEAVE_BTN, clickHandler);
                    } else {
                        currentShowItem = allItem.shift();
                        currentShowItem.addEffect.play();
                        currentShowItem.addEventListener("addEffectEnd", showAddEffect);
                    };
                };
                var createNormalScoreWindow:* = function (_arg1:String, _arg2:String, _arg3:String):DuelEndWindowScoreItem{
                    var _local4:DuelEndWindowScoreItem = new DuelEndWindowScoreItem();
                    _local4.descText = _arg1;
                    _local4.scoreText = _arg2;
                    allItem.push(_local4);
                    _local4.alpha = 0;
                    _local4.detailInfo = _arg3;
                    return (_local4);
                };
                allItem = new Array();
                this.scoreGroup.addElement(createNormalScoreWindow("战斗基本分", this.getScoreText(this.param["duel_score"]), this.getDuelBasicScoreTooltip(this.param)));
                if (this.param["pve_complete_score"]){
                    tooltip = "首次完成某项训练或指引战斗，视难度给予相当的首次完成分数奖励。";
                    this.scoreGroup.addElement(createNormalScoreWindow("首次完成", this.getScoreText(this.param["pve_complete_score"]), tooltip));
                };
                if (this.param["pvp_level_score"]){
                    tooltip = "玩家间的对战，根据双方等级给予等级积分奖励，等级越高获得的积分也越多。";
                    this.scoreGroup.addElement(createNormalScoreWindow("等级奖励", this.getScoreText(this.param["pvp_level_score"]), tooltip));
                };
                if (this.param["pvp_meet_score"]){
                    tooltip = "初次与某玩家对战，则可获得初识积分奖励。";
                    this.scoreGroup.addElement(createNormalScoreWindow("初识奖励", this.getScoreText(this.param["pvp_meet_score"]), tooltip));
                };
                for each (id in this.param.duel_achievement_info) {
                    item = new DuelEndWindowScoreItem();
                    item.setTextByAchievement(id, this.param.new_achievement, this.param.duel_result);
                    this.scoreGroup.addElement(item);
                    allItem.push(item);
                    item.alpha = 0;
                };
                if (this.param.score_arg){
                    for (reason in this.param.score_arg) {
                        item = new DuelEndWindowScoreItem();
                        item.setTextByScoreArg(reason, this.param.score_arg[reason]);
                        this.scoreGroup.addElement(item);
                        allItem.push(item);
                        item.alpha = 0;
                    };
                };
                tooltip = "决斗的最终积分结算，取胜时该积分受到双倍积分等效果的影响。";
                allScoreDesc = createNormalScoreWindow("总得分", this.getScoreText((this.param["remain_score"] - this.param["last_remain_score"])), tooltip);
                allScoreDesc.descColor = 0xFF7E00;
                allScoreDesc.scoreColor = 0xFF5400;
                this.scoreGroup.addElement(allScoreDesc);
                expDesc = createNormalScoreWindow("战斗经验", this.getScoreText((this.param["all_score"] - this.param["last_all_score"])), this.getDuelBasicExpTooltip(this.param));
                expDesc.descColor = 0xFF7E00;
                expDesc.scoreColor = 0xFF5400;
                this.scoreGroup.addElement(expDesc);
                this.relayoutScoreGroup(allItem.length);
                tooltip = "玩家目前剩余的积分，积分可以在商城兑换一些物品，如卡包、卡片、特殊道具。";
                item = createNormalScoreWindow("当前积分", this.param["remain_score"], tooltip);
                addElement(item);
                item.x = 600;
                item.y = 572;
                tooltip = "玩家经验值，决定玩家的等级。部分道具、卡包、卡片的购买有等级需求。";
                item = createNormalScoreWindow("经验值", ((this.param["all_score"] + " / ") + UserObject.getLevelUpScore(this.param.last_level)), tooltip);
                addElement(item);
                item.x = 600;
                item.y = 622;
                currentShowItem = allItem.shift();
                currentShowItem.addEffect.play();
                currentShowItem.addEventListener("addEffectEnd", showAddEffect);
            };
        }
        private function getDuelBasicScoreTooltip(_arg1:Object):String{
            var _local3:String;
            var _local2 = "决斗的基本分数，对战失败时可能为负值。";
            if (_arg1.duel_score_arg){
                for (_local3 in _arg1.duel_score_arg) {
                    switch (_local3){
                        case "no_punish":
                            _local2 = (_local2 + (("<br>#r本次战败免惩罚。#n<br>#o剩余免惩罚次数：" + _arg1.duel_score_arg[_local3]) + "#n"));
                            break;
                        case "over_20":
                            _local2 = (_local2 + "<br>#r等级超过对方20以上，<br>积分获取扣减至20%#n");
                            break;
                        case "over_10":
                            _local2 = (_local2 + "<br>#r等级超过对方10以上，<br>积分获取扣减至60%#n");
                            break;
                        default:
                            _local2 = (_local2 + _local3);
                    };
                };
            };
            return (_local2);
        }
        private function getDuelBasicExpTooltip(_arg1:Object):String{
            var _local3:String;
            var _local2 = "通过决斗获取的经验值。";
            if (_arg1.duel_exp_arg){
                for (_local3 in _arg1.duel_exp_arg) {
                    switch (_local3){
                        case "over_20":
                            _local2 = (_local2 + "<br>#r等级超过对方20以上，<br>经验获取扣减至20%#n");
                            break;
                        case "over_10":
                            _local2 = (_local2 + "<br>#r等级超过对方10以上，<br>经验获取扣减至60%#n");
                            break;
                        default:
                            _local2 = (_local2 + _local3);
                    };
                };
            };
            return (_local2);
        }
        private function relayoutScoreGroup(_arg1:int):void{
            if (_arg1 <= 9){
                this.scoreGroup.x = 600;
                this.scoreGroup.width = 400;
                this.scoreGroup.height = (_arg1 * 50);
            } else {
                if (_arg1 <= 18){
                    this.scoreGroup.x = 450;
                    this.scoreGroup.width = 800;
                    this.scoreGroup.height = (Math.ceil((_arg1 / 2)) * 50);
                } else {
                    this.scoreGroup.x = 50;
                    this.scoreGroup.width = 1200;
                    this.scoreGroup.height = (Math.ceil((_arg1 / 3)) * 50);
                };
            };
        }
        private function clickHandler(_arg1):void{
            var f:* = null;
            var effectEndHander:* = null;
            var e:* = _arg1;
            effectEndHander = function (_arg1:CustomEffectEvent):void{
                f.removeEventListener(CustomEffectEvent.END, effectEndHander);
                removeSelf();
            };
            CombatStage.getInstance().removeEventListener(MouseEvent.CLICK, this.clickHandler);
            BasicOperationBar.getInstance().removeEventListener(BasicOperationBar.CLICK_LEAVE_BTN, this.clickHandler);
            f = new FakeFadeEffect(this, 500, 1, 0);
            f.play();
            f.addEventListener(CustomEffectEvent.END, effectEndHander);
            this.visible = false;
        }
        private function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function _DuelEndWindowScoreWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 500;
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _DuelEndWindowScoreWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndWindowScoreWindow_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.verticalCenter = -80;
            _local1.layout = this._DuelEndWindowScoreWindow_TileLayout1_c();
            _local1.id = "scoreGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.scoreGroup = _local1;
            BindingManager.executeBindings(this, "scoreGroup", this.scoreGroup);
            return (_local1);
        }
        private function _DuelEndWindowScoreWindow_TileLayout1_c():TileLayout{
            var _local1:TileLayout = new TileLayout();
            _local1.orientation = "columns";
            _local1.verticalGap = 0;
            _local1.horizontalGap = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndWindowScoreWindow_Group3_i():Group{
            var _local1:Group = new Group();
            _local1.mxmlContent = [this._DuelEndWindowScoreWindow_Rect1_c()];
            _local1.id = "_DuelEndWindowScoreWindow_Group3";
            if (!_local1.document){
                _local1.document = this;
            };
            this._DuelEndWindowScoreWindow_Group3 = _local1;
            BindingManager.executeBindings(this, "_DuelEndWindowScoreWindow_Group3", this._DuelEndWindowScoreWindow_Group3);
            return (_local1);
        }
        private function _DuelEndWindowScoreWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.x = 430;
            _local1.y = 565;
            _local1.width = 850;
            _local1.height = 3;
            _local1.fill = this._DuelEndWindowScoreWindow_LinearGradient1_c();
            _local1.filters = [this._DuelEndWindowScoreWindow_GlowFilter1_c()];
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndWindowScoreWindow_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._DuelEndWindowScoreWindow_GradientEntry1_c(), this._DuelEndWindowScoreWindow_GradientEntry2_c(), this._DuelEndWindowScoreWindow_GradientEntry3_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndWindowScoreWindow_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 13679985;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndWindowScoreWindow_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 13679985;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndWindowScoreWindow_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 13679985;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndWindowScoreWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___DuelEndWindowScoreWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler();
        }
        private function _DuelEndWindowScoreWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                _DuelEndWindowScoreWindow_Group3.setStyle("addedEffect", _arg1);
            }, "_DuelEndWindowScoreWindow_Group3.addedEffect", "addEffect");
            return (result);
        }
        public function get addEffect():Fade{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Fade):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }
        public function get scoreGroup():Group{
            return (this._1561662221scoreGroup);
        }
        public function set scoreGroup(_arg1:Group):void{
            var _local2:Object = this._1561662221scoreGroup;
            if (_local2 !== _arg1){
                this._1561662221scoreGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scoreGroup", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 
