//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.resources.*;

    public class zh_CN$textLayout_properties extends ResourceBundle {

        public function zh_CN$textLayout_properties(){
            super("zh_CN", "textLayout");
        }
        override protected function getContent():Object{
            var _local1:Object = {
                badRemoveChild:"找不到要删除的子代",
                badReplaceChildrenIndex:"FlowGroupElement.replaceChildren 的索引超出范围",
                missingTextFlow:"没有要分析的 TextFlow",
                unexpectedNamespace:"意外命名空间 {0}",
                badMXMLChildrenArgument:"传递给 mxmlChildren 的类型 {0} 的元素错误",
                invalidReplaceTextPositions:"传递给 SpanElement.replaceText 的位置无效",
                invalidSplitAtPosition:"splitAtPosition 的参数无效",
                badSurrogatePairCopy:"仅复制了 SpanElement.shallowCopy 中代理对的一半",
                invalidChildType:"NewElement 不属于此项可作为其父代的类型",
                unknownAttribute:"元素 {1} 中不允许有属性 {0}",
                invalidSurrogatePairSplit:"分割代理对无效",
                expectedExactlyOneTextLayoutFormat:"{0}\t 中应有且仅有一个 TextLayoutFormat",
                invalidFlowElementConstruct:"尝试构造无效 FlowElement 子类",
                malformedTag:"标签 {0} 格式不正确",
                missingStringResource:"资源 {0} 没有字符串",
                invalidSplitAtIndex:"splitAtIndex 的参数无效",
                illegalOperation:"尝试执行 {0} 操作非法",
                malformedMarkup:"标记 {0} 格式不正确",
                unexpectedXMLElementInSpan:"跨距中有意外元素 {0}",
                badPropertyValue:"属性 {0} 值 {1} 超出范围",
                badShallowCopyRange:"shallowCopy 的范围错误",
                unknownElement:"未知元素 {0}"
            };
            return (_local1);
        }

    }
}//package 
