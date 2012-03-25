//Created by Action Script Viewer - http://www.buraks.com/asv
package org.gonta.filters {
    import flash.display.*;
    import spark.filters.*;

    public dynamic class WetFloorFilter extends ShaderFilter {

        public static const SHADER:Class = WetFloorFilter_SHADER;

        private var _filter:ShaderFilter;

        public function WetFloorFilter(_arg1:Shader=null){
            _arg1 = ((_arg1) || (new Shader(new SHADER())));
            super(_arg1);
            this.bottomExtension = 40;
        }
        protected function get filter():ShaderFilter{
            if (!this._filter){
                this._filter = new ShaderFilter(this.shader);
            };
            return (this._filter);
        }
        public function get y():Number{
            return (this.imageHeight);
        }
        public function set y(_arg1:Number):void{
            this.imageHeight = _arg1;
        }
        public function get height():Number{
            return (this.reflectionHeight);
        }
        public function set height(_arg1:Number):void{
            this.bottomExtension = _arg1;
            this.reflectionHeight = _arg1;
        }
        public function get alpha():Number{
            return (this.reflectionAlpha);
        }
        public function set alpha(_arg1:Number):void{
            this.reflectionAlpha = _arg1;
        }

    }
}//package org.gonta.filters 
