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
	            	<h3 class="card-title">새 폴더 생성</h3>
	            </div>
	            <!-- /.card-header -->

	            <!-- form start -->
	            <form role="form">
	            	<div class="card-body">
	                	<div class="form-group">
	                    	<label for="foldLocate">현재 위치</label>
	                    	<input type="text" class="form-control" id="foldLocate" name="foldLocate" value="${current }"  readonly="readonly">
	                  	</div>
	                  	<div class="form-group">
	                    	<label for="foldName">폴더명</label>
	                    	<input type="text" class="form-control" id="foldName" placeholder="폴더명을 입력하세요" name="foldName">
	                  	</div>
	                </div>
	                <!-- /.card-body -->

	              </form>
	                <div class="card-footer p-2">
	                <div class="float-right">
		               	<button type="button" onclick="javascript:makeFold();" class="btn btn-info">생성</button>
	                	<button type="button" onclick="javascript:window.close();;" class="btn btn-default">닫기</button>
	                </div>
	                </div>
	    	</div>
        </div>
    </section>

	</div>

	<script>
		var pattern = /^[a-zA-Zㄱ-힣0-9]*$/;

		function makeFold(){
			const temp=$('#foldName').val();
			if(!temp.match(pattern)){
				alert('특수문자는 사용할수 없습니다.');
				return;
			}
			$('form[role="form"]').attr('action','<%=request.getContextPath()%>/file/makeFold').submit();
		}
	</script>

</body>