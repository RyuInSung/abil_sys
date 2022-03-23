<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>

	<div class="content-wrapper" style="max-width:800px;min-width:420px;margin:0 auto;min-height:812px;">
		<section class="content-header">
	  		<div class="container-fluid">
	  			<div class="row md-2">
	  				<div class="col-sm-6">
	  					<h1>상세보기</h1>  				
	  				</div>
		  			<div class="col-sm-6">
		  				<ol class="breadcrumb float-sm-right">
					        <li class="breadcrumb-item">
						        <i class="fa fa-dashboard"></i>화면
					        </li>
					        <li class="breadcrumb-item active">
					        	서브2
					        </li>		        
		    	  		</ol>
		  			</div>
		  		</div>
		  	</div>
		</section>
   
		<section class="content container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card card-outline card-info">
						<div class="card-header">
							<h3 class="card-title">DataTable (TEST_ISRYU_BBS_MNG)</h3>
							<div class="card-tools">
								<button type="button" id="modifyBtn" class="btn btn-warning" onclick="modify_go();">MODIFY</button>						
						    	<button type="button" id="removeBtn" class="btn btn-danger" onclick="remove_go();">REMOVE</button>
						    	<button type="button" id="listBtn" class="btn btn-primary" onclick="CloseWindow();">CLOSE</button>
					    	</div>
						</div>
						
						<div class="card-body">
							<div class="row">
								<div class="form-group col-sm-6">
									<label for="expmntMethId">실험법 ID</label>
									<input type="text" class="form-control" id="expmntMethId" readonly disabled value="${commExpmntMeth.expmntMethId }" />							
								</div>
								<div class="form-group col-sm-6">
									<label for="expmntMethNm">실험법 이름</label>
									<input type="text" class="form-control" id="expmntMethNm" readonly value="${commExpmntMeth.expmntMethNm }" />							
								</div>
							</div>
						
							<div class="row">	
								<div class="form-group col-sm-4" >
									<label for="regDttm">등록일시</label>
									<input type="text" class="form-control" id="regDttm" readonly value="<fmt:formatDate value="${commExpmntMeth.regDttm }" pattern="yyyy-MM-dd" />" />
								</div>
								
								<div class="form-group col-sm-4" >
									<label for="regId">등록자</label>
									<input type="text" class="form-control" id="regId" readonly value="${commExpmntMeth.regId }"/>
								</div>		
								
								<div class="form-group col-sm-4" >
									<label for="rsltTable">결과 테이블</label>
									<input type="text" class="form-control" id="rsltTable" readonly value="${commExpmntMeth.rsltTable }"/>
								</div>
							</div>
						
							<div class="form-group col-sm-12">
								<label for="rsltContent">내 용</label><br/>
								<%-- <input type="text" class="form-control" id="rsltContent" readonly style="height: 100px;" value="${commExpmntMeth.rsltContent }"/> --%>
								<textarea class="form-control" name="rsltContent" id="rsltContent" cols="94" rows="5" style="resize:none;" readonly="readonly" placeholder="500자 내외로 작성하세요.">${fn:escapeXml(commExpmntMeth.rsltContent) }</textarea>
								<%-- <textarea id="rsltContent" name="rsltContent" readonly rows="5" cols="94" style="text-align: left; resize:none;" disabled="disabled">
									${commExpmntMeth.rsltContent }
								</textarea> --%>
							</div>
							
							<div class="row">	
								<div class="form-group col-sm-12" >
									<label for="multiFileList">첨부파일</label>
									<div class="">
										<c:if test="${!empty commExpmntMeth.fileList }">
											<c:forEach var="file" items="${commExpmntMeth.fileList }">
												<a href="<%=request.getContextPath()%>/file/getFile?attachSaveName=${file.fileName}&attachSavePath=${file.filePath}">${file.realName }</a><br/>
											</c:forEach>
										</c:if>
										<c:if test="${empty commExpmntMeth.fileList }">
											<span>첨부파일이 없습니다.</span>
										</c:if>
									</div>
								</div>		
							</div>
						</div>													
					</div><!-- end card -->				
				</div><!-- end col-md-12 -->
			</div><!-- end row  -->
    	</section>
    
		<!-- 댓글 -->
		<section class="content container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card card-info">					
						<div class="card-body">
							<!-- The time line -->
							<div class="timeline">
								<!-- timeline time label -->
								<div class="time-label" id="repliesDiv">
									<span class="bg-green">Replies List </span>							
								</div>
							</div>
						
							<div class='text-center'>
								<ul id="pagination" class="pagination justify-content-center m-0" >
								</ul>
							</div>
						</div>
					
						<div class="card-footer">
							<%-- <label for="newReplyWriter">Writer</label>
							<input class="form-control" type="hidden" placeholder="USER ID"	 id="newReplyWriter" readonly value="${loginUser.id }"> --%> 
							<label for="newReplyText">Reply Text</label>
							<input class="form-control" type="text"	placeholder="REPLY TEXT" id="newReplyText">
							<br/>
							<button type="button" class="btn btn-primary" id="replyAddBtn" onclick="replyRegist_go();">ADD REPLY</button>
						</div>				
					</div>
				</div><!-- end col-md-12 -->
			</div><!-- end row -->
    	</section>
  	</div>

	<!-- Modal -->
	<div id="modifyModal" class="modal modal-default fade" role="dialog">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h4 class="modal-title" style="display:none;"></h4>
	        		<button type="button" class="close" data-dismiss="modal">&times;</button>        
	      		</div>
	      		<div class="modal-body" data-rno>
	        		<p>
	        			<input type="text" id="replytext" class="form-control">
	        		</p>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-info" id="replyModBtn" onclick="replyModify_go();">Modify</button>
	        		<button type="button" class="btn btn-danger" id="replyDelBtn" onclick="replyRemove_go();">Delete</button>
	        		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      		</div>
	    	</div>
	  	</div>
	</div>	
	
	<form role="form">
		<input type="hidden" name="expmntMethId" value="${commExpmntMeth.expmntMethId}" />
	</form>
	
	<script>
	if(${from eq 'modify'})
	{
		alert('정상적으로 수정되었습니다.');
		window.opener.location.reload();
	}
	
	if(${from eq 'remove'})
	{
		alert('정상적으로 삭제되었습니다.');
		window.opener.location.reload();
		window.close();
	}
	
	function modify_go()
	{
		var formObj=$('form[role="form"]');
		formObj.attr({
			'action':'modifyForm',
			'method':'post'
		});
		formObj.submit();
	}
	
	function remove_go()
	{
		var formObj=$('form[role="form"]');
		var answer=confirm('정말 삭제하시겠습니까?');
		if(answer)
		{
			formObj.attr("action","remove");
			formObj.attr("method","post");
			formObj.submit();		
		}
	}
	
	//팝업창 닫기
	function CloseWindow(parentURL)
	{
		window.opener.location.reload(true);
		window.close();
	}
	</script>
	
	<%@ include file="./reply_js.jsp" %>

</body> 