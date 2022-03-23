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
	            	<h3 class="card-title">파일 업로드</h3>
	            </div>
	            <!-- /.card-header -->

	            <!-- form start -->
	            <form role="form" method="post" enctype="multipart/form-data">
	            	<div class="card-body">
	                	<div class="form-group">
	                    	<label for="foldLocate">현재 위치</label>
	                    	<input type="text" class="form-control" id="foldLocate" name="foldLocate" value="${current }"  readonly="readonly">
	                  	</div>
	                  	<div class="form-group">
	                    	<label for="files">업로드 파일</label><br/>
	                    	<input type="file" multiple="multiple" id="files" name="files">
	                  	</div>
	                </div>
	            </form>
	                <!-- /.card-body -->

	                <div class="card-footer p-2">
		                <div class="float-right">
		                  <button type="button" onclick="javascript:uploadFile();" class="btn btn-info">업로드</button>
		                  <button type="button" onclick="javascript:window.close();" class="btn btn-default">닫기</button>
		                </div>
	                </div>
	    	</div>
        </div>
    </section>

	</div>

	<script>
		function uploadFile(){
			$('form[role="form"]').attr('action','<%=request.getContextPath()%>/file/uploadFile').submit();
		}
	</script>

</body>