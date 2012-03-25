//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import mx.binding.*;
    import spark.primitives.*;
    import mx.graphics.*;

    public class GrayLine extends Rect {

        public function GrayLine(){
            this.fill = this._GrayLine_LinearGradient1_c();
        }
        private function _GrayLine_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._GrayLine_GradientEntry1_c(), this._GrayLine_GradientEntry2_c(), this._GrayLine_GradientEntry3_c(), this._GrayLine_GradientEntry4_c(), this._GrayLine_GradientEntry5_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GrayLine_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 12434082;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GrayLine_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 12434082;
            _local1.alpha = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GrayLine_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 12434082;
            _local1.alpha = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GrayLine_GradientEntry4_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 12434082;
            _local1.alpha = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GrayLine_GradientEntry5_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 12434082;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }

    }
}//package ui_element 
