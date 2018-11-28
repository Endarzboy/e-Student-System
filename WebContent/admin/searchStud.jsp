
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
<%
	
%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h3>Manage Students</h3>
	<hr>
	
	<a href="registerStud.jsp" class="btn btn-info btn-sm">Register Students</a>
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
				String idNo = request.getParameter("search");
				ManageStudentDao msDao = new ManageStudentDao();
				Student stud = msDao.getStudentByID(idNo);
				if (idNo != null && idNo != "") {
					if (idNo.equals(stud.getStudentID())) {
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
				} else {
			%>
			<tr>
				<td colspan="7">No Result Found...!</td>
			</tr>
			<%
				}
				} else {
			%>
			<tr>
				<td colspan="7">Please Input first...!</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>