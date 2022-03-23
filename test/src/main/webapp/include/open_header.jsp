<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><decorator:title default="test-page"/></title>
  <decorator:head/>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
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
 <!-- Select2 -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
  <!-- BS Stepper -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/bs-stepper/css/bs-stepper.min.css">
  <!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
  <!-- jsTree -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
  <!-- icheck -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Bootstrap4 Duallistbox -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
  <!-- dropzonejs -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/dropzone/min/dropzone.min.css">
  
  <!-- jqGrid -->
  <!-- <link rel="stylesheet" type="text/css" href="/js/common/jquery/jquery-ui.min.css" /> --> 
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery-ui/jquery-ui.min.css" />
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/tonytomov-jqGrid-6659334/css/ui.jqgrid.css" />

  <style type="text/css">
          * {
            font-family: 'Noto Sans KR', sans-serif;
        }
  .tooltip-inner *{
	box-sizing: border-box;
	}

	.tooltip-inner{
	  min-width:211px;
	  min-height: 150px !important;
	  padding:0px;
	  margin:0px;
	  color:black;
	  backgroud-color:F4F4F4;
	  background: -webkit-gradient(linear, left top, left 25, from(#F4F4F4), color-stop(4%, #F4F4F4), to(#F4F4F4));
	  background: -moz-linear-gradient(top, #F4F4F4, #B4C8D6 1px, #F4F4F4 25px);
	  -webkit-border-radius:9px;
	  -moz-border-radius:9px;
	  border-radius:4px;
	}
	.tooltip-inner img{
		object-fit: cover;
		width: 50px;
		height: 50px;

	}
	.tooltip-inner .card{
	 	width: 210px;
	 	margin:0;
		background-color: #f8f9fa!important;

	}
	.tooltip-inner .card-body{
		padding:: 1.25rem;
	}

	.tooltip-inner .row{
	display:flex;
	}

	.tooltip-inner p{
	  display: block;
	  margin-block-start: 0.3em;
	  margin-block-end: 0.3em;
	  margin-inline-start: 0px;
	  margin-inline-end: 0px;"
	}

	.tooltip-inner .fa-ul{
		list-style-type: none;
		padding-left:0;
		text-align: left;
	}

	.tooltip-inner .firstRow{
	margin-bottom:10px;
	}
	.tooltip-inner li i {
	padding-top:0.3em;
	}

.boxes {
  --size: 32px;
  --duration: 800ms;
  height: calc(var(--size) * 2);
  width: calc(var(--size) * 3);
  position: relative;
  transform-style: preserve-3d;
  transform-origin: 50% 50%;
  margin-top: calc(var(--size) * 1.5 * -1);
  transform: rotateX(60deg) rotateZ(45deg) rotateY(0deg) translateZ(0px);
}
.boxes .box {
  width: var(--size);
  height: var(--size);
  top: 0;
  left: 0;
  position: absolute;
  transform-style: preserve-3d;
}
.boxes .box:nth-child(1) {
  transform: translate(100%, 0);
  -webkit-animation: box1 var(--duration) linear infinite;
          animation: box1 var(--duration) linear infinite;
}
.boxes .box:nth-child(2) {
  transform: translate(0, 100%);
  -webkit-animation: box2 var(--duration) linear infinite;
          animation: box2 var(--duration) linear infinite;
}
.boxes .box:nth-child(3) {
  transform: translate(100%, 100%);
  -webkit-animation: box3 var(--duration) linear infinite;
          animation: box3 var(--duration) linear infinite;
}
.boxes .box:nth-child(4) {
  transform: translate(200%, 0);
  -webkit-animation: box4 var(--duration) linear infinite;
          animation: box4 var(--duration) linear infinite;
}
.boxes .box > div {
  --background: #5c8df6;
  --top: auto;
  --right: auto;
  --bottom: auto;
  --left: auto;
  --translateZ: calc(var(--size) / 2);
  --rotateY: 0deg;
  --rotateX: 0deg;
  position: absolute;
  width: 100%;
  height: 100%;
  background: var(--background);
  top: var(--top);
  right: var(--right);
  bottom: var(--bottom);
  left: var(--left);
  transform: rotateY(var(--rotateY)) rotateX(var(--rotateX)) translateZ(var(--translateZ));
}
.boxes .box > div:nth-child(1) {
  --top: 0;
  --left: 0;
}
.boxes .box > div:nth-child(2) {
  --background: #145af2;
  --right: 0;
  --rotateY: 90deg;
}
.boxes .box > div:nth-child(3) {
  --background: #447cf5;
  --rotateX: -90deg;
}
.boxes .box > div:nth-child(4) {
  --background: #dbe3f4;
  --top: 0;
  --left: 0;
  --translateZ: calc(var(--size) * 3 * -1);
}

@-webkit-keyframes box1 {
  0%, 50% {
    transform: translate(100%, 0);
  }
  100% {
    transform: translate(200%, 0);
  }
}

@keyframes box1 {
  0%, 50% {
    transform: translate(100%, 0);
  }
  100% {
    transform: translate(200%, 0);
  }
}
@-webkit-keyframes box2 {
  0% {
    transform: translate(0, 100%);
  }
  50% {
    transform: translate(0, 0);
  }
  100% {
    transform: translate(100%, 0);
  }
}
@keyframes box2 {
  0% {
    transform: translate(0, 100%);
  }
  50% {
    transform: translate(0, 0);
  }
  100% {
    transform: translate(100%, 0);
  }
}
@-webkit-keyframes box3 {
  0%, 50% {
    transform: translate(100%, 100%);
  }
  100% {
    transform: translate(0, 100%);
  }
}
@keyframes box3 {
  0%, 50% {
    transform: translate(100%, 100%);
  }
  100% {
    transform: translate(0, 100%);
  }
}
@-webkit-keyframes box4 {
  0% {
    transform: translate(200%, 0);
  }
  50% {
    transform: translate(200%, 100%);
  }
  100% {
    transform: translate(100%, 100%);
  }
}
@keyframes box4 {
  0% {
    transform: translate(200%, 0);
  }
  50% {
    transform: translate(200%, 100%);
  }
  100% {
    transform: translate(100%, 100%);
  }
}
html {
  -webkit-font-smoothing: antialiased;
}

* {
  box-sizing: border-box;
}
*:before, *:after {
  box-sizing: border-box;
}

.loader {
  min-height: 100vh;
  font-family: Roboto, Arial;
  color: #adafb6;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #f9fbff;
}
  </style>
</head>
<body class="hold-transition sidebar-mini">
