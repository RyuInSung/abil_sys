package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReplyVO {
	private int rno; //고유번호
	private String expmntMethId; //게시글 번호
	private String replytext; //댓글내용
	private String replyer; //작성자
	private Date regDate; //등록일
	private String picture; //작성자 사진
	
	private List<ReplyReplyVO> replyReplyList;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getExpmntMethId() {
		return expmntMethId;
	}
	public void setExpmntMethId(String expmntMethId) {
		this.expmntMethId = expmntMethId;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public List<ReplyReplyVO> getReplyReplyList() {
		return replyReplyList;
	}
	public void setReplyReplyList(List<ReplyReplyVO> replyReplyList) {
		this.replyReplyList = replyReplyList;
	}
}
