//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {

    public class PetAnimalController extends Base {

        public function get result():int{
            return (_data.pet.result);
        }
        public function get lv():int{
            return (_data.pet.lv);
        }
        public function get hasUpStar():Boolean{
            return ((_data.pet.hasUpStar == 1));
        }
        public function get star():int{
            return (_data.pet.star);
        }
        public function get exp():int{
            return (_data.pet.exp);
        }
        public function get multiple():int{
            return (_data.pet.multiple);
        }
        public function get eatNum():int{
            if (_data.pet.eatNum > 99){
                return (100);
            };
            return (_data.pet.eatNum);
        }
        public function get eatType():int{
            return (_data.pet.eatType);
        }
        public function get expAdd():int{
            return (_data.pet.expAdd);
        }

    }
}//package com.controllers 
