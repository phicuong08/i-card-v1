//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import mx.core.*;

    public class FoldEffectItem {

        public var source:UIComponent;
        private var speedArg:Number;
        public var hasComplete:Boolean = false;
        public var isFolding:Boolean = false;
        private var rotationKey:String;
        public var i:int;
        public var j:int;

        public function FoldEffectItem(_arg1:UIComponent, _arg2:Number, _arg3:int, _arg4:int){
            this.source = _arg1;
            this.speedArg = _arg2;
            this.i = _arg3;
            this.j = _arg4;
        }
        public function restore():void{
            this.source.rotationX = 0;
            this.source.rotationY = 0;
            this.hasComplete = false;
            this.isFolding = false;
            this.speedArg = Math.abs(this.speedArg);
        }
        public function update():void{
            this.source[this.rotationKey] = (this.source[this.rotationKey] + this.speedArg);
            if (Math.abs(this.source[this.rotationKey]) < Math.abs(this.speedArg)){
                this.hasComplete = true;
                this.isFolding = false;
                this.source[this.rotationKey] = 0;
                this.source.depth = 0;
            };
        }
        public function startRotation(_arg1:String):void{
            this.isFolding = true;
            this.source.visible = true;
            this.source.depth = -1;
            switch (_arg1){
                case "up":
                    this.rotationKey = "rotationX";
                    this.source.rotationX = -90;
                    break;
                case "down":
                    this.source.transformY = this.source.height;
                    this.rotationKey = "rotationX";
                    this.source.rotationX = 90;
                    this.speedArg = -(this.speedArg);
                    break;
                case "left":
                    this.rotationKey = "rotationY";
                    this.source.rotationY = -90;
                    break;
                case "right":
                    this.source.transformX = this.source.width;
                    this.rotationKey = "rotationY";
                    this.source.rotationY = 90;
                    this.speedArg = -(this.speedArg);
                    break;
            };
        }

    }
}//package custom_effect 
