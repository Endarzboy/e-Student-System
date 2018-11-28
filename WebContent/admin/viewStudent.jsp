
<%
	String adminID = (String) session.getAttribute("adminID");
	String adminDept = (String) session.getAttribute("adminDept");
	String adminCollege = (String) session.getAttribute("adminCollege");

	if (adminID == null && adminDept == null && adminCollege == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>

<%@page import="com.model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.adminDao.ManageStudentDao"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<!--JSP Code for viewing list of accounts  -->
<%!int noOfPages, pageSize, onPage;

	public void init() {
		pageSize = 4;
		noOfPages = (int) (Math.ceil((double) ManageStudentDao.getRowCount() / pageSize));
	}%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h3>Manage Students</h3>
	<hr>

	<a href="registerStud.jsp" class="btn btn-info btn-sm">Register
		Students</a>
	<div style="float: right;">
		<form action="searchStud.jsp" method="post">
			<input type="text" name="search" placeholder="Search Here">
		</form>
	</div>
	<hr>
	<table class="table">
		<thead>
			<tr>
				<th>Stud ID</th>
				<th>Full Name</th>
				<th>Gender</th>
				<th>Address</th>
				<th>Department</th>
				<th>College ID</th>
				<th>Stream</th>
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
				ManageStudentDao msDao = new ManageStudentDao();
				List<Student> students = msDao.getAllStudents((onPage - 1) * pageSize, pageSize);
				for (Student stud : students) {
			%>
			<tr>
				<td><%=stud.getStudentID()%></td>
				<td><%=stud.getFullName()%></td>
				<td><%=stud.getGender()%></td>
				<td><%=stud.getAddress()%></td>
				<td><%=stud.getDeptID()%></td>
				<td><%=stud.getCollegeID()%></td>
				<td><%=stud.getStreamID()%></td>
				<td><%=stud.getBatch()%></td>
				<td><a href="deleteStudent.jsp?idNo=<%=stud.getStudentID()%>"
					onclick="return confirm('Are you sure to Delete?')"
					class="btn btn-danger btn-sm">Delete</a></td>
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
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>