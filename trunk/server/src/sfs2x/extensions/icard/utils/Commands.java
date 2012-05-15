package sfs2x.extensions.icard.utils;

public class Commands {
							//
							//server commands
							//
	
	
	public static final String CMD_S2C_GAME_START 				= "10001";
	//game start ��ʼ��Ϸ������1:����Ƹ�����Ϣ; 
	//{player1{card1{realID,cardID},card2,...},player2,...}	
	//player id [realID,cardID,slot id], �Է�����Ϣ[real,0001]

	public static final String CMD_S2C_CLIENT_GAME_STATE_UPDATE	="10002";
	//����1: playerId,����2: ״̬ [ 0--��ʼ״̬�� 1--����]
	
	public static final String CMD_S2C_CARD_UPDATE				="11001";
	//{����1(playerID,realID,cardID,slot,side,turn,hp,atk,def),...}
	//��Ƭ״̬�ı�

	public static final String CMD_S2C_CARD_FIGHT				="11002";
	//����1(srcID);����2(target):Ŀ�꿨{(realID,slot)...},����3(timer):��Ӧʱ��(��);
	//��Ƭʹ�ã�����ʩ���뿨Ƭս��
	
	public static final String CMD_S2C_CARD_FIGHT_RESULT		="11003";
	//����1(srcID):, ����2(target):{ {realID,card_battle_state,val} ,...}--�����ÿ����
	//ս������
	
	
	


	
							//
							//client commands
							//
	public static final String CMD_C2S_CLIENT_GAME_STATE_UPDATE = "1";
	//���״̬�޸�   ����1: ״̬[ 0--��ʼ״̬�� 1--����]
	
	public static final String CMD_C2S_CARD_USE					="1001"; //ʩ����ս��
	//����1:Դ��{realID},����2:Ŀ�꿨{Ŀ�꿨����realID,realID,...};
	
	public static final String CMD_C2S_CARD_UPDATE				="1002";
	//����1:��״̬{realID,slot_id,side_state,turn_state]; 
	
	
//	realID --��ƬΨһID
//	cardID --��ƬID
//	slot   --��λ 
//	side   --�Ƿ���� 1-�ᣬ0-�Ǻ�
//	turn   --�Ƿ�ת 1-��ת
//	hp     --Ѫ��
//	atk    --������
//	def    --������
//	
//	//����1: playerId,����2: ״̬ [ 0--��ʼ״̬�� 1--����]
//
//	
//	state   --���״̬  0--��ʼ��1--����  2--��ʼ�˻���ս
	

}