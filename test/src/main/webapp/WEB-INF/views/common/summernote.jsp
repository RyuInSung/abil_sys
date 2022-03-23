<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<script>
	function summernote_go(target)
	{
		target.summernote({
			placeholder:"여기에 내용을 적으세요",
			lang:"ko-KR",
			height:250,
			disabledResizeEditer:true,
			callbacks:{
				onImageUpload:function(files,editor,welEditable){
					
					//유효성 검사
					for(var file of files)
					{
						if(file.name.substring(file.name.lastIndexOf(".")+1).toUpperCase()!="JPG")
						{
							alert("JPG 이미지 형식만 가능합니다.");
							return;
						}
						
						//alert(file.name);
						if(file.size>1024*1024*5)
						{
							alert("이미지는 5MB 미만입니다.");
							return;
						}
					}
					
					//하나씩 보내기 (비동기)
					for(var file of files)
					{
						sendFile(file,this);
					}
				},
				onMediaDelete:function(target){
					//alert(target.attr("src"));
					//alert(target[0].src);
					//순수자바스크립트 객체가 제이쿼리 객체안에 들어있다.
					
					//var splitSrc=target.attr("src").split("="); //이건안댐... 제이쿼리 x!!
					/* var splitSrc=target[0].src.split("=");
					var fileName=splitSrc[splitSrc.length-1];
					alert(fileName); */
					
					alert(target[0].src);
					deleteFile(target[0].src); //http://localhost/command_bootstrap/getImg.do?filename=uuid$$파일명.jpg
				}
				
			}
			
		});
	}
	
	function deleteFile(src) // /command_bootstrap/getimage=uuid$$셔틀콕.jpg
	{
		var splitSrc=src.split("="); //http://localhost/command_bootstrap/getImg.do?filename=uuid$$파일명.jpg
		var fileName=splitSrc[splitSrc.length-1]; // uuid$$셔틀콕.jpg
		
		var fileData={fileName:fileName}; //객체 {fileName:uuid$$셔틀콕} -> 이것도 1depth 라고 부름.
		alert(fileData);
		console.log(fileData);
		alert(JSON.stringify(fileData));	
		$.ajax({
			url:"<%=request.getContextPath()%>/deleteImg.do",
			data:JSON.stringify(fileData),
			type:"post", //multipart/form-data, 길이제한이 있거나, 의도적으로 주소줄에 노출되는걸 피하기 위해서.
			contentType:"application/json", //보낼때. 서버로 들어갈때.
			success:function(res){
				console.log(res);
			},
			error:function(){
				alert("이미지 삭제가 불가합니다.");
			}
		});
	}
	
	
	function sendFile(file,el)
	{
		var form_data=new FormData();
		form_data.append("file",file);
		$.ajax({
			data:form_data,
			type:"POST",
			url:'<%=request.getContextPath()%>/uploadImg.do',
			cache:false, //캐시 안쓴다.
			contentType:false, //서버로 들어가는 타입.
			processData:false,
			success:function(img_url){
				//alert(img_url+"성공");
				$(el).summernote('editor.insertImage',img_url);
				//이미지 태그는 따로 크기를 지정하지 않으면 이미지 파일 크기 그대로 나간다.
			},
			error:function(){
				alert(file.name+"업로드에 실패했습니다.");
			}
		});
	}
</script>