//Created by Action Script Viewer - http://www.buraks.com/asv
package task {
    import flash.events.*;
    import normal_window.*;
    import flash.utils.*;
    import combat_element_script.*;

    public class TaskScenario120 {

        private var scenarioInfo:Array;
        private var talkWindow:TaskScenarioTalkWindow;
        private var followTask:Array;
        private var isPlaying:Boolean = false;

        public function TaskScenario120(_arg1:Array){
            this.followTask = _arg1;
            if ((((TCGClient.getInstance().customCurrentState == "guideMapWindow")) || ((TCGClient.getInstance().customCurrentState == "mainMenu")))){
                TCGClient.getInstance().callLater(this.startScenario);
            };
            TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.stateChangeHandler);
        }
        private function stateChangeHandler(_arg1:CustomStateChangeEvent):void{
            if ((((_arg1.newState == "guideMapWindow")) || ((_arg1.newState == "mainMenu")))){
                TCGClient.getInstance().callLater(this.startScenario);
            } else {
                TCGClient.getInstance().callLater(this.finishScenario);
            };
        }
        private function startScenario():void{
            var t:* = null;
            var timerHandler:* = null;
            timerHandler = function (_arg1:TimerEvent):void{
                t.removeEventListener(TimerEvent.TIMER, timerHandler);
                t.stop();
                showScenarioTalkWindow();
            };
            if (this.isPlaying){
                return;
            };
            this.isPlaying = true;
            this.talkWindow = new TaskScenarioTalkWindow();
            this.talkWindow.addEventListener("finishTask", this.showScenarioTalkWindow);
            TCGClient.getInstance().mainGroup.addElement(this.talkWindow);
            this.scenarioInfo = this.getScenarioInfoByUserCamp(UserObject.camp);
            t = new Timer(100, 1);
            t.addEventListener(TimerEvent.TIMER, timerHandler);
            t.start();
        }
        private function showScenarioTalkWindow(_arg1=null):void{
            if (this.scenarioInfo.length == 0){
                this.finishScenario();
            } else {
                if (this.talkWindow){
                    this.talkWindow.setInfo(this.scenarioInfo.shift());
                    this.talkWindow.fadeInEffect.play();
                };
            };
        }
        private function finishScenario():void{
            TCGClient.getInstance().removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.stateChangeHandler);
            if (TCGClient.getInstance().customCurrentState != "loginWindow"){
                TaskMgr.getInstance().addNewTask(this.followTask);
            };
            if (this.talkWindow){
                this.talkWindow.removeSelf();
                this.talkWindow.removeEventListener("finishTask", this.showScenarioTalkWindow);
                this.talkWindow = null;
            };
        }
        private function getScenarioInfoByUserCamp(_arg1:String):Array{
            switch (_arg1){
                case "曹操":
                    return (this.getCaocaoScenario());
                case "刘备":
                    return (this.getLiubeiScenario());
                default:
                    return (this.getSunquanScenario());
            };
        }
        private function getCaocaoScenario():Array{
            var _local1 = (("source/userHead/" + UserObject.headIcon) + ".jpg");
            var _local2:String = UserObject.name;
            var _local3 = "source/cardImages/315.jpg";
            var _local4:Array = new Array();
            _local4.push({
                headPath:_local3,
                headName:"荀彧",
                content:"此役之后，黄巾贼实力锐减。但华夏之内，各路诸侯拥兵备战，战火一触即发。"
            });
            _local4.push({
                headPath:_local1,
                headName:_local2,
                content:"那我们应该怎么办呢？"
            });
            _local4.push({
                headPath:_local3,
                headName:"荀彧",
                content:"应当趁机招兵买马，增强战力。先求割据一方，再图问鼎天下……"
            });
            _local4.push({
                headPath:_local1,
                headName:_local2,
                content:"招兵买马？好，赶紧去做！"
            });
            _local4.push({
                headPath:_local3,
                headName:"荀彧",
                content:"别忙，凡事要寻求最有效的方法。"
            });
            _local4.push({
                headPath:_local1,
                headName:_local2,
                content:"最有效的方法？"
            });
            _local4.push({
                headPath:_local3,
                headName:"荀彧",
                content:"没错。要扩充实力，关键是要找到最优秀的人才。所谓千军易得，一将难求。"
            });
            _local4.push({
                headPath:_local1,
                headName:_local2,
                content:"哦，明白！可是良将要去哪里找呢？"
            });
            _local4.push({
                headPath:_local3,
                headName:"荀彧",
                content:"在下听闻在陈留己吾县有一人力大无穷、一手可举千斤，而且性格任侠、极重义气。此人正是我军需要的杀敌擒将之才！"
            });
            _local4.push({
                headPath:_local1,
                headName:_local2,
                content:"哈哈，原来就在陈留，我们今日就去拜访！"
            });
            _local4.push({
                headPath:_local3,
                headName:"荀彧",
                content:"另有一人，既勇猛善战又儒雅博学，此人是军中难得的智将。此人现居山阳钜野，距陈留不过二百里。"
            });
            _local4.push({
                headPath:_local1,
                headName:_local2,
                content:"好，立即派人送去书信！"
            });
            return (_local4);
        }
        private function getLiubeiScenario():Array{
            var _local1 = (("source/userHead/" + UserObject.headIcon) + ".jpg");
            var _local2:String = UserObject.name;
            var _local3:Array = new Array();
            _local3.push({
                headPath:"source/cardImages/44.jpg",
                headName:"简雍",
                content:"此役之后，黄巾贼实力锐减。但华夏之内，各路诸侯拥兵备战，战火一触即发。"
            });
            _local3.push({
                headPath:_local1,
                headName:_local2,
                content:"那我们应该怎么办呢？"
            });
            _local3.push({
                headPath:"source/cardImages/44.jpg",
                headName:"简雍",
                content:"应当趁机厉兵秣马，增强战力。先求割据一方，再图问鼎天下……"
            });
            _local3.push({
                headPath:_local1,
                headName:_local2,
                content:"要如何才能增强战力呢？"
            });
            _local3.push({
                headPath:"source/cardImages/44.jpg",
                headName:"简雍",
                content:"就目前来看，最实际的做法，莫过于为关羽、张飞二位将军打造趁手的兵器。此二人都是独当一面的大将，有万夫不当之勇，我们应当发挥他们的优势。"
            });
            _local3.push({
                headPath:_local1,
                headName:_local2,
                content:"打造兵器？要去哪里呢？"
            });
            _local3.push({
                headPath:"source/cardImages/44.jpg",
                headName:"简雍",
                content:"在下曾结识一位铁匠，有祖传的技艺，专擅打造长兵器。但不知二位将军惯用何种兵器？"
            });
            _local3.push({
                headPath:"source/cardImages/43.jpg",
                headName:"张飞",
                content:"矛！"
            });
            _local3.push({
                headPath:"source/cardImages/43.jpg",
                headName:"张飞",
                content:"刃要长！"
            });
            _local3.push({
                headPath:"source/cardImages/43.jpg",
                headName:"张飞",
                content:"柄也要长！"
            });
            _local3.push({
                headPath:"source/cardImages/42.jpg",
                headName:"关羽",
                content:"来把长刀，越重越好。"
            });
            _local3.push({
                headPath:_local1,
                headName:_local2,
                content:"好，我们这就动身。"
            });
            return (_local3);
        }
        private function getSunquanScenario():Array{
            var _local1 = (("source/userHead/" + UserObject.headIcon) + ".jpg");
            var _local2:String = UserObject.name;
            var _local3 = "source/cardImages/84.jpg";
            var _local4:Array = new Array();
            _local4.push({
                headPath:_local3,
                headName:"程普",
                content:"此役之后，黄巾贼实力锐减。但华夏之内，各路诸侯拥兵备战，战火一触即发。"
            });
            _local4.push({
                headPath:_local1,
                headName:_local2,
                content:"那我们应该怎么办呢？"
            });
            _local4.push({
                headPath:_local3,
                headName:"程普",
                content:"应当趁机修养生息，增强战力。先求割据一方，再图问鼎天下……"
            });
            _local4.push({
                headPath:_local1,
                headName:_local2,
                content:"要如何才能增强战力呢？"
            });
            _local4.push({
                headPath:_local3,
                headName:"程普",
                content:"根据我军的特点，应当利用地形优势，继续操习水战。在长江天险的防护下，我们的水军是无敌的。"
            });
            _local4.push({
                headPath:_local1,
                headName:_local2,
                content:"利用长江天险……嗯，我们的士兵好像水性都不错呢。"
            });
            _local4.push({
                headPath:_local3,
                headName:"程普",
                content:"因为所有人都在江边长大，操习水战再合适不过了。"
            });
            _local4.push({
                headPath:_local1,
                headName:_local2,
                content:"不过，江上作战需要耗费大量的船只，目前我们还欠缺准备。"
            });
            _local4.push({
                headPath:_local3,
                headName:"程普",
                content:"这也不愁。有一种“快速造船之术”在江南流传已久，我们可以派人查访，以求学得此术。"
            });
            _local4.push({
                headPath:_local1,
                headName:_local2,
                content:"哈哈，不愧是江东智将，考虑如此周全！"
            });
            return (_local4);
        }

    }
}//package task 
