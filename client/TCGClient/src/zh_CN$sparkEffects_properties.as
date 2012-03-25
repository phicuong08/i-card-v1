//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.resources.*;

    public class zh_CN$sparkEffects_properties extends ResourceBundle {

        public function zh_CN$sparkEffects_properties(){
            super("zh_CN", "sparkEffects");
        }
        override protected function getContent():Object{
            var _local1:Object = {
                cannotOperateOn:"AnimateShaderTransition 只能在 IUIComponent 和 GraphicElement 实例上执行。",
                accDecWithinRange:"（加速 + 减速）必须在范围 [0,1] 内。",
                propNotPropOrStyle:"属性 {0} 不是对象 {1} 上的属性或样式: {2}。",
                cannotCalculateValue:"当 startValue ({0}) 或 endValue ({1}) 不是数字时，Interpolator 无法计算内插值。",
                illegalPropValue:"非法属性值: {0}。",
                arraysNotOfEqualLength:"开始数组和结束数组的长度必须相等。",
                endValContainsNonNums:"endValue 数组包含非数字项: 必须为 Animation 提供自定义 Interpolator。",
                startValContainsNonNums:"startValue 数组包含非数字项: 必须为 Animation 提供 Interpolator。"
            };
            return (_local1);
        }

    }
}//package 
