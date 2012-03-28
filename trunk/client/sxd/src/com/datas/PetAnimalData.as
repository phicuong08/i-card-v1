//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.protocols.*;

    public class PetAnimalData extends Base {

        public var lv:int = 0;
        public var star:int = 0;
        public var exp:int = 0;
        public var expAdd:int = 0;
        public var result:int = 0;
        public var multiple:int = 1;
        public var eatNum:int = 0;
        public var eatType:int = 0;
        public var hasUpStar:int = 0;

        public function pet_animal_info(_arg1:Array):void{
            this.lv = _arg1[1];
            this.star = _arg1[2];
            this.exp = _arg1[3];
            this.eatNum = _arg1[4];
            this.hasUpStar = 0;
        }
        public function feed_pet_animal(_arg1:Array):void{
            this.result = _arg1[0];
            this.hasUpStar = 0;
            if (this.result == Mod_PetAnimal_Base.SUCCESS){
                if (((!((this.star == _arg1[2]))) || (!((this.lv == _arg1[1]))))){
                    this.hasUpStar = 1;
                };
                this.lv = _arg1[1];
                this.star = _arg1[2];
                this.exp = _arg1[3];
                this.expAdd = _arg1[4];
                this.eatType = _arg1[5];
                this.eatNum = _arg1[6];
                this.multiple = _arg1[7];
            };
        }
        public function change_name(_arg1:Array):void{
            this.result = _arg1[0];
        }
        public function up_pet_animal(_arg1:Array):void{
            this.lv = _arg1[0];
            this.star = _arg1[1];
            this.exp = _arg1[2];
            this.hasUpStar = 1;
        }

    }
}//package com.datas 
