
package ICard.assist {
		import ICard.assist.view.HtmlText;

		public class cardTipHtml {
		
		public static CreateCardHtmlTip(info:Array,title:Array):String{
				var typeId:int = info[0]/1000;
				var result:String="";
				switch(typeId)
				{
						case 20:
							result= HeroHtmlTip(info,title);
							break;
						case 50:
							result =SkillHtmlTip(info,title);
							break;
						case 40:
							result =TaskHtmlTip(info,title);
							break;
						case 31:
							result =DefHtmlTip(info,title);
							break;		
						case 30:
							result =WeaponHtmlTip(info,title);
							break;
						case 21:
						case 22:
						case 23:
							result =SoldierHtmlTip(info,title);
							break;		
				}
				return result;
			}

			private static SoldierHtmlTip(info:Array,title:Array):String{
					var result:String = CardBaseHtml(info,title);
					result = result + CardAtkHtml(info,title) + "   " + CardHpHtml(info,title) +HtmlText._newLineSign;
					result = result + CardDetailHtml(info,title);
					return result;
			}

			private static WeaponHtmlTip(info:Array,title:Array):String{
					var result:String = CardBaseHtml(info,title);
					result = result + CardCostHtml(info,title) + "   " + CardTurnCostHtml(info,title) +HtmlText._newLineSign;
					result = result + CardAtkHtml(info,title) + HtmlText._newLineSign;
					result = result + CardDetailHtml(info,title);
					return result;
			}

			private static DefHtmlTip(info:Array,title:Array):String{
					var result:String = CardBaseHtml(info,title);
					result = result + CardCostHtml(info,title) + HtmlText._newLineSign;
					result = result + CardDefHtml(info,title) + HtmlText._newLineSign;
					result = result + CardDetailHtml(info,title);
					return result;
			}

			private static TaskHtmlTip(info:Array,title:Array):String{
					var result:String = CardBaseHtml(info,title);
					result = result + CardDetailHtml(info,title);
					return result;
			}

			private static SkillHtmlTip(info:Array,title:Array):String{
					var result:String = CardBaseHtml(info,title);
					result = result + CardCostHtml(info,title) + HtmlText._newLineSign;
					result = result + CardDetailHtml(info,title);
					return result;
			}

			private static HeroHtmlTip(info:Array,title:Array):String{
					var result:String = CardBaseHtml(info,title);
					result = result + CardCostHtml(info,title) + HtmlText._newLineSign;
					result = result + CardHpHtml(info,title) + HtmlText._newLineSign;
					result = result + CardDetailHtml(info,title);
					return result;
			}


			private static CardAtkHtml(info:Array,title:Array):String{
					var typeId:int = info[0]/1000;
					var result:String="";
					switch(typeId)
					{
							case 30:
							case 21:
							case 22:
							case 23:
								result= HtmlText.FontWraper(title[6],HtmlText.FONTSIZE_3,HtmlText.Green) + HtmlText.FontWraper(info[6],HtmlText.FONTSIZE_3,HtmlText.White);
								break;
					}
					return result;
			}

			private static CardCostHtml(info:Array,title:Array):String{
					var typeId:int = info[0]/1000;
					var result:String="";
					switch(typeId)
					{
							case 20:
							case 21:
							cas3 22:
							case 23:
							case 50:
							case 30:
							cas3 31:
								result= HtmlText.FontWraper(title[4],HtmlText.FONTSIZE_3,HtmlText.Green) + HtmlText.FontWraper(info[4],FONTSIZE_3,HtmlText.HtmlText.White);
								break;
					}
					return result;
			}

			private static CardTurnCostHtml(info:Array,title:Array):String{
					var typeId:int = info[0]/1000;
					var result:String="";
					switch(typeId)
					{
							case 30:
								result= HtmlText.FontWraper(title[5],HtmlText.FONTSIZE_3,HtmlText.Green) + HtmlText.FontWraper(info[5],HtmlText.FONTSIZE_3,HtmlText.White);
								break;
					}
					return result;
			}

			private static CardDefHtml(info:Array,title:Array):String{
					var typeId:int = info[0]/1000;
					var result:String="";
					switch(typeId)
					{
							case 31:
								result= HtmlText.FontWraper(title[5],FONTSIZE_3,HtmlText.Green) + HtmlText.FontWraper(info[5],HtmlText.FONTSIZE_3,HtmlText.White);
								break;
					}
					return result;
			}

			private static CardDetailHtml(info:Array,title:Array):String{
					var detailPos:int = info.length - 1;
					return HtmlText.FontWraper(HtmlText.FontWraper(info[detailPos],HtmlText.FONTSIZE_4,HtmlText.White);
			}

			private static CardHpHtml(info:Array,title:Array):String{
					var typeId:int = info[0]/1000;
					var result:String="";
					switch(typeId)
					{
							case 20: //hero
							case 21: //dps
							case 22: //
							case 23: 
								result = HtmlText.FontWraper(title[5],FONTSIZE_3,HtmlText.Green) + HtmlText.FontWraper(info[5],FONTSIZE_3,HtmlText.White);
								break;
					}
					return result;
			}
			private static CardBaseHtml(info:Array,title:Array):String{
					var result:String ="";
					var result:String ="";
					result = HtmlText.FontWraper(title[1],FONTSIZE_2,HtmlText.Yellow) + 
									HtmlText.FontWraper(info[1],FONTSIZE_2,HtmlText.White) +  HtmlText._newLineSign;
					result = result + HtmlText.FontWraper(title[2],FONTSIZE_3,HtmlText.Green) + HtmlText.FontWraper(info[2],FONTSIZE_3,HtmlText.White) + "   ";
					result = result + HtmlText.FontWraper(title[3],FONTSIZE_3,HtmlText.Green) + HtmlText.FontWraper(info[3],FONTSIZE_3,HtmlText.White) + HtmlText._newLineSign;   
					return result;
			}
		}


}