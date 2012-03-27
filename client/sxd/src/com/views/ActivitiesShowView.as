//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.haloer.net.*;
    import flash.geom.*;
    import com.assist.view.interfaces.*;
    import com.assist.server.*;

    public class ActivitiesShowView extends Base implements IView {

        private var _activitisList:Array;
        private var _activitisObj:Object;
        private var _activitisDataList:Array;

        public function ActivitiesShowView(){
            this._activitisObj = {hasData:false};
            super();
            this._activitisList = new Array();
            this._activitisDataList = new Array();
        }
        public function show():void{
            var _local1:Array = [_view.getAssetsUrl("ActivitiesShow")];
            File.loadList(_local1, this.render);
        }
        private function render(_arg1:Array):void{
            var _local2:Object;
            var _local3:Array;
            var _local4:int;
            var _local5:IActivitiesShow;
            var _local6:String;
            var _local7:int;
            var _local8:Object;
            var _local9:IActivitiesShow;
            var _local10:Point;
            var _local11:Point;
            if (!this._activitisObj.bHasData){
                this._activitisObj.bHasData = true;
                _local3 = ActivityType.ActivitysList;
                _local4 = 0;
                while (_local4 < _local3.length) {
                    _local5 = ((_arg1[0] as File).getClassObject("ActivitiesShow") as IActivitiesShow);
                    _local6 = _local3[_local4];
                    _local5.onStartActivity = this.onStartActivity;
                    if (ActivityType.ActivityAward == _local6){
                        _local5.notCloseViewList = [ISealStone, IAlert];
                    };
                    _popup.addView(this, _local5.content);
                    this._activitisObj[_local6] = _local5;
                    _local7 = 0;
                    while (_local7 < this._activitisDataList.length) {
                        if (this._activitisDataList[_local7].type == _local6){
                            _local2 = this._activitisDataList[_local7];
                            this._activitisDataList.splice(_local7, 1);
                            if (_local2.bAdd){
                                _local5.addActivity(_local2);
                            } else {
                                _local5.removeActivity(_local2);
                            };
                            _local7--;
                        };
                        _local7++;
                    };
                    _local4++;
                };
            };
            while (this._activitisList.length > 0) {
                _local8 = this._activitisList.pop();
                _local9 = this._activitisObj[_local8.type];
                _local10 = Structure.stageOffset;
                _local11 = new Point();
                _local11.x = (_local8.point.x - _local10.x);
                _local11.y = (_local8.point.y - _local10.y);
                _local9.openPanel(_local11);
                this._activitisObj[(_local8.type + "P")] = _local8.point;
                _view.toolbar.content.addChildAt(_local9.content, 0);
            };
        }
        public function close():void{
        }
        public function clear():void{
        }
        public function openFunctionPanel(_arg1:Point, _arg2:String):void{
            var _local5:IActivitiesShow;
            var _local3:Object = {};
            _local3.type = _arg2;
            _local3.point = _arg1;
            var _local4:int;
            while (_local4 < this._activitisList.length) {
                if (this._activitisList[_local4].type == _arg2){
                    this._activitisList.splice(_local4, 1);
                    return;
                };
                _local4++;
            };
            if (this._activitisObj.bHasData){
                _local5 = this._activitisObj[_arg2];
                if (_local5.isOnStage){
                    return;
                };
            };
            this._activitisList.push(_local3);
        }
        public function addActivity(_arg1:String, _arg2:Boolean=true):void{
            var _local4:IActivitiesShow;
            var _local5:int;
            var _local6:Object;
            var _local7:Object;
            var _local3:Object = ActivityType.getActivityDataForSign(_arg1);
            _local3.bAdd = _arg2;
            if (this._activitisObj.bHasData){
                _local4 = this._activitisObj[_local3.type];
                if (_arg2){
                    _local4.addActivity(_local3);
                } else {
                    _local4.removeActivity(_local3);
                };
                this.addParentButton(!(_local4.isEmpty), _local3.type);
            } else {
                if (_arg2){
                    this._activitisDataList.push(_local3);
                    this.addParentButton(true, _local3.type);
                    return;
                };
                _local5 = 0;
                while (_local5 < this._activitisDataList.length) {
                    _local6 = this._activitisDataList[_local5];
                    if (_local6.sign == _arg1){
                        this._activitisDataList.splice(_local5, 1);
                        _local5--;
                    };
                    _local5++;
                };
                _local5 = 0;
                while (_local5 < this._activitisDataList.length) {
                    _local7 = this._activitisDataList[_local5];
                    if (_local7.type == _local3.type){
                        this.addParentButton(true, _local3.type);
                        return;
                    };
                    _local5++;
                };
                this.addParentButton(false, _local3.type);
            };
        }
        private function onStartActivity(_arg1:Object):void{
            _view.activities.onStartActivity(_arg1);
        }
        public function removeChildren():void{
            var _local1:Array;
            var _local2:int;
            var _local3:String;
            var _local4:IActivitiesShow;
            if (this._activitisObj.bHasData){
                _local1 = ActivityType.ActivitysList;
                _local2 = 0;
                while (_local2 < _local1.length) {
                    _local3 = _local1[_local2];
                    _local4 = this._activitisObj[_local3];
                    _local4.closePanel();
                    _local2++;
                };
            };
        }
        public function addParentButton(_arg1:Boolean, _arg2:String):void{
            if (_arg1){
                _view.activities.addActivity(_arg2);
            } else {
                _view.activities.removeActivity(_arg2);
            };
            if (_arg2 == ActivityType.ActivityAward){
                _view.activities.visibleBtnEffect(_arg2, "", _arg1);
            };
        }
        public function reposition():void{
            var _local1:Array;
            var _local2:int;
            var _local3:String;
            var _local4:IActivitiesShow;
            var _local5:Point;
            var _local6:Point;
            var _local7:Point;
            if (this._activitisObj.bHasData){
                _local1 = ActivityType.ActivitysList;
                _local2 = 0;
                while (_local2 < _local1.length) {
                    _local3 = _local1[_local2];
                    _local4 = this._activitisObj[_local3];
                    _local5 = Structure.stageOffset;
                    _local6 = _view.activities.getActivityPoint(_local3);
                    _local7 = new Point();
                    _local7.x = (_local6.x - _local5.x);
                    _local7.y = (_local6.y - _local5.y);
                    _local4.updatePoint = _local7;
                    _local2++;
                };
            };
        }

    }
}//package com.views 
