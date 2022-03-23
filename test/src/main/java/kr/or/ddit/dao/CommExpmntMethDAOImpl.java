package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.vo.CommExpmntMethVO;

public class CommExpmntMethDAOImpl implements CommExpmntMethDAO{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CommExpmntMethVO> selectCommExpmntMethList() throws SQLException {
		return sqlSession.selectList("CommExpmntMeth-Mapper.selectCommExpmntMethList");
	}

	@Override
	public List<CommExpmntMethVO> selectCommExpmntMethList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);

		List<CommExpmntMethVO> list = sqlSession.selectList("CommExpmntMeth-Mapper.selectCommExpmntMethList", null, rowBounds);
		return list;
	}

	@Override
	public int selectCommExpmntMethListCount() throws SQLException {
		return sqlSession.selectOne("CommExpmntMeth-Mapper.selectCommExpmntMethListCount");
	}

	@Override
	public CommExpmntMethVO selectCommExpmntMethByExpmntMethId(String expmntMethId) throws SQLException {
		return sqlSession.selectOne("CommExpmntMeth-Mapper.selectCommExpmntMethByExpmntMethId",expmntMethId);
	}

	@Override
	public void updateCommExpMethForRemove(String expmntMethId) throws SQLException {
		sqlSession.update("CommExpmntMeth-Mapper.updateCommExpMethForRemove",expmntMethId);
	}

	@Override
	public void updateCommExpMethForModify(CommExpmntMethVO commExpmntMeth) throws SQLException {
		sqlSession.update("CommExpmntMeth-Mapper.updateCommExpMethForModify",commExpmntMeth);
	}

	@Override
	public void insertCommExpMeth(CommExpmntMethVO commExpmntMeth) throws SQLException {
		sqlSession.update("CommExpmntMeth-Mapper.insertCommExpMeth",commExpmntMeth);
	}

}
