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
    import item_system.*;
    import skins.*;
    import tool.*;

    public class BattleButton extends Button {

        private static var _skinParts_:Object = {labelDisplay:false};

        private var hitAreaControl:UIComponent;

        public function BattleButton(){
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
            var _local3:Class = CombatStageSourceMgr.getInstance().getSourceClass("battle");
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
            this.hitAreaControl = new UIComponent();
            (parent as IVisualElementContainer).addElement(this.hitAreaControl);
            this.hitAreaControl.transform.matrix = this.transform.matrix.clone();
            this.hitAreaControl.mouseEnabled = false;
            this.hitAreaControl.graphics.beginFill(0, 0);
            this.hitAreaControl.graphics.drawRect(96, 164, 71, 87);
            this.hitAreaControl.graphics.drawRect(96, 251, 82, 32);
            this.hitAreaControl.graphics.beginFill(1, 0);
            this.hitAreaControl.graphics.drawEllipse(48, 275, 121, 81);
            this.hitAreaControl.graphics.endFill();
            this.hitArea = this.hitAreaControl;
            this.hitAreaControl.addEventListener(MouseEvent.ROLL_OVER, this.rollOverButtonHandler);
        }
        private function rollOverButtonHandler(_arg1:MouseEvent):void{
            this.hitAreaControl.toolTip = null;
            var _local2:Array = LuaAgent.getInstance().run("return d:check_operation('', 'begin_attack');");
            if (_local2.length > 2){
                switch (_local2[2]){
                    case "not in own round":
                    case "wrong player":
                        this.hitAreaControl.toolTip = "#r不能在对方的回合擂鼓#n";
                        break;
                    case "effect":
                    case "disable attack":
                        if (_local2.length > 3){
                            this.hitAreaControl.toolTip = (("#r因为【" + ItemCardLib.getItemInfoById(_local2[3])["name"]) + "】而不能擂鼓#n");
                        } else {
                            this.hitAreaControl.toolTip = "#r因为卡片效果而不能擂鼓#n";
                        };
                        break;
                    case "round one":
                        this.hitAreaControl.toolTip = "#r首回合不能擂鼓#n";
                        break;
                    case "battle flag":
                        this.hitAreaControl.toolTip = "#r一回合只能擂鼓一次#n";
                        break;
                    case "no monster":
                        this.hitAreaControl.toolTip = "#r场上不存在武将#n";
                        break;
                };
            };
        }
        override public function set enabled(_arg1:Boolean):void{
            if (_arg1 == enabled){
                return;
            };
            super.enabled = _arg1;
            if (this.hitAreaControl){
                this.hitAreaControl.mouseEnabled = !(_arg1);
            };
        }
//        override protected function get skinParts():Object{
//            return (_skinParts_);
//        }

    }
}//package combat_element 
