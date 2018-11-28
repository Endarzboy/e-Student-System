<%
	String studid = (String) session.getAttribute("studID");
	String studdept = (String) session.getAttribute("studDept");
	String studcol = (String) session.getAttribute("studCollege");

	if (studid == null && studdept == null && studcol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>

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
		noOfPages = (int) (Math.ceil((double) AssignmentResultDao.getRowCount(studentID) / pageSize));
	%>
	<a href="viewAssignmentResults.jsp" class="btn btn-info btn-sm">View
		Assignment Result</a> <a href="examResult.jsp" class="btn btn-info btn-sm">View
		Exam Result</a>
	<hr>
	<h3 style="color: blue;">Assignment Result</h3>
	<hr>
	<table class="table table-bordered" id="tblAssignResult">
		<thead>
			<tr>
				<!-- <th>Result ID</th> -->
				<th>Student ID</th>
				<tH>Course</tH>
				<th>Department</th>
				<th>Stream</th>
				<th>Instructor</th>
				<th>Assignment ID</th>
				<th>Score</th>

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

				AssignmentResultDao arDao = new AssignmentResultDao();
				List<AssignmentResult> ars = arDao.getAllAssignResults(studentID, (onPage - 1) * pageSize, pageSize);
				if (ars.size() != 0) {
					if (studentID != null && studentID != "") {
						for (AssignmentResult ar : ars) {
			%>
			<tr>
				<%-- <td><%=ar.getAssignResultID()%></td> --%>
				<td><%=ar.getStudentID()%></td>
				<td><%=ar.getCourseID()%></td>
				<td><%=ar.getDeptID()%></td>
				<td><%=ar.getStreamID()%></td>
				<td><%=ar.getInstructorID()%></td>
				<td><%=ar.getAssignmentID()%></td>
				<td><strong style="color: red;"><%=ar.getScore()%></strong> / <strong
					style="color: blue;"><%=arDao.getMark(ar.getAssignResultID())%></strong>
				</td>

			</tr>
			<%
				}
					}
				} else {
			%>
			<tr>
				<td colspan="8"><strong style="color: red; font-size: 30px;">No
						Assignment Result Released!</strong></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<a href="viewAssignmentResults.jsp?page=<%=1%>"
		class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewAssignmentResults.jsp?page=<%=i%>"
		class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a href="viewAssignmentResults.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a> 
		
		<input type="button" id="btnExport" name="btnExcel" class="btn btn-info btn-sm" value="Export" style="float: right;">
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript" src="includes/table2excel.js"></script>
		<script type="text/javascript">
		$(function name() {
			$("#btnExport").click(function name() {
				$("#tblAssignResult").table2excel({
					filename: "AssignmentResult.xls"
				});
			});
		});
		</script>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>