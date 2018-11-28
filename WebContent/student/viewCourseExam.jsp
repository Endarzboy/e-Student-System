<%
	String studid = (String) session.getAttribute("studID");
	String studdept = (String) session.getAttribute("studDept");
	String studcol = (String) session.getAttribute("studCollege");

	if (studid == null && studdept == null && studcol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.model.Examination"%>
<%@page import="com.studentDao.GetExamInfoDao"%>
<%@page import="com.deptHeadDao.ManageCourseDao"%>
<%@page import="com.studentDao.HandoutDao"%>
<%@page import="com.model.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.studentDao.StudentDao"%>
<%@page import="com.model.Course"%>
<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">
	<%
		ManageCourseDao mcDao = new ManageCourseDao();

		String ccode = request.getParameter("courseExamIDNo");
		if (ccode != null && ccode != "") {

			Course cc = mcDao.getCourseByCode(ccode);
	%>
	<h3 style="color: blue;">
		List of Exams for <strong style="color: red;"><%=cc.getTitle()%></strong>
	</h3>
	<hr>
	<a href="viewCourses.jsp" class="btn btn-info btn-sm">Back to
		Courses</a>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Exam ID</th>
				<th>Exam Title</th>
				<th>Course</th>
				<th>Department</th>
				<th>Stream</th>
				<th>Instructor</th>
				<th>Start Time</th>
				<th>End Time</th>
				<th>Schedule ID</th>
				<th>Mark</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<%
				GetExamInfoDao getExDao = new GetExamInfoDao();
					List<Examination> exams = getExDao.getExamByCourseID(ccode);
					// Objects to get start and end time
					GetExamInfoDao getExamInf = new GetExamInfoDao();

					String today = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(LocalDate.now());

					/* ---------------- Validating Expiry -------------------- */

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					sdf.setTimeZone(TimeZone.getTimeZone("UTC"));

					SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
					sdfDate.setTimeZone(TimeZone.getTimeZone("UTC+08:00"));

					SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
					sdfTime.setTimeZone(TimeZone.getTimeZone("UTC+08:00"));

					/* ------------------------------------------------------- */

					if (exams.size() != 0) {

						for (Examination e : exams) {

							// Get day and time of exam start time
							Date StartDate = sdf.parse(e.getStartTime());
							String startDt = sdfDate.format(StartDate);//2018-03-18
							String startTm = sdfTime.format(StartDate);//03:30:00

							/* ------------------------------------------------------- */
							// Get day and time of exam end time
							Date endDate = sdf.parse(e.getEndTime());
							String endExamDate = sdfDate.format(StartDate);//2018-03-18
							String endExamTime = sdfTime.format(StartDate);//03:30:00
							
							/* System.out.println("End Time: "+endExamTime);
							System.out.println("Start Time:"+startTm); */

							// Get current date and time
							Date currentDate = new Date();
							String currentTime = sdfTime.format(currentDate.getTime());
							//System.out.println("Current Time: "+currentTime);
							
							if (today.compareTo(startDt) == 0 && currentTime.compareTo(endExamTime) < 0) {
			%>
			<tr>
				<td><%=e.getExamID()%></td>
				<td><%=e.getExamTitle()%></td>
				<td><%=e.getCourseID()%></td>
				<td><%=e.getDeptID()%></td>
				<td><%=e.getStreamID()%></td>
				<td><%=e.getInstructorID()%></td>
				<td><%=e.getStartTime()%></td>
				<td><%=e.getEndTime()%></td>
				<td><%=e.getScheduleID()%></td>
				<td><%=e.getMark()%></td>
				<td><a href="examDetails.jsp?examIDNo=<%=e.getExamID()%>"
					class="btn btn-info btn-sm">Start Exam</a></td>

			</tr>
			<%
				} else if (today.compareTo(startDt) > 0 ) {//&& currentTime.compareTo(endExamTime) > 0
			%>
			<tr>
				<td colspan="8"><strong style="color: red; font-size: 30px;">The
						Examination has already Passed...!</strong></td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td colspan="8"><strong style="color: red; font-size: 30px;">This Course has not
						Examination...!</strong></td>
			</tr>
			<%
				}
						}
					} else {
			%>
			<tr>
				<td colspan="8"><strong style="color: red; font-size: 30px;">This
						Course has not Examination...!</strong></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>
<%
	}
%>