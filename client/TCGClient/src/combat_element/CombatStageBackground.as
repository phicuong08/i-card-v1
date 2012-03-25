//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import custom_control1.*;

    public class CombatStageBackground extends SmoothBitmapImage {

        private static var defaultBgImg:Object;

        public function CombatStageBackground(){
            if (defaultBgImg){
                source = defaultBgImg;
            };
        }
        public function setDefaultBgImg(_arg1:Object):void{
            defaultBgImg = _arg1;
            if (!source){
                source = _arg1;
            };
        }

    }
}//package combat_element 
