<%
	String depID = (String) session.getAttribute("deptID");
	String depDep = (String) session.getAttribute("deptDept");
	String depCol = (String) session.getAttribute("deptCollege");

	if (depID == null && depDep == null && depCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.model.ExamSchedule"%>
<%@page import="java.util.List"%>
<%@page import="com.deptHeadDao.ManageExamScheduleDao"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">

	<%
		String deptID = (String) session.getAttribute("deptDept");
	%>
	<%
		int pageSize, noOfPages, onPage;

		pageSize = 4;
		noOfPages = (int) (Math.ceil((double) ManageExamScheduleDao.getRowCount(deptID) / pageSize));
	%>


	<h4>Organize Schedule</h4>
	<hr>

	<a href="newSchedule.jsp" class="btn btn-info btn-sm">New Schedule</a>
	<hr>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>ScheduleID</th>
				<th>CourseID</th>
				<th>DeptID</th>
				<th>Date</th>
				<!-- <th>Notice</th> -->
				<th>Time</th>
				<th>Invigilator</th>
				<th>Batch</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
				String pageNumber = request.getParameter("page");
				if (pageNumber == null) {
					onPage = 1;
				} else {
					try {
						onPage = Integer.parseInt(pageNumber);
					} catch (NumberFormatException e) {
						onPage = 1;
					}
				}
				ManageExamScheduleDao mesDao = new ManageExamScheduleDao();
				List<ExamSchedule> ess = mesDao.getAllSchedule(deptID, (onPage - 1) * pageSize, pageSize);

				for (ExamSchedule es : ess) {
			%>
			<tr>
				<td><%=es.getScheduleID()%></td>
				<td><%=es.getCourseID()%></td>
				<td><%=es.getDeptID()%></td>
				<td><%=es.getDateOfExam()%></td>
				<%-- <td><%=es.getExamNotice()%></td> --%>
				<td><%=es.getExamTime()%></td>
				<td><%=es.getInvigilator()%></td>
				<td><%=es.getBatch()%></td>
				<td><a
					href="editExamSchedule.jsp?scheduleID=<%=es.getScheduleID()%>"
					class="btn btn-primary btn-sm">Edit</a> <a
					href="deleteExamSchedule.jsp?scheduleID=<%=es.getScheduleID()%>"
					class="btn btn-danger btn-sm"
					onclick="return confirm('Are you sure to delete?')">Delete</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<a href="viewSchedule.jsp?page=<%=1%>" class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewSchedule.jsp?page=<%=i%>" class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a href="viewSchedule.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>