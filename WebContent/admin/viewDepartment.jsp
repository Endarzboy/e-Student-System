
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
<%!int noOfPages, pageSize, onPage;

	public void init() {
		pageSize = 4;
		noOfPages = (int) (Math.ceil((double) ManageDepartmentDao.getRowCount() / pageSize));
	}%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h3>Manage Department</h3>
	<hr>

	<a href="createDept.jsp" class="btn btn-info btn-sm">Create
		Department</a>
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
				ManageDepartmentDao mDao = new ManageDepartmentDao();
				List<Department> depts = mDao.getAllDepartments((onPage - 1) * pageSize, pageSize);

				for (Department dp : depts) {
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
				}
			%>
		</tbody>
	</table>

	<a href="viewDepartment.jsp?page=<%=1%>" class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewDepartment.jsp?page=<%=i%>" class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a href="viewDepartment.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>