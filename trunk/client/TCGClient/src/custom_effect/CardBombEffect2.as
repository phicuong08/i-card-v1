//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {

    public class CardBombEffect2 extends CardBombEffect {

        public function CardBombEffect2(_arg1, _arg2:Number, _arg3:Number){
            super(_arg1, _arg2, _arg3, 0, 0);
            bombFrame = 20;
            retractFrame = 0;
            totalFrame = (bombFrame + retractFrame);
        }
        override protected function changeAlpha(_arg1:int, _arg2:int):void{
            effectContainer.alpha = easeOut(_arg1, _arg2);
        }

    }
}//package custom_effect 
