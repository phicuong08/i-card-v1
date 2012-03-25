//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;
    import flash.utils.*;

    public class CommonLoadingBar_cls extends MovieClipLoaderAsset {

        private static var bytes:ByteArray = null;

        public var dataClass:Class;

        public function CommonLoadingBar_cls(){
            this.dataClass = CommonLoadingBar_cls_dataClass;
            super();
            initialWidth = (11000 / 20);
            initialHeight = (8000 / 20);
        }
        override public function get movieClipData():ByteArray{
            if (bytes == null){
                bytes = ByteArray(new this.dataClass());
            };
            return (bytes);
        }

    }
}//package custom_control 
