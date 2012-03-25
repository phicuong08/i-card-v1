//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import flash.display.*;
    import flash.events.*;
    import mx.controls.*;
    import file_read.*;

    public class MyImage extends Image {

        public static const IMAGE_LOAD_COMPLETE:String = "image_load_complete";

        public static var defaultImage:Class = MyImage_defaultImage;

        private var imgLoader:MyImageLoader;

        public function MyImage(_arg1:Object=null){
            if (_arg1){
                this.source = _arg1;
            };
            this.smoothBitmapContent = true;
            this.setStyle("horizontalAlign", "center");
            this.setStyle("verticalAlign", "middle");
        }
        public function setLoaderSource(_arg1:BitmapData):void{
            this.source = new Bitmap(_arg1, "auto", true);
            this.imgLoader = null;
        }
        override public function set source(_arg1:Object):void{
            var _local2:Class;
            if (this.imgLoader){
                this.imgLoader.refuseAcceptImageData();
                this.imgLoader = null;
            };
            if ((((_arg1 is String)) && (!(((_arg1 as String).length == 0))))){
                if (!MyImageLoader.imagesData[(_arg1 as String)]){
                    super.source = defaultImage;
                };
                this.imgLoader = new MyImageLoader(this, (_arg1 as String));
            } else {
                if ((_arg1 is Class)){
                    _local2 = Class(_arg1);
                    _arg1 = new (_local2)();
                    (_arg1 as Bitmap).smoothing = true;
                };
                super.source = _arg1;
                dispatchEvent(new Event(IMAGE_LOAD_COMPLETE));
            };
        }

    }
}//package custom_control 
