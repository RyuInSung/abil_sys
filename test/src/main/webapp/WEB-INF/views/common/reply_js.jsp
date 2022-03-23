<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}
<div class="replyLi" >
	<div class="user-block">
		<%-- <img src="<%=request.getContextPath()%>/member/getPicture.do?picture={{picture}}" class="img-circle img-bordered-sm"/> --%>
		<%-- <img src="<%=request.getContextPath()%>/member/getPicture.do/{{picture}}" class="img-circle img-bordered-sm"/> --%>
		<%-- <img src="<%=request.getContextPath()%>/member/getPictureById.do/{{replyer}}" class="img-circle img-bordered-sm"/> --%>
		<img src="<%=request.getContextPath() %>/resources/images/01.jpg" class="img-circle img-bordered-sm"/>
    </div>
	
 	<div class="timeline-item" >
  		<span class="time">
    		<i class="fa fa-clock"></i>{{prettifyDate regDate}}
	 		<a class="btn btn-primary btn-xs {{rno}}-a" id="modifyReplyBtn" data-rno={{rno}}
				onclick="replyModifyModal_go('{{rno}}');"				
				style="display:{{VisibleByLoginCheck replyer}};"
	    		data-replyer={{replyer}} data-toggle="modal" data-target="#modifyModal">Modify</a>
  		</span>
	
  		<h3 class="timeline-header"><strong style="display:none;">{{rno}}</strong>{{replyer}}</h3>
  		<div class="timeline-body" id="{{rno}}-replytext">{{replytext}} </div>

		<%--대댓글--%>
		{{#each replyReplyList}}
			<span class="time" style="background-color:#CDECFA;">
    		<i class="fa fa-clock"></i>{{prettifyDate replyRegDate}}
	 			<a class="btn btn-primary btn-xs {{rrno}}-a" id="modifyReplyBtn" data-rrno={{rrno}}
				onclick="replyModifyModal_go('{{rrno}}');"				
				style="display:{{VisibleByLoginCheck replyReplyer}};"
	    		data-replyer={{replyReplyer}} data-toggle="modal" data-target="#modifyModal">Modify</a>
  			</span>
			<h3 class="timeline-header" style="background-color:#CDECFA;"><strong style="display:none;">{{rrno}}</strong>└{{replyReplyer}}</h3>
  			<div class="timeline-body" id="{{rrno}}-replyReplyText" style="background-color:#CDECFA;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{replyReplyText}} </div>
		{{/each}}
		<div class="replyReply-input">
			<input class="form-control" type="text"	placeholder="대댓글을 입력하시오." id="newReplyReplyText{{rno}}">
			<br/>
			<button type="button" class="btn btn-info" id="replyReplyAddBtn" onclick="replyReplyRegist_go('{{rno}}');">대댓글 등록</button>
		</div>
		<%--대댓글--%>
	</div>
</div>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="reply-pagination-template" >
<li class="paginate_button page-item">
	<a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-left'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{#if prev}}{{prevPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-left'></i>
	</a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{signActive this}} ">
	<a href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		{{this}}
	</a>
</li>
{{/each}}

<li class="paginate_button page-item ">
	<a href="{{#if next}}{{nextPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-right'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-right'></i>
	</a>
</li>	
</script>

<script>

	window.onload=function(){
		//getPage('<%=request.getContextPath()%>/reply/list.do?bno=${board.bno}&page='+replyPage);
		getPage('<%=request.getContextPath()%>/replies/${commExpmntMeth.expmntMethId }/'+replyPage);
		
		//핸들러 직접 잡아서 구현
		//처음 로딩 이벤트(캡쳐링 버블링)
		//해당 로딩될때 완료된 요소를 잡아서 하는이벤트가 있고, 나머지 이후에 생긴 애들을 잡아서
		//캡쳐링은 다잡고, 버블링은 이후에 있는놈만 잡을수있따.
		//
		//ul태그에 걸린거다. ul태그의 버블링이다.
		/* $('ul.pagination').on('click',function(event){
			alert("ul click");
			
			return false; //prevent default 궂이 안적어줘도 return false하면 dispatcher가 안다. 
		}); */
		
		//li에 걸린거다.
		$('ul.pagination').on('click','li a',function(event){
			//치고 나왓을때 li태그 있는지 확인한다.
			//alert("ul click");
			
			if($(this).attr("href"))
			{
				replyPage=$(this).attr("href");
				console.log($(this));
				//getPage("<%=request.getContextPath()%>/reply/list.do?bno=${board.bno}&page="+replyPage);
				getPage('<%=request.getContextPath()%>/replies/${commExpmntMeth.expmntMethId}/'+replyPage);
			}
			
			return false; //prevent default 궂이 안적어줘도 return false하면 dispatcher가 안다.
		});
		
		//결론: li 직접  click 잡으면 안나옴. li를 직접 엘리멘트로 잡아서 이벤트 못준다.
	}
	
	var replyPage=1;
	
	function printData(replyArr,target,templateObject) // (백단디비,순수태그,순수글자)
	{
		var template=Handlebars.compile(templateObject.html()); //순수글자 컴파일
		var html=template(replyArr); //컴파일 안에 디비 넣어준다.
		$('.replyLi').remove();
		target.after(html);
	}
	
	function printPagination(pageMaker,target,templateObject)
	{
		var pageNum=new Array(pageMaker.endPage-pageMaker.startPage+1);
		
		for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++)
		{
			pageNum[i]=pageMaker.startPage+i;
		}
		
		pageMaker.pageNum=pageNum;
		pageMaker.prevPageNum=pageMaker.startPage-1;
		pageMaker.nextPageNum=pageMaker.endPage+1;
		
		var template=Handlebars.compile(templateObject.html());
		var html=template(pageMaker);
		target.html("").html(html);
	}
	
	function getPage(pageInfo)
	{
		$.ajax({
			url:pageInfo,
			type:'get',
			success:function(data){
				printData(data.replyList,$('#repliesDiv'),$('#reply-list-template'));
				printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
			},
			error:function(errer){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
		
		/* $.getJSON(pageInfo,function(data){
			printData(data.replyList,$('#repliesDiv'),$('#reply-list-template'));
			printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
		}); */
	}
	
	Handlebars.registerHelper({
		"prettifyDate":function(timeValue){ //Handlebars에 날짜출력함수 등록.
			var dateObj=new Date(timeValue);
			var year=dateObj.getFullYear();
			var month=dateObj.getMonth()+1;
			var date=dateObj.getDate();
			return year+"/"+month+"/"+date;
		},
		"VisibleByLoginCheck":function(replyer){
			var result="none";
			if(replyer == "${loginUser.id}") result="visible";
			return result;
		},
		"signActive":function(pageNum){
			if(pageNum==replyPage) return 'active';
		}
	});
	
	function replyRegist_go()
	{
		//alert("add reply");
		
		var replytext=$('#newReplyText').val();
		//var bno=${board.bno}
		var expmntMethId=$('input[name="expmntMethId"]').val();
		
		if(!replytext)
		{
			alert("내용은 필수입니다.");
			return;
		}
		
		//alert(replyer+":"+replytext+":"+bno);
		var data={
				"expmntMethId":""+expmntMethId+"", //그냥 bno로 써도 상관없는듯.
				//"replyer":"${loginUser.id}",
				"replytext":replytext
		}
		
		$.ajax({
			//url:"<%=request.getContextPath()%>/reply/regist",
			//alert("dhidhi");
			url:"<%=request.getContextPath()%>/replies",
			type:"post",
			data:JSON.stringify(data),
			contentType:"application/json",
			success:function(data){
				alert('댓글이 등록되었습니다.\n마지막페이지로 이동합니다.');
				replyPage=data; //페이지이동
				/* if(result[0].trim()!)
				{
					alert();
				} */
				
				//getPage("<%=request.getContextPath()%>/reply/list.do?bno="+bno+"&page="+data); //리스트
				getPage('<%=request.getContextPath()%>/replies/${commExpmntMeth.expmntMethId}/'+data);
				$('#newReplyText').val("");
			},
			error:function(data){
				alert('댓글이 등록을 실패했습니다.');
				//AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
		
	}
	
	function replyReplyRegist_go(rno)
	{
		var replyreplytext=$('#'+'newReplyReplyText'+rno).val();
		var expmntMethId=$('input[name="expmntMethId"]').val();
		
		if(!replyreplytext)
		{
			alert("내용은 필수입니다.");
			return;
		}
		
		var data={
				"expmntMethId":""+expmntMethId+"",
				"replyReplyText":replyreplytext,
				"rno":rno
		}
		
		$.ajax({
			url:"<%=request.getContextPath()%>/repliesReplies",
			type:"post",
			data:JSON.stringify(data),
			contentType:"application/json",
			success:function(data){
				alert('대댓글이 등록되었습니다.');
				replyPage=data; //페이지이동
				getPage('<%=request.getContextPath()%>/replies/${commExpmntMeth.expmntMethId}/'+1);
				/* window.location.reload(); */
				$('#newReplyReplyText').val("");
			},
			error:function(data){
				alert('댓글이 등록을 실패했습니다.');
			}
		});
		
	} 
	
	function replyModifyModal_go(rno){
		$('div#modifyModal div.modal-body #replytext').val($('div#'+rno+'-replytext').text());
		$('div#modifyModal div.modal-header h4.modal-title').text(rno);
	}
	
	function replyModify_go(){
		var rno=$('.modal-title').text();
		var replytext=$('#replytext').val();
		
		var sendData={
				rno:rno, //앞에는 json이 키값이니까 스트링으로 안다.
				replytext:replytext
		}
		
		$.ajax({
			//url:"<%=request.getContextPath()%>/reply/modify.do",
			url:"<%=request.getContextPath()%>/replies/"+rno,
			//type:"post",
			type:"put", //브라우저 호환성. put이 안들어가는 브라우저도 있다. 크롬은 들어가는데, 안들어가는애들을 위해서 header를 고의적으로 넣어야한다.
			headers:{
				"X-HTTP-Method-Override":"PUT"
			},
			data:JSON.stringify(sendData),
			contentType:"application/json",
			success:function(result){
				alert("수정되었습니다.");
				//getPage("<%=request.getContextPath()%>/reply/list.do?bno=${board.bno}&page="+replyPage);
				getPage('<%=request.getContextPath()%>/replies/${commExpmntMeth.expmntMethId}/'+replyPage);
			},
			error:function(){
				alert('수정 실패했습니다.');
				//AjaxErrorSecurityRedirectHandler(error.status);
			},
			complete:function(){ //finally 같은놈. 콜백함수다.
				$('#modifyModal').modal('hide'); //강제적으로 모달 닫아준다.
			}
		});
	}
	
	function replyRemove_go(){
		//alert('delete');
		
		var rno=$('.modal-title').text();
		
		$.ajax({
			//url:"<%=request.getContextPath()%>/reply/remove.do?rno="+rno+"&page="+replyPage+"&bno=${board.bno}",
			url:"<%=request.getContextPath()%>/replies/${commExpmntMeth.expmntMethId}/"+rno+"/"+replyPage,
			//type:"get",
			type:"DELETE",
			header:{
				"X-HTTP-Method-Override":"DELETE"
			},
			success:function(page){
				alert("삭제되었습니다.");
				//getPage("<%=request.getContextPath()%>/reply/list.do?bno=${board.bno}&page="+page);
				//alert('hi');
				getPage('<%=request.getContextPath()%>/replies/${commExpmntMeth.expmntMethId}/'+page);
				replyPage=page;
			},
			error:function(error){
				//alert('삭제 실패했습니다.');
				AjaxErrorSecurityRedirectHandler(error.status);
			},
			complete:function(){
				$('#modifyModal').modal('hide');
			}
		});
	}
</script>