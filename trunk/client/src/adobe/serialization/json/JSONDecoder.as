﻿//Created by Action Script Viewer - http://www.buraks.com/asv
package adobe.serialization.json {

    public class JSONDecoder {

        private var strict:Boolean;
        private var value;
        private var tokenizer:JSONTokenizer;
        private var token:JSONToken;

        public function JSONDecoder(_arg1:String, _arg2:Boolean){
            this.strict = _arg2;
            this.tokenizer = new JSONTokenizer(_arg1, _arg2);
            this.nextToken();
            this.value = this.parseValue();
            if (((_arg2) && (!((this.nextToken() == null))))){
                this.tokenizer.parseError("Unexpected characters left in input stream");
            };
        }
        public function getValue(){
            return (this.value);
        }
        private function nextToken():JSONToken{
            return ((this.token = this.tokenizer.getNextToken()));
        }
        private function parseArray():Array{
            var _local1:Array = new Array();
            this.nextToken();
            if (this.token.type == JSONTokenType.RIGHT_BRACKET){
                return (_local1);
            };
            if (((!(this.strict)) && ((this.token.type == JSONTokenType.COMMA)))){
                this.nextToken();
                if (this.token.type == JSONTokenType.RIGHT_BRACKET){
                    return (_local1);
                };
                this.tokenizer.parseError(("Leading commas are not supported.  Expecting ']' but found " + this.token.value));
            };
            _local1.push(this.parseValue());
            this.nextToken();
            if (this.token.type == JSONTokenType.RIGHT_BRACKET){
                return (_local1);
            };
            if (this.token.type == JSONTokenType.COMMA){
                this.nextToken();
                if (!this.strict){
                    if (this.token.type == JSONTokenType.RIGHT_BRACKET){
                        return (_local1);
                    };
                };
            } else {
                this.tokenizer.parseError(("Expecting ] or , but found " + this.token.value));
            };
            //unresolved jump
			return _local1;
        }
        private function parseObject():Object{
            var _local2:String;
            var _local1:Object = new Object();
            this.nextToken();
            if (this.token.type == JSONTokenType.RIGHT_BRACE){
                return (_local1);
            };
            if (((!(this.strict)) && ((this.token.type == JSONTokenType.COMMA)))){
                this.nextToken();
                if (this.token.type == JSONTokenType.RIGHT_BRACE){
                    return (_local1);
                };
                this.tokenizer.parseError(("Leading commas are not supported.  Expecting '}' but found " + this.token.value));
            };
            if (this.token.type == JSONTokenType.STRING){
                _local2 = String(this.token.value);
                this.nextToken();
                if (this.token.type == JSONTokenType.COLON){
                    this.nextToken();
                    _local1[_local2] = this.parseValue();
                    this.nextToken();
                    if (this.token.type == JSONTokenType.RIGHT_BRACE){
                        return (_local1);
                    };
                    if (this.token.type == JSONTokenType.COMMA){
                        this.nextToken();
                        if (!this.strict){
                            if (this.token.type == JSONTokenType.RIGHT_BRACE){
                                return (_local1);
                            };
                        };
                    } else {
                        this.tokenizer.parseError(("Expecting } or , but found " + this.token.value));
                    };
                } else {
                    this.tokenizer.parseError(("Expecting : but found " + this.token.value));
                };
            } else {
                this.tokenizer.parseError(("Expecting string but found " + this.token.value));
            };
			return _local1;
            //unresolved jump
        }
        private function parseValue():Object{
            if (this.token == null){
                this.tokenizer.parseError("Unexpected end of input");
            };
            switch (this.token.type){
                case JSONTokenType.LEFT_BRACE:
                    return (this.parseObject());
                case JSONTokenType.LEFT_BRACKET:
                    return (this.parseArray());
                case JSONTokenType.STRING:
                case JSONTokenType.NUMBER:
                case JSONTokenType.TRUE:
                case JSONTokenType.FALSE:
                case JSONTokenType.NULL:
                    return (this.token.value);
                case JSONTokenType.NAN:
                    if (!this.strict){
                        return (this.token.value);
                    };
                    this.tokenizer.parseError(("Unexpected " + this.token.value));
                default:
                    this.tokenizer.parseError(("Unexpected " + this.token.value));
            };
            return (null);
        }

    }
}//package adobe.serialization.json 
