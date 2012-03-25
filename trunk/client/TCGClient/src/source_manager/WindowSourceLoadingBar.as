//Created by Action Script Viewer - http://www.buraks.com/asv
package source_manager {
    import custom_control1.*;

    public class WindowSourceLoadingBar extends CommonLoadingBar {

        protected var currentShowingWindow:WindowSourceLoadingBar;

        public function WindowSourceLoadingBar(){
            if (this.currentShowingWindow){
                this.currentShowingWindow.removeSelf();
            };
            this.currentShowingWindow = this;
        }
        protected function removeSelf():Boolean{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
            if (this.currentShowingWindow == this){
                this.currentShowingWindow = null;
                if (TCGClient.getInstance().customCurrentState == "loadingWindow"){
                    return (true);
                };
            };
            return (false);
        }

    }
}//package source_manager 
