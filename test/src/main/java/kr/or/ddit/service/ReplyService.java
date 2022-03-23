package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.vo.ReplyVO;

public interface ReplyService {

	public abstract Map<String, Object> getReplyListByExpmntMethId(String expmntMethId,Criteria cri) throws SQLException;
	
	public abstract void registReply(ReplyVO reply) throws SQLException;
	
	public abstract void removeReply(int rno) throws SQLException;
}
