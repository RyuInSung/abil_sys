package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.vo.ReplyReplyVO;

public class ReplyReplyDAOImpl implements ReplyReplyDAO{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertReplyReply(ReplyReplyVO replyReply) throws SQLException {
		sqlSession.update("ReplyReply-Mapper.insertReplyReply",replyReply);
	}

	@Override
	public List<ReplyReplyVO> selectReplyReplyList(ReplyReplyVO replyReply) throws SQLException {
		return sqlSession.selectList("ReplyReply-Mapper.selectReplyReplyList",replyReply);
	}

}
