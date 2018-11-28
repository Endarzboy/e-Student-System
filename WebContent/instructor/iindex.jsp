
<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>

<%@page import="com.deptHeadDao.ManageTeacherDao"%>
<%@page import="com.model.Instructor"%>
<%@page import="com.adminDao.AccountDao"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">

	<%
		AccountDao acDao = new AccountDao();
		String courseCode = acDao.selectCourse((String) session.getAttribute("instID"));
		String instructorID = (String) session.getAttribute("instID");
		ManageTeacherDao mtd = new ManageTeacherDao();

		Instructor instname = mtd.getInstructorByID(instructorID);
	%>

	<h3 style="color: blue;">List of Instructors Task</h3>
	<hr>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<a href="postAssignment.jsp" class="btn btn-info btn-sm"
						style="width: 300px;">Post Assignment</a>
				</div>

				<div class="form-group">
					<a href="publishExam.jsp" class="btn btn-info btn-sm"
						style="width: 300px;">Publish Exam</a>
				</div>
				<div class="form-group">
					<a href="viewAssignProject.jsp" class="btn btn-info btn-sm"
						style="width: 300px;">View Assignments or Projects</a>
				</div>

			</div>
			<div class="col-md-6">
				<div class="form-group">
					<a href="viewHandouts.jsp" class="btn btn-info btn-sm"
						style="width: 300px;">Upload Handout</a>
				</div>
				<div class="form-group">
					<a href="viewStudentResult.jsp" class="btn btn-info btn-sm"
						style="width: 300px;">Student Result</a>
				</div>
				<div class="form-group">
					<a href="viewProfile.jsp" class="btn btn-info btn-sm"
						style="width: 300px;">Profile</a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>