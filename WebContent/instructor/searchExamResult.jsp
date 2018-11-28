<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.instructorDao.ExamResultDao"%>
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

	AccountDao acDao = new AccountDao();
	String courseCode = acDao.selectCourse(instID);

	int pageSize, noOfPages, onPage;

	pageSize = 4;
	noOfPages = (int) (Math.ceil((double) ExamResultDao.getRowCount(courseCode) / pageSize));
%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h4>List of Students Result</h4>
	<hr>
	<a href="addResult.jsp" class="btn btn-info">Add Assignment Result</a>
	<a href="viewStudentResult.jsp" class="btn btn-info">Back to
		Assignment</a>
	<div style="float: right;">
		<form action="searchExamResult.jsp" method="post">
			<input type="text" name="searchExamResult"
				placeholder="Search Exam Result" style="width: 270px;">
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

				<th>Exam ID</th>
				<th>Score</th>
				<th>Date of Exam</th>
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

				ExamResultDao erDao = new ExamResultDao();
				String studentID = request.getParameter("searchExamResult");

				ExamResult er = erDao.getExamResultByStudID(studentID);
				if (studentID != null && studentID != "") {
					if (studentID.equals(er.getStudID())) {
			%>
			<tr>
				<td><%=er.getExamResultID()%></td>
				<td><%=er.getStudID()%></td>
				<td><%=er.getCourseID()%></td>
				<td><%=er.getDeptID()%></td>
				<td><%=er.getExamID()%></td>
				<td><strong style="color: red;"><%=er.getScoreObtained()%></strong>
					/ <strong style="color: blue;"><%=erDao.getMark(er.getExamID())%></strong></td>
				<td><%=er.getDateOfExam()%></td>
				<%-- <td><a
					href="editExamResult.jsp?editExamResultID=<%=er.getExamResultID()%>"
					class="btn btn-primary">Edit</a> <a
					href="deleteExamResult.jsp?deleteExamResultID=<%=er.getExamResultID()%>"
					onclick="return confirm('Are you sure to delete?')"
					class="btn btn-danger">Delete</a></td> --%>
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
	<a href="viewExamResult.jsp?page=<%=i%>" class="btn btn-info"><%=i%></a>
	<%
		}
	%>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>