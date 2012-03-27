//Created by Action Script Viewer - http://www.buraks.com/asv
package com.protocols {
    import com.*;

    public class Mod_PetAnimal {

        public static function register(_arg1:Data):void{
            _arg1.registerDataCallback(Mod_PetAnimal_Base.pet_animal_info, _arg1.pet.pet_animal_info);
            _arg1.registerDataCallback(Mod_PetAnimal_Base.change_name, _arg1.pet.change_name);
            _arg1.registerDataCallback(Mod_PetAnimal_Base.feed_pet_animal, _arg1.pet.feed_pet_animal);
            _arg1.registerDataCallback(Mod_PetAnimal_Base.up_pet_animal, _arg1.pet.up_pet_animal);
        }

    }
}//package com.protocols 
