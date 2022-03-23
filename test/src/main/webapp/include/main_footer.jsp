<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-light">

            <!-- Control sidebar content goes here -->
            <div class="card card-info card-outline">
				<div class="card-header" style="margin-top: 10px; margin-bottom:10px;">
                	<div class="row" style="justify-content: space-around;">
		               <a class="btn bg-primary" style="height: 40px; width:55px; padding:5px; magin:0;" onclick="#"><i class="fas fa-envelope"></i></a>
		               <a class="btn bg-warning" style="height: 40px; width:55px; padding:5px; magin:0;" onclick="#"><i class="far fa-comment-dots"></i></a>
		               <a class="btn bg-danger" style="height: 40px; width:55px; padding:5px; magin:0;" onclick="#"><i class="fas fa-file-signature"></i> </a>
		               <a class="btn bg-success" style="height: 40px; width:55px; padding:5px; magin:0;" onclick="#"><i class="fas fa-briefcase"></i> </a>
                	</div>
				</div>
                <div class="card-body" style="padding-top:0">
                	<a id="attBtn" href="#" class="btn btn-outline-primary btn-block"><b>버튼</b></a>
                   
                    <div class="selectBox" style="padding-bottom:8px;">
         				<select class="select2 select2-hidden-accessible"  name="attOption" id="attOption" onchange="att_go();" data-placeholder="근무 상태 선택 " style="height: 100%; width: 100%; font-size: 0.3em; line-height: 20px;"  tabindex="-1" aria-hidden="true">
                        	<option class="attOptions" value="op1" selected="selected">선택1</option>
                        	<option class="attOptions" value="op2" >선택2</option>
                        	<option class="attOptions" value="op3" >선택3</option>
	                  	</select>
                    </div>
	                <button type="button" class="btn btn-outline-info btn-block btn-xs" onclick="#">버튼1</button>
					<button type="button" class="btn btn-outline-secondary btn-block btn-xs" onclick="#">버튼2</button>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </aside>
        <!-- /.control-sidebar -->
        <!-- Main Footer -->
        <footer class="main-footer" >
            <!-- To the right -->
            <div class="float-right d-none d-sm-inline">
            	Test-Page-Footer
            </div>
            <!-- Default to the left -->
            <strong>Copyright &copy; 2022 <span class="text-info">abli-sys</span></strong> All rights
            reserved.
        </footer>

    </div>


<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- SweetAlert2 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Select2 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/select2/js/select2.full.min.js"></script>
<!-- date-range-picker -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/daterangepicker/daterangepicker.js"></script>
<!-- BS-Stepper -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bs-stepper/js/bs-stepper.min.js"></script>
<!-- dropzonejs -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/dropzone/min/dropzone.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- Summernote -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>


</body>
</html>