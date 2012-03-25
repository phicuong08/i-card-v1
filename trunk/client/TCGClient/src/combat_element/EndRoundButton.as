//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element{
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import flash.events.*;
    import spark.components.*;
    import flash.filters.*;
    import source_manager.*;
    import combat_element_script.*;
    import skins.*;
    import tool.*;

    public class EndRoundButton extends Button {

        private static var _skinParts_:Object = {labelDisplay:false};

        public function EndRoundButton(){
            depth = CombatStageDepthInfo.DEPTH_OF_BATTLE_END_ROUND_BUTTON;
            setStyle("skinClass", crossFadeImageButtonSkin);
            setStyle("buttonDisableGradient", true);
            if (CombatStageSourceMgr.getInstance().loadingComplete){
                this.setImage(null);
            } else {
                CombatStageSourceMgr.getInstance().addEventListener(Event.COMPLETE, this.setImage);
            };
            addEventListener(FlexEvent.ADD, this.setHitArea);
        }
        protected function setImage(_arg1:Event):void{
            CombatStageSourceMgr.getInstance().removeEventListener(Event.COMPLETE, this.setImage);
            var _local2:ColorMatrixFilter = new ColorMatrixFilter();
            var _local3:Class = CombatStageSourceMgr.getInstance().getSourceClass("roundEnd");
            var _local4:BitmapData = (new (_local3)() as Bitmap).bitmapData;
            setStyle("upBitmapdata", _local4);
            var _local5:BitmapData = new BitmapData(_local4.width, _local4.height, true, 0);
            _local2.matrix = ColorUtil.getColorMatrixByBrightness(0.4);
            _local5.applyFilter(_local4, new Rectangle(0, 0, _local4.width, _local4.height), new Point(), _local2);
            setStyle("overBitmapdata", _local5);
            var _local6:BitmapData = new BitmapData(_local4.width, _local4.height, true, 0);
            _local2.matrix = ColorUtil.getColorMatrixByBrightness(0.2);
            _local6.applyFilter(_local4, new Rectangle(0, 0, _local4.width, _local4.height), new Point(), _local2);
            setStyle("downBitmapdata", _local6);
        }
        protected function setHitArea(_arg1:FlexEvent):void{
            removeEventListener(FlexEvent.ADD, this.setHitArea);
            var _local2:UIComponent = new UIComponent();
            (parent as IVisualElementContainer).addElement(_local2);
            _local2.transform.matrix = this.transform.matrix.clone();
            _local2.mouseEnabled = false;
            _local2.visible = false;
            _local2.graphics.beginFill(0);
            _local2.graphics.drawRect(73, 173, 70, 81);
            _local2.graphics.drawRect(63, 254, 81, 35);
            _local2.graphics.beginFill(1);
            _local2.graphics.drawEllipse(69, 283, 116, 69);
            _local2.graphics.endFill();
            this.hitArea = _local2;
        }
        override public function set enabled(_arg1:Boolean):void{
            if (_arg1 == enabled){
                return;
            };
            super.enabled = _arg1;
        }
//        override protected function get skinParts():Object{
//            return (_skinParts_);
//        }

    }
}//package combat_element 
