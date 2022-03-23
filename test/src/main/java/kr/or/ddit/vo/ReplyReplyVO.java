package kr.or.ddit.vo;

import java.util.Date;

public class ReplyReplyVO {
	private int rrno;
	private int rno;
	private String expmntMethId;
	private String replyReplyText;
	private String replyReplyer;
	private Date replyRegDate;
	private String replyPicture;
	
	public int getRrno() {
		return rrno;
	}
	public void setRrno(int rrno) {
		this.rrno = rrno;
	}
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
	public String getReplyReplyText() {
		return replyReplyText;
	}
	public void setReplyReplyText(String replyReplyText) {
		this.replyReplyText = replyReplyText;
	}
	public String getReplyReplyer() {
		return replyReplyer;
	}
	public void setReplyReplyer(String replyReplyer) {
		this.replyReplyer = replyReplyer;
	}
	public Date getReplyRegDate() {
		return replyRegDate;
	}
	public void setReplyRegDate(Date replyRegDate) {
		this.replyRegDate = replyRegDate;
	}
	public String getReplyPicture() {
		return replyPicture;
	}
	public void setReplyPicture(String replyPicture) {
		this.replyPicture = replyPicture;
	}
}
