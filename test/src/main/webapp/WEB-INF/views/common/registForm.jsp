<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head></head>

<title></title>

<body>

	<script>
		if(${from eq 'regist'})
		{
			alert("등록되었습니다.");
			window.opener.location.reload();
			window.close();
		}
	</script>
	
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>실험법 등록</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="list.do">
				        	<i class="fa fa-dashboard"></i>화면
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	실험법
			        </li>		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
  <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width:960px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">DataTable (TEST_ISRYU_BBS_MNG)</h3>
						<div class ="card-tools">
							<button type="button" class="btn btn-primary" id="registBtn" onclick="regist_go();">등 록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-warning" id="cancelBtn" onclick="CloseWindow();" >취 소</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad">
						<form role="form" method="post" action="regist" name="registForm" enctype="multipart/form-data">
							<div class="form-group">
								<label for="expmntMethId">실험법 ID</label>
								<div class="row">
									<div class="col-sm-8">
										<input type="text" id="expmntMethId" name='expmntMethId' class="form-control" placeholder="실험법 ID를 쓰세요">
									</div>
									<div class="col-sm-4">
										<button type="button" class="btn btn-info" id="cancelBtn" onclick="dupCheck();" >중복확인</button>
									</div>
								</div> 
							</div>
							<div class="form-group">
								<label for="expmntMethNm">실험법 이름</label> 
								<input type="text" id="expmntMethNm" name='expmntMethNm' class="form-control" placeholder="실험법 이름을 쓰세요">
							</div>							
							<div class="form-group">
								<label for="regId">작성자</label> 
								<input type="text" id="regId" name="regId" class="form-control" placeholder="작성자를 쓰세요">
							</div>
							<div class="form-group">
								<label for="multiFileList">첨부파일</label><br/> 
								<input type="file" id="multiFileList" name="multiFileList" class="" multiple="multiple">
							</div>
							<div class="form-group">
								<label for="rsltTable">결과 테이블</label> 
								<input type="text" id="rsltTable" name="rsltTable" class="form-control" placeholder="결과 테이블을 쓰세요">
							</div>
							<div class="form-group">
								<label for="rsltContent">결과 테이블 내용</label>
								<textarea class="textarea" name="rsltContent" id="rsltContent" rows="20" placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
							</div>
						</form>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">
						
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->
    
     <%@ include file="/WEB-INF/views/common/summernote.jsp" %>
     
     <script>
    	window.onload=function(){
    		summernote_go($('textarea#rsltContent'));
    	}
    	
    	var dupCheckCom="already";
    	var dupCheckId="temp";
    	
    	function regist_go()
    	{
    		var form=document.registForm; //해당 DOM은 name으로 찾을수있다.
    		//오로지 form 태그만!!! document.name속성명  으로 접근할수있다.
    		
    		if(dupCheckCom=="already"){
    			alert("실험법 ID 중복확인은 필수입니다.");
    			return;
    		}
    		var temp=$('#expmntMethId').val();
    		if(temp!=dupCheckId){
    			alert("실험법 ID 중복확인을 해주세요.");
    			return;
    		}
    		/* if(form.title.value=="")
    		{
    			alert("제목은 필수입니다.");
    			return;
    		} */
    		
    		form.submit();
    	}
    	
    	//팝업창 닫기
    	function CloseWindow(parentURL)
    	{
    		window.opener.location.reload(true);
    		window.close();
    	}
    	
    	function dupCheck(){
    		var expmntMethId=$('#expmntMethId').val();
    		if(expmntMethId==''){
    			alert('실험법ID를 입력하세요.');
    			return;
    		}
    		$.ajax({
	        	url:'<%=request.getContextPath()%>/common/dupCheck?expmntMethId='+expmntMethId,
	            type:'get',
	            success:function(success){
	            	if(success=='success'){
	            		alert('사용가능한 실험법 ID입니다.');
	            		dupCheckCom="ready";
	            		dupCheckId=expmntMethId;
	            	}
	            	else{
	            		alert('중복된 실험법 ID입니다.\n새로운 ID를 입력하세요');
	            	}
	            },
	            error:function(error){
	            	alert(error.status);
	            }
	        });
    	}
    </script>
</body>