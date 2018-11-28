<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="java.util.List"%>
<%@page import="com.instructorDao.*"%>
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
	String instructorID = (String) session.getAttribute("instID");

	int pageSize, noOfPages, onPage;

	pageSize = 4;
	noOfPages = (int) (Math.ceil((double) ManageQuestionDao.getRowCout(instructorID) / pageSize));
%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h4>List of Questions</h4>
	<hr>
	<a href="createExam.jsp" class="btn btn-info btn-sm">Create
		Examination</a> <a href="addQuestions.jsp" class="btn btn-info btn-sm">
		Add Questions</a> <a href="publishExam.jsp" class="btn btn-info btn-sm">
		Back to Examinations</a>

	<div style="float: right;">
		<form action="searchQuestionByExam.jsp" method="post">
			<input type="text" placeholder="Search by Exam ID"
				required="required" class="form-control" style="width: 300px;"
				name="searchExamID">
		</form>
	</div>
	<hr>
	<table class="table">
		<thead>
			<tr>
				<th>Question ID</th>
				<th>Exam ID</th>
				<th>Course ID</th>
				<th>Question No</th>
				<th>Question</th>
				<!-- 	<th>Option#1</th>
				<th>Option#2</th>
				<th>Option#3</th>
				<th>Option#4</th> -->
				<th>Answer</th>
				<th>Weight</th>
				<th>Instructor</th>
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

				ManageQuestionDao mqDao = new ManageQuestionDao();

				List<Questions> qsns = mqDao.getAllQuestion(instructorID, (onPage - 1) * pageSize, pageSize);
				if (instructorID != null && instructorID != "") {
					for (Questions q : qsns) {
			%>
			<tr>
				<td><%=q.getQuestionID()%></td>
				<td><%=q.getExamID()%></td>
				<td><%=q.getCourseID()%></td>
				<td><%=q.getQuestionNo()%></td>
				<td><%=q.getQuestion()%></td>
				<%-- <td><%=q.getOption1()%></td>
				<td><%=q.getOption2()%></td>
				<td><%=q.getOption3()%></td>
				<td><%=q.getOption4()%></td> --%>
				<td><%=q.getAnswer()%></td>
				<td><%=q.getWeight()%></td>
				<td><%=q.getInstructorID()%>
				<td><a
					href="editQuestions.jsp?editQsnIDNo=<%=q.getQuestionID()%>"
					class="btn btn-info btn-sm">Edit</a> <a
					href="deleteQuestion.jsp?deleteQnID=<%=q.getQuestionID()%>"
					onclick="return confirm('Are you sure to delete?')"
					class="btn btn-danger btn-sm">Delete</a></td>

			</tr>
			<%
				}
				}
			%>
		</tbody>
	</table>
	<a href="viewQuestions.jsp?page=<%=1%>" class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewQuestions.jsp?page=<%=i%>" class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a href="viewQuestions.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>