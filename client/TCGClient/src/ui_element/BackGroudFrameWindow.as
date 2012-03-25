//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import flash.display.*;

    public class BackGroudFrameWindow extends Sprite {

        private var img1:Class;
        private var img2:Class;

        public function BackGroudFrameWindow(){
            this.img1 = BackGroudFrameWindow_img1;
            this.img2 = BackGroudFrameWindow_img2;
            super();
            mouseChildren = false;
            mouseEnabled = false;
            this.drawImage();
        }
        private function drawImage():void{
            var _local1:Bitmap = new this.img1();
            _local1.x = -41;
            _local1.y = -40;
            addChild(_local1);
            _local1 = new this.img1();
            _local1.rotationY = 180;
            _local1.x = 1319;
            _local1.y = -41;
            addChild(_local1);
            _local1 = new this.img1();
            _local1.rotationX = 180;
            _local1.x = -41;
            _local1.y = 840;
            addChild(_local1);
            _local1 = new this.img1();
            _local1.rotationZ = 180;
            _local1.x = 1319;
            _local1.y = 840;
            addChild(_local1);
            _local1 = new this.img2();
            _local1.x = -41;
            addChild(_local1);
            _local1 = new this.img2();
            _local1.rotationX = 180;
            _local1.x = -42;
            _local1.y = 799;
            addChild(_local1);
            _local1 = new this.img2();
            _local1.rotationY = 180;
            _local1.x = 1321;
            addChild(_local1);
            _local1 = new this.img2();
            _local1.rotationZ = 180;
            _local1.x = 1321;
            _local1.y = 800;
            addChild(_local1);
        }

    }
}//package ui_element 
