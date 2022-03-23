package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CommExpmntMethVO {
	
	private String expmntMethId;
	private String expmntMethNm;
	private String tmpltFileNm;
	private String tmpltFilePath;
	private String remark;
	private String regId;
	private Date regDttm;
	private String modId;
	private Date modDttm;
	private String rsltTable;
	private String rsltColumn;
	private Character delCheck;
	private String rsltContent;
	
	private List<FileVO> fileList;
	
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
	public String getTmpltFileNm() {
		return tmpltFileNm;
	}
	public void setTmpltFileNm(String tmpltFileNm) {
		this.tmpltFileNm = tmpltFileNm;
	}
	public String getTmpltFilePath() {
		return tmpltFilePath;
	}
	public void setTmpltFilePath(String tmpltFilePath) {
		this.tmpltFilePath = tmpltFilePath;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public Date getRegDttm() {
		return regDttm;
	}
	public void setRegDttm(Date regDttm) {
		this.regDttm = regDttm;
	}
	public String getModId() {
		return modId;
	}
	public void setModId(String modId) {
		this.modId = modId;
	}
	public Date getModDttm() {
		return modDttm;
	}
	public void setModDttm(Date modDttm) {
		this.modDttm = modDttm;
	}
	public String getRsltTable() {
		return rsltTable;
	}
	public void setRsltTable(String rsltTable) {
		this.rsltTable = rsltTable;
	}
	public String getRsltColumn() {
		return rsltColumn;
	}
	public void setRsltColumn(String rsltColumn) {
		this.rsltColumn = rsltColumn;
	}
	public Character getDelCheck() {
		return delCheck;
	}
	public void setDelCheck(Character delCheck) {
		this.delCheck = delCheck;
	}
	public String getRsltContent() {
		return rsltContent;
	}
	public void setRsltContent(String rsltContent) {
		this.rsltContent = rsltContent;
	}
	public List<FileVO> getFileList() {
		return fileList;
	}
	public void setFileList(List<FileVO> fileList) {
		this.fileList = fileList;
	}
}
