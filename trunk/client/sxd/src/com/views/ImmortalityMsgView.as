//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.info.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class ImmortalityMsgView extends Base implements IView {

        private static var nullFun:Function = new Function();

        public var roleLv:int = 0;
        public var roleName:String = "";
        public var playerRoleId:int = 0;
        private var _target:IImmortalityMsg;
        private var _info:ImmortalityInfo;
        private var _numList:Array;

        public function ImmortalityMsgView(){
            this._numList = [ImmortalityMsgViewLang.Num1, ImmortalityMsgViewLang.Num2, ImmortalityMsgViewLang.Num3, ImmortalityMsgViewLang.Num4, ImmortalityMsgViewLang.Num5, ImmortalityMsgViewLang.Num6, ImmortalityMsgViewLang.Num7, ImmortalityMsgViewLang.Num8, ImmortalityMsgViewLang.Num9];
        }
        public function show():void{
            if (this._target != null){
                this._target.onFuYong = nullFun;
            };
            this.get_player_role_elixir_record();
        }
        public function close():void{
            this.playerRoleId = 0;
            _popup.closeView(this);
        }
        public function clear():void{
        }
        private function loadComplete():void{
            if (this._target == null){
                this._target = (_view.getAssetsObject("ImmortalityMsg", "MCImmortalityMsg") as IImmortalityMsg);
                this._target.onClose = this.close;
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
            };
            if (inStage == false){
                _popup.addView(this, this._target.content);
            };
            this._info = new ImmortalityInfo();
            this._info.listWuli = _ctrl.item.danyaoList[ItemType.WuLiDan];
            this._info.listJueJi = _ctrl.item.danyaoList[ItemType.JueJiDan];
            this._info.listFaShu = _ctrl.item.danyaoList[ItemType.FaShuDan];
            this._info.roleLv = this.roleLv;
            this._info.roleName = this.roleName;
            this._info.inogteat = (_ctrl.player.vipLevel >= 5);
            this._info.inogteat6 = (_ctrl.player.vipLevel >= 7);
            this._target.onFuYong = this.onFuYong;
            this._target.onWuLi = this.onWuLi;
            this._target.onJueJi = this.onJueJi;
            this._target.onFaShu = this.onFaShu;
            this._target.initData(this._info);
        }
        private function onWuLi():void{
            var _local6:Array;
            var _local1:int;
            var _local2:Array = ImmortalityInfo.tipsList1[ItemType.WuLiDan];
            var _local3:Array = this._target.icons;
            var _local4:Array = this._target.addList;
            var _local5:int;
            while (_local1 < 6) {
                _local6 = _local3[_local1];
                _local5 = 0;
                while (_local5 < _local6.length) {
                    _view.tip.iTip.addTarget(_local6[_local5], _local2[_local1][_local5]);
                    _local5++;
                };
                _view.tip.iTip.addTarget(_local4[_local1], Lang.sprintf(ImmortalityMsgViewLang.EatWuLi, this._numList[_local1]));
                _local1++;
            };
        }
        private function onJueJi():void{
            var _local6:Array;
            var _local1:int;
            var _local2:Array = ImmortalityInfo.tipsList1[ItemType.JueJiDan];
            var _local3:Array = this._target.icons;
            var _local4:Array = this._target.addList;
            var _local5:int;
            while (_local1 < 6) {
                _local6 = _local3[_local1];
                _local5 = 0;
                while (_local5 < _local6.length) {
                    _view.tip.iTip.addTarget(_local6[_local5], _local2[_local1][_local5]);
                    _local5++;
                };
                _view.tip.iTip.addTarget(_local4[_local1], Lang.sprintf(ImmortalityMsgViewLang.EatJueJi, this._numList[_local1]));
                _local1++;
            };
        }
        private function onFaShu():void{
            var _local6:Array;
            var _local1:int;
            var _local2:Array = ImmortalityInfo.tipsList1[ItemType.FaShuDan];
            var _local3:Array = this._target.icons;
            var _local4:Array = this._target.addList;
            var _local5:int;
            while (_local1 < 6) {
                _local6 = _local3[_local1];
                _local5 = 0;
                while (_local5 < _local6.length) {
                    _view.tip.iTip.addTarget(_local6[_local5], _local2[_local1][_local5]);
                    _local5++;
                };
                _view.tip.iTip.addTarget(_local4[_local1], Lang.sprintf(ImmortalityMsgViewLang.EatFaShu, this._numList[_local1]));
                _local1++;
            };
        }
        private function onFuYong(_arg1:Object):void{
            var obj:* = _arg1;
            var n1:* = ItemType.getName(obj.itemId);
            var n2:* = n1.substr((n1.length - 3), 2);
            var count:* = (obj.c + 1);
            var add:* = (obj.a - (obj.c * 5));
            var str:* = "";
            str = Lang.sprintf(ImmortalityMsgViewLang.AskEatTip2, HtmlText.yellow(this.roleName), HtmlText.yellow((count + "")), HtmlText.yellow(n1), (n2 + HtmlText.yellow(("+" + add))));
            str = HtmlText.white(str);
            if (obj.num != 0){
                _view.alert.showYesNoMsg(str, ImmortalityMsgViewLang.Eat, ImmortalityMsgViewLang.UnEat, function (_arg1:int):void{
                    if (_arg1 == AlertButtonType.Yes){
                        player_use_grid_elixir(obj.gid);
                    };
                });
            } else {
                if (_view.ingotEnough(obj.ingot)){
                    str = (Lang.sprintf(ImmortalityMsgViewLang.AskEatTip1, HtmlText.yellow((obj.ingot + ImmortalityMsgViewLang.Ingot))) + str);
                    this.checkBoxSelect(ConsumeAlertSetType.ImmortalityCookie, str, function ():void{
                        player_use_ingot_elixir(obj.itemId);
                    });
                };
            };
        }
        public function showSee(_arg1:ImmortalityInfo):void{
            this._info = _arg1;
            this._info.isSee = true;
            loadAssets("ImmortalityMsg", null, ImmortalityMsgViewLang.LaodingImmortalityTip, false, false, this.loadComplete2);
        }
        private function loadComplete2():void{
            if (this._target == null){
                this._target = (_view.getAssetsObject("ImmortalityMsg", "MCImmortalityMsg") as IImmortalityMsg);
                this._target.onClose = this.close;
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
            };
            if (inStage == false){
                _popup.addView(this, this._target.content);
            };
            this._target.onFuYong = new Function();
            this._target.onWuLi = this.onWuLi;
            this._target.onJueJi = this.onJueJi;
            this._target.onFaShu = this.onFaShu;
            this._target.initData(this._info);
        }
        private function checkBoxSelect(_arg1:int, _arg2:String, _arg3:Function):void{
            var cookieId:* = _arg1;
            var msg:* = _arg2;
            var callback:* = _arg3;
            if (_view.consumeAlertSetting.isAlert(cookieId)){
                callback();
            } else {
                _view.alert.iAlert.hasCheckbox = true;
                _view.alert.showYesNoMsg(msg, ImmortalityMsgViewLang.Eat, ImmortalityMsgViewLang.UnEat, function (_arg1:int):void{
                    if (_arg1 == AlertButtonType.Yes){
                        callback();
                        if (_view.alert.iAlert.checked == true){
                            _view.consumeAlertSetting.saveSetting(cookieId, true);
                        };
                    };
                });
            };
        }
        private function get_player_role_elixir_record():void{
            _data.call(Mod_Item_Base.get_player_role_elixir_record, this.get_player_role_elixir_record_back, [this.playerRoleId]);
        }
        private function get_player_role_elixir_record_back():void{
            if (_ctrl.item.playerRoleId != this.playerRoleId){
                return;
            };
            loadAssets("ImmortalityMsg", null, ImmortalityMsgViewLang.LaodingImmortalityTip, false, false, this.loadComplete);
        }
        private function player_use_grid_elixir(_arg1:int):void{
            _data.call(Mod_Item_Base.player_use_grid_elixir, this.player_use_grid_elixir_back, [_arg1, this.playerRoleId]);
        }
        private function player_use_ingot_elixir(_arg1:int):void{
            _data.call(Mod_Item_Base.player_use_ingot_elixir, this.player_use_grid_elixir_back, [_arg1, this.playerRoleId]);
        }
        private function player_use_grid_elixir_back():void{
            if (_ctrl.item.result == Mod_Item_Base.ACTION_SUCCESS){
                _view.showTip(ImmortalityMsgViewLang.EatImmortalitySuccess, "", TipType.Success);
                _view.roleMsg.updateSimpe();
                this.get_player_role_elixir_record2();
            } else {
                _view.showTip(ImmortalityMsgViewLang.EatImmortalityFails);
            };
        }
        private function get_player_role_elixir_record2():void{
            _data.call(Mod_Item_Base.get_player_role_elixir_record, this.get_player_role_elixir_record2_back, [this.playerRoleId]);
        }
        private function get_player_role_elixir_record2_back():void{
            if (_ctrl.item.playerRoleId != this.playerRoleId){
                return;
            };
            if (inStage == false){
                return;
            };
            this._info.listWuli = _ctrl.item.danyaoList[ItemType.WuLiDan];
            this._info.listJueJi = _ctrl.item.danyaoList[ItemType.JueJiDan];
            this._info.listFaShu = _ctrl.item.danyaoList[ItemType.FaShuDan];
            this._info.roleLv = this.roleLv;
            this._info.roleName = this.roleName;
            this._info.inogteat = (_ctrl.player.vipLevel >= 5);
            this._target.initData(this._info);
        }

    }
}//package com.views 
