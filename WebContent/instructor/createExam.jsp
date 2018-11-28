<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.model.*,com.instructorDao.*"%>
<%@page import="com.db.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.instructorDao.ManageExamDao"%>
<%@page import="com.adminDao.AccountDao,com.deptHeadDao.*,com.model.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>



<%
	String msg = "", datewarning = "";

	if (request.getParameter("addExam") != null) {

		String examID = request.getParameter("examID");
		String title = request.getParameter("title");
		String course = request.getParameter("course");
		String dept = (String) session.getAttribute("instDept");
		String stream = request.getParameter("stream");
		String startDate = request.getParameter("startDate");
		String startTime = request.getParameter("startTime");
		String endDate = request.getParameter("endDate");
		String endTime = request.getParameter("endTime");
		String instructor = (String) session.getAttribute("instID");
		String schedule = request.getParameter("scheduleID");
		String mark = request.getParameter("mark");

		Examination exam = new Examination();

		exam.setExamID(examID);
		exam.setExamTitle(title);
		exam.setCourseID(course);
		exam.setDeptID(dept);
		exam.setStreamID(stream);
		exam.setStreamID(stream);
		exam.setStartTime(startDate + " " + startTime);
		exam.setEndTime(endDate + " " + endTime);
		exam.setInstructorID(instructor);
		exam.setScheduleID(schedule);
		exam.setMark(Integer.parseInt(mark));

		ManageExamDao meDao = new ManageExamDao();

		LocalDate ld = LocalDate.now();
		String today = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(ld);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date currentDate = sdf.parse(today);
		Date publishDate = sdf.parse(startDate);

		if (currentDate.compareTo(publishDate) > 0) {
			datewarning = "You are setting the previous date for published date";
		} else {
			boolean inserted = meDao.InsertExam(exam);
			if (inserted) {
				msg = "Exam Created Successfully.";
			}
		}

	}
%>

<%
	String deptID = (String) session.getAttribute("instDept");
	Connection con = null;
	PreparedStatement pSt, pSt1, pSt2;
	ResultSet rSet, rSet1, rSet2;
	con = DBConnection.createConnection();

	String selectCourses = "SELECT * FROM Course WHERE DeptID=?";
	pSt = con.prepareStatement(selectCourses);
	pSt.setString(1, deptID);

	rSet = pSt.executeQuery();
%>
<style type="text/css">
#frm {
	margin-top: 80px;
	margin-left: 100px;
}
</style>

<!-- This is the right panel -->
<div class="col-md-10">
	<h4>Create Examination</h4>
	<hr>
	<%
		if (msg != null && msg != "") {
	%>
	<strong style="color: green; font-weight: bold;"><%=msg%></strong>
	<%
		}
	%>
	<form action="" method="post">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Exam ID:</label><input type="text" name="examID"
							placeholder="Exam ID" required="required" class="form-control"
							style="width: 300px;">
					</div>

					<div class="form-group">
						<label>Exam Title:</label><input type="text" name="title"
							placeholder="Exam Title" required="required" class="form-control"
							style="width: 300px;">
					</div>
					<div class="form-group">
						<label>Course:</label> <select name="course" required="required"
							class="form-control" style="width: 300px;">
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
						<%
							String selectStream = "SELECT * FROM Stream";
							pSt1 = con.prepareStatement(selectStream);
							//pSt1.setString(1, deptID);

							rSet1 = pSt1.executeQuery();
						%>
						<label>Stream:</label> <select name="stream" required="required"
							class="form-control" style="width: 300px;">
							<option>Select Stream</option>
							<%
								while (rSet1.next()) {
							%>
							<option value="<%=rSet1.getString("StreamID")%>"><%=rSet1.getString("StreamName")%></option>
							<%
								}
							%>
						</select>
					</div>

				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Start Time:</label> <input type="date" name="startDate"
							required="required" class="form-control" style="width: 200px;"><input
							type="time" name="startTime" required="required"
							class="form-control" style="width: 200px;">
						<%
							if (datewarning != null && datewarning != "") {
						%>
						<strong style="color: red; font-size: 13px;"><%=datewarning%></strong>
						<%
							}
						%>
					</div>


					<div class="form-group">
						<label>End Time:</label> <input type="date" name="endDate"
							placeholder="Allocated Time" required="required"
							class="form-control" style="width: 200px;"><input
							type="time" name="endTime" required="required"
							class="form-control" style="width: 200px;">
					</div>
					<div class="form-group">
						<%
							String selectSchedule = "SELECT * FROM ExamSchedule WHERE DeptID=?";
							pSt2 = con.prepareStatement(selectSchedule);
							pSt2.setString(1, deptID);

							rSet2 = pSt2.executeQuery();
						%>
						<label>Scheduled ID:</label> <select name="scheduleID"
							required="required" class="form-control" style="width: 300px;">
							<option>Schedule ID</option>
							<%
								while (rSet2.next()) {
							%>
							<option value="<%=rSet2.getString("ScheduleID")%>"><%=rSet2.getString("ScheduleID")%></option>
							<%
								}
							%>
						</select>
					</div>
					<div class="form-group">
						<label>Exam Mark:</label><input type="text" name="mark"
							placeholder="Exam Mark" required="required" class="form-control"
							style="width: 300px;">
					</div>
					<div class="form-group">
						<input type="submit" name="addExam" value="Save Exam"
							class="btn btn-info btn-sm"> <a href="publishExam.jsp"
							class="btn btn-default btn-sm"> Back to Exam List</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>