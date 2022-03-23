<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
	<style>
	th.ui-th-column div { 
		white-space:normal !important; 
		height:auto !important; 
	}
	/* .ui-jqgrid .ui-pg-button  { 
		height:19px !important;
		width:3px;
		background-color:yellow;
	} */
	
	/* .ui-common-table{
	  width: 100% !important;
	}
	
	.ui-jqgrid .ui-jqgrid-hbox{
	  padding-right: 0px !important;
	} */
	
	</style>
</head>

<title></title>


<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>서브페이지6</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">화면</a></li>
							<li class="breadcrumb-item active">서브6</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		
		<section class="content">
			<div class="container-fluid">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<div class="col-sm-11">
								<h3 class="card-title">DataTable (TEST_ISRYU_BBS_MNG)</h3>
							</div>
							<div class="col-sm-1">
								<button type="button" class="btn btn-primary" id="registBtn" onclick="OpenWindow('registForm','글등록',800,700);">등록</button>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
							<div class="row">
								<div class="col-sm-12 col-md-6">
								</div>
								<div class="col-sm-12 col-md-6">
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<table id="jqGrid"></table>
									<div id="gridpager"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
	        </div>
        </section>
	</div>
	
	<script>
		
		//팝업창들 띄우기
		//새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소, 창 타이틀 , 넓이, 길이 )
		function OpenWindow(UrlStr,WinTitle,WinWidth,WinHeight)
		{
			winleft=(screen.width-WinWidth)/2;
			wintop=(screen.height-WinHeight)/2;
			var win=window.open(UrlStr, WinTitle, "scrollbars=yes,width="+WinWidth+","
								+"height="+WinHeight+", top="+wintop+", left="
								+winleft+", resizable=yes, status=yes" );
			win.focus();
		}
		
	var dataArr = [ 
		{ID:"1",javascript:"80",python:"60",jsp:"50"}, 
		{ID:"2",javascript:"57",python:"80",jsp:"50"}, 
		{ID:"3",javascript:"90",python:"40",jsp:"85"}, 
		{ID:"4",javascript:"67",python:"84",jsp:"76"}, 
		{ID:"5",javascript:"35",python:"83",jsp:"85"}, 
		{ID:"6",javascript:"90",python:"67",jsp:"56"}, 
		{ID:"7",javascript:"80",python:"60",jsp:"50"}, 
		{ID:"8",javascript:"45",python:"67",jsp:"100"}, 
		{ID:"9",javascript:"90",python:"40",jsp:"68"}, 
		{ID:"10",javascript:"67",python:"57",jsp:"76"}, 
		{ID:"11",javascript:"36",python:"83",jsp:"35"}, 
		{ID:"12",javascript:"76",python:"35",jsp:"98"}, 
	];
	
	var map=JSON.parse('${map}');

	window.onload=function(){
		$("#jqGrid").jqGrid(
			{ 
				datatype: "local", 
				data: map, 
				height: 270,
				//width: 1000,
				autowidth : true,
				colNames : [
					'실험법 ID','실험법 이름','등록자','등록일시','결과테이블'
				], 
				colModel:[ 
					{
						name:"ExpmntMethId", 
						index:"ExpmntMethId", 
						width:250, 
						align:'center', 
						hidden:false,
						key:true
					},
					{
						name : 'ExpmntMethNm', 
						index : 'ExpmntMethNm', 
						width : 200, 
						align : 'center', 
						hidden:false, 
					}, 
					{
						name : 'RegId', 
						index : 'RegId', 
						width : 200, 
						align : 'center', 
						hidden:false 
					}, 
					{
						name : 'RegDttm', 
						index : 'RegDttm', 
						width : 200, 
						resizable : true, 
						align : 'center',
						hidden:false 
					}, 
					{
						name : 'RsltTable', 
						index : 'RsltTable', 
						width : 250, 
						resizable : true, 
						align : 'center',
						hidden:false 
					}
				],
				loadtext: "로딩중일때 표시되는 텍스트!", 
				caption: "jQuery Grid: jqGrid 샘플",
				pager:"#gridpager", 
				rowNum:10, 
				rownumbers:true, 
				viewrecords:true, 
				pgbuttons:true, 
				pginput:true, 
				onCellSelect: function(rowid,icol,cellcontent,e){
					//alert(rowid+' '+icol+' '+cellcontent+' '+e);
					console.log(rowid);
					console.log(icol);
					console.log(cellcontent);
					console.log(e);
					OpenWindow('detail?expmntMethId='+rowid+'&from=list','상세보기',800,700);
			            /* rowid : 선택한 셀의 행 번호
			            icol : 선택한 셀의 열 번호
			            cellcontent : 선택한 셀의 값 */
				},
				//shrinkToFit:true, 
				//sortable: false, 
				//loadComplete:function(data){}, 
				//scroll:true, 
				//loadonce:false, 
				//hidegrid:true 
			}
		);
		
		//화면 창 크기 비례
		/* $(window).on('resize', function() {
			   $("#jqGrid").setGridWidth($(window).width());
			}).trigger('resize'); */

	};
	
	
	function OpenWindow(UrlStr,WinTitle,WinWidth,WinHeight)
	{
		winleft=(screen.width-WinWidth)/2;
		wintop=(screen.height-WinHeight)/2;
		var win=window.open(UrlStr, WinTitle, "scrollbars=yes,width="+WinWidth+","
							+"height="+WinHeight+", top="+wintop+", left="
							+winleft+", resizable=yes, status=yes" );
		win.focus();
	}
	</script>
</body>