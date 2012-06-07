package sfs2x.extensions.icard.utils;

/**
 * Constants: class containing constatns used to configure the extension
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class ErrorDef 
{	
	public final static String ERR_PLAYER_MATCH = "player is not match!";
	public final static String ERR_NOT_PLAYER_OP = "player can't do op!";
	public static String _CurErr="";
	public static void Empty(){
		_CurErr="";
	}
	public static Boolean IsEmpty(){
		return _CurErr.length()==0;
	}
}