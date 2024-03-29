<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="java.util.List"%>
<%@page import="com.instructorDao.ManageExamDao"%>
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
%>
<%
	int pageSize, noOfPages, onPage;

	pageSize = 4;
	noOfPages = (int) (Math.ceil((double) ManageExamDao.getRowCount(instID) / pageSize));
%>

<!-- This is the right panel -->
<div class="col-md-10">
	<h4>List of Available Examinations</h4>
	<hr>
	<a href="createExam.jsp" class="btn btn-info">Create Examination</a> <a
		href="addQuestions.jsp" class="btn btn-info"> Add Questions</a> <a
		href="viewQuestions.jsp" class="btn btn-info"> View Questions</a>

	<div style="float: right;">
		<form action="searchExam.jsp" method="post">
			<input type="text" name="searchExam" placeholder="Search Exam by ID">
		</form>
	</div>
	<hr>
	<table class="table">
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

				String searchKey = request.getParameter("searchExam");

				ManageExamDao meDao = new ManageExamDao();
				
				Examination e = meDao.getExamByID(searchKey);
				
				if (searchKey != null && searchKey != "") {
					if (searchKey.equals(e.getExamID())) {
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
				<td><%=e.getMark() %></td>
				<td><a href="editExam.jsp?editExamID=<%=e.getExamID()%>"
					class="btn btn-primary">Edit</a> <a
					href="deleteExam.jsp?examIDNo=<%=e.getExamID()%>"
					class="btn btn-danger"
					onclick="return confirm('Are you sure to delete?')"> Delete</a></td>

			</tr>

			<%
				} else {
			%>
			<tr>
				<td colspan="7">No Exam Found....!</td>
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
	<a href="publishExam.jsp?page=<%=i%>" class="btn btn-info"><%=i%></a>
	<%
		}
	%>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>