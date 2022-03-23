package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.command.ReplyReplyCommand;
import kr.or.ddit.service.ReplyReplyService;
import kr.or.ddit.vo.ReplyReplyVO;

@RestController
@RequestMapping("/repliesReplies")
public class ReplyReplyController {

	@Autowired
	private ReplyReplyService replyReplyService;
	
//	@RequestMapping(value="/{expmntMethId}/{page}",method=RequestMethod.GET)
//	public ResponseEntity<Map<String, Object>> replyList(@PathVariable("expmntMethId") String expmntMethId,@PathVariable("page") int page) throws Exception
//	{
//		ResponseEntity<Map<String, Object>> entity=null;
//		
//		Criteria cri = new Criteria();
//		cri.setPage(page);
//		
//		Map<String, Object> dataMap=replyService.getReplyListByExpmntMethId(expmntMethId, cri);
//		entity=new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
//		
//		return entity;
//	}
	
	@RequestMapping(value="",method=RequestMethod.POST)
	public ResponseEntity<String> regist(@RequestBody ReplyReplyCommand registReq) throws Exception
	{
		ResponseEntity<String> entity=null;
		
		ReplyReplyVO replyReply = registReq.toReplyReplyVO();
		
		replyReplyService.registReplyReply(replyReply);
		
//		Criteria cri=new Criteria();

		//아래부터는 오버스펙일 수 있다.
//		Map<String, Object> dataMap = replyService.getReplyListByExpmntMethId(reply.getExpmntMethId(), cri);
//		PageMaker pageMaker = (PageMaker)dataMap.get("pageMaker");
//		int realEndPage = pageMaker.getRealEndPage();
//		entity=new ResponseEntity<String>(realEndPage+"",HttpStatus.OK);
		
		entity=new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}
}
