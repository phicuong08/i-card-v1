//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.war {

    public class WarType {

        public static const War:String = "War";
        public static const MultiWar:String = "MultiWar";
        public static const SportWar:String = "SportWar";
        public static const PKWar:String = "PKWar";
        public static const DramaWar:String = "DramaWar";
        public static const CampWar:String = "CampWar";
        public static const WorldBossWar:String = "WorldBossWar";
        public static const SuperSportWar:String = "SuperSportWar";
        public static const FactionWar:String = "FactionWar";
        public static const TakeBibleWar:String = "TakeBibleWar";
        public static const MiniFactionWar:String = "MiniFactionWar";
        public static const TowerWar:String = "TowerWar";
        public static const DuJieWar:String = "DuJieWar";
        public static const ServerWar:String = "ServerWar";
        public static const GetPeachWar:String = "GetPeachWar";
        public static const HeroesWar:String = "HeroesWar";
        public static const ZodiacWar:String = "ZodiacWar";

        public static function hasMonster(_arg1:String):Boolean{
            return ((((((((((((((((War == _arg1)) || ((MultiWar == _arg1)))) || ((DramaWar == _arg1)))) || ((WorldBossWar == _arg1)))) || ((TowerWar == _arg1)))) || ((DuJieWar == _arg1)))) || ((GetPeachWar == _arg1)))) || ((ZodiacWar == _arg1))));
        }
        public static function hasStunt(_arg1:String):Boolean{
            return (((((((((((!((CampWar == _arg1))) && (!((HeroesWar == _arg1))))) && (!((FactionWar == _arg1))))) && (!((MultiWar == _arg1))))) && (!((MiniFactionWar == _arg1))))) && (!((WorldBossWar == _arg1)))));
        }
        public static function getMiniSuffix(_arg1:String):String{
            return (((((((MultiWar == _arg1)) || ((FactionWar == _arg1)))) || ((MiniFactionWar == _arg1)))) ? "Mini" : "");
        }
        public static function getSpeed(_arg1:String):int{
            return (((MultiWar == _arg1)) ? 2 : 1);
        }
        public static function hasSportReport(_arg1:String):Boolean{
            return ((((((((((((hasMonster(_arg1) == false)) || ((WorldBossWar == _arg1)))) || ((TowerWar == _arg1)))) || ((DuJieWar == _arg1)))) || ((GetPeachWar == _arg1)))) || ((ZodiacWar == _arg1))));
        }

    }
}//package com.assist.view.war 
