package kr.or.ddit.service;

import java.sql.SQLException;

import kr.or.ddit.dao.FileDAO;
import kr.or.ddit.vo.FileVO;

public class FileServiceImpl implements FileService{

	private FileDAO fileDAO;
	
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}

	@Override
	public void registFile(FileVO file) throws SQLException {
		fileDAO.insertFile(file);
	}

}
