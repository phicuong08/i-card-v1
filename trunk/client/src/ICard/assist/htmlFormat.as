//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist {
    import ICard.assist.view.*;

    public function htmlFormat(_arg1:String, _arg2:int=12, _arg3:int=0, _arg4:Boolean=false, _arg5:Boolean=false, _arg6:String=""):String{
        return (HtmlText.format(_arg1, Math.max(_arg3, 0), Math.max(_arg2, 0), "", _arg4, false, _arg5, null, _arg6));
    }
}//package com.assist 
