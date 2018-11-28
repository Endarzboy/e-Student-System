<%
	String studid = (String) session.getAttribute("studID");
	String studdept = (String) session.getAttribute("studDept");
	String studcol = (String) session.getAttribute("studCollege");

	if (studid == null && studdept == null && studcol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>

<%@page import="com.model.SubmittedAssignment"%>
<%@page import="com.studentDao.SubmitAssignmentDao"%>
<%@page import="com.model.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.studentDao.StudentDao"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">
	<%
		String studentID = (String) session.getAttribute("studID");

		int pageSize, noOfPages, onPage;

		pageSize = 4;
		noOfPages = (int) (Math.ceil((double) SubmitAssignmentDao.getRowCount(studentID) / pageSize));
	%>
	<h3 style="color: blue;">List of Submitted Assignments and
		Projects</h3>
	<hr>
	<a href="viewCourses.jsp" class="btn btn-info btn-sm">Back to
		Courses</a>
	<table class="table table-bordered">
		<thead>
			<tr>
				<!-- <th>Assign ID</th> -->
				<th>Course</th>
				<th>Department</th>
				<th>Stream</th>
				<th>File Name</th>
				<th>File Size</th>
				<th>Submitted Date</th>
				<th>Instructor</th>
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
				SubmitAssignmentDao saDao = new SubmitAssignmentDao();
				List<SubmittedAssignment> sas = saDao.getAllSubmittedAssignments(studentID, (onPage - 1) * pageSize,
						pageSize);
				if (sas.size() != 0) {
					if (studentID != null && studentID != "") {
						for (SubmittedAssignment sa : sas) {
			%>
			<tr>
				<%-- <td><%=sa.getSubAssignID()%></td> --%>
				<td><%=sa.getCourseID()%></td>
				<td><%=sa.getDeptID()%></td>
				<td><%=sa.getStreamID()%></td>
				<td><a
					href="downloadUploadedAssign.jsp?downloadUploadedID=<%=sa.getSubAssignID()%>"><%=sa.getFileName()%></a></td>
				<td><%=sa.getFileSize()%></td>
				<td><%=sa.getSubmittedDate()%></td>
				<td><%=sa.getInstructorID()%></td>
				<td><%=sa.getBatch()%></td>
				<td><a
					href="downloadUploadedAssign.jsp?downloadUploadedID=<%=sa.getSubAssignID()%>"
					class="btn btn-primary btn-sm">Download</a></td>
			</tr>
			<%
				}
					}
				} else {
			%>
			<tr>
				<td colspan="8"><strong style="color: red; font-size: 30px;">You
						Did not submitted any Sort of Assignment...!</strong></td>
			</tr>
			<%
				}
			%>
		</tbody>

	</table>
	<a href="viewAssignments.jsp?page=<%=1%>" class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewAssignments.jsp?page=<%=i%>" class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a href="viewAssignments.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>