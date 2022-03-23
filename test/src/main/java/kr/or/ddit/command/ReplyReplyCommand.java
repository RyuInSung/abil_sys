package kr.or.ddit.command;

import java.util.Date;

import kr.or.ddit.vo.ReplyReplyVO;

public class ReplyReplyCommand {
	private String rrno;
	private String rno;
	private String expmntMethId;
	private String replyReplyText;
	private String replyReplyer;
	private String replyRegDate;
	private String replyPicture;
	
	public String getRrno() {
		return rrno;
	}
	public void setRrno(String rrno) {
		this.rrno = rrno;
	}
	public String getRno() {
		return rno;
	}
	public void setRno(String rno) {
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
	public String getReplyRegDate() {
		return replyRegDate;
	}
	public void setReplyRegDate(String replyRegDate) {
		this.replyRegDate = replyRegDate;
	}
	public String getReplyPicture() {
		return replyPicture;
	}
	public void setReplyPicture(String replyPicture) {
		this.replyPicture = replyPicture;
	}
	
	public ReplyReplyVO toReplyReplyVO() {
		ReplyReplyVO replyReply=new ReplyReplyVO();
		
		replyReply.setRno(Integer.parseInt(rno));
		replyReply.setExpmntMethId(expmntMethId);
		replyReply.setReplyReplyText(replyReplyText);
		replyReply.setReplyReplyer("대댓글등록자");
		replyReply.setReplyRegDate(new Date());
//		replyReply.setReplyPicture(replyPicture);
		
		return replyReply;
	}
	
}
