<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head></head>

<title></title>

<body>
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h5>메인페이지</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">화면</a></li>
							<li class="breadcrumb-item active">메인</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		
		<section class="content">
			<div class="container-fluid">
        		<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">TestTable</h3>
								<div class="card-tools">
									<div class="input-group input-group-sm" style="width: 180px;">
									</div>
								</div>
							</div>

							<div class="card-body table-responsive p-0">
 								<table class="table table-hover text-nowrap" id="mainTable">
									<thead>
										<tr>
											<th>ID</th>
											<th>User</th>
											<th>Date</th>
											<th>Status</th>
											<th>Reason</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="i" begin="0" end="6">
											<tr id="${i+1 }id" onclick="javascript:hi(this.id);">
												<td>${i+1 }</td>
												<td>John ${i+1 }번</td>
												<td>11-7-2014</td>
												<td><span class="tag tag-success">Approved</span></td>
												<td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
											</tr>
										</c:forEach>
											<tr>
												<td>
													<!-- <button type="button" onclick="javascript:modalGo();" class="btn btn-primary" style="">버튼</button> -->
													<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-info">
														모달
													</button>
												</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
									</tbody>
								</table>
							</div>
									
						</div>
					</div>
				</div>
        	</div>
        	
        	<div class="modal fade" id="modal-info" style="display: none;" aria-hidden="true">	
				<div class="modal-dialog" style="width:100%; height:100%;">
					<div class="modal-content bg-info">
						<div class="modal-header">
							<h4 class="modal-title">상세(모달)</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<table border="1">
								<thead>
								</thead>
								<tbody id="change_body" style="color:white;>
									<tr">
										<th>ID</th>
										<td></td>
									</tr>
									
									<tr>
										<th>User</th>
										<td></td>
									</tr>
									
									<tr>
										<th>Date</th>
										<td></td>
									</tr>
									
									<tr>
										<th>Status</th>
										<td></td>
									</tr>
									
									<tr>
										<th>Reason</th>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer justify-content-between">
							<button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
        	
        	
        </section>
	</div>
	
	
	<script>
		var temp="empty";
		function hi(id){
			temp=id;
//			alert(id);
			
			//var yy=document.getElementById(id).getElementsByTagName("td")[0].innerHTML;
			
			for(var i=0;i<5;i++){
				document.getElementById("change_body").getElementsByTagName("tr")[i].getElementsByTagName("td")[0].innerHTML = document.getElementById(id).getElementsByTagName("td")[i].innerHTML;	
			}

			var table = document.getElementById("mainTable");
			var tr = table.getElementsByTagName("tr");
			for(var i=0; i<tr.length; i++){
				tr[i].style.background = "white";
			}
			document.getElementById(id).style.backgroundColor = "#FCE6E0";

		}
		
		function modalGo(){
			alert(temp);
		}
	</script>
	
	
	
	
</body>