package sfs2x.extensions.icard.beans;

import sfs2x.extensions.icard.utils.Constants;


/**
 * GameMapBean: class describing a map associated to a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BufferBean
{
	public static final int TYPE_ATK_ADD=1;  //���ӹ�����
	public static final int TYPE_DEF_ADD=2;  //���ӷ���ֵ
	public static final int TYPE_GUIDE_ABLE=3; //�ɻ���
	public static final int TYPE_ATK_UNABLE=4; //���ɹ���
	public static final int TYPE_RESET_UNABLE=5; //��������
	public static final int TYPE_USECOST_ADD=6; //ʹ�÷���
	public static final int TYPE_REMOTE=7; //Զ��
	public static final int TYPE_HIDDEN=8; //Ǳ��
	public static final int TYPE_POINT_UNABLE=9; //���ɱ�ָ��
	
	public static final int WORK_ALWAYS=1;   //��������
	public static final int WORK_MYLOOP=2;   //�ҷ��غϼ���
	
	
	private int _loopNum=1;  //����ʱ��
	private int _workType;   
	private int _srcID;
	public BufferBean()
	{
	}
	

}
