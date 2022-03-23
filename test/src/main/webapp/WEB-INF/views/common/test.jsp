<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head></head>

<title></title>

<body>
	<div class="tableWrap"> 
		<table id="mainGrid">
		</table>
		 
		<div id="pager">
		</div> 
	</div>
	
	<script>
	var searchResultColNames = ['게시글관리번호', '번호', '제목', '작성자', '날짜', '조회수']; 
	var searchResultColModel = 
		[ 
			{name:'bbsMgtNo', index:'bbsMgtNo', align:'center', hidden:true}, 
			{name:'bbsNum', index:'bbsNum', align:'left', width:'12%'}, 
			{name:'bbsTitle', index:'bbsTitle', align:'center', width:'50%'}, 
			{name:'bbsWriter', index:'bbsWriter', align:'center', width:'14%'}, 
			{name:'bbsDate', index:'bbsDate', align:'center', width:'12%'}, 
			{name:'bbsHit', index:'bbsHit', align:'center', width:'12%'} 
		]; 
	window.onload=function(){
		$("#mainGrid").jqGrid(
			{ 
				height: 261, 
				width: 1019, 
				colNames: searchResultColNames, 
				colModel: searchResultColModel, 
				rowNum : 10, 
				pager: "pager" 
			}
		);		
	};
	
	function searchData(mode) { 
		var postData = objConvertJson($("#fieldSurvForm")); //form 데이터 json으로 변경 
		$("#mainGrid").jqGrid({ 
			url : "/board/searchData.do", 
			datatype : "JSON", 
			postData : postData, 
			mtype : "POST", 
			colNames: searchResultColNames, 
			colModel: searchResultColModel, 
			rowNum : 10, pager: "#pager", 
			height: 261, width: 1019, 
			caption : "게시글 목록" 
		});
	}

	/* $(function() { 
		$("#mainGrid").jqGrid(
			{ height: 261, width: 1019, colNames: searchResultColNames, colModel: searchResultColModel, rowNum : 10, pager: "pager" }
		); 
	}); */
	</script>
</body>