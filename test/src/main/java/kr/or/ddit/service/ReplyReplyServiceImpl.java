package kr.or.ddit.service;

import java.sql.SQLException;

import kr.or.ddit.dao.ReplyReplyDAO;
import kr.or.ddit.vo.ReplyReplyVO;

public class ReplyReplyServiceImpl implements ReplyReplyService{

	private ReplyReplyDAO replyReplyDAO;
	
	public void setReplyReplyDAO(ReplyReplyDAO replyReplyDAO) {
		this.replyReplyDAO = replyReplyDAO;
	}

	@Override
	public void registReplyReply(ReplyReplyVO replyReply) throws SQLException {
		replyReplyDAO.insertReplyReply(replyReply);
	}

}
