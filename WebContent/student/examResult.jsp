<%
	String studid = (String) session.getAttribute("studID");
	String studdept = (String) session.getAttribute("studDept");
	String studcol = (String) session.getAttribute("studCollege");

	if (studid == null && studdept == null && studcol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>

<%@page import="com.model.ExamResult"%>
<%@page import="com.studentDao.ExamResultDao"%>
<%@page import="com.studentDao.AssignmentResultDao"%>
<%@page import="com.model.AssignmentResult"%>
<%@page import="java.util.List"%>
<%@page import="com.instructorDao.ManageAssignmentResultDao"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">
	<%
		String studentID = (String) session.getAttribute("studID");

		int pageSize, noOfPages, onPage;

		pageSize = 4;
		noOfPages = (int) (Math.ceil((double) ExamResultDao.getRowCount(studentID) / pageSize));
	%>
	<a href="viewAssignmentResults.jsp" class="btn btn-info btn-sm">View
		Assignment Result</a> <a href="examResult.jsp" class="btn btn-info btn-sm">View
		Exam Result</a>
	<hr>
	<h3 style="color: blue;">Examination Result</h3>
	<hr>
	<table class="table table-bordered" id="tblExamResult">
		<thead>
			<tr>
				<!-- <th>Result ID</th> -->
				<th>Student ID</th>
				<tH>Course</tH>
				<th>Department</th>
				<th>Assignment ID</th>
				<th>Score</th>
				<th>Date</th>
				<!-- 	<th>Actions</th> -->
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

				ExamResultDao arDao = new ExamResultDao();
				List<ExamResult> ars = arDao.getAllExamResults(studentID, (onPage - 1) * pageSize, pageSize);
				if(ars.size()!=0){
				if (studentID != null && studentID != "") {
					for (ExamResult ar : ars) {
			%>
			<tr>
				<%-- <td><%=ar.getExamResultID()%></td> --%>
				<td><%=ar.getStudID()%></td>
				<td><%=ar.getCourseID()%></td>
				<td><%=ar.getDeptID()%></td>
				<td><%=ar.getExamID()%></td>
				<td><strong style="color: red;"><%=ar.getScoreObtained()%></strong>
					/ <strong style="color: blue;"><%=arDao.getMark(ar.getExamID())%></strong></td>
				<td><%=ar.getDateOfExam()%></td>


			</tr>
			<%
				}
				}} else {
					%>
					<tr>
						<td colspan="8"><strong style="color: red; font-size: 30px;">No Exam Result has been Released...!</strong></td>
					</tr>
					<%
						}
			%>
		</tbody>
	</table>
	<a href="examResult.jsp?page=<%=1%>" class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="examResult.jsp?page=<%=i%>" class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a href="examResult.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a> 

<input type="button" id="btnExport" name="btnExcel" class="btn btn-info btn-sm" value="Export" style="float: right;">
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript" src="includes/table2excel.js"></script>
		<script type="text/javascript">
		$(function name() {
			$("#btnExport").click(function name() {
				$("#tblExamResult").table2excel({
					filename: "ExamResult.xls"
				});
			});
		});
		</script>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>