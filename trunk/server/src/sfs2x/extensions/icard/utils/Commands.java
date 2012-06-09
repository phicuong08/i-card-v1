package sfs2x.extensions.icard.utils;

public class Commands {
							//
							//server commands
							//
	
	public static final String CMD_S2C_ERROR              =  "9002";
	public static final String CMD_S2C_GAME_START 				= "10001";
	//����1(me)--�ҷ�playerID ;����2(you):--�Է�playerID,����3(card)--(playerID,realID,cardID,slot,side,turn,hp,atk,def),...}  side=1,���ã� turn=1,��ת


	public static final String CMD_S2C_CLIENT_GAME_STATE_UPDATE	="10002";
	//����1(playerID) ;����2(state): ״̬ [ 0--��ʼ״̬�� 1--����]
	
	public static final String CMD_S2C_CARD_UPDATE				="11001";
	//{����1(card)--(playerID,realID,cardID,slot,side,turn,hp,atk,def),...}
	//��Ƭ״̬�ı�

	public static final String CMD_S2C_CARD_FIGHT				="11002";
	//����1(srcID);����2(target):Ŀ�꿨{(realID)...},����3(time):��Ӧʱ��(��),����4(defender);
	//��Ƭʹ�ã�����ʩ���뿨Ƭս��
	
	public static final String CMD_S2C_CARD_FIGHT_RESULT		="11003";
	//����1(srcID):, ����2(target):{ {realID,hpAdd,def,atk,slot,turn,side} ,...}--�����ÿ����,����3(bEnemy)[0-���ѷ���1-�Եз�]
	//ս������
	public static final String CMD_S2C_BATTLE_PLAYER_LOOP       ="11004";//�غ�ת��
	public static final String CMD_S2C_PRI_PLAYER_LOOP       ="11005";//����Ȩת��
	
	


	
							//
							//client commands
							//
	public static final String CMD_C2S_CLIENT_BATTLE_STATE_UPDATE = "1";
	//���״̬�޸�   ����1: ״̬[ 0--��ʼ״̬�� 1--����]
	
	public static final String CMD_C2S_CARD_USE					="1001"; //ʹ�ÿ�Ƭ 
	//����1(srcID):int;����2(target):{realID,...};
	
	public static final String CMD_C2S_CARD_UPDATE				="1002"; //����ı俨״̬,����
	//����1(realID):int;����2(slot):int, 
	

	

}