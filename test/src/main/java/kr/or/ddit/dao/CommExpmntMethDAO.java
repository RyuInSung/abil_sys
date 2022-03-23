package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.vo.CommExpmntMethVO;

public interface CommExpmntMethDAO {
	
	public abstract List<CommExpmntMethVO> selectCommExpmntMethList() throws SQLException;
	
	public abstract List<CommExpmntMethVO> selectCommExpmntMethList(Criteria cri) throws SQLException;
	
	public abstract int selectCommExpmntMethListCount() throws SQLException;
	
	public abstract CommExpmntMethVO selectCommExpmntMethByExpmntMethId(String expmntMethId) throws SQLException;
	
	public abstract void updateCommExpMethForRemove(String expmntMethId) throws SQLException;
	
	public abstract void updateCommExpMethForModify(CommExpmntMethVO commExpmntMeth) throws SQLException;
	
	public abstract void insertCommExpMeth(CommExpmntMethVO commExpmntMeth) throws SQLException;
	
}
