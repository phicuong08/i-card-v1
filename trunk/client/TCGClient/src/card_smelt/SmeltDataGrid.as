//Created by Action Script Viewer - http://www.buraks.com/asv
package card_smelt {
    import mx.managers.*;
    import mx.events.*;
    import normal_window.*;
    import source_manager.*;
    import combat_element_script.*;

    public class SmeltDataGrid extends JudgeCardDataGrid {

        override protected function doInitRange():void{
            rangeCards("type", false, false);
            rangeCards("color_range_index");
        }
        override protected function createNewCardItem():JudgeCardDataGridItem{
            return (new SmeltDataGridItem());
        }
        override protected function setParentLoadingPercent(_arg1:Number):void{
        }
        override public function checkOperation(_arg1:String, _arg2:Object, _arg3:Boolean=false){
            return (false);
        }
        override protected function dragEnterHandler(_arg1:DragEvent):void{
            if ((_arg1.dragInitiator is CardSmeltCardItem)){
                DragManager.acceptDragDrop(itemGroup);
            };
        }
        override protected function dragDropHandler(_arg1:DragEvent):void{
            CardSmeltMgr.getInstance().dragDropHandler(_arg1, this);
        }
        override protected function initCardInfo(_arg1:String, _arg2:int):Object{
            var _local3:Object = {
                id:_arg1,
                num:_arg2
            };
            CardsInfo.addAttribById(_local3);
            return (_local3);
        }
        override protected function setTitleImg():void{
            titleText.source = JudgeCardsSourceMgr.getInstance().getSourceClass("allCardText");
        }

    }
}//package card_smelt 
