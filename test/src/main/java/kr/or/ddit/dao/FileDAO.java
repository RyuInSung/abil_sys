package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.vo.FileChangeVO;
import kr.or.ddit.vo.FileVO;

public interface FileDAO {

	public abstract void insertFile(FileVO file) throws SQLException;
	
	public abstract List<FileVO> selectFileList(String expmntMethId) throws SQLException;
	
	public abstract void deleteFile(FileChangeVO fileChange) throws SQLException;
}
