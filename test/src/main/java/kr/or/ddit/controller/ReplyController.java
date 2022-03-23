package kr.or.ddit.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.replyCommand;
import kr.or.ddit.service.ReplyService;
import kr.or.ddit.vo.ReplyVO;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	//REST방식에선 하나의 url이 하나의 데이터라고 생각하는걸 권장한다.
	//브라우저 형식이 파라미터& 이고, url에 데이터를 보내는걸. 장비든 기계든 파라미터 적용이 안된다.
	//FTP서버도 tele dot임. 얘네도 슬래시 방식임. 프로토콜이 다를뿐이지.
	//'주소줄에다 데이터를 심어라' (물음표 말고 ㅋ)
	//스프링에서 할수있게했음 그게바로 pathVariable
	//웹기반이 아닌건 다 socket이다.
	//쉽게 말해서 윈도우에서 돌아가는 게임은 서버랑 소켓통신이다. http가 아니고. (TCP/UDP) 
	//브라우저가 아니니까 스레드 만들어야한다. 서버 만드는 방식도 다르다.
	
	/*
	 * url: /replies
	 * 
	 * bno번 게시글의 페이징 처리된 댓글 목록
	 * 1. /replies/{bno}/{page}         page list:GET방식 -R
	 * 2. /replies						regist:POST방식 :댓글입력 -C
	 * 3. /replies/{rno}  				modify:PUT,PATCH방식, rno댓글의 수정 -U
	 * 4. /replies/{bno}/{rno}/{page}   remove:DELETE방식:rno댓글의 삭제  //총 갯수 bno 지우기 rno 현재페이지page (넘겨야되나 말아야되나) -D
	 */
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value="/{expmntMethId}/{page}",method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> replyList(@PathVariable("expmntMethId") String expmntMethId,@PathVariable("page") int page) throws Exception
	{
		//타입,이름을 딱딱 맞춰야 함. -> 많은 데이터를 보내는 용도가 아니다.
		//항공의 경우 위도와 경도만 받고 딱 끝내는 것처럼...
		
		//파일명 넣으면 안됨. 확장자가 안들어감. 어쨋든 매퍼가 받음.
		//서버가 파일을 받아서 이미지인지 아닌지 확인하려고함 -> 확장자를 봐야함 -> 근데 이게 안들어오니까 확인불가.
		
		//이런 pathVariable은 우리가 생각하는 form데이터가 아니라, 순수 데이터 (숫자, 문자) 그걸 처리하기 위한거다.
		//소수점을 보내야할땐 ? 엔드포인트에 주지말고 중간에 줘버린다. 그럼 그건 가져온다. 매퍼가 자르지 않는다.
		//엔드포인트 쩜 이하는 무조건 자른다.
		
		//사이트 매쉬엔 걸리지않는다. response out으로 나가는 놈이다.
		//사이트 매쉬의 포워드 형식에 걸리지 않는다. 
		//jackson이 객체를 받아서 내보낼때 포워드로 내보내는게 아니라 response out으로 나가기때문에.
		//헤더에 html이 없으면 사이트매쉬가 관여안한다. 그게 html 파서가 하는일이다.
		
		//톰켓에서 내보내는 에러페이지는 필터에 적용을 안받고 바로나간다.
		
		ResponseEntity<Map<String, Object>> entity=null;
		
		Criteria cri = new Criteria();
		cri.setPage(page);
		
		Map<String, Object> dataMap=replyService.getReplyListByExpmntMethId(expmntMethId, cri);
		entity=new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="",method=RequestMethod.POST)
	public ResponseEntity<String> regist(@RequestBody replyCommand registReq) throws Exception
	{
		ResponseEntity<String> entity=null;
		
//		reply.setReplytext(HTMLInputFilter.htmlSpecialChars(reply.getReplytext()));
		ReplyVO reply = registReq.toReplyVO();
		
		replyService.registReply(reply);
		
		Criteria cri=new Criteria();

		//아래부터는 오버스펙일 수 있다.
		Map<String, Object> dataMap = replyService.getReplyListByExpmntMethId(reply.getExpmntMethId(), cri);
		PageMaker pageMaker = (PageMaker)dataMap.get("pageMaker");
		int realEndPage = pageMaker.getRealEndPage();
		
		entity=new ResponseEntity<String>(realEndPage+"",HttpStatus.OK);
		
		return entity;
	}
	
//	@RequestMapping(value="/{rno}",method= {RequestMethod.PUT,RequestMethod.PATCH})
//	public ResponseEntity<String> modify(@PathVariable("rno") int rno,@RequestBody ReplyVO reply) throws Exception
//	{
//		//중요한건머야. rest 컨트롤러는 에러를 직접 던져야함. 
//		//success가 받기때문에 에러면 에러를 던져야지, fail.jsp 이런거 만들어서 forward 하면 안된다고!
//		
//		ResponseEntity<String> entity=null;
//		
//		reply.setRno(rno);
//		
//		replyService.modifyReply(reply);
//		entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
//		
//		return entity;
//	}
//	
//	@RequestMapping(value="/{expmntMethId}/{rno}/{page}",method=RequestMethod.DELETE)
//	public ResponseEntity<String> remove(@PathVariable("expmntMethId") String expmntMethId, @PathVariable("rno")int rno, @PathVariable("page") int page) throws Exception
//	{
//		ResponseEntity<String> entity=null;
//		
//		replyService.removeReply(rno);
//		
//		Criteria cri=new Criteria();
//		
//		Map<String, Object> dataMap = replyService.getReplyListByExpmntMethId(expmntMethId, cri);
//		PageMaker pageMaker= (PageMaker)dataMap.get("pageMaker");
//		
//		int realEndPage = pageMaker.getRealEndPage();
//		if(page>realEndPage) {page=realEndPage;}
//		
//		entity=new ResponseEntity<String>(""+page,HttpStatus.OK);
//		
//		return entity;
//	}
	
}
