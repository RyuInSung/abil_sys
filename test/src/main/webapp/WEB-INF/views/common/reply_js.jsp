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

		<%--λλκΈ--%>
		{{#each replyReplyList}}
			<span class="time" style="background-color:#CDECFA;">
    		<i class="fa fa-clock"></i>{{prettifyDate replyRegDate}}
	 			<a class="btn btn-primary btn-xs {{rrno}}-a" id="modifyReplyBtn" data-rrno={{rrno}}
				onclick="replyModifyModal_go('{{rrno}}');"				
				style="display:{{VisibleByLoginCheck replyReplyer}};"
	    		data-replyer={{replyReplyer}} data-toggle="modal" data-target="#modifyModal">Modify</a>
  			</span>
			<h3 class="timeline-header" style="background-color:#CDECFA;"><strong style="display:none;">{{rrno}}</strong>β{{replyReplyer}}</h3>
  			<div class="timeline-body" id="{{rrno}}-replyReplyText" style="background-color:#CDECFA;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{replyReplyText}} </div>
		{{/each}}
		<div class="replyReply-input">
			<input class="form-control" type="text"	placeholder="λλκΈμ μλ ₯νμμ€." id="newReplyReplyText{{rno}}">
			<br/>
			<button type="button" class="btn btn-info" id="replyReplyAddBtn" onclick="replyReplyRegist_go('{{rno}}');">λλκΈ λ±λ‘</button>
		</div>
		<%--λλκΈ--%>
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
		
		//νΈλ€λ¬ μ§μ  μ‘μμ κ΅¬ν
		//μ²μ λ‘λ© μ΄λ²€νΈ(μΊ‘μ³λ§ λ²λΈλ§)
		//ν΄λΉ λ‘λ©λ λ μλ£λ μμλ₯Ό μ‘μμ νλμ΄λ²€νΈκ° μκ³ , λλ¨Έμ§ μ΄νμ μκΈ΄ μ λ€μ μ‘μμ
		//μΊ‘μ³λ§μ λ€μ‘κ³ , λ²λΈλ§μ μ΄νμ μλλλ§ μ‘μμμλ°.
		//
		//ulνκ·Έμ κ±Έλ¦°κ±°λ€. ulνκ·Έμ λ²λΈλ§μ΄λ€.
		/* $('ul.pagination').on('click',function(event){
			alert("ul click");
			
			return false; //prevent default κΆμ΄ μμ μ΄μ€λ return falseνλ©΄ dispatcherκ° μλ€. 
		}); */
		
		//liμ κ±Έλ¦°κ±°λ€.
		$('ul.pagination').on('click','li a',function(event){
			//μΉκ³  λμμλ liνκ·Έ μλμ§ νμΈνλ€.
			//alert("ul click");
			
			if($(this).attr("href"))
			{
				replyPage=$(this).attr("href");
				console.log($(this));
				//getPage("<%=request.getContextPath()%>/reply/list.do?bno=${board.bno}&page="+replyPage);
				getPage('<%=request.getContextPath()%>/replies/${commExpmntMeth.expmntMethId}/'+replyPage);
			}
			
			return false; //prevent default κΆμ΄ μμ μ΄μ€λ return falseνλ©΄ dispatcherκ° μλ€.
		});
		
		//κ²°λ‘ : li μ§μ   click μ‘μΌλ©΄ μλμ΄. liλ₯Ό μ§μ  μλ¦¬λ©νΈλ‘ μ‘μμ μ΄λ²€νΈ λͺ»μ€λ€.
	}
	
	var replyPage=1;
	
	function printData(replyArr,target,templateObject) // (λ°±λ¨λλΉ,μμνκ·Έ,μμκΈμ)
	{
		var template=Handlebars.compile(templateObject.html()); //μμκΈμ μ»΄νμΌ
		var html=template(replyArr); //μ»΄νμΌ μμ λλΉ λ£μ΄μ€λ€.
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
		"prettifyDate":function(timeValue){ //Handlebarsμ λ μ§μΆλ ₯ν¨μ λ±λ‘.
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
			alert("λ΄μ©μ νμμλλ€.");
			return;
		}
		
		//alert(replyer+":"+replytext+":"+bno);
		var data={
				"expmntMethId":""+expmntMethId+"", //κ·Έλ₯ bnoλ‘ μ¨λ μκ΄μλλ―.
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
				alert('λκΈμ΄ λ±λ‘λμμ΅λλ€.\nλ§μ§λ§νμ΄μ§λ‘ μ΄λν©λλ€.');
				replyPage=data; //νμ΄μ§μ΄λ
				/* if(result[0].trim()!)
				{
					alert();
				} */
				
				//getPage("<%=request.getContextPath()%>/reply/list.do?bno="+bno+"&page="+data); //λ¦¬μ€νΈ
				getPage('<%=request.getContextPath()%>/replies/${commExpmntMeth.expmntMethId}/'+data);
				$('#newReplyText').val("");
			},
			error:function(data){
				alert('λκΈμ΄ λ±λ‘μ μ€ν¨νμ΅λλ€.');
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
			alert("λ΄μ©μ νμμλλ€.");
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
				alert('λλκΈμ΄ λ±λ‘λμμ΅λλ€.');
				replyPage=data; //νμ΄μ§μ΄λ
				getPage('<%=request.getContextPath()%>/replies/${commExpmntMeth.expmntMethId}/'+1);
				/* window.location.reload(); */
				$('#newReplyReplyText').val("");
			},
			error:function(data){
				alert('λκΈμ΄ λ±λ‘μ μ€ν¨νμ΅λλ€.');
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
				rno:rno, //μμλ jsonμ΄ ν€κ°μ΄λκΉ μ€νΈλ§μΌλ‘ μλ€.
				replytext:replytext
		}
		
		$.ajax({
			//url:"<%=request.getContextPath()%>/reply/modify.do",
			url:"<%=request.getContextPath()%>/replies/"+rno,
			//type:"post",
			type:"put", //λΈλΌμ°μ  νΈνμ±. putμ΄ μλ€μ΄κ°λ λΈλΌμ°μ λ μλ€. ν¬λ‘¬μ λ€μ΄κ°λλ°, μλ€μ΄κ°λμ λ€μ μν΄μ headerλ₯Ό κ³ μμ μΌλ‘ λ£μ΄μΌνλ€.
			headers:{
				"X-HTTP-Method-Override":"PUT"
			},
			data:JSON.stringify(sendData),
			contentType:"application/json",
			success:function(result){
				alert("μμ λμμ΅λλ€.");
				//getPage("<%=request.getContextPath()%>/reply/list.do?bno=${board.bno}&page="+replyPage);
				getPage('<%=request.getContextPath()%>/replies/${commExpmntMeth.expmntMethId}/'+replyPage);
			},
			error:function(){
				alert('μμ  μ€ν¨νμ΅λλ€.');
				//AjaxErrorSecurityRedirectHandler(error.status);
			},
			complete:function(){ //finally κ°μλ. μ½λ°±ν¨μλ€.
				$('#modifyModal').modal('hide'); //κ°μ μ μΌλ‘ λͺ¨λ¬ λ«μμ€λ€.
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
				alert("μ­μ λμμ΅λλ€.");
				//getPage("<%=request.getContextPath()%>/reply/list.do?bno=${board.bno}&page="+page);
				//alert('hi');
				getPage('<%=request.getContextPath()%>/replies/${commExpmntMeth.expmntMethId}/'+page);
				replyPage=page;
			},
			error:function(error){
				//alert('μ­μ  μ€ν¨νμ΅λλ€.');
				AjaxErrorSecurityRedirectHandler(error.status);
			},
			complete:function(){
				$('#modifyModal').modal('hide');
			}
		});
	}
</script>