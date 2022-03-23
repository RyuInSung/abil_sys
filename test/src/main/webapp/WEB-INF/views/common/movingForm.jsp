<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head></head>

<title></title>

<body>

	<div class="content-wrapper">

		<div style="height: 20px;"></div>
	
		<section class="content">
			<div class="container-fluid">
	        	<div class="card card-info">
		        	<div class="card-header">
		            	<h3 class="card-title">파일/폴더 이동</h3>
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
		                    	<label for="">이동할 위치</label>
		                    	<!-- <input type="text" class="form-control" id="foldName" placeholder="폴더명을 입력하세요" name="foldName"> -->
		                    	<div class="" style="overflow-y:scroll; height:180px; border:1px solid grey;">
		                        	<div id="tree"></div>
	                        	</div>
		                  	</div>
		                	<div class="form-check">
		               		</div>
		            	</div>
		            </form>
		            
		            <!-- /.card-body -->
		            <div class="card-footer p-2">
			        	<div class="float-right">
			        		<button type="button" onclick="javascript:moving();" class="btn btn-info">이동</button>
			        		<button type="button" onclick="javascript:cancel();" class="btn btn-default">취소</button>
			            </div>
		            </div>
		    	</div>
	        </div>
	    </section>

	</div>

	<script>
		var result;
	   	var list=new Array();

	    '<c:forEach items="${docList }" var="doc">'
		    var temp=new Object();
		    temp.id='${doc.id}';
		    temp.parent='${doc.parent}';
		    temp.text='${doc.text}';
		    temp.icon='${doc.icon}';
		    if('${current}'.startsWith('${doc.id}')){
		    	temp.state={opened:true};
		    }
		    list.push(temp);
	    '</c:forEach>'

	    function cancel(){
	    	window.close();
	    }

	    function moving()
		{
	    	if(result==undefined)
	    	{
	    		alert('이동할 폴더를 선택하세요.');
	    		return;
	    	}
	    	var answer = confirm("${cnt} 개의 폴더/파일 을 이동하시겠습니까?");

	    	if(answer) {
	    		var tempList=new Array();
	    		'<c:forEach items="${moveList }" var="move">'
	    			tempList.push('${move}');
	    	    '</c:forEach>'
	    	    console.log(tempList);
	 	    	$.ajax({
	 	    		url : "<%=request.getContextPath()%>/file/moving",
	 	    		type : "post",
	 	    		data : {"sendArray" : tempList ,"target":result},
	 	    		success: function(data){
	 	    			alert('파일이동에 성공하였습니다.');
	 	    			window.opener.location='<%=request.getContextPath()%>/common/sub4';
	 	    			window.close();
	 	    		},
	 	    		error: function(xhr) {
	 	    			alert(xhr.responseText);
	 	    		}
	 	    	});
	 	    };
		}

		window.onload=function(){

			$('#tree').jstree({
	        	'core' : {
	            	'data' : list,
	                "check_callback":true
	            },
	            "plugins":["dnd","contextmenu","search","wholerow"]
	        });

	        $('#tree').bind('select_node.jstree', function(event, data){
	        	console.log(data.node);
	        	result=data.node.id;
	        });
		}
	</script>

</body>