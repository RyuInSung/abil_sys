package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.command.CommExpmntMethCommand;
import kr.or.ddit.command.CriteriaCommand;
import kr.or.ddit.service.CommExpmntMethService;
import kr.or.ddit.vo.CommExpmntMethVO;
import kr.or.ddit.vo.DateData;
import kr.or.ddit.vo.FileChangeVO;

@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	private CommExpmntMethService commExpmntMethService;
	
	@Resource(name="filePath")
	private String filePath;
	
	@RequestMapping("/common/test") 
	public void test() throws Exception {}
	
	@RequestMapping("/common/test2") 
	public void test2() throws Exception {}
	
	@RequestMapping(value="/index.do",method=RequestMethod.GET)
	public String index(@RequestParam(defaultValue="m1") String mCode,Model model) throws Exception
	{
		String url="common/indexPage";
		logger.info("mCode Check : {}", mCode);
		
		String mUrl=null;
		if(mCode.equals("m1")) mUrl="main";
		else if(mCode.equals("m2")) mUrl="sub1";
		else if(mCode.equals("m3")) mUrl="sub2";
		else if(mCode.equals("m4")) mUrl="sub3";
		else if(mCode.equals("m5")) mUrl="sub4";
		else if(mCode.equals("m6")) mUrl="sub5";
		else if(mCode.equals("m7")) mUrl="sub6";
			
		model.addAttribute("mUrl", mUrl);
		model.addAttribute("mCode",mCode);
		return url;
	}
	
	@RequestMapping(value="/common/main",method=RequestMethod.GET)
	public String main() throws Exception
	{
		String url="common/main";
		logger.info("Welcome home! {}.", "test success");
		return url;
	}
	
	@RequestMapping("/common/sub1") 
	public void sub1() throws Exception
	{
		logger.info("sub1 {}.", "sub success");
	}
	
	@RequestMapping("/common/sub2")
	public ModelAndView sub2(ModelAndView mnv,CriteriaCommand criCommand) throws Exception
	{
		String url="common/sub2";
		logger.info("sub2 {}.", "sub success");
		
		Map<String, Object> map = commExpmntMethService.getCommExpmntMethList(criCommand.toCommExpmntMethCriteria());
		
		mnv.setViewName(url);
		mnv.addAllObjects(map);
		
		return mnv;
	}
	
	@RequestMapping("/common/registForm")
	public void registForm() throws Exception{}
	
	
	@RequestMapping(value="/common/regist",method=RequestMethod.POST)
	public String regist(CommExpmntMethCommand registReq,RedirectAttributes rttr) throws Exception{
		String url="redirect:/common/registForm";
		
		CommExpmntMethVO commExpmntMeth = registReq.toCommExpmntMethVO(filePath);
		commExpmntMethService.registCommExpMeth(commExpmntMeth,filePath);
		
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	
	@RequestMapping("/common/detail")
	public String detail(String expmntMethId,String from,Model model) throws Exception{
		String url="common/detail";
		
		CommExpmntMethVO commExpmntMeth = commExpmntMethService.getCommExpmntMethByExpmntMethId(expmntMethId);
		
		model.addAttribute("commExpmntMeth",commExpmntMeth);
		
		return url;
	}
	
	@RequestMapping("/common/modifyForm")
	public String modifyForm(String expmntMethId,Model model) throws Exception{
		String url="common/modifyForm";
		
		CommExpmntMethVO commExpmntMeth = commExpmntMethService.getCommExpmntMethByExpmntMethId(expmntMethId);
		
		model.addAttribute("commExpmntMeth",commExpmntMeth);
		
		return url;
	}
	
	@RequestMapping("/common/modify")
	public String modify(CommExpmntMethCommand modifyReq,RedirectAttributes rttr,@RequestParam(required=false,value="remainName") List<String> remainList) throws Exception{
		String url="redirect:/common/detail";

		CommExpmntMethVO commExpmntMeth = modifyReq.toCommExpmntMethVO(filePath);
		
		commExpmntMethService.modifyCommExpMeth(commExpmntMeth,remainList,filePath);
		
		rttr.addAttribute("expmntMethId",commExpmntMeth.getExpmntMethId());
		rttr.addFlashAttribute("from","modify");
		
		return url;
	}
	
	@RequestMapping(value="/common/remove",method=RequestMethod.POST)
	public String remove(String expmntMethId,RedirectAttributes rttr) throws Exception{
		String url="redirect:/common/detail";
		
		logger.info("remove post check : {}",expmntMethId);
		
		commExpmntMethService.removeCommExpMethByExpmntMethID(expmntMethId);
		
		rttr.addAttribute("expmntMethId",expmntMethId);
		rttr.addFlashAttribute("from","remove");
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value="/common/dupCheck",method=RequestMethod.GET)
	public ResponseEntity<String> dupCheck(String expmntMethId) throws Exception{
		ResponseEntity<String> result=null;

		CommExpmntMethVO commExpmntMeth = commExpmntMethService.getCommExpmntMethByExpmntMethId(expmntMethId);
		
		if(commExpmntMeth==null) result=new ResponseEntity<String>("success",HttpStatus.OK);
		else result=new ResponseEntity<String>("fail",HttpStatus.OK);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/common/ajaxGo",method=RequestMethod.GET)
	public ResponseEntity<ArrayList<String>> ajaxGo(String tdId) throws Exception{
		ResponseEntity<ArrayList<String>> result=null;

		//DB없으니 고의적으로 만들어줌.
		ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
		ArrayList<ArrayList<String>> totalList = method(list);
		
		int num = Integer.parseInt(tdId);
		num-=1;
		result=new ResponseEntity<ArrayList<String>>(totalList.get(num),HttpStatus.OK);
		
		return result;
	}
	
	private ArrayList<ArrayList<String>> method(ArrayList<ArrayList<String>> list){
		
		ArrayList<String> temp = new ArrayList<String>();
		temp.add("1");
		temp.add("John 1번");
		temp.add("11-7-2014");
		temp.add("Approved");
		temp.add("Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.");
		list.add(temp);

		temp=new ArrayList<String>();
		temp.add("2");
		temp.add("John 2번");
		temp.add("11-7-2014");
		temp.add("Approved");
		temp.add("Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.");
		list.add(temp);
		
		temp=new ArrayList<String>();
		temp.add("3");
		temp.add("John 3번");
		temp.add("11-7-2014");
		temp.add("Approved");
		temp.add("Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.");
		list.add(temp);
		
		temp=new ArrayList<String>();
		temp.add("4");
		temp.add("John 4번");
		temp.add("11-7-2014");
		temp.add("Approved");
		temp.add("Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.");
		list.add(temp);
		
		temp=new ArrayList<String>();
		temp.add("5");
		temp.add("John 5번");
		temp.add("11-7-2014");
		temp.add("Approved");
		temp.add("Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.");
		list.add(temp);
		
		temp=new ArrayList<String>();
		temp.add("6");
		temp.add("John 6번");
		temp.add("11-7-2014");
		temp.add("Approved");
		temp.add("Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.");
		list.add(temp);
		
		temp=new ArrayList<String>();
		temp.add("7");
		temp.add("John 7번");
		temp.add("11-7-2014");
		temp.add("Approved");
		temp.add("Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.");
		list.add(temp);
		
		
		return list;
	}
	
	@RequestMapping(value = "/common/sub3", method = RequestMethod.GET)
	public String sub3(Model model, DateData dateData){
		
		String url="common/sub3";
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();

		//보이지 않는 부분.
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//나머지 빈곳 삽입.
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		return url;
	}
	
	@RequestMapping("/common/sub6")
	public ModelAndView sub6(ModelAndView mnv) throws Exception
	{
		String url="common/sub6";
		logger.info("sub2 {}.", "sub success");
		
		List<Map<String, Object>> map = commExpmntMethService.getCommExpmntMethListToJSON();
		mnv.setViewName(url);
		mnv.addObject("map",map);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(map);
		logger.info("json 1 {}",json);
		mnv.addObject("map",json);
//		json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map); 
//		logger.info("json 2 {}",json);
		
		String[] test = new String[] {"3","4"}; 
		
		return mnv;
	}
	

}
