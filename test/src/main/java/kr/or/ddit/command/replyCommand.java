package kr.or.ddit.command;

import java.util.Date;

import kr.or.ddit.vo.ReplyVO;

public class replyCommand {
	private String expmntMethId;
	private String replytext; 
	private String replyer;
	private String picture;
	
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
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	public ReplyVO toReplyVO() {
		ReplyVO reply=new ReplyVO();
		
		reply.setExpmntMethId(expmntMethId);
		reply.setReplytext(replytext);
		reply.setReplyer("댓글등록자");
		reply.setRegDate(new Date());
//		reply.setPicture(picture);
		
		return reply;
	}
	
}
