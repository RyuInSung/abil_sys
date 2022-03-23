package kr.or.ddit.service;

import java.sql.SQLException;

import kr.or.ddit.vo.FileVO;

public interface FileService {

	public abstract void registFile(FileVO file) throws SQLException;
}
