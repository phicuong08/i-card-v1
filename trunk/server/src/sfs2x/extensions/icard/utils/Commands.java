package sfs2x.extensions.icard.utils;

public class Commands {
	/** Ready to start a game */
	//server
	public static final String CMD_S2C_GAME_START = "s2c_game_start";
	  //game start ��ʼ��Ϸ������1:����Ƹ�����Ϣ; 
	//{player1{card1{realID,cardID},card2,...},player2,...}
	
	//player id [realID,cardID,slot id], �Է�����Ϣ[real,0001]
	  //move card 
	public static final String CMD_S2C_CLIENT_STATE_UPDATE="s2c_client_state_update";
	//����1: playerId,����2: ״̬ [ 0--��ʼ״̬�� 1--����]
	
	public static final String CMD_S2C_CARD_UPDATE="s2c_card_update";
	//����1. playerId,����2:��״̬{realID,cardID,slot_id,side_state,turn_state,hp,atk,def]; key-value
	
	public static final String CMD_S2C_CARD_FIGHT_RESULT="s2c_card_fight_result";
	//����1. playerId,����2:��״̬{realID,cardID,slot_id,side_state,turn_state,hp,atk,def]; key-value
	
	public static final String CMS_S2C_CARD_FIGHT="s2c_card_fight";
	//����1:Դ��{realID},����2:Ŀ�꿨{Ŀ�꿨����realID,realID,...};
	
	//client commands
	//
	public static final String CMD_C2S_CLIENT_STATE_UPDATE = "c2s_client_state_update";
	//���״̬�޸�   ����1: ״̬[ 0--��ʼ״̬�� 1--����]
	
	public static final String CMD_C2S_CARD_UPDATE="c2s_card_update";
	//����1:��״̬{realID,slot_id,side_state,turn_state]; 
	public static final String CMD_C2S_CARD_USE="c2s_card_use"; //ʩ����ս��
	//����1:Դ��{realID},����2:Ŀ�꿨{Ŀ�꿨����realID,realID,...};
}


// client Commands