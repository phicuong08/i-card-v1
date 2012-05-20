package sfs2x.extensions.icard.main;

import com.smartfoxserver.v2.extensions.SFSExtension;

public class ParentExtension {
	static SFSExtension extension = null;
	private ParentExtension(){	
	}
	public static SFSExtension getInstance(){
		return extension;
	}
	public static void setInstance(SFSExtension e){
		extension = e;
	}
}
