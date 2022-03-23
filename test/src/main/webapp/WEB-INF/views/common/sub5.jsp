<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head></head>

<title></title>

<body>
	<div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <section class="content-header">
    	<div class="container-fluid">
        	<div class="row mb-2">
            	<div class="col-sm-6">
              		<h5>휴지통</h5>
            	</div>
            	<div class="col-sm-6">
            		<ol class="breadcrumb float-sm-right">
	            		<li class="breadcrumb-item"><a href="#">화면</a></li>
            			<li class="breadcrumb-item active">서브5</li>
            		</ol>
        		</div>
          	</div>
        </div>
        <!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
    	<div class="row">
        	<!-- left column -->
        	<div class="col-md-4">
            	<div class="card card-info" >
                	<div class="card-header" >
                    	<h3 class="card-title">휴지통 목록</h3>
                      	<button type="button" class="btn btn-block btn-default btn-xs float-right" id="showAll" style="width:80px;">전체 펼치기</button>
                    </div>
                    <!-- /.card-header -->

                    <div class="card-body" >
                        <div class="form-group" style="overflow-y:scroll; height:500px;">
                        	<div id="tree"></div>
                        </div>
                    </div>
                    <!-- /.card-body -->

                </div>
                <!-- /.card -->
            </div>

            <div class="col-md-8">
            	<div class="card card-info card-outline">
              		<div class="card-header">
                		<h3 id="foldTitle" class="card-title">현재 경로 : [<span id="pathing">${current eq '#' ? '/휴지통/' :  current.substring(14) }</span>]</h3>
                		<div class="card-tools">
	                 		<div class="input-group input-group-sm">
	                  		</div>
                		</div>
                		<!-- /.card-tools -->
              		</div>
              		<!-- /.card-header -->

              		<div class="card-body p-0">
                		<div class="mailbox-controls">
                  			<!-- Check all button -->
                  			<div class="btn-group">
                  				<button type="button" class="btn btn-default btn-sm" onclick="realRemove()">영구삭제</button>
                    			<button type="button" class="btn btn-default btn-sm" onclick="multiDownLoad()">다운로드</button>
                    			<button type="button" class="btn btn-default btn-sm" onclick="moving()">복구</button>
                  			</div>
                  			<!-- /.btn-group -->
                  			<button type="button" class="btn btn-default btn-sm" onclick="reloading()"><i class="fas fa-sync-alt"></i></button>

                  			<div class="float-right">
                    			<div class="btn-group">
                    			</div>
                  			</div>
                  			<!-- /.float-right -->
                		</div>

                		<div class="table-responsive mailbox-messages" style="overflow-y:scroll; height:500px;">
                  			<table id="foldList" class="table table-hover table-striped">
                  				<thead>
                  					<tr>
                  						<th>
                  							<button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="far fa-square"></i></button>
                  						</th>
                      					<th>종류</th>
                      					<th>폴더/파일명</th>
                      					<th>공개설정</th>

                      					<th>크기</th>
                      					<th>등록일</th>
                      					<th>등록자</th>
                    				</tr>
                  				</thead>
                    			<tbody>
                    				<c:if test="${!empty docList }">
                    					<c:forEach items="${docList }" var="doc">
                    						<c:if test="${doc.parent eq current }">

                    						<c:choose>
                    							<c:when test="${doc.icon eq 'fa fa-file  text-warning' }">
                    								<tr>
                    									<td>
									                    	<input type="checkbox" value="${doc.id }" class="checking">
									                    </td>
                    									<td>
			                    							<i class="fas fa-file-image"></i>
			                    						</td>
			                    						<td><a href="<%=request.getContextPath()%>/file/getFile?attachSaveName=${doc.realName }&attachSavePath=${doc.parent eq '#' ? 'root':doc.parent }&stand=D">${doc.text }</a></td>
			                    						<td>비공개</td>

					                    				<td>${doc.fileSize }KB</td>
			                    						<td>${doc.fileDate }</td>
			                    						<td>파일등록자</td>
                    								</tr>
                    							</c:when>

                    							<c:otherwise>
			                    					<tr>
			                    						<td>
									                      <input type="checkbox" value="${doc.id }" class="checking">
									                    </td>
                    									<td>
			                    							<i class="fas fa-folder"></i>
			                    						</td>
			                    						<td><a href="<%=request.getContextPath()%>/common/sub5?current=${doc.id }">${doc.text }</a></td>
			                    						<td>비공개</td>

					                    				<td></td>
			                    						<td>${doc.fileDate }</td>
			                    						<td>파일등록자</td>
                    								</tr>
                    							</c:otherwise>
                    						</c:choose>

	                    					</c:if>
                    					</c:forEach>
                    				</c:if>
                    			</tbody>
                  			</table>
                  			<!-- /.table -->
                		</div>
                		<!-- /.mail-box-messages -->
              		</div>
              		<!-- /.card-body -->

              		<div class="card-footer p-0">
                		<div class="mailbox-controls">
                		</div>
            		</div>
            	</div>
        		<!-- /.card -->
        	</div>
        </div>
    	<!-- /.row -->
	</section>


	<script>
    var flag=true;
    var btnElement= document.getElementById('showAll');
   	var list=new Array();

    '<c:forEach items="${docList }" var="doc">'
	    var temp=new Object();
	    temp.id='${doc.id}';
	    temp.parent='${doc.parent}';
	    temp.text='${doc.text}';
	    temp.icon='${doc.icon}';
	    if('${current}'.startsWith('${doc.id}'))
	    {
	    	temp.state={opened:true};
	    }
	
	    list.push(temp);
    '</c:forEach>'

    btnElement.addEventListener('click',function(){
    	if(flag)
        {
        	$('#tree').jstree('open_all');
            this.innerText = '전체 접기';
            flag=false;
        }
        else
        {
        	$('#tree').jstree('close_all');
            this.innerText = "전체 펼치기";
            flag=true;
        }
    });


	function realRemove(){
 		var sendArray = new Array();
		var sendCnt = 0;
		var chkBox = $(".checking");

		for (i = 0; i < chkBox.length; i++) {
			if (chkBox[i].checked == true) {
				sendArray[sendCnt] = chkBox[i].value;
				sendCnt++;
			}
		}

		console.log(sendArray);

		if(sendCnt == 0){
	        alert("선택된  폴더/파일 이 없습니다.");
	    } else {
	    	var answer = confirm(sendCnt+"개의 폴더/파일 을 영구 삭제 하시겠습니까?");

	    	 if(answer) {
	 	    	$.ajax({
	 	    		url : "<%=request.getContextPath()%>/file/delete",
	 	    		type : "post",
	 	    		data : {"sendArray" : sendArray},
	 	    		success: function(data){
	 	    			alert('영구 삭제 성공하였습니다.');
	 	    			location.reload();
	 	    		},
	 	    		error: function(xhr) {
	 	    			alert("영구 삭제 실패하였습니다.")
	 	    		}
	 	    	});
	 	     };
	    }
 	}

	function multiDownLoad()
	{
		var sendArray = new Array();
		var sendCnt = 0;
		var chkBox = $(".checking");

		for (i = 0; i < chkBox.length; i++) {
			if (chkBox[i].checked == true) {
				sendArray[sendCnt] = chkBox[i].value;
				sendCnt++;
			}
		}

		console.log(sendArray);

		if(sendCnt == 0){
	        alert("선택된  파일 이 없습니다.");
	    } else {
	    	var answer = confirm(sendCnt+"개의 파일을 다운로드 하시겠습니까?");

	    	 if(answer) {
	    		 for(var i=0;i<sendArray.length;i++)
	    		 {
	    			const check=sendArray[i];
	    			if(check[check.length-1]=='/')
	    			{
	    				alert('폴더가 선택되어 있어 다운로드에 실패하였습니다.');
	    				return;
	    			}
	    		 }

	    		 for(var i=0;i<sendArray.length;i++)
	    		 {
	    			 var temp=sendArray[i];
	    			 var tempArray=temp.split('/');
	    			 var tempLength=tempArray.length;
	    			 const fileName=tempArray[tempLength-1];
	    			 const filePath=temp.substr(0,temp.indexOf(fileName));
	    			 setTimeout(function(){
	    				 location.href='<%=request.getContextPath()%>/file/getFile?attachSaveName='+fileName+'&attachSavePath='+filePath;
	    			 },1000*i);
	    		 }

	 	     };
	    }
	}

	function moving()
	{
		var sendArray = new Array();
		var sendCnt = 0;
		var chkBox = $(".checking");

		for (i = 0; i < chkBox.length; i++) {
			if (chkBox[i].checked == true) {
				sendArray[sendCnt] = chkBox[i].value;
				sendCnt++;
			}
		}

		if(sendCnt == 0)
		{
	        alert("선택된  폴더/파일 이 없습니다.");
	    }
		else
		{
			var array=sendArray.toString();
			console.log(array);
			var param=$('#pathing').text();
 			opening=window.open('<%=request.getContextPath()%>/file/movingForm?current='+param+'&array='+array,'이동폼','width=500,height=500');
	    }
	}

	function reloading(){
		//location.reload();
		location.href='<%=request.getContextPath()%>/common/sub5';
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

        	if(data.node.icon!='fa fa-file  text-warning') //폴더
        	{
        		$('#foldList>tbody').empty();

        		$.ajax({
    	        	url:'<%=request.getContextPath()%>/file/getTrashList?',
    	            type:'get',
    	            success:function(success){
    	               	var relativeTitle=data.node.id.substring(14);
    	                $('#pathing').text(relativeTitle);
    	                if(success) //있으면
    	                {
    	                    for(var i of success)
    	                    {
    	                    	if(i.parent==data.node.id)
    	                    	{
    	                    		var logName ='${loginUser.empName }';
    	                    		if(i.icon=='fa fa-file  text-warning') //파일
    	                    		{
    	                    			$('#foldList>tbody').append('<tr><td><input type="checkbox" value="'+i.id+'" class="checking"></td> <td><i class="fas fa-file-image"></i></td> <td><a href="<%=request.getContextPath()%>/fileDocument/getFile.do?attachSaveName='+i.realName+'&attachSavePath='+i.parent+'">'+i.text+'</a></td> <td>비공개</td> <td>'+i.fileSize+'KB</td> <td>'+i.fileDate+'</td> <td>'+logName+'</td></tr>');
    	                    		}
    	                    		else //폴더
    	                    		{
    	                    			$('#foldList>tbody').append('<tr><td><input type="checkbox" value="'+i.id+'" class="checking"></td> <td><i class="fas fa-folder"></i></td> <td><a href="<%=request.getContextPath()%>/fileDocument/trash.do?current='+i.id+'">'+i.text+'</a></td> <td>비공개</td> <td></td> <td>'+i.fileDate+'</td> <td>'+logName+'</td></tr>');
    	                    		}
    	                    	}
    	                    }
    	                }
    	            },
    	            error:function(error){
    	            	alert("시스템장애로 가입이 불가합니다.");
    	        	}
    	    	});

        	}
        	else //파일
        	{
        		const temp=data.node.id;
   			    const tempArray=temp.split('/');
   			    const tempLength=tempArray.length;
   			    const fileName=tempArray[tempLength-1];
   			    const filePath=temp.substr(0,temp.indexOf(fileName));
        		location.href='<%=request.getContextPath()%>/file/getFile?attachSaveName='+fileName+'&attachSavePath='+filePath;
        	}

        });


        //adminlte check box
        $('.checkbox-toggle').click(function () {
  	      var clicks = $(this).data('clicks')
  	      if (clicks) {
  	        //Uncheck all checkboxes
  	        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
  	        $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
  	      } else {
  	        //Check all checkboxes
  	        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
  	        $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
  	      }
  	      $(this).data('clicks', !clicks)
  	    });


    }
    </script>

    </div>

</body>