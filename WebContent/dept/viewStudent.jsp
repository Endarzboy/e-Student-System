<%
	String depID = (String) session.getAttribute("deptID");
	String depDep = (String) session.getAttribute("deptDept");
	String depCol = (String) session.getAttribute("deptCollege");

	if (depID == null && depDep == null && depCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="java.util.List"%>
<%@page import="com.model.Student"%>
<%@page import="com.deptHeadDao.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">

	<%
		String deptID = (String) session.getAttribute("deptDept");
	%>
	<%
		int pageSize, noOfPages, onPage;

		pageSize = 4;
		noOfPages = (int) (Math.ceil((double) ManageStudentDao.getRowCount(deptID) / pageSize));
	%>





	<h4>Student Details</h4>
	<hr>
	
	<strong>Search Student:</strong>
	<div style="float: right;">
		<form action="searchStudent.jsp" method="post">
			<select name="searchOption">
				<option>Options</option>
				<option value="studByID">Student ID</option>
				<option value="studBatch">Batch</option>
			</select> <input type="text" name="searchStudent" placeholder="Search Here">
		</form>
	</div>
	<hr>
	<table class="table table-bordered">
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

				ManageStudentDao mstDao = new ManageStudentDao();
				List<Student> students = mstDao.getAllStudents(deptID, (onPage - 1) * pageSize, pageSize);
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
	<a href="viewStudent.jsp?page=<%=noOfPages%>" class="btn btn-info btn-sm">Last</a>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>