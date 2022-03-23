package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.vo.ReplyVO;

public interface ReplyDAO {
	
	public abstract List<ReplyVO> selectReplyListByExpmntMethId(String expmntMethId,Criteria cri) throws SQLException;
	
	public abstract int selectReplyCount(String expmntMethId) throws SQLException;
	
	public abstract void insertReply(ReplyVO reply) throws SQLException;
	
	public abstract void deleteReply(int rno) throws SQLException;
}
