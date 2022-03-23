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
						<h5>서브페이지1</h5>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">화면</a></li>
							<li class="breadcrumb-item active">서브1</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		
		<section class="content">
			<div class="container-fluid">
			
				<div class="row">
					<div class="col-md-6">
				
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">전송</h3>
							</div>
							<form>
								<div class="card-body">
									<div class="form-group">
										<label for="exampleInputEmail1">Email</label>
										<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Password</label>
										<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
									</div>
									<div class="form-group">
										<label for="exampleInputFile">File</label>
										<div class="input-group">
											<div class="custom-file">
												<input type="file" class="custom-file-input" id="exampleInputFile">
												<label class="custom-file-label" for="exampleInputFile">Choose file</label>
											</div>
											<div class="input-group-append">
												<span class="input-group-text">Upload</span>
											</div>
										</div>
									</div>
									<div class="form-check">
										<input type="checkbox" class="form-check-input" id="exampleCheck1">
										<label class="form-check-label" for="exampleCheck1">Check Box	</label>
									</div>
								</div>
								<div class="card-footer">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
						</form>
					</div>
					
					</div>
					<div class="col-md-6">
					
						<div class="card card-info">
							<div class="card-header">
								<h3 class="card-title">테이블</h3>
							</div>
							<div class="card-body p-0">
								<table class="table">
									<thead>
										<tr>
											<th style="width: 10px">#</th>
											<th>Task</th>
											<th>Progress</th>
											<th style="width: 40px">Label</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1.</td>
											<td>Update software</td>
											<td>
												<div class="progress progress-xs">
													<div class="progress-bar progress-bar-danger" style="width: 55%"></div>
												</div>
											</td>
											<td><span class="badge bg-danger">55%</span></td>
										</tr>
										<tr>
											<td>2.</td>
											<td>Clean database</td>
											<td>
												<div class="progress progress-xs">
													<div class="progress-bar bg-warning" style="width: 70%"></div>
												</div>
											</td>
											<td><span class="badge bg-warning">70%</span></td>
										</tr>
										<tr>
											<td>3.</td>
											<td>Cron job running</td>
											<td>
												<div class="progress progress-xs progress-striped active">
													<div class="progress-bar bg-primary" style="width: 30%"></div>
												</div>
											</td>
											<td><span class="badge bg-primary">30%</span></td>
										</tr>
										<tr>
											<td>4.</td>
											<td>Fix and squish bugs</td>
											<td>
												<div class="progress progress-xs progress-striped active">
													<div class="progress-bar bg-success" style="width: 90%"></div>
												</div>
											</td>
											<td><span class="badge bg-success">90%</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					
					</div>
				</div>
				
	        </div>
        </section>
	</div>
</body>

