//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.pack {
    import flash.display.*;
    import ICard.haloer.net.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;
    import ICard.assist.*;
    import ICard.assist.view.map.*;
    import ICard.assist.server.*;

    public class FateTipSprite extends Sprite {

        private var _fateMcData:Object;
        private var _fateSign:String;
        private var colorObj:Object;
        private var _tip:ITip;
        private var _fateMc:MovieClip;
        private var _box:MovieClip;
        private var _fateFile:TextField;
        private var _textFromat:TextFormat;
        private var _rect:Sprite;
        private var _fateMcList:Array;
        private var _isLoader:Boolean = false;
        private var _fateIconList:Array;

        public function FateTipSprite(){
            this.colorObj = {
                1:0x999999,
                2:2272312,
                3:44783,
                4:0xFF00FF,
                5:0xFFF100,
                6:0xFF0000
            };
            super();
            this._fateMcData = {};
            this.addMc();
            this.createRect();
            this.addFile();
        }
        public function set tip(_arg1:ITip):void{
            this._tip = _arg1;
        }
        public function set target(_arg1:DisplayObject):void{
            var _local2:Sprite = this._tip.clickToOpen(this._fateMc);
        }
        public function set getFateId(_arg1:int):void{
            var _local2:String = FateType.getFateSign(_arg1);
            if (this._fateSign == _local2){
                return;
            };
            this._fateSign = _local2;
            var _local3:Object = {};
            _local3.fateId = _arg1;
            _local3.fateLevel = 1;
            _local3.quality = FateType.getFateQuality(_local3.fateId);
            _local3.fateName = FateType.getFateName(_local3.fateId);
            _local3.color = this.colorObj[_local3.quality];
            _local3.info = FateType.getFateDescription(_local3.fateId);
            _local3.sell = FateType.getSalePriceByFateId(_local3.fateId);
            _local3.addValue = FateType.getFateAddonValue(_local3.fateId, _local3.fateLevel);
            _local3.maxLevel = FateType.getMaxFateLevel(_local3.fateId);
            _local3.url = ((URI.fateUrl + _local3.sign) + ".swf");
            _local3.baseExp = FateType.getExperienceByQualityId(_local3.quality);
            _local3.warType = FateType.getWarAttributeType(_local3.fateId);
            if ((((((((((((((_local3.warType == FateType.Hit)) || ((_local3.warType == FateType.Block)))) || ((_local3.warType == FateType.Dodge)))) || ((_local3.warType == FateType.Critical)))) || ((_local3.warType == FateType.BreakBlock)))) || ((_local3.warType == FateType.BreakCritical)))) || ((_local3.warType == FateType.Kill)))){
                _local3.addValue = (_local3.addValue + "%");
            };
            var _local4 = ((URI.fateUrl + this._fateSign) + ".swf");
            this.renderFateData(_local3);
            if (this._fateMcData[this._fateSign] != null){
                this.oldFateDate();
            } else {
                this.getFataUrl(_local4);
            };
        }
        private function oldFateDate():void{
            var _local1:Object = {};
            _local1.loader = this._fateMcData[this._fateSign];
            this.renderLootFate([_local1]);
        }
        private function addMc():void{
            this._fateMc = new MovieClip();
            this._box = MapStatic.mapInstance.boxObj;
            this._fateMc.addChild(this._box);
        }
        private function addFile():void{
            this._textFromat = new TextFormat();
            this._textFromat.leading = 8;
            this._fateFile = new TextField();
            this._fateFile.autoSize = TextFieldAutoSize.LEFT;
            this._fateFile.textColor = 0xFFFFFF;
            this._fateFile.selectable = false;
            this._fateMc.addChild(this._fateFile);
        }
        private function renderFateData(_arg1:Object):void{
            var _local2 = "";
            this._fateFile.htmlText = (((htmlFormat(_arg1.fateName, 14, _arg1.color, false) + htmlFormat((" Lv." + _arg1.fateLevel), 12, _arg1.color, false)) + htmlFormat(((("\n" + _arg1.info) + " ") + _arg1.addValue), 12, 0xCC3300, false)) + "  ");
            this._fateFile.setTextFormat(this._textFromat);
        }
        private function createRect():void{
            this._rect = new Sprite();
            this._rect.graphics.beginFill(0);
            this._rect.graphics.drawRect(0, 0, 160, 60);
            this._rect.graphics.endFill();
            this._rect.mouseEnabled = false;
            this._fateMc.addChild(this._rect);
            this._rect.alpha = 0;
        }
        private function getFataUrl(_arg1:String):void{
            this._fateMcList = [];
            this._fateMcList.push(_arg1);
            File.loadList(this._fateMcList, this.renderLootFate);
        }
        private function renderLootFate(_arg1:Array):void{
            if (this._isLoader){
                this._fateIconList[0].parent.removeChild(this._fateIconList[0]);
                this._isLoader = false;
            };
            this._fateIconList = [];
            this._fateMcList = null;
            this._fateIconList.push(_arg1[0].loader);
            this._fateMcData[this._fateSign] = _arg1[0].loader;
            this._box.Icon.addChild(_arg1[0].loader);
            var _local2:Number = Math.max(100, (this._fateFile.width + 10));
            this._box.x = (_local2 + 5);
            this._box.y = 3;
            _arg1[0].loader.scaleX = 0.8;
            _arg1[0].loader.scaleY = 0.8;
            _arg1[0].loader.x = 20;
            _arg1[0].loader.y = 20;
            this._isLoader = true;
        }
        private function clearFateMc():void{
            if (((this._isLoader) && (this._fateIconList[0].parent))){
                this._fateIconList[0].content.stop();
                this._fateIconList[0].parent.removeChild(this._fateIconList[0]);
                this._fateIconList[0];
                this._isLoader = false;
            };
        }

    }
}//package com.assist.view.pack 
