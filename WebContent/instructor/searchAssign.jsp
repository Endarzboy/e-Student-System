<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="java.io.File"%>
<%@page import="com.instructorDao.*,com.model.*, java.util.*,com.deptHeadDao.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<!-- This is the right panel -->
<div class="col-md-10">
	<%
		String deptID = (String) session.getAttribute("instDept");
	%>
	<%
		int pageSize, noOfPages, onPage;

		pageSize = 4;
		noOfPages = (int) (Math.ceil((double) ManagePostAssignDao.getRowCount(deptID) / pageSize));
	%>

	
	<hr>
	<a href="newAssignemt.jsp" class="btn btn-info">New Assignment</a>
	<div style="float: right;">
		<form action="searchAssign.jsp" method="post">
			<input type="text" name="searchAssignment"
				placeholder="Search Assignment">
		</form>
	</div>
	<hr>
	<table class="table">
		<thead>
			<tr>
				<!-- <th>Description</th> -->
				<th>Course</th>
				<th>Department</th>
				<th>Stream</th>
				<th>File Name</th>
				<th>File Size</th>
				<th>Post Date</th>
				<th>DeadLine</th>
				<th>Instructor</th>
				<!-- <th>Batch</th>
				<th>Semester</th> -->
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

				String courseID = request.getParameter("searchAssignment");

				ManagePostAssignDao mpaDao = new ManagePostAssignDao();
				AssignmentToPost at = mpaDao.getAssignmentToPostsByID(courseID);//(deptID, (onPage - 1) * pageSize, pageSize);

				if (courseID != null && courseID != "") {
					if (courseID.equals(at.getCourseID())) {
			%>

			<tr>
				<%-- <td><%=at.getDescription()%></td> --%>
				<td><%=at.getCourseID()%></td>
				<td><%=at.getDeptID()%></td>
				<td><%=at.getStreamID()%></td>
				<td><a
					href="downloadAssignment.jsp?downloadID=<%=at.getAssignID()%>"><%=at.getFileName()%></a></td>
				<td><%=at.getFileSize()%></td>
				<td><%=at.getDateToPost()%></td>
				<td><%=at.getDeadLine()%></td>
				<td><%=at.getInstructorID()%></td>
				<%-- <td><%=at.getBatch()%></td>
							<td><%=at.getSemester()%></td> --%>
				<td><a
					href="editAssignmentToPost.jsp?editAssignID=<%=at.getAssignID()%>"
					class="btn btn-primary">Edit</a> <a
					href="deleteAssignmentToPost.jsp?assignID=<%=at.getAssignID()%>"
					class="btn btn-danger"
					onclick="return confirm('Are you sure to delete?')">Delete</a></td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td colspan="10">No Assignment Found....!</td>
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
	<a href="postAssignment.jsp?page=<%=i%>" class="btn btn-info"><%=i%></a>
	<%
		}
	%>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>