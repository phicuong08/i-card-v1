//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.utils.*;
    import flash.text.*;
    import com.assist.view.interfaces.factionWar.*;
    import com.assist.*;
    import com.protocols.*;
    import com.lang.client.com.views.*;
    import com.assist.view.toolbar.*;

    public class FactionTableView extends Base implements IView {

        private var _target:IFactionWarTable;

        public function show():void{
            if (inStage){
                return;
            };
            this.cup_list();
        }
        public function update():void{
            if (inStage == false){
                return;
            };
            this.cup_list();
        }
        public function close():void{
            _popup.closeView(this);
        }
        public function clear():void{
        }
        private function loadComplete():void{
            var _local2:String;
            var _local3:TextField;
            if (this._target == null){
                this._target = (_view.getAssetsObject("FactionTable", "MCFactionWarTable") as IFactionWarTable);
                this._target.onClose = this.close;
                this._target.onInto = this.onInto;
                this._target.onSeeClick = this.onSeeClick;
                this._target.onTextLink = this.onTextLink;
                this._target.buttonEffect = _view.activities.buttonEffectObj();
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
                _local2 = (((((((htmlFormat(FactionTableViewLang.OpenGift, 12, 0xFFFFFF) + htmlFormat(FactionTableViewLang.PurpleReel, 12, 0xFF00FF)) + "，") + htmlFormat(FactionTableViewLang.SixReel, 12, 44783)) + "，") + htmlFormat(FactionTableViewLang.SixImmortality, 12, 44783)) + "，") + htmlFormat(FactionTableViewLang.FiveImmortality, 12, 44783));
                _local2 = ((((htmlFormat((FactionTableViewLang.ChampionGift + "\n"), 12, 0xFFF100) + _local2) + FactionTableViewLang.Comma) + htmlFormat(FactionTableViewLang.ChampionRide, 12, 0xFFF100)) + FactionTableViewLang.Period);
                _local3 = new TextField();
                _local3.textColor = 0xFFFFFF;
                _local3.wordWrap = true;
                _local3.width = 150;
                _local3.htmlText = _local2;
                _local3.height = (_local3.textHeight + 5);
                _view.tip.iTip.addTarget(this._target.jueSaiBtn, _local3);
            };
            if (inStage == false){
                _popup.addView(this, this._target.content);
            };
            var _local1:Object = _ctrl.factionWarMap.cupObj;
            this._target.cupObj = _local1;
            if (((_view.factionWarMap.inStage) && ((_ctrl.factionWarMap.intoTime > 0)))){
                this._target.intoVisible = false;
            };
        }
        private function onInto():void{
            _view.factionWarMap.gotoFactionWar();
        }
        private function onSeeClick(_arg1:Object):void{
            this.get_versus_rank_list(_arg1.round, _arg1.id1, _arg1.id2);
        }
        private function get_versus_rank_list(_arg1:int, _arg2:int, _arg3:int):void{
            _data.call(Mod_FactionWar_Base.get_versus_rank_list, this.get_versus_rank_list_back, [1, _arg1, _arg2, _arg3]);
        }
        private function get_versus_rank_list_back():void{
            this._target.heroRank = _ctrl.factionWarMap.heroRank;
            this._target.heroRankTip = _ctrl.factionWarMap.heroRankTip;
        }
        private function onTextLink(_arg1:int, _arg2:String):void{
            var _local5:Array;
            if (_arg1 == _ctrl.player.playerId){
                return;
            };
            if (_arg2.indexOf(FactionTableViewLang.FactonBoss)){
                _local5 = [FactionTableViewLang.QueryData, FactionTableViewLang.AddAttention];
            };
            var _local3:Array = [[TextLinkType.SeeMsg, _arg1].join("_"), [TextLinkType.AddFocus, _arg1, _arg2].join("_")];
            var _local4:ClickTipList = new ClickTipList(_local5, _local3, _view.toolbar.onTextLink);
            setTimeout(_view.tip.iTip.clickToOpen, 50, _local4);
        }
        private function cup_list():void{
            _data.call(Mod_FactionWar_Base.cup_list, this.cup_list_back, [1]);
        }
        private function cup_list_back():void{
            loadAssets("FactionTable", null, FactionTableViewLang.LoadInfo, true, false, this.loadComplete);
        }

    }
}//package com.views 
