<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="java.util.List"%>
<%@page import="com.instructorDao.ManageSubmittedAssignDao,com.model.*"%>
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
	noOfPages = (int) (Math.ceil((double) ManageSubmittedAssignDao.getRowCount(instID) / pageSize));
%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h4>Submitted Assignments and Projects</h4>
	<hr>
	<div style="float: right;">
		<form action="searchSubmittedAssign.jsp" method="post">
			<input type="text" name="searchSubmittedAssign"
				placeholder="Search Assignments Course ID" style="width: 270px;">
		</form>
	</div>
	<hr>
	<table class="table">
		<thead>
			<tr>
				<th>Course</th>
				<th>Department</th>
				<!-- <th>Stream</th> -->
				<th>File Name</th>
				<th>File Size</th>
				<th>Submitted Date</th>
				<!-- <th>Batch</th> -->
				<th>Instructor</th>
				<th>Student</th>
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
				String courseID = request.getParameter("searchSubmittedAssign");

				ManageSubmittedAssignDao msaDao = new ManageSubmittedAssignDao();
				SubmittedAssignment sa = msaDao.getSubmittedAssignmentByCourseID(courseID);

				if (instID != null && instID != "") {
					if (courseID.equals(sa.getCourseID())) {
			%>
			<tr>
				<td><%=sa.getCourseID()%></td>
				<td><%=sa.getDeptID()%></td>
				<%-- <td><%=sa.getStreamID()%></td> --%>
				<td><a
					href="downloadSubAssign.jsp?downloadSubAssID=<%=sa.getSubAssignID()%>"><%=sa.getFileName()%></a></td>
				<td><%=sa.getFileSize()%></td>
				<td><%=sa.getSubmittedDate()%></td>
				<%-- <td><%=sa.getBatch()%></td> --%>
				<td><%=sa.getInstructorID()%></td>
				<td><%=sa.getStudentID()%></td>
				<td><a
					href="downloadSubAssign.jsp?downloadSubAssID=<%=sa.getSubAssignID()%>"
					class="btn btn-primary">Download</a> <a
					href="deleteSubmittedAssign.jsp?deleteSubAssignID=<%=sa.getSubAssignID()%>"
					onclick="return confirm('Are you sure to Delete?')"
					class="btn btn-danger">Delete</a></td>

			</tr>
			<%
				} else if (!courseID.equals(sa.getCourseID())) {
			%>
			<tr>
				<td colspan="8">No Result founds...</td>
			</tr>
			<%
				}
				}
			%>
		</tbody>
	</table>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewAssignProject.jsp?page=<%=i%>" class="btn btn-info"><%=i%></a>
	<%
		}
	%>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>