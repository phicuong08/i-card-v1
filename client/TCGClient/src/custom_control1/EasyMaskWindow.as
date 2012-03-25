//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;

    public class EasyMaskWindow extends UIComponent {

        override public function set width(_arg1:Number):void{
            super.width = _arg1;
            this.drawMask();
        }
        override public function set height(_arg1:Number):void{
            super.height = _arg1;
            this.drawMask();
        }
        protected function drawMask():void{
            if (((width) && (height))){
                this.graphics.clear();
                this.graphics.beginFill(0, 0);
                this.graphics.drawRect(0, 0, width, height);
                this.graphics.endFill();
            };
        }

    }
}//package custom_control 
