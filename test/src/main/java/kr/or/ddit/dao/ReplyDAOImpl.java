package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.vo.ReplyVO;

public class ReplyDAOImpl implements ReplyDAO {

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ReplyVO> selectReplyListByExpmntMethId(String expmntMethId,Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		return sqlSession.selectList("Reply-Mapper.selectReplyListByExpmntMethId",expmntMethId,rowBounds);
	}

	@Override
	public int selectReplyCount(String expmntMethId) throws SQLException {
		return sqlSession.selectOne("Reply-Mapper.selectReplyCount",expmntMethId);
	}

	@Override
	public void insertReply(ReplyVO reply) throws SQLException {
		sqlSession.update("Reply-Mapper.insertReply",reply);
	}

	@Override
	public void deleteReply(int rno) throws SQLException {
		sqlSession.update("Reply-Mapper.deleteReply",rno);
	}

}
