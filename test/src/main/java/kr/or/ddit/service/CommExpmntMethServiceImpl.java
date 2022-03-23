package kr.or.ddit.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.CommExpmntMethDAO;
import kr.or.ddit.dao.FileDAO;
import kr.or.ddit.util.MakeFileName;
import kr.or.ddit.vo.CommExpmntMethVO;
import kr.or.ddit.vo.FileChangeVO;
import kr.or.ddit.vo.FileVO;

public class CommExpmntMethServiceImpl implements CommExpmntMethService{

	private CommExpmntMethDAO commExpmntMethDAO;
	
	public void setCommExpmntMethDAO(CommExpmntMethDAO commExpmntMethDAO) {
		this.commExpmntMethDAO = commExpmntMethDAO;
	}
	
	private FileDAO fileDAO;
	
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}

	@Override
	public List<CommExpmntMethVO> getCommExpmntMethList() throws SQLException {
		return commExpmntMethDAO.selectCommExpmntMethList();
	}

	@Override
	public Map<String, Object> getCommExpmntMethList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = null;

		List<CommExpmntMethVO> list = null;
		PageMaker pageMaker = null;

		list=commExpmntMethDAO.selectCommExpmntMethList(cri);
		
		pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(commExpmntMethDAO.selectCommExpmntMethListCount());

		dataMap=new HashMap<String,Object>();
		dataMap.put("list", list);
		dataMap.put("pageMaker",pageMaker);

		return dataMap;
	}

	@Override
	public CommExpmntMethVO getCommExpmntMethByExpmntMethId(String expmntMethId) throws SQLException {
		CommExpmntMethVO commExpmntMeth = commExpmntMethDAO.selectCommExpmntMethByExpmntMethId(expmntMethId);
		List<FileVO> fileList = fileDAO.selectFileList(expmntMethId);
		if(fileList!=null && commExpmntMeth!=null) {
			for(FileVO file:fileList) {
				file.setRealName(MakeFileName.parseFileNameFromUUID(file.getFileName(), "\\$\\$"));
			}
			commExpmntMeth.setFileList(fileList);
		}
		return commExpmntMeth;
	}

	@Override
	public void removeCommExpMethByExpmntMethID(String expmntMethId) throws SQLException {
		commExpmntMethDAO.updateCommExpMethForRemove(expmntMethId);
	}

	@Override
	public void modifyCommExpMeth(CommExpmntMethVO commExpmntMeth,List<String> remainList,String filePath) throws SQLException {
		//게시글 수정
		commExpmntMethDAO.updateCommExpMethForModify(commExpmntMeth);
		
		//파일 정보 디비 수정 (삭제 먼저)
		List<FileVO> existList = fileDAO.selectFileList(commExpmntMeth.getExpmntMethId());
		List<String> deleteList=new ArrayList<String>();
		if(existList!=null) {
			for(FileVO exist:existList) {
				boolean flag=false;
				if(remainList!=null)for(String remain:remainList) {
					if(exist.getFileName().equals(remain)) {
						flag=true;
					}
				}
				if(!flag) deleteList.add(exist.getFileName());
			}
		}
		
		//삭제할 명단 = (현재 명단 - 남아있는 명단)
		FileChangeVO fileChange = new FileChangeVO();
		fileChange.setExpmntMethId(commExpmntMeth.getExpmntMethId());
		if(!deleteList.isEmpty())for(String delete:deleteList) {
			fileChange.setFileName(delete);
			fileDAO.deleteFile(fileChange);
		}
		
//		FileChangeVO fileChange=new FileChangeVO();
//		fileChange.setExpmntMethId(commExpmntMeth.getExpmntMethId());
//		for(String remain:remainList) {
//			fileChange.setFileName(remain);
//			fileDAO.deleteFile(fileChange);
//		}
		//신규 파일 목록 추가
		List<FileVO> fileList = commExpmntMeth.getFileList();
		if(fileList!=null) for(FileVO file:fileList) {
			fileDAO.insertFile(file);
		}
	}

	@Override
	public void registCommExpMeth(CommExpmntMethVO commExpmntMeth,String filePath) throws Exception {
		//게시글 등록
		commExpmntMethDAO.insertCommExpMeth(commExpmntMeth);
		
		//파일 정보 디비 저장.
		List<FileVO> fileList = commExpmntMeth.getFileList();
		if(fileList!=null) for(FileVO file:fileList) {
			fileDAO.insertFile(file);
		}
	}
	
//	private String savePicture(MultipartFile multi,String uploadPath) throws IOException
//	{
//		String fileName=null;
//		//파일유무확인
//		if(!(multi==null||multi.isEmpty()||multi.getSize()>1024*1024*5))
//		{
//			fileName=MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
////			fileName=multi.getOriginalFilename();
//			File storeFile=new File(uploadPath,fileName);
//			
//			storeFile.mkdirs();
//			//local HDD에 저장.
//			multi.transferTo(storeFile);
//		}
//		return fileName;
//	}

	@Override
	public List<Map<String, Object>> getCommExpmntMethListToJSON() throws SQLException {
		List<Map<String, Object>> result=new ArrayList<Map<String,Object>>();
		
		List<CommExpmntMethVO> commExpmntMethVOList = commExpmntMethDAO.selectCommExpmntMethList();
		Map<String, Object> map = null;
		for(CommExpmntMethVO commExpmntMethVO:commExpmntMethVOList) {
			map=new HashMap<String, Object>();
			map.put("ExpmntMethId", commExpmntMethVO.getExpmntMethId());
			map.put("ExpmntMethNm", commExpmntMethVO.getExpmntMethNm());
			map.put("RegId", commExpmntMethVO.getRegId());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			map.put("RegDttm", sdf.format(commExpmntMethVO.getRegDttm()));
			map.put("RsltTable", commExpmntMethVO.getRsltTable());
			result.add(map);
		}
		
		return result;
	}


}
