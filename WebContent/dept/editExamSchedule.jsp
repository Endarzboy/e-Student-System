<%
	String depID = (String) session.getAttribute("deptID");
	String depDep = (String) session.getAttribute("deptDept");
	String depCol = (String) session.getAttribute("deptCollege");

	if (depID == null && depDep == null && depCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.deptHeadDao.ManageExamScheduleDao"%>
<%@page import="com.model.ExamSchedule"%>
<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.*,java.util.Date"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">
	<%
		String msg = "", dateWarning = "";
		if (request.getParameter("update") != null) {
			String scid = request.getParameter("scid");
			String courseID = request.getParameter("course");
			//String dept = request.getParameter("dept");
			String dateOfExam = request.getParameter("dateOfExam");
			String examTime = request.getParameter("examTime");
			String invig = request.getParameter("invigilator");
			String batch = request.getParameter("batch");
			String notice = request.getParameter("notice");

			String dept = (String) session.getAttribute("deptDept");

			ExamSchedule es = new ExamSchedule();
			es.setScheduleID(scid);
			es.setCourseID(courseID);
			es.setDeptID(dept);
			es.setDateOfExam(dateOfExam);
			es.setExamNotice(notice);
			es.setExamTime(examTime);
			es.setInvigilator(invig);
			es.setBatch(Integer.parseInt(batch));

			ManageExamScheduleDao esdDao = new ManageExamScheduleDao();

			LocalDate ld = LocalDate.now();
			String today = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(ld);

			SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd");
			Date currentDate = dtf.parse(today);
			Date dateForExam = dtf.parse(dateOfExam);
			
			if(currentDate.compareTo(dateForExam)<0){
				boolean update = esdDao.UpdateSchedule(es);
				if (update) {
					msg = "Schedule has been Updated";
				} else {
					msg = "No schedule has been Updated";
				}
			}else{
				dateWarning = "You are selecting invalid date for the exam";
			}

			
		}
	%>

	<h4>Edit Schedule</h4>
	<hr>

	<%
		String deptID = (String) session.getAttribute("deptDept");
		Connection con = null;
		PreparedStatement pSt, pSt1;
		ResultSet rSet, rSet1;
		con = DBConnection.createConnection();

		String selectCourses = "SELECT * FROM Course WHERE DeptID=?";
		pSt = con.prepareStatement(selectCourses);
		pSt.setString(1, deptID);

		rSet = pSt.executeQuery();
	%>

	<%
		if (msg != null || msg != "") {
	%>
	<div class="alert alert-success">
		<strong><%=msg%></strong>
	</div>
	<%
		}
	%>

	<%
		String scheduleID = request.getParameter("scheduleID");
		ManageExamScheduleDao mesDao = new ManageExamScheduleDao();

		ExamSchedule schedule = mesDao.getScheduleByID(scheduleID);
	%>
	<form action="" method="post" class="form-horizontal">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Schedule ID:</label> <input type="text" name="scid"
							placeholder="Schedule ID" class="form-control"
							style="width: 300px;" required="required"
							value="<%=schedule.getScheduleID()%>">
					</div>
					<div class="form-group">
						<label>Course:</label> <select required="required"
							class="form-control" name="course" style="width: 300px;">
							<option value="<%=schedule.getCourseID()%>"><%=schedule.getCourseID()%></option>
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
						<label>Date of Exam:</label> <input type="date" name="dateOfExam"
							class="form-control" style="width: 300px;" required="required"
							value="<%=schedule.getDateOfExam()%>">
						<%
							if (dateWarning != null && dateWarning != "") {
						%>
						<span style="color: red; font-size: 11px;"><%=dateWarning%></span>
						<%
							}
						%>
					</div>
					<div class="form-group">
						<label>Exam Time:</label> <input type="text" name="examTime"
							placeholder="Exam Time" class="form-control"
							style="width: 300px;" required="required"
							value="<%=schedule.getExamTime()%>">
					</div>
				</div>

				<div class="col-md-6">
					<div class="form-group">
						<label>Invigilator:</label> <input type="text" name="invigilator"
							placeholder="Invigilator" class="form-control"
							style="width: 300px;" required="required"
							value="<%=schedule.getInvigilator()%>">
					</div>
					<div class="form-group">

						<label>Batch:</label> <select name="batch" required="required"
							class="form-control" style="width: 300px;">
							<option value="<%=schedule.getBatch()%>"><%=schedule.getBatch()%></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select>
					</div>
					<div class="form-group">
						<label>Notice:</label>
						<textarea rows="6" cols="100" name="notice" class="form-control"
							style="width: 500px;"><%=schedule.getExamNotice()%></textarea>
					</div>

					<div class="form-group">
						<input type="submit" name="update" value="Update and Post"
							class="btn btn-info btn-sm"> <a href="viewSchedule.jsp"
							class="btn btn-default btn-sm">Back to Schedule</a>
					</div>
				</div>
			</div>
		</div>
	</form>

</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>