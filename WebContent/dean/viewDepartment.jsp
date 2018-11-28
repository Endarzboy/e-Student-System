
<%
	String deanIdNo = (String) session.getAttribute("deanID");
	String deanDpt = (String) session.getAttribute("deanDept");
	String deanCol = (String) session.getAttribute("deanCollege");

	if (deanIdNo == null && deanDpt == null && deanCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.deanDao.DepartmentDao"%>
<%@page
	import="com.adminDao.ManageDepartmentDao,com.model.*, java.util.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<!--JSP Code for viewing list of accounts  -->

<%
	int noOfPages, pageSize, onPage;

	String collegeID = (String) session.getAttribute("deanCollege");
	pageSize = 4;
	noOfPages = (int) (Math.ceil((double) DepartmentDao.getRowCount(collegeID) / pageSize));
%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h3>Manage Department</h3>
	<hr>
	<table class="table table-bordered" id="tblDepartment">
		<thead>
			<tr>
				<th>Dept ID</th>
				<th>Department</th>
				<th>College ID</th>
				<th>Description</th>
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
				DepartmentDao dDao = new DepartmentDao();
				List<Department> depts = dDao.getAllDepartments(collegeID, (onPage - 1) * pageSize, pageSize);

				for (Department dp : depts) {
			%>
			<tr>
				<td><%=dp.getDeptID()%></td>
				<td><%=dp.getDeptName()%></td>
				<td><%=dp.getCollegeID()%></td>
				<td><%=dp.getDescription()%></td>
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

		<input type="button" id="btnExport" name="btnExcel" class="btn btn-info btn-sm" value="Export" style="float: right;">
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript" src="includes/table2excel.js"></script>
		<script type="text/javascript">
		$(function name() {
			$("#btnExport").click(function name() {
				$("#tblDepartment").table2excel({
					filename: "List of Department.xls"
				});
			});
		});
		</script>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>