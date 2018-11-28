<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="java.util.List"%>
<%@page import="com.instructorDao.ManageAssignmentResultDao"%>
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
	String instID = (String) session.getAttribute("instID");

	int pageSize, noOfPages, onPage;

	pageSize = 4;
	noOfPages = (int) (Math.ceil((double) ManageAssignmentResultDao.getRowCount(instID) / pageSize));
%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h4>List of Students Assignments Result</h4>
	<hr>
	<a href="addResult.jsp" class="btn btn-info btn-sm">Add Assignment
		Result</a> <a href="viewExamResult.jsp" class="btn btn-info btn-sm">View
		Exam Result</a>
	<div style="float: right;">
		<form action="searchAssignResult.jsp" method="post">
			<input type="text" name="searchAssignResult"
				placeholder="Search Assignments Result" style="width: 270px;">
		</form>
	</div>
	<hr>
	<table class="table">
		<thead>
			<tr>
				<th>Result ID</th>
				<th>Student ID</th>
				<tH>Course</tH>
				<th>Department</th>
				<th>Stream</th>
				<th>Instructor</th>
				<th>Assignment ID</th>
				<th>Score</th>
				<th>Actions</th>
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

				ManageAssignmentResultDao marDao = new ManageAssignmentResultDao();
				List<AssignmentResult> ars = marDao.getAllAssignResults(instID, (onPage - 1) * pageSize, pageSize);
				if (instID != null && instID != "") {
					for (AssignmentResult ar : ars) {
			%>
			<tr>
				<td><%=ar.getAssignResultID()%></td>
				<td><%=ar.getStudentID()%></td>
				<td><%=ar.getCourseID()%></td>
				<td><%=ar.getDeptID()%></td>
				<td><%=ar.getStreamID()%></td>
				<td><%=ar.getInstructorID()%></td>
				<td><%=ar.getAssignmentID()%></td>
				<td><strong style="color: red;"><%=ar.getScore()%></strong> / <strong><%=marDao.getMark(ar.getAssignResultID())%></strong>
				</td>
				<td><a
					href="editAssignmentResult.jsp?editAssResultID=<%=ar.getAssignResultID()%>"
					class="btn btn-primary btn-sm">Edit</a> <a
					href="deleteAssignResult.jsp?deleteAssignResultID=<%=ar.getAssignResultID()%>"
					onclick="return confirm('Are you sure to delete?')"
					class="btn btn-danger btn-sm">Delete</a></td>
			</tr>
			<%
				}
				}
			%>
		</tbody>
	</table>
	<a href="viewStudentResult.jsp?page=<%=1%>" class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewStudentResult.jsp?page=<%=i%>" class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a href="viewStudentResult.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>