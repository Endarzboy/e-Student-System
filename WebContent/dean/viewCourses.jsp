
<%
	String deanIdNo = (String) session.getAttribute("deanID");
	String deanDpt = (String) session.getAttribute("deanDept");
	String deanCol = (String) session.getAttribute("deanCollege");

	if (deanIdNo == null && deanDpt == null && deanCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.deanDao.CourseDao"%>
<%@page import="com.model.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.deptHeadDao.ManageCourseDao"%>
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
		noOfPages = (int) (Math.ceil((double) CourseDao.getRowCount(collegeID) / pageSize));
	%>





	<h4>Course Details</h4>
	<hr>

	<table class="table table-bordered" id="tblCourse">
		<thead>
			<tr>
				<th>Course Code</th>
				<th>Title</th>
				<th>Credit Hour</th>
				<th>Pre-Requisite</th>
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

				CourseDao cdao = new CourseDao();
				List<Course> courses = cdao.getAllCourses(collegeID, (onPage - 1) * pageSize, pageSize);

				for (Course c : courses) {
			%>
			<tr>
				<td><%=c.getCourseCode()%></td>
				<td><%=c.getTitle()%></td>
				<td><%=c.getCreditHour()%></td>
				<td><%=c.getPreRequisit()%></td>
				<td><%=c.getDeptID()%></td>
				<td><%=c.getCollegeID() %></td>
				<td><%=c.getStreamID()%></td>

			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<a href="viewCourses.jsp?page=<%=1%>" class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewCourses.jsp?page=<%=i%>" class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a href="viewCourses.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a> 

	<input type="button" id="btnExport" name="btnExcel" class="btn btn-info btn-sm" value="Export" style="float: right;">
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script type="text/javascript" src="includes/table2excel.js"></script>
		<script type="text/javascript">
		$(function name() {
			$("#btnExport").click(function name() {
				$("#tblCourse").table2excel({
					filename: "List of Courses.xls"
				});
			});
		});
		</script>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>