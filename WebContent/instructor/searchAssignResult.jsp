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
	<h4>List of Students Result</h4>
	<hr>
	<a href="addResult.jsp" class="btn btn-info">Add Result</a>
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

				String searchKeyword = request.getParameter("searchAssignResult");

				ManageAssignmentResultDao marDao = new ManageAssignmentResultDao();

				AssignmentResult ar = marDao.getAssignResultsByStudentID(searchKeyword);
				if (searchKeyword != null && searchKeyword != "") {
					if (searchKeyword.equals(ar.getAssignResultID())) {
			%>
			<tr>
				<%-- <td><%=ar.getAssignResultID()%></td> --%>
				<td><%=ar.getStudentID()%></td>
				<td><%=ar.getCourseID()%></td>
				<td><%=ar.getDeptID()%></td>
				<td><%=ar.getStreamID()%></td>
				<td><%=ar.getInstructorID()%></td>
				<td><%=ar.getAssignmentID()%></td>
				<td><%=ar.getScore()%></td>
				<td><a
					href="editAssignmentResult.jsp?editAssResultID=<%=ar.getAssignResultID()%>"
					class="btn btn-primary">Edit</a> <a
					href="deleteAssignResult.jsp?deleteAssignResultID=<%=ar.getAssignResultID()%>"
					onclick="return confirm('Are you sure to delete?')"
					class="btn btn-danger">Delete</a></td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td colspan="8">No Result Found....</td>
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
	<a href="viewStudentResult.jsp?page=<%=i%>" class="btn btn-info"><%=i%></a>
	<%
		}
	%>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>