package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.vo.CommExpmntMethVO;

public interface CommExpmntMethService {

	public abstract List<CommExpmntMethVO> getCommExpmntMethList() throws SQLException;
	
	public abstract Map<String, Object> getCommExpmntMethList(Criteria cri) throws SQLException;

	public abstract CommExpmntMethVO getCommExpmntMethByExpmntMethId(String expmntMethId) throws SQLException;
	
	public abstract void removeCommExpMethByExpmntMethID(String expmntMethId) throws SQLException;
	
	public abstract void modifyCommExpMeth(CommExpmntMethVO commExpmntMeth,List<String> remainList,String filePath) throws SQLException;
	
	public abstract void registCommExpMeth(CommExpmntMethVO commExpmntMeth,String filePath) throws Exception;
	
	public abstract List<Map<String, Object>> getCommExpmntMethListToJSON() throws SQLException;
}
