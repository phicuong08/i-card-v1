//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.lang.client.com.views.*;
    import com.protocols.*;
    
    import flash.display.*;

    public final class PetView extends Base implements IView {

        private var _target:IPetLong;

        public function show():void{
            if (inStage){
                return;
            };
            this.pet_animal_info();
        }
        public function close():void{
            _popup.closeView(this);
        }
        public function clear():void{
        }
        private function loadComplete():void{
            if (this._target == null){
                this._target = (_view.getAssetsObject("Pet", "MCPetLong") as IPetLong);
                this._target.onClose = this.close;
                this._target.onCoin = this.onCoin;
                this._target.onIngot = this.onIngot;
                this._target.onUpLv = this.onUpLv;
                this._target.onTip = this.onTip;
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
            };
            this._target.playerVip = _ctrl.player.vipLevel;
            if (inStage == false){
                _popup.addView(this, this._target.content);
            };
            _view.screen.currentMap.updatePetLv(_ctrl.pet.lv);
            this.updatePet();
        }
        private function onUpLv():void{
            this.up_pet_animal();
        }
        private function onCoin():void{
            this.feed_pet_animal(0);
        }
        private function onIngot():void{
            this.feed_pet_animal(1);
        }
        private function onTip(_arg1:DisplayObject, _arg2:Object=null):void{
            if ((((_arg2 == null)) || ((_arg2 == "")))){
                _view.tip.iTip.removeTarget(_arg1);
            } else {
                _view.tip.iTip.addTarget(_arg1, _arg2);
            };
        }
        private function updatePet(_arg1:Boolean=false, _arg2:Boolean=false):void{
            this._target.updatePet(_ctrl.player.level, _ctrl.pet.lv, _ctrl.pet.star, _ctrl.pet.exp, _ctrl.pet.expAdd, _ctrl.pet.eatNum, _ctrl.pet.multiple, _arg1, _ctrl.pet.hasUpStar, _arg2);
            if (_arg2){
                _view.screen.currentMap.updatePetLv(_ctrl.pet.lv);
            };
        }
        private function pet_animal_info():void{
            _data.call(Mod_PetAnimal_Base.pet_animal_info, this.pet_animal_info_back, []);
        }
        private function pet_animal_info_back():void{
            loadAssets("Pet", null, PetViewLang.Loading, false, false, this.loadComplete);
        }
        private function feed_pet_animal(_arg1:int):void{
            if (_ctrl.pet.eatNum == 0){
                _view.showTip(PetViewLang.EatNumOver);
                return;
            };
            _data.call(Mod_PetAnimal_Base.feed_pet_animal, this.feed_pet_animal_back, [_arg1]);
        }
        private function feed_pet_animal_back():void{
            if (_ctrl.pet.result == Mod_PetAnimal_Base.SUCCESS){
                this.updatePet(true);
            } else {
                if (_ctrl.pet.result == Mod_PetAnimal_Base.NOENOUGH_INGOT){
                    _view.showTip(PetViewLang.IngotNoenough);
                } else {
                    if (_ctrl.pet.result == Mod_PetAnimal_Base.NOENOUGH_COIN){
                        _view.showTip(PetViewLang.CoinNoenough);
                    } else {
                        _view.showTip(PetViewLang.EatError);
                    };
                };
            };
        }
        private function up_pet_animal():void{
            _data.call(Mod_PetAnimal_Base.up_pet_animal, this.up_pet_animal_back, []);
        }
        private function up_pet_animal_back():void{
            this.updatePet(false, true);
        }

    }
}//package com.views 
