package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.vo.FileChangeVO;
import kr.or.ddit.vo.FileVO;

public class FileDAOImpl implements FileDAO{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertFile(FileVO file) throws SQLException {
		sqlSession.update("File-Mapper.insertFile",file);
	}

	@Override
	public List<FileVO> selectFileList(String expmntMethId) throws SQLException {
		return sqlSession.selectList("File-Mapper.selectFileList",expmntMethId);
	}

	@Override
	public void deleteFile(FileChangeVO fileChange) throws SQLException {
		sqlSession.update("File-Mapper.deleteFile",fileChange);
	}

}
