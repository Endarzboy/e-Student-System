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
	String examID = request.getParameter("searchExamID");
%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h4>List of Questions</h4>
	<hr>
	<a href="createExam.jsp" class="btn btn-info">Create Examination</a> <a
		href="addQuestions.jsp" class="btn btn-info"> Add Questions</a> <a
		href="publishExam.jsp" class="btn btn-info"> View Examinations</a>

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
				<!-- <th>Option#1</th>
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
				ManageQuestionDao mqDao = new ManageQuestionDao();

				List<Questions> questions = mqDao.getQuestionByExamID(examID);
				if (examID != null && examID != "") {
					for (Questions q : questions) {
						if (examID.equals(q.getExamID())) {
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
				<td><a href="editQuestions.jsp?editQsnIDNo=<%=q.getQuestionID()%>"
					class="btn btn-info">Edit</a> <a
					href="deleteQuestion.jsp?deleteQnID=<%=q.getQuestionID()%>"
					onclick="return confirm('Are you sure to delete?')"
					class="btn btn-danger">Delete</a></td>

			</tr>
			<%
				} else {
			%>
			<tr>
				<td colspan="8">No Result Found</td>
			</tr>
			<%
				}
					}
				}
			%>
		</tbody>
	</table>

</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>