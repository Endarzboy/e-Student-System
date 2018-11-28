
<%
	String deanIdNo = (String) session.getAttribute("deanID");
	String deanDpt = (String) session.getAttribute("deanDept");
	String deanCol = (String) session.getAttribute("deanCollege");

	if (deanIdNo == null && deanDpt == null && deanCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.deanDao.TeacherDao"%>
<%@page import="com.model.Instructor"%>
<%@page import="java.util.List"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">
	<%
		String collegeID = (String) session.getAttribute("deanCollege");
	%>
	<%
		int pageSize, noOfPages, onPage;

		pageSize = 4;
		noOfPages = (int) (Math.ceil((double) TeacherDao.getRowCount(collegeID) / pageSize));
	%>





	<h4>Teacher Details</h4>
	<hr>

	<table class="table table-bordered" id="tblTeachers">
		<thead>
			<tr>
				<th>Teahcer's ID</th>
				<th>Full Name</th>
				<th>Gender</th>
				<th>Address</th>
				<th>Department</th>
				<th>College ID</th>
				<th>Stream</th>
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

				TeacherDao mtDao = new TeacherDao();
				List<Instructor> instructors = mtDao.getAllInstructors(collegeID, (onPage - 1) * pageSize, pageSize);
				for (Instructor inst : instructors) {
			%>
			<tr>
				<td><%=inst.getInstructorID()%></td>
				<td><%=inst.getFullName()%></td>
				<td><%=inst.getGender()%></td>
				<td><%=inst.getAddress()%></td>
				<td><%=inst.getDeptID()%></td>
				<td><%=inst.getCollegeID()%></td>
				<td><%=inst.getStreamID()%></td>

			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<a href="viewTeachers.jsp?page=<%=1%>" class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewTeachers.jsp?page=<%=i%>" class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a href="viewTeachers.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a> <input type="button"
		id="btnExport" name="btnExcel" class="btn btn-info btn-sm"
		value="Export" style="float: right;">
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="includes/table2excel.js"></script>
	<script type="text/javascript">
		$(function name() {
			$("#btnExport").click(function name() {
				$("#tblTeachers").table2excel({
					filename : "List of Teahcers.xls"
				});
			});
		});
	</script>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>