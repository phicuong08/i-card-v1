//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element{
    import spark.components.*;
    import skins.*;

    public class DataGridTitleButton extends Button {

        private static var _skinParts_:Object = {labelDisplay:false};

        public function DataGridTitleButton(){
            this.setSkin();
        }
        protected function setSkin():void{
            setStyle("skinClass", dataGridTitleButtonSkin);
        }
//        override protected function get skinParts():Object{
//            return (_skinParts_);
//        }

    }
}//package ui_element 
