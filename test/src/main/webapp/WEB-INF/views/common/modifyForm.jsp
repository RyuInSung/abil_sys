<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>   
	
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>수정하기</h1>  				
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
  <!-- Main content -->
    <section class="content container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-outline card-info">
					<div class="card-header row">
						<h4 class="col-md-8">DataTable (COMM_EXPMNT_METH)</h4>
						<div class="col-md-4">
							<div class="float-right">
								<button type="button" class="btn btn-warning" id="modifyBtn" onclick="modify_go();">수 정</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- <button type="button" class="btn btn-default " id="cancelBtn" onclick="history.go(-1);">취 소</button> -->
								<button type="button" class="btn btn-default " id="cancelBtn" onclick="cancel_go();">취 소</button>
							</div>
						</div>
					</div><!--end card-header  -->
					<div class="card-body">
						<form role="form" method="post" action="modify" name="modifyForm" enctype="multipart/form-data">
							<input type="hidden" id="expmntMethId" name="expmntMethId" value="${commExpmntMeth.expmntMethId }" />
							<%-- <input type="hidden" name="regDttm" value="<fmt:formatDate value="${commExpmntMeth.regDttm }" pattern="yyyy-MM-dd" />" /> --%>
							<input type="hidden" name="rsltTable" value="${commExpmntMeth.rsltTable }" />
							
							<div class="form-group">
								<label for="expmntMethNm">실험법 이름</label> 
								<input type="text" id="expmntMethNm" readonly name='expmntMethNm' class="form-control" value="${commExpmntMeth.expmntMethNm }">
							</div>
							<div class="form-group">
								<label for="regId">등록자</label> 
								<input type="text" id="regId" readonly name="regId" class="form-control"  value="${commExpmntMeth.regId }">
							</div>
							<div class="form-group">
								<label for="rsltContent">결과 테이블 내용</label>		
								<textarea class="form-control" name="rsltContent" id="rsltContent" cols="94" rows="5" style="resize:none;" placeholder="500자 내외로 작성하세요.">${fn:escapeXml(commExpmntMeth.rsltContent) }</textarea>
							</div>
							
							<div class="row">	
								<div class="form-group col-sm-12" >
									<label for="multiFileList">첨부파일</label>
									<div class="">
										<c:if test="${!empty commExpmntMeth.fileList }">
											<c:set var="index" value="1"></c:set>
											<c:forEach var="file" items="${commExpmntMeth.fileList }">
												<div>
													<span>${file.realName }</span>
													&nbsp;&nbsp;&nbsp;<button  type="button" onclick="fileDelete(this);">X</button>
													<input type="hidden" name="remainName" value="${file.fileName }">
												</div>
												<c:set var="index" value="${index+1 }"></c:set>
											</c:forEach>
										</c:if>
										<c:if test="${empty commExpmntMeth.fileList }">
											<span>첨부파일이 없습니다.</span>
										</c:if>
									</div>
									<input type="file" id="multiFileList" name="multiFileList" class="" multiple="multiple">
								</div>	
							</div>
						</form>
					</div><!--end card-body  -->
					
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->
    
    <%@include file="/WEB-INF/views/common/summernote.jsp" %>
    <script>
	    window.onload=function(){
			summernote_go($('textarea#content'));
		}
	    
	    function modify_go()
	    {
	    	$('form[role="form"]').submit();
	    }
	    
	    function cancel_go(){
	    	var id=$('#expmntMethId').val();
	    	location.href="<%=request.getContextPath()%>/common/detail?expmntMethId="+id;
	    }
	    
	    function fileDelete(param){
	    	//param.empty();
	    	//console.log($('#'+param).val());
	    	//param.parentNode.removeChild(param);
		    var tr = param.parentNode;
		    tr.parentNode.removeChild(tr);
	    }
    </script>
  
</body>    