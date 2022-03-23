package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.vo.ReplyReplyVO;

public interface ReplyReplyDAO {

	public abstract void insertReplyReply(ReplyReplyVO replyReply) throws SQLException; 
	
	public abstract List<ReplyReplyVO> selectReplyReplyList(ReplyReplyVO replyReply) throws SQLException;
}
