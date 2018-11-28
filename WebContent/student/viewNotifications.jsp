<%
	String studid = (String) session.getAttribute("studID");
	String studdept = (String) session.getAttribute("studDept");
	String studcol = (String) session.getAttribute("studCollege");

	if (studid == null && studdept == null && studcol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.model.Notification"%>
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
	<h3 style="color: blue;">Notification Details</h3>
	<hr>
	<a href="viewCourses.jsp" class="btn btn-info btn-sm">Back to
		Course</a>
	<hr>
	<table class="table table-bordered">
		<thead>
			<tr>

				<th>Course ID</th>
				<th>Notification</th>
				<th>Instructor</th>
				<th>Date</th>
			</tr>
		</thead>
		<tbody>
			<%
				StudentDao sd = new StudentDao();
				String courseCODE = request.getParameter("CourseID");
				NotificationDao ndao = new NotificationDao();
				List<Notification> nots = ndao.getNotification(courseCODE);
				if (nots.size() != 0) {
					if (courseCODE != null && courseCODE != "") {
						for (Notification not : nots) {
			%>
			<tr>
				<td><%=not.getCourseID()%></td>
				<td><%=not.getNotification()%></td>
				<td><%=not.getInstructorID()%></td>

				<td><%=not.getDate()%></td>
				<td><a
					href="removeNotifications.jsp?removeIDNo=<%=not.getNotifyID()%>"
					class="btn btn-danger btn-sm">Remove</a></td>
			</tr>
			<%
				//System.out.println(not.getNotifyID());
						}
					}
				} else {
			%>
			<tr>
				<td colspan="8"><strong style="color: red; font-size: 30px;">This
						Course has not Notification...!</strong></td>
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