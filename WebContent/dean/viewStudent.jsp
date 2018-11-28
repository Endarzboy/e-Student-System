
<%
	String deanIdNo = (String) session.getAttribute("deanID");
	String deanDpt = (String) session.getAttribute("deanDept");
	String deanCol = (String) session.getAttribute("deanCollege");

	if (deanIdNo == null && deanDpt == null && deanCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.deanDao.StudentDao"%>
<%@page import="java.util.List"%>
<%@page import="com.model.Student"%>
<%@page import="com.deptHeadDao.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">

	<%
		String collegeID = (String) session.getAttribute("deanCollege");

		int pageSize, noOfPages, onPage;

		pageSize = 4;
		noOfPages = (int) (Math.ceil((double) StudentDao.getRowCount(collegeID) / pageSize));
	%>




	<h4>Student Details</h4>
	<hr>

	<table class="table table-bordered" id="tblStudent">
		<thead>
			<tr>
				<th>Student ID</th>
				<th>Full Name</th>
				<th>Gender</th>
				<th>Address</th>
				<th>Department</th>
				<th>College ID</th>
				<th>Stream</th>
				<th>Batch</th>
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

				StudentDao mstDao = new StudentDao();
				List<Student> students = mstDao.getAllStudents(collegeID, (onPage - 1) * pageSize, pageSize);
				for (Student s1 : students) {
			%>
			<tr>
				<td><%=s1.getStudentID()%></td>
				<td><%=s1.getFullName()%></td>
				<td><%=s1.getGender()%></td>
				<td><%=s1.getAddress()%></td>
				<td><%=s1.getDeptID()%></td>
				<td><%=s1.getCollegeID()%></td>
				<td><%=s1.getStreamID()%></td>
				<td><%=s1.getBatch()%></td>

			</tr>
			<%
				}
			%>

		</tbody>
	</table>
	<a href="viewStudent.jsp?page=<%=1%>" class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewStudent.jsp?page=<%=i%>" class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a href="viewStudent.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a> 
 <input type="button" id="btnExport" name="btnExcel" class="btn btn-info btn-sm" value="Export" style="float: right;">
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript" src="includes/table2excel.js"></script>
		<script type="text/javascript">
		$(function name() {
			$("#btnExport").click(function name() {
				$("#tblStudent").table2excel({
					filename: "List of Students.xls"
				});
			});
		});
		</script>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>