//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import mx.core.*;

    public class BackGroundFrameUIComponentWindow extends UIComponent {

        public function BackGroundFrameUIComponentWindow(){
            addChild(new BackGroudFrameWindow());
            depth = 6;
        }
    }
}//package ui_element 
