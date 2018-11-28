<%
	String studid = (String) session.getAttribute("studID");
	String studdept = (String) session.getAttribute("studDept");
	String studcol = (String) session.getAttribute("studCollege");

	if (studid == null && studdept == null && studcol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.clientSide.NotificationDao"%>
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
	<h3 style="color: blue;">List of Courses I am Taking</h3>
	<hr>
	<table class="table table-bordered" style="color: black; font-family: serif;">
		<thead>
			<tr>
				<th>Alert</th>
				<th>Course ID</th>
				<th>Title</th>
				<th>Credit</th>
				<!-- <th>Pre-Requisite</th> -->
				<th>Department</th>
				<th>Stream</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
				StudentDao sd = new StudentDao();
				String studentID = (String) session.getAttribute("studID");

				List<Course> courses = sd.getCourseList(studentID);

				NotificationDao nda = new NotificationDao();
				int countNotify = 0;
				if (studentID != null && studentID != "") {
					for (Course c : courses) {
						countNotify = nda.countNotifications(c.getCourseCode());
			%>
			<tr>
				<%
					if (countNotify >= 1) {
				%>
				<td><a
					href="viewNotifications.jsp?CourseID=<%=c.getCourseCode()%>"
					class="btn btn-primary btn-sm"><span class="badge" style="">(
							<%=countNotify%> )
					</span></a></td>
				<%
					} else {
				%>
				<td>&nbsp;</td>
				<%
					}
				%>
				<td><%=c.getCourseCode()%></td>
				<td><%=c.getTitle()%></td>
				<td><%=c.getCreditHour()%></td>
				<%-- <td><%=c.getPreRequisit()%></td> --%>
				<td><%=c.getDeptID()%></td>
				<td><%=c.getStreamID()%></td>
				<td><a
					href="submitAssignment.jsp?courseIDNo=<%=c.getCourseCode()%>"
					class="btn btn-info btn-sm">Assignment</a> <a
					href="viewHandouts.jsp?courseIDNoforHo=<%=c.getCourseCode()%>"
					class="btn btn-success btn-sm">Handouts</a> <a
					href="viewCourseExam.jsp?courseExamIDNo=<%=c.getCourseCode()%>"
					class="btn btn-danger btn-sm">Take Exam</a></td>
			</tr>
			<%
				}
				}
			%>
		</tbody>
	</table>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>