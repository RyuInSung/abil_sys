package kr.or.ddit.service;

import java.sql.SQLException;

import kr.or.ddit.vo.ReplyReplyVO;

public interface ReplyReplyService {

	public abstract void registReplyReply(ReplyReplyVO replyReply) throws SQLException;
}
