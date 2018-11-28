<%
	String depID = (String) session.getAttribute("deptID");
	String depDep = (String) session.getAttribute("deptDept");
	String depCol = (String) session.getAttribute("deptCollege");

	if (depID == null && depDep == null && depCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.model.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.deptHeadDao.ManageCourseDao"%>
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
		noOfPages = (int) (Math.ceil((double) ManageCourseDao.getRowCount(deptID) / pageSize));
	%>






	<h4>Course Details</h4>
	<hr>
	
	<a href="importCourses.jsp" class="btn btn-info btn-sm">Import Course</a>
	<div style="float: right;">
		<form action="searchCourse.jsp" method="post">
			<select name="searchOption">
				<option>Options</option>
				<option value="courseByID">Code</option>
				<option value="courseTitle">Title</option>
			</select> <input type="text" name="searchCourse" placeholder="Search Here">
		</form>
	</div>
	<hr>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Course Code</th>
				<th>Title</th>
				<th>Credit Hour</th>
				<th>Pre-Requisite</th>
				<th>Department</th>
				<th>College ID</th>
				<th>Stream</th>
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

				ManageCourseDao mcDao = new ManageCourseDao();
				List<Course> courses = mcDao.getAllCourses(deptID, (onPage - 1) * pageSize, pageSize);

				for (Course c : courses) {
			%>
			<tr>
				<td><%=c.getCourseCode()%></td>
				<td><%=c.getTitle()%></td>
				<td><%=c.getCreditHour()%></td>
				<td><%=c.getPreRequisit()%></td>
				<td><%=c.getDeptID()%></td>
				<td><%=c.getCollegeID()%></td>
				<td><%=c.getStreamID()%></td>
				<td><a href="deleteCourse.jsp?ccode=<%=c.getCourseCode()%>"
					onclick="return confirm('Are you sure to delete this course?')"
					class="btn btn-danger btn-sm">Delete</a></td>
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
	<a href="viewCourses.jsp?page=<%=noOfPages%>" class="btn btn-info btn-sm">Last</a>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>