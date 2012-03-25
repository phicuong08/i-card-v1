//Created by Action Script Viewer - http://www.buraks.com/asv
package card_smelt {
    import custom_control1.*;

    public class SmeltsGroup extends FakeListGroup {

        private var addSmeltWindow:AddSmeltWindow;

        public function SmeltsGroup(){
            this.addSmeltWindow = new AddSmeltWindow();
            super();
        }
        override public function get itemsArray():Array{
            var _local1:Array;
            _local1 = new Array();
            this.addSmeltWindow.y = (_itemsArray.length * itemHeight);
            return (_local1.concat(_itemsArray, this.addSmeltWindow));
        }

    }
}//package card_smelt 
