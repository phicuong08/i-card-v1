//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.haloer.net.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.lang.client.com.views.*;

    public class ChooseRolesView extends Base implements IView {

        private var _cr:IChooseRoles;

        public function show():void{
            var _local1:LoadResponder;
            if (_view.hasResource("ChooseRoles")){
                this.render();
            } else {
                _local1 = new LoadResponder(this.render);
                _view.loadResources(["ChooseRoles"], _local1);
            };
        }
        public function render():void{
            this._cr = (_view.getAssetsObject("ChooseRoles", "ChooseRoles") as IChooseRoles);
            _popup.addChild(this._cr.content);
            this._cr.chooseRolesUrl = URI.chooseRolesUrl;
            this._cr.tip = _view.tip.iTip;
            this._cr.onStart = this.start;
            this._cr.weiBoNickName = URI.weiBoNickName;
            this._cr.weiBoGender = URI.weiBoGender;
            this._cr.init(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight);
        }
        private function start(_arg1:String, _arg2:int):void{
            var name:* = _arg1;
            var roleId:* = _arg2;
            var callback:* = function ():void{
                getPlayerFirstInitCallback(name);
            };
            _data.call(Mod_Player_Base.player_first_init, callback, [roleId, (name + URI.nickNameSuffix())]);
            Helper.backtrace("Mod_Player_Base.player_first_init, 1");
        }
        private function getPlayerFirstInitCallback(_arg1:String):void{
            var str:* = null;
            var http:* = null;
            var name:* = _arg1;
            Helper.backtrace("Mod_Player_Base.player_first_init, 0");
            switch (_ctrl.player.createdRole){
                case Mod_Player_Base.SUCCEED:
                    this.close();
                    _view.initLoading.loadToolbar();
                    if (URI.isBaidu){
                        str = "role_rest_baidu.php";
                    } else {
                        if (URI.isSogou){
                            str = "role_rest_sogou.php";
                        } else {
                            if (URI.isPlatformB){
                                str = "role_rest_skycn.php";
                            };
                        };
                    };
                    if (str){
                        http = new HTTP();
                        http.data = {
                            action:"CREATE",
                            user:URI.playerName,
                            nickname:name
                        };
                        http.onComplete = function (_arg1:Object):void{
                        };
                        http.onError = function ():void{
                        };
                        http.load(((("http://" + URI.serverName) + "/") + str));
                    };
                    break;
                case Mod_Player_Base.DUPLICATED_NICKNAME:
                    this._cr.error = ChooseRolesViewLang.DuplicatedNickName;
                    break;
                case Mod_Player_Base.FORBIDDEN_NICKNAME:
                    this._cr.error = ChooseRolesViewLang.ForbiddenNickName;
                    break;
            };
        }
        public function clear():void{
            this._cr.clear();
            _view.removeResource("ChooseRoles");
        }
        public function close():void{
            this.clear();
            _popup.removeChild(this._cr.content);
        }

    }
}//package com.views 
