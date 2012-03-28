//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class DeployType {

        private static const Deploys:Object = {
            1:"天阵",
            2:"地阵",
            3:"水阵",
            4:"火阵",
            5:"风阵",
            6:"雷阵",
            7:"山阵",
            8:"泽阵",
            20:"全开阵"
        };

        public static function getDeployName(_arg1:int):String{
            return (((Deploys[_arg1]) || ("")));
        }

    }
}//package com.assist.server 
