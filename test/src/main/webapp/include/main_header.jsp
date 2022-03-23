<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<!--
    This is a starter template page. Use this page to start your new project from
    scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><decorator:title default="test-page" /></title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- additional link for korean font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/daterangepicker/daterangepicker.css">
    <!-- fullCalendar -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fullcalendar/main.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
	<!-- summernote -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
	<!-- BS Stepper -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/bs-stepper/css/bs-stepper.min.css">
	<!-- Select2 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/select2/css/select2.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
	<!-- dropzonejs -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/dropzone/min/dropzone.min.css">
	<!-- ionicons -->
	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <style>
        aside i {
            color: white;
        }

        aside p {
            color: white;
        }

        * {
            font-family: 'Noto Sans KR', sans-serif;
        }

		.control-sidebar .selectBox .select2-container--default .select2-selection--single .select2-selection__rendered {
		    color: #444;
		    line-height: 20px;
		    text-align: center;
}
    </style>
  <decorator:head />

</head>

<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed sidebar-collapse">
    <div class="wrapper" style="min-width:1280px;  margin:0 auto;">

        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item ">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button" ><i class="fas fa-bars"></i></a>
                </li>
            </ul>

			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					  <span id="timeCheck" class="text-muted" style="font-size: 0.8em;"></span>
				</li>
			</ul>
            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <!-- Navbar Search -->
                <li class="nav-item">
                        <button onclick="#" type="button" style="border: 0; outline: 0; background: 0; margin-top: 6px;">
	                        <img src="<%=request.getContextPath() %>/resources/images/logout1.png"
	                        	 style="width: 20px; height: 20px;">
                       	</button>
                </li>

                <!-- Notifications Dropdown Menu -->
                <li class="nav-item">
                    <a class="nav-link" onclick="#" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                        <div class="image">
                            <img id="top_main_photo" src="" style="object-fit: cover;
                            width: 30px;
                            height: 30px;" class="img-size-50 mr-3 img-circle" alt="User Image" onerror="this.src='<%=request.getContextPath() %>/resources/images/01.jpg'">
                        </div>
                    </a>
                </li>
                <!-- ./ Notifications Dropdown Menu -->
            </ul>
            <!-- ./ Right navbar links -->
        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <!-- <aside class="main-sidebar sidebar-light bg-gradient-info accent-white elevation-4"> -->
        <aside class="main-sidebar sidebar-light accent-white elevation-4" style="background-color: #3C5A91;">
            <!-- Brand Logo -->
            <a href="<%=request.getContextPath() %>/index.do" class="brand-link">
                <!-- <img src="../resources/bootstrap/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> -->
                &nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-home"></i>
                &nbsp;&nbsp;&nbsp;<span class="brand-text font-weight-light"
                    style="color: aliceblue;">Abil-Sys</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column nav-legacy nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
						
						<li class="nav-item">
							<%-- <a href="<%=request.getContextPath() %>/common/main" class="nav-link"> --%>
							<a href="javascript:goPage('<%=request.getContextPath()%>/common/main','m1');" class="nav-link">
			        		&nbsp;&nbsp;&nbsp;<i class="fas fa-circle"></i>
			                &nbsp;&nbsp;&nbsp;&nbsp;<p>메인1</p>
	        				</a>
						</li>
						
						<li class="nav-item">
							<%-- <a href="<%=request.getContextPath() %>/common/sub1" class="nav-link"> --%>
							<a href="javascript:goPage('<%=request.getContextPath()%>/common/sub1','m2');" class="nav-link">
							&nbsp;&nbsp;&nbsp;<i class="fas fa-circle"></i>
			                &nbsp;&nbsp;&nbsp;&nbsp;<p>서브1</p>
	        				</a>
						</li>
						
						<li class="nav-item">
							<%-- <a href="<%=request.getContextPath() %>/common/sub2" class="nav-link"> --%>
							<a href="javascript:goPage('<%=request.getContextPath()%>/common/sub2','m3');" class="nav-link">
							&nbsp;&nbsp;&nbsp;<i class="fas fa-circle"></i>
			                &nbsp;&nbsp;&nbsp;&nbsp;<p>서브2</p>	
	        				</a>
						</li>
						
						<li class="nav-item">
							<%-- <a href="<%=request.getContextPath() %>/common/sub2" class="nav-link"> --%>
							<a href="javascript:goPage('<%=request.getContextPath()%>/common/sub3','m4');" class="nav-link">
							&nbsp;&nbsp;&nbsp;<i class="fas fa-circle"></i>
			                &nbsp;&nbsp;&nbsp;&nbsp;<p>서브3</p>	
	        				</a>
						</li>
						
						<li class="nav-item">
							<%-- <a href="<%=request.getContextPath() %>/common/sub2" class="nav-link"> --%>
							<a href="javascript:goPage('<%=request.getContextPath()%>/common/sub4','m5');" class="nav-link">
							&nbsp;&nbsp;&nbsp;<i class="fas fa-circle"></i>
			                &nbsp;&nbsp;&nbsp;&nbsp;<p>서브4</p>	
	        				</a>
						</li>
						
						<li class="nav-item">
							<%-- <a href="<%=request.getContextPath() %>/common/sub2" class="nav-link"> --%>
							<a href="javascript:goPage('<%=request.getContextPath()%>/common/sub5','m6');" class="nav-link">
							&nbsp;&nbsp;&nbsp;<i class="fas fa-circle"></i>
			                &nbsp;&nbsp;&nbsp;&nbsp;<p>서브5</p>	
	        				</a>
						</li>
						
						<li class="nav-item">
							<%-- <a href="<%=request.getContextPath() %>/common/sub2" class="nav-link"> --%>
							<a href="javascript:goPage('<%=request.getContextPath()%>/common/sub6','m7');" class="nav-link">
							&nbsp;&nbsp;&nbsp;<i class="fas fa-circle"></i>
			                &nbsp;&nbsp;&nbsp;&nbsp;<p>서브6</p>	
	        				</a>
						</li>

                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
                
            </div>
            <!-- /.sidebar -->
        </aside>