
package ICard.assist {
	import ICard.assist.view.HtmlText;
	import ICard.assist.server.CardType;
	public class cardTipHtml {
		public var abc:Array;		
		public static function CreateCardHtmlTip(cardID:int):String{
			var typeId:int = cardID/1000;
			var title:Object = CardType.CreateCardInfo(typeId*1000);
			var info:Object = CardType.CreateCardInfo(cardID);
			return CardHtmlTip(info,title);
		}
		
		private static function CardHtmlTip(info:Object,title:Object):String{
			var result:String = CardBaseHtml(info,title);
			if(info["cost"])
			{
				result  += CardAtkHtml(info,title);
				if(info["turncost"])
					result = result + "   "  + CardTurnCostHtml(info,title);
				result += HtmlText._newLineSign;
			}
			if(info["atk"])
			{
				result += CardAtkHtml(info,title);
				if(info["hp"])
					result = result + "   "  + CardHpHtml(info,title);
				result += HtmlText._newLineSign;
			}
			else if(info["hp"])
			{
				result = result + CardHpHtml(info,title) + HtmlText._newLineSign;
			}
			if(info["def"])
				result = result + CardDefHtml(info,title) + HtmlText._newLineSign;
			result = result + CardDetailHtml(info,title);
			return result;
		}
		
		
		
		private static function CardAtkHtml(info:Object,title:Object):String{
			return HtmlText.FontWraper(title["atk"],HtmlText.FONTSIZE_3,HtmlText.Green) + 
										HtmlText.FontWraper(info["atk"],HtmlText.FONTSIZE_3,HtmlText.White);
		}
		
		private static function CardCostHtml(info:Object,title:Object):String{
			return HtmlText.FontWraper(title["cost"],HtmlText.FONTSIZE_3,HtmlText.Green) + 
											HtmlText.FontWraper(info["cost"],HtmlText.FONTSIZE_3,HtmlText.White);
		}
		
		private static function CardTurnCostHtml(info:Object,title:Object):String{
			return HtmlText.FontWraper(title["turncost"],HtmlText.FONTSIZE_3,HtmlText.Green) + 
										HtmlText.FontWraper(info["turncost"],HtmlText.FONTSIZE_3,HtmlText.White);
		}
		
		private static function CardDefHtml(info:Object,title:Object):String{
			return HtmlText.FontWraper(title["def"],HtmlText.FONTSIZE_3,HtmlText.Green) + 
										HtmlText.FontWraper(info["def"],HtmlText.FONTSIZE_3,HtmlText.White);
		}
		
		private static function CardDetailHtml(info:Object,title:Object):String{
			return HtmlText.FontWraper(info["detail"],HtmlText.FONTSIZE_4,HtmlText.White);
		}
		
		private static function CardHpHtml(info:Object,title:Object):String{
			return HtmlText.FontWraper(title["hp"],HtmlText.FONTSIZE_3,HtmlText.Green) + 
										HtmlText.FontWraper(info["hp"],HtmlText.FONTSIZE_3,HtmlText.White);
		}
		
		private static function CardBaseHtml(info:Object,title:Object):String{
			var result:String ="";
			result = HtmlText.FontWraper(title["title"],HtmlText.FONTSIZE_2,HtmlText.Yellow) + 
				HtmlText.FontWraper(info["title"],HtmlText.FONTSIZE_2,HtmlText.White) +  HtmlText._newLineSign;
			result = result + HtmlText.FontWraper(title["camp"],HtmlText.FONTSIZE_3,HtmlText.Green) + HtmlText.FontWraper(info["camp"],HtmlText.FONTSIZE_3,HtmlText.White) + "   ";
			result = result + HtmlText.FontWraper(title["race"],HtmlText.FONTSIZE_3,HtmlText.Green) + HtmlText.FontWraper(info["race"],HtmlText.FONTSIZE_3,HtmlText.White) + HtmlText._newLineSign;   
			return result;
		}
	}
	
	
}