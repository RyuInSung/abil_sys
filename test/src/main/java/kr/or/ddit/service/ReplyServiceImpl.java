package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.ReplyDAO;
import kr.or.ddit.dao.ReplyReplyDAO;
import kr.or.ddit.vo.ReplyReplyVO;
import kr.or.ddit.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyService{

	private ReplyDAO replyDAO;
	
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	private ReplyReplyDAO replyReplyDAO;
	
	public void setReplyReplyDAO(ReplyReplyDAO replyReplyDAO) {
		this.replyReplyDAO = replyReplyDAO;
	}

	@Override
	public Map<String, Object> getReplyListByExpmntMethId(String expmntMethId,Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ReplyVO> replyList = replyDAO.selectReplyListByExpmntMethId(expmntMethId,cri);
		
		ReplyReplyVO replyReply=new ReplyReplyVO();
		replyReply.setExpmntMethId(expmntMethId);
		
		if(replyList!=null) for(ReplyVO reply:replyList) {
			//사진
//			MemberVO member = memberDAO.selectMemberById(session, reply.getReplyer());
//			reply.setPicture(member.getPicture());
			
			//대댓글
			replyReply.setRno(reply.getRno());
			reply.setReplyReplyList(replyReplyDAO.selectReplyReplyList(replyReply));
		}
		
		int count = replyDAO.selectReplyCount(expmntMethId);
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public void registReply(ReplyVO reply) throws SQLException {
		replyDAO.insertReply(reply);
	}

	@Override
	public void removeReply(int rno) throws SQLException {
		replyDAO.deleteReply(rno);
	}
	
}
