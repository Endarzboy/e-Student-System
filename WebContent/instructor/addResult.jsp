<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.instructorDao.ManageAssignmentResultDao"%>
<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="com.instructorDao.CourseDetail"%>
<%@page import="com.adminDao.AccountDao,com.deptHeadDao.*,com.model.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<style type="text/css">
#frm {
	margin-top: 80px;
	margin-left: 100px;
}
</style>

<%
	String msg = "";
	String deptID = (String) session.getAttribute("instDept");
	String instructorID = (String) session.getAttribute("instID");

	if (request.getParameter("addResult") != null) {

		String studID = request.getParameter("student");
		String stream = request.getParameter("stream");
		String assign = request.getParameter("assign");
		String course = request.getParameter("course");
		String score = request.getParameter("result");
		String mark = request.getParameter("mark");

		AssignmentResult ar = new AssignmentResult();

		String assignResultID = Long.toHexString(Double.doubleToLongBits(Math.random()));

		ar.setAssignResultID("AR" + assignResultID);
		ar.setStudentID(studID);
		ar.setCourseID(course);
		ar.setDeptID(deptID);
		ar.setStreamID(stream);
		ar.setInstructorID(instructorID);
		ar.setAssignmentID(assign);
		ar.setScore(Double.parseDouble(score));
		ar.setMark(Double.parseDouble(mark));
		

		ManageAssignmentResultDao marDao = new ManageAssignmentResultDao();

		boolean inserted = marDao.InsertAssignResult(ar);
		if (inserted) {
			msg = "Score has been Recorded";
		} else {
			msg = "Error in Filling Scores.";
		}

	}
%>

<!-- This is the right panel -->
<div class="col-md-10">
	<h4>Fill Studnet's Assignment Result</h4>
	<hr>
	<%
		Connection con = null;
		PreparedStatement pSt, pSt1, pSt2;
		ResultSet rSet, rSet1, rSet2;
		con = DBConnection.createConnection();

		String selectCourses = "SELECT * FROM Course WHERE DeptID=?";
		pSt = con.prepareStatement(selectCourses);
		pSt.setString(1, deptID);

		rSet = pSt.executeQuery();
	%>

	<%
		if (msg != null && msg != "") {
	%>
	<strong style="color: green;"><%=msg%></strong>
	<%
		}
	%>
	<form action="" method="post">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<%
							CourseDetail cd = new CourseDetail();

							String instID = (String) session.getAttribute("instID");

							String cID = cd.getCourseCode(instID);

							List<CourseToStudent> studs = cd.getStudentTakingCourse(cID);
						%>
						<label>Student ID:</label> <select name="student"
							required="required" class="form-control" style="width: 300px;">
							<option>student</option>
							<%
								for (CourseToStudent s : studs) {
							%>
							<option value="<%=s.getStudentID()%>"><%=s.getStudentID()%></option>
							<%
								}
							%>
						</select>
					</div>

					<div class="form-group">
						<label>Stream:</label> <select name="stream" required="required"
							class="form-control" style="width: 300px;">
							<option>Stream</option>

							<%
								String selectStream = "SELECT * FROM Stream";
								pSt1 = con.prepareStatement(selectStream);

								rSet1 = pSt1.executeQuery();

								while (rSet1.next()) {
							%>
							<option value="<%=rSet1.getString("StreamID")%>"><%=rSet1.getString("StreamName")%></option>
							<%
								}
							%>
						</select>
					</div>
					<div class="form-group">
						<label>Assignment:</label> <select name="assign"
							class="form-control" style="width: 300px;">
							<option>Select Assignment</option>
							<%
								String selectAssignment = "SELECT * FROM AssignmentToPost WHERE InstructorID=?";
								pSt2 = con.prepareStatement(selectAssignment);
								pSt2.setString(1, instructorID);

								rSet2 = pSt2.executeQuery();
								while (rSet2.next()) {
							%>
							<option value="<%=rSet2.getString("AssignID")%>"><%=rSet2.getString("Title")%></option>
							<%
								}
							%>
						</select>

					</div>

				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Course:</label> <select name="course" class="form-control"
							style="width: 300px;">
							<option>Select Course</option>
							<%
								while (rSet.next()) {
							%>
							<option value="<%=rSet.getString("CourseCode")%>"><%=rSet.getString("Title")%></option>
							<%
								}
							%>
						</select>

					</div>
					<div class="form-group">
					<label>Mark:</label>
						<input type="text" name="mark" required="required"
							class="form-control" style="width: 300px;" placeholder="Mark or Weight">
					</div>
					<div class="form-group">
					<label>Score Result:</label>
						<input type="text" name="result" required="required"
							class="form-control" style="width: 300px;" placeholder="Result">
					</div>

					<div class="form-group">
						<input type="submit" name="addResult" value="Submit Result"
							class="btn btn-info btn-sm"> <a href="viewStudentResult.jsp"
							class="btn btn-default btn-sm"> Back to Result</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>