
<%
	String adminID = (String) session.getAttribute("adminID");
	String adminDept = (String) session.getAttribute("adminDept");
	String adminCollege = (String) session.getAttribute("adminCollege");

	if (adminID == null && adminDept == null && adminCollege == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>

<%@page
	import="com.adminDao.ManageDepartmentDao,com.model.*, java.util.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<!--JSP Code for viewing list of accounts  -->
<%
	
%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h3>Manage Department</h3>
	<hr>
	
	<a href="createDept.jsp" class="btn btn-info btn-sm">Create Department</a>
	<div style="float: right;">
		<form action="searchDept.jsp" method="post">
			<input type="text" name="search" placeholder="Search Here">
		</form>
	</div>
	<hr>
	<table class="table">
		<thead>
			<tr>
				<th>Dept ID</th>
				<th>Department</th>
				<th>College ID</th>
				<th>Description</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
				String idNo = request.getParameter("search");

				ManageDepartmentDao mDao = new ManageDepartmentDao();

				Department dp = mDao.getDeptByID(idNo);

				if (idNo != null && idNo != "") {
					if (idNo.equals(dp.getDeptID())) {
			%>
			<tr>
				<td><%=dp.getDeptID()%></td>
				<td><%=dp.getDeptName()%></td>
				<td><%=dp.getCollegeID()%></td>
				<td><%=dp.getDescription()%></td>

				<td><a href="deleteDept.jsp?idNo=<%=dp.getDeptID()%>"
					onclick="return confirm('Are you sure to Delete?')"
					class="btn btn-danger btn-sm">Delete</a></td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td colspan="4">No Result Found...!</td>

			</tr>
			<%
				}
				} else {
			%>
			<tr>
				<td colspan="4">Please input first...!</td>

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