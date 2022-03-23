<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head></head>

<title></title>

<body>

	<div class="content-wrapper">

	<div style="height: 20px;"></div>

	<section class="content">
		<div class="container-fluid">
        	<div class="card card-info">
	        	<div class="card-header">
	            	<h3 class="card-title">이름 변경</h3>
	            </div>
	            <!-- /.card-header -->

	            <!-- form start -->
	            <form role="form">
	            	<div class="card-body">
	                	<div class="form-group">
	                    	<label for="foldLocate">변경 대상</label>
	                    	<input type="hidden" class="form-control" id="originalName2" name="originalName" value="${name}">
	                    	<input type="text" class="form-control" id="originalName" value="${name.substring(name.lastIndexOf('$')+1) }"  readonly="readonly">
	                    	<input type="hidden" class="form-control" id="originalPath" name="originalPath" value="${path }">
	                  	</div>
	                  	<div class="form-group">
	                    	<label for="foldName">변경할 이름</label>
	                    	<input type="text" class="form-control" id="target" placeholder="변경할 이름을 입력하세요" name="target">
	                  	</div>
	                </div>
	                <!-- /.card-body -->
	              </form>

	                <div class="card-footer p-2">
		                <div class="float-right">
		                	  <button type="button" onclick="javascript:changeName();" class="btn btn-info">변경</button>
		                	  <button type="button" onclick="javascript:window.close();" class="btn btn-default">닫기</button>
		                </div>
	                </div>
	    	</div>
        </div>
    </section>

	</div>

	<script>
	
		var pattern = /^[a-zA-Zㄱ-힣0-9]*$/;
		
		function changeName()
		{
			var temp=$('#target').val();
			if(!temp.match(pattern)){
				alert('특수문자는 사용할수 없습니다.');
				return;
			}
			
			$('form[role="form"]').attr('action','<%=request.getContextPath()%>/file/changeName').submit();
			
			
			<%-- $.ajax({
 	    		url : "<%=request.getContextPath()%>/file/nameCheck?current=${current}&name="+temp,
 	    		type : "get",
 	    		success: function(data){
 	    			if(data=='Fail'){
 	    				alert('사용중인 이름입니다.');
 	    			}
 	    			else{
 	    				// 	    				
 	    			}
 	    		},
 	    		error: function(xhr) {
 	    			alert("서버 오류 입니다.");
 	    		}
 	    	}); --%>
			
		}
	</script>

</body>