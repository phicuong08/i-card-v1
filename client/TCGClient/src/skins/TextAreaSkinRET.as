//Created by Action Script Viewer - http://www.buraks.com/asv
package skins {
    import spark.components.*;
    import spark.core.*;

    public class TextAreaSkinRET extends RichEditableText {

        override public function getVerticalScrollPositionDelta(_arg1:uint):Number{
            switch (_arg1){
                case NavigationUnit.UP:
                    return (-(Math.abs(super.getVerticalScrollPositionDelta(_arg1))));
                case NavigationUnit.DOWN:
                    return (Math.abs(super.getVerticalScrollPositionDelta(_arg1)));
                default:
                    return (super.getVerticalScrollPositionDelta(_arg1));
            };
        }

    }
}//package skins 
