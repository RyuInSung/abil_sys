package kr.or.ddit.command;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sun.media.jfxmedia.logging.Logger;

import kr.or.ddit.util.MakeFileName;
import kr.or.ddit.vo.CommExpmntMethVO;
import kr.or.ddit.vo.FileVO;

public class CommExpmntMethCommand {
	
	private String expmntMethId;
	private String expmntMethNm;
	private String regId;
	private String regDttm;
	private String rsltTable;
	private String rsltContent;
	private List<MultipartFile> multiFileList;
	
	public String getExpmntMethId() {
		return expmntMethId;
	}
	public void setExpmntMethId(String expmntMethId) {
		this.expmntMethId = expmntMethId;
	}
	public String getExpmntMethNm() {
		return expmntMethNm;
	}
	public void setExpmntMethNm(String expmntMethNm) {
		this.expmntMethNm = expmntMethNm;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getRegDttm() {
		return regDttm;
	}
	public void setRegDttm(String regDttm) {
		this.regDttm = regDttm;
	}
	public String getRsltTable() {
		return rsltTable;
	}
	public void setRsltTable(String rsltTable) {
		this.rsltTable = rsltTable;
	}
	public String getRsltContent() {
		return rsltContent;
	}
	public void setRsltContent(String rsltContent) {
		this.rsltContent = rsltContent;
	}
	public List<MultipartFile> getMultiFileList() {
		return multiFileList;
	}
	public void setMultiFileList(List<MultipartFile> multiFileList) {
		this.multiFileList = multiFileList;
	}

	public CommExpmntMethVO toCommExpmntMethVO(String filePath) throws Exception{
		CommExpmntMethVO commExpmntMeth = new CommExpmntMethVO();
		
		commExpmntMeth.setExpmntMethId(expmntMethId);
		commExpmntMeth.setExpmntMethNm(expmntMethNm);
		commExpmntMeth.setRegId(regId);
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		commExpmntMeth.setRegDttm(sdf.parse(regDttm));
		
		commExpmntMeth.setRegDttm(new Date());
		
		commExpmntMeth.setRsltTable(rsltTable);
		commExpmntMeth.setDelCheck('N');
		commExpmntMeth.setRsltContent(rsltContent);
		
		if(multiFileList!=null) {
			List<FileVO> fileList=new ArrayList<FileVO>();
			for(MultipartFile multi:multiFileList) {
				if(!(multi==null||multi.isEmpty()||multi.getSize()>1024*1024*5)) {
					String fileName=MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
					
					FileVO file=new FileVO();
					
					file.setFilePath(filePath);
					file.setFileName(fileName);
					file.setExpmntMethId(expmntMethId);
					
					//파일 하드에 저장.
					File stroage=new File(filePath,fileName);
					stroage.mkdirs();
					multi.transferTo(stroage);
					
					fileList.add(file);
				}
			}
			commExpmntMeth.setFileList(fileList);
		}
		
		
		return commExpmntMeth;
	}
	
}
