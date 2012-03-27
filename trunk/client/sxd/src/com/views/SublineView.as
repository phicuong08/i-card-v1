//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;

    public class SublineView extends Base implements IView {

        private var _subline:ISubline;

        public function show():void{
            loadAssets("Subline", this.render, "加载分线");
        }
        public function render():void{
            this._subline = (_view.getAssetsObject("Subline", "Subline") as ISubline);
            _popup.addView(this, this._subline.content);
            this.fillData();
            this._subline.onClose = function ():void{
                close();
            };
            this._subline.onSendLine = function (_arg1:int):void{
            };
            _view.center(sign, this._subline.content);
        }
        public function clear():void{
            this._subline.clear();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        private function fillData():void{
            var _local1:Object = {
                name:"服务器1",
                id:1,
                state:1
            };
            var _local2:Object = {
                name:"服务器2",
                id:2,
                state:2
            };
            var _local3:Object = {
                name:"服务器3",
                id:3,
                state:1
            };
            var _local4:Object = {
                name:"服务器4",
                id:4,
                state:2
            };
            var _local5:Object = {
                name:"服务器5",
                id:5,
                state:1
            };
            var _local6:Object = {
                name:"服务器6",
                id:6,
                state:2
            };
            var _local7:Object = {
                name:"服务器7",
                id:7,
                state:1
            };
            var _local8:Object = {
                name:"服务器8",
                id:8,
                state:2
            };
            var _local9:Array = [_local1];
            this._subline.receive(_local9, 1);
        }

    }
}//package com.views 
