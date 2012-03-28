//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {

    public class InheritController extends Base {

        public function get roleList():Array{
            return (this._data.inherit.roleList);
        }
        public function get roleAttribute():Object{
            return (this._data.inherit.roleAttribute);
        }
        public function get attributeAfterInherit():Array{
            return (this._data.inherit.attributeAfterInherit);
        }
        public function get inherit():Object{
            return (this._data.inherit.roleInherit);
        }

    }
}//package com.controllers 
