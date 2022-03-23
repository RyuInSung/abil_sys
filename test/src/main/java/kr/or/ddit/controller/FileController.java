package kr.or.ddit.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.nio.file.attribute.FileTime;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.util.MakeFileName;
import kr.or.ddit.vo.FileJsonVO;

@Controller
public class FileController {

	private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	
	@Resource(name="filePath")
	private String filePath;
	
	@RequestMapping("/common/sub4")
	public ModelAndView personalMain(ModelAndView mnv,@RequestParam(defaultValue="#") String current) throws Exception
	{
		String url="common/sub4";
		
		//휴지통 만들어주기
		File trash = new File(filePath+"휴지통/");
		trash.mkdirs();
		
		//jstree용 리스트 출력
		List<FileJsonVO> docList=new ArrayList<FileJsonVO>();
		dfs(filePath,docList,"",true);
		List<FileJsonVO> orderedDocList = sorting(docList);
		
		//심어주는 부분
		mnv.addObject("docList",orderedDocList);
		mnv.setViewName(url);
		mnv.addObject("current",current);
			
		return mnv;
	}
	
	@RequestMapping("/common/sub5")
	public ModelAndView trash(ModelAndView mnv,@RequestParam(defaultValue="#") String current) throws Exception
	{
		String url="common/sub5";
		
		//휴지통 만들어주기
		File trash = new File(filePath+"휴지통/");
		trash.mkdirs();
		
		//jstree용 리스트 출력
		List<FileJsonVO> docList=new ArrayList<FileJsonVO>();
		dfs(filePath+"휴지통/",docList,"",true);
		List<FileJsonVO> orderedDocList = sorting(docList);
		
		//심어주는 부분
		mnv.addObject("docList",orderedDocList);
		mnv.setViewName(url);
		mnv.addObject("current",current);
			
		return mnv;
	}
	
	private void dfs(String directName,List<FileJsonVO> docList,String parent,boolean isRoot) throws IOException
	{
		File temp = new File(directName);
		temp.mkdirs();
		File[] items = temp.listFiles();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");

		for(File item:items)
		{
			FileJsonVO doc=null;
			
			BasicFileAttributes attrs = Files.readAttributes(item.toPath(), BasicFileAttributes.class);
			FileTime time = attrs.creationTime();
			
			if (item.isDirectory()) //폴더면
			{
				if(item.getName().equals("휴지통")) continue;
				doc=new FileJsonVO(item.getAbsolutePath().replace(File.separator, "/")+"/" , isRoot?"#":""+parent , item.getName() , "", format.format(new Date(time.toMillis())) , Math.round(((double)item.length()/1024)*100)/100.0,item.getName() ); //fa fa-folder text-warning
				docList.add(doc);
				String addDirect=directName+item.getName()+"/";
				dfs(addDirect,docList,item.getAbsolutePath().replace(File.separator, "/")+"/",false);
			}
			else //파일이면
			{
				doc=new FileJsonVO(directName+item.getName() , isRoot?"#":""+parent ,  MakeFileName.parseFileNameFromUUID(item.getName(), "\\$\\$") , "fa fa-file  text-warning" , format.format(new Date(time.toMillis())) , Math.round(((double)item.length()/1024)*100)/100.0,item.getName());
				docList.add(doc);
			}
		}
	}
	
	private List<FileJsonVO> sorting(List<FileJsonVO> docList) throws Exception
	{
		List<FileJsonVO> temp1=new ArrayList<FileJsonVO>();
		List<FileJsonVO> temp2=new ArrayList<FileJsonVO>();
		List<FileJsonVO> temp3=new ArrayList<FileJsonVO>();
		for(int i=0;i<docList.size();i++)
		{
			if(docList.get(i).getIcon().equals("fa fa-file  text-warning")) temp2.add(docList.get(i));
			else temp1.add(docList.get(i));
		}
		
		temp3.addAll(temp1);
		temp3.addAll(temp2);
		
		return temp3;
	}
	
	@RequestMapping("/file/newFoldForm")
	public ModelAndView newFoldForm(ModelAndView mnv,String current) throws Exception {
		String url="common/newFoldForm";
		
		mnv.addObject("current",current);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/file/makeFold")
	public String makeFold(HttpSession session,@RequestParam(defaultValue="새폴더") String foldName,String foldLocate) throws Exception
	{
		String url="common/successMakeFold";
		
		String rootPath=filePath+foldLocate+foldName+"/";
		File newFold=new File(rootPath);
		newFold.mkdirs();
		
		return url;
	}
	
	@RequestMapping("/file/uploadForm")
	public ModelAndView uploadForm(ModelAndView mnv,String current) throws Exception {
		String url="common/uploadForm";
		
		mnv.addObject("current",current);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/file/uploadFile")
	public String uploadFile(@RequestParam("files") MultipartFile files,String foldLocate) throws Exception
	{
		String url="common/successUploadFile";
		
		String rootPath=filePath+foldLocate; 
		File newFold=new File(rootPath);
		newFold.mkdirs();
		
		savePicture(files, rootPath);
		
		return url;
	}
	
	private String savePicture(MultipartFile multi,String uploadPath) throws IOException
	{
		String fileName=null;
		//파일유무확인
		if(!(multi==null||multi.isEmpty()||multi.getSize()>1024*1024*5))
		{
			fileName=MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile=new File(uploadPath,fileName);
			
			storeFile.mkdirs();
			//local HDD에 저장.
			multi.transferTo(storeFile);
		}
		return fileName;
	}
	
	//다운로드용 메서드.
	@RequestMapping("/file/getFile")
	public String getFile(String attachSaveName,String attachSavePath,Model model) throws Exception
	{
		String url="downloadFile"; //빈네임 뷰 리솔버
		
		if(attachSavePath.equals("root")) attachSavePath="C:\\test\\files";
		logger.info("saveName : {}",attachSaveName);
		logger.info("savePath : {}",attachSavePath);
		
		model.addAttribute("saveName",attachSaveName); //==request.setAttribute("filename",attach.getFileName());
		model.addAttribute("savePath",attachSavePath);
			
		return url;
	}
	
	@ResponseBody
	@RequestMapping("/file/getFoldList")
	public ResponseEntity<List<FileJsonVO>> getFoldList() throws Exception
	{
		ResponseEntity<List<FileJsonVO>> result=null;
		
		// jstree용 리스트 출력
		List<FileJsonVO> docList = new ArrayList<FileJsonVO>();
		dfs(filePath, docList, "", true);
		List<FileJsonVO> orderedDocList = sorting(docList);

		result=new ResponseEntity<List<FileJsonVO>>(orderedDocList,HttpStatus.OK);
		
		return result;
	}
	
	@RequestMapping("/file/goTrash")
	public ResponseEntity<String> goTrash(@RequestParam(value="sendArray[]") List<String> deleteList) throws Exception
	{
		ResponseEntity<String> result=null;
		
		String real=filePath+"휴지통/";
		for(int i=0;i<deleteList.size();i++)
		{
			File temp = new File(deleteList.get(i));
			String path = temp.getPath();
			int num = path.lastIndexOf(File.separator);
			real += path.substring(num+1);
			
			Path oldFile = Paths.get(path);
			Path newFile = Paths.get(real);
			Files.move(oldFile, newFile, StandardCopyOption.ATOMIC_MOVE);
		}
		
		return result;
	}
	
	@RequestMapping("/file/movingForm")
	public ModelAndView movingForm(ModelAndView mnv,@RequestParam(defaultValue="#") String current,String array) throws Exception {
		
		String url="common/movingForm";
		
		// jstree용 리스트 출력
		List<FileJsonVO> docList = new ArrayList<FileJsonVO>();

		dfsForMovingForm(filePath, docList, "", true);
		docList.add(new FileJsonVO(filePath, "#" , "모든 폴더", "", "", 0,""));
//		Collections.reverse(docList);
		List<FileJsonVO> temp3 = sorting(docList);
		
		List<String> moveList=new ArrayList<String>();
		String[] temp = array.split(",");
		for(int i=0;i<temp.length;i++)
		{
			moveList.add(temp[i]);
		}
		
		// 심어주는 부분
		mnv.addObject("docList", temp3);
		mnv.setViewName(url);
		mnv.addObject("current", current);
		mnv.addObject("moveList",moveList);
		mnv.addObject("cnt",temp.length);
		
		return mnv;
	}
	
	private void dfsForMovingForm(String directName,List<FileJsonVO> docList,String parent,boolean isRoot) throws IOException
	{
		File temp = new File(directName);
		temp.mkdirs();
		File[] items = temp.listFiles();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");

		for(File item:items)
		{
			FileJsonVO doc=null;
			
			BasicFileAttributes attrs = Files.readAttributes(item.toPath(), BasicFileAttributes.class);
			FileTime time = attrs.creationTime();
			
			if (item.isDirectory()) //폴더면
			{
				if(item.getName().equals("휴지통")) continue;
				doc=new FileJsonVO(item.getAbsolutePath().replace(File.separator, "/")+"/" , isRoot?directName:""+parent , item.getName() , "", format.format(new Date(time.toMillis())) , Math.round(((double)item.length()/1024)*100)/100.0,item.getName() ); //fa fa-folder text-warning
				docList.add(doc);
				String addDirect=directName+item.getName()+"/";
				dfsForMovingForm(addDirect,docList,item.getAbsolutePath().replace(File.separator, "/")+"/",false);
			}
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/file/moving",produces="text/plain;charset=utf-8")
	public ResponseEntity<String> moving(@RequestParam(value="sendArray[]") List<String> moveList, String target) throws Exception
	{
		ResponseEntity<String> result=null;
		
		for(int i=0;i<moveList.size();i++)
		{
			File temp = new File(moveList.get(i));
			String path = temp.getPath();
			int num = path.lastIndexOf(File.separator);
			String real = target+path.substring(num+1);

			File dup=new File(real);
			if(dup.exists())
			{
				result=new ResponseEntity<String>("이름이 중복된 파일이 검색되어 이동이 불가합니다.",HttpStatus.INTERNAL_SERVER_ERROR);
				return result;
			}
			else result=new ResponseEntity<String>("",HttpStatus.INTERNAL_SERVER_ERROR);
			
			Path oldFile = Paths.get(path);
			Path newFile = Paths.get(real);
			Files.move(oldFile, newFile, StandardCopyOption.ATOMIC_MOVE);
		}
		result=new ResponseEntity<String>("이동 성공하였습니다.",HttpStatus.OK);
		
		return result;
	}
	
	@RequestMapping("/file/nameChangeForm")
	public ModelAndView nameChangeForm(ModelAndView mnv,String current) throws Exception {
		
		String url="common/nameChangeForm";
		
		String path=null;
		String name=null;
		
		if(current.charAt(current.length()-1)=='/') //폴더면
		{
			String[] divide = current.split("/");
			name=divide[divide.length-1];
			int num = current.indexOf(name);
			path=current.substring(0,num);
		}
		else //파일이면
		{
			int num = current.lastIndexOf("/");
			path = current.substring(0,num+1);
			name = current.substring(num+1);
		}
		mnv.addObject("path",path);
		mnv.addObject("name",name);
		mnv.addObject("current",current);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/file/changeName")
	public String changeName(String originalName,String originalPath,String target) throws Exception
	{
		String url="common/successChangeName";

		String extension=null;
		if(originalName.contains(".")) //파일
		{
			extension=originalName.substring(originalName.indexOf("."));
		}
			
		String before = originalPath+originalName;
		String after = originalPath+target;
		if(extension!=null) after+=extension;
		
		Path oldFile = Paths.get(before);
		Path newFile = Paths.get(after);
		
		Files.move(oldFile, newFile);
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping("/file/getTrashList")
	public ResponseEntity<List<FileJsonVO>> getTrashList() throws Exception
	{
		ResponseEntity<List<FileJsonVO>> result=null;
		
		String rootPath = filePath + "/휴지통/";
		
		// jstree용 리스트 출력
		List<FileJsonVO> docList = new ArrayList<FileJsonVO>();

		dfs(rootPath, docList, "", true);
		List<FileJsonVO> temp3 = sorting(docList);

		result=new ResponseEntity<List<FileJsonVO>>(temp3,HttpStatus.OK);
		
		return result;
	}
	

	@RequestMapping("/file/delete")
	public ResponseEntity<String> delete(@RequestParam(value="sendArray[]") List<String> deleteList) throws Exception
	{
		ResponseEntity<String> result=null;
		
		for(int i=0;i<deleteList.size();i++)
		{
			File temp = new File(deleteList.get(i));
			dfsForDelete(temp);
		}
		
		return result;
	}
	
	private void dfsForDelete(File file) throws Exception
	{
		if(file.isDirectory())
		{
			File[] temps = file.listFiles();
			for(File temp:temps)
			{
				dfsForDelete(temp);
			}
			file.delete();
		}
		else
		{
			file.delete();
		}
	}
	
	@ResponseBody
	@RequestMapping("/file/nameCheck")
	public ResponseEntity<String> nameCheck(String current,String name) throws Exception
	{
		ResponseEntity<String> result=null;
		
		File file = new File(current);
		if(file.getName().equals(name)) result=new ResponseEntity<String>("Fail",HttpStatus.OK);
		else {
			if(file.isDirectory()) //폴더면
			{
				String[] divide = current.split("/");
				String foldName=divide[divide.length-1];
				int num = current.indexOf(foldName);
				String foldPath=current.substring(0,num);

				File check = new File(foldPath);
				File[] checkList = check.listFiles();
				for(File ch:checkList) {
					if(ch.getName().equals(name)) {
						return result=new ResponseEntity<String>("Fail",HttpStatus.OK);
					}
				}
			}
			else //파일이면
			{
				int num = current.lastIndexOf("/");
				String filePath = current.substring(0,num+1);
				String fileName = current.substring(num+1);
				
				
				File check = new File(filePath);
				File[] checkList = check.listFiles();
				for(File ch:checkList) {
					if(ch.getName().equals(name)) {
						return result=new ResponseEntity<String>("Fail",HttpStatus.OK);
					}
				}
				
			}
			
			result=new ResponseEntity<String>("Success",HttpStatus.OK);
		}
		
		

		return result;
	}
}
