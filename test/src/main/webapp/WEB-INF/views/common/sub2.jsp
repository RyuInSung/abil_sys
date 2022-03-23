<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head></head>

<title></title>

<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>서브페이지2</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">화면</a></li>
							<li class="breadcrumb-item active">서브2</li>
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
									<table id="example2" class="table table-bordered table-hover dataTable dtr-inline" role="grid" aria-describedby="example2_info">
										<thead>
											<tr role="row">
												<th class="sorting sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">
													실험법 ID
												</th>
												
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">
													실험법 이름
												</th>
												
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
													등록자
												</th>
												
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
													등록일시
												</th>
												
												<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">
													결과 테이블
												</th>
											</tr>
										</thead>
										
										<tbody>
											<c:if test="${!empty list }">
												<c:forEach items="${list }" var="i">
													<tr class="odd" onclick="javascript:OpenWindow('detail.do?expmntMethId=${i.expmntMethId }&from=list','상세보기',800,700);">
														<td class="dtr-control sorting_1" tabindex="0">${i.expmntMethId }</td>
														<td>${i.expmntMethNm }</td>
														<td>${i.regId }</td>
														<td><fmt:formatDate value="${i.regDttm }" pattern="yyyy-MM-dd"/></td>
														<td>${i.rsltTable }</td>
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${empty list }">
												<tr>
													<td colspan="5">검색 내역이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</div>
								<div class="container" style="text-align: center; margin: 0 auto;" > 
									<div style="display: inline-block;">
										<%@ include file="/WEB-INF/views/common/pagination.jsp" %> 
									</div> 
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
	</script>
</body>

