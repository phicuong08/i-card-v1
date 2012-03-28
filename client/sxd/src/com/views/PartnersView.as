//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class PartnersView extends Base implements IView {

        private var _partners:IPartners;
        private var _dialog:IAlert = null;

        private function get isOpenSport():Boolean{
            return (FunctionType.isOpened(FunctionType.SuperSport));
        }
        public function show():void{
            if (this._view.missionMap.inStageWithTip){
                return;
            };
            if (FunctionType.isOpened(FunctionType.Partners) == false){
                _view.alert.confirm(PartnersViewLang.FirstRole);
                return;
            };
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
            this._view.guide.stopPartnersGuides();
            this._view.guide.stopPartnersGuides2();
        }
        public function clear():void{
            this._dialog.hide();
            this._partners.clear();
        }
        private function loadData():void{
            this._data.call(Mod_Partners_Base.partners_list, this.loadDtaCallBack, [0]);
        }
        private function loadDtaCallBack():void{
            var callBack:* = function ():void{
                render();
                partnersListCallBack();
                showUI();
            };
            loadAssets("Partners", callBack, PartnersViewLang.LoadInfo);
        }
        private function render():void{
            if (this._partners == null){
                this._partners = (_view.getAssetsObject("Partners", "Partners") as IPartners);
            };
            this.init();
            this._partners.render();
        }
        private function showUI():void{
            _popup.addView(this, this._partners.content);
            _view.center(sign, this._partners.content);
        }
        private function init():void{
            this._partners.roleIconUrl = URI.iconsUrl;
            this._dialog = _view.alert.iAlert;
            this._partners.tip = _view.tip.iTip;
            this._partners.drag = _view.drag.iDrag;
            this._partners.onCloseBtn = this.close;
            this._partners.onPartnersData = this.partners_list;
            this._partners.onPartnersItemBtn = this.partners_invite;
            this._partners.isOpenSport = this.isOpenSport;
            this._partners.pageCurrent = 1;
        }
        private function getPageCount(_arg1:Array):int{
            return (Math.ceil((_arg1.length / 12)));
        }
        private function partners_list():void{
            this._data.call(Mod_Partners_Base.partners_list, this.partnersListCallBack, [this._partners.partnersJobType]);
        }
        private function partnersListCallBack():void{
            var _local1:Array = this._ctrl.partners.getPartnersList();
            var _local2:Object = this._ctrl.partners.getRecruitCount();
            var _local3:Object = {
                fame:this._ctrl.player.fame,
                fame_level:_local2["fame_level"],
                coin:this._ctrl.player.coins
            };
            this._partners.setPlayerInfo(_local3);
            this._partners.pageCount = this.getPageCount(_local1);
            this._partners.setDataBtn(_local1);
            if (this._partners.pageCurrent > this._partners.pageCount){
                this._partners.pageCurrent = this._partners.pageCount;
            };
            _local1 = _local1.slice(((this._partners.pageCurrent - 1) * 12), (this._partners.pageCurrent * 12));
            this._partners.renderPartnersList(_local1);
            this._partners.renderRecruitCount(_local2);
            this._view.guide.trackPartners(3, this._partners.content);
            this._view.guide.trackPartners2(3, this._partners.content);
            if (_local1.length == 0){
                this._view.guide.trackPartners(4, this._partners.content);
                this._view.guide.trackPartners2(4, this._partners.content);
            };
        }
        private function partners_invite():void{
            this._data.call(Mod_Partners_Base.partners_invite, this.partnersInviteCallBack, [this._partners.partnersID]);
        }
        private function partnersInviteCallBack():void{
            var _local1:int = this._ctrl.partners.Recruit();
            if (_local1 != Mod_Partners_Base.SUCCEED){
                _view.showTip(this.recruitMessage(_local1));
                return;
            };
            _view.showTip(PartnersViewLang.Succeed, null, TipType.Success);
            this.partners_list();
        }
        private function recruitMessage(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_Partners_Base.SUCCEED:
                    _local2 = PartnersViewLang.Succeed;
                    break;
                case Mod_Partners_Base.FAILED:
                    _local2 = PartnersViewLang.Failed;
                    break;
                case Mod_Partners_Base.NOENOUGHFEES:
                    _local2 = PartnersViewLang.NoEnoughFees;
                    break;
                case Mod_Partners_Base.COUNTLIMIT:
                    _local2 = PartnersViewLang.CountLimit;
                    break;
                case Mod_Partners_Base.NOENOUGHFAME:
                    _local2 = PartnersViewLang.NoEnoughFame;
                    break;
                default:
                    _local2 = (PartnersViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 
