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







	<h4>Search Result</h4>
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
	<table class="table">
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
				String course = request.getParameter("searchCourse");
				String option = request.getParameter("searchOption");

				ManageCourseDao mcDao = new ManageCourseDao();
				Course c1 = mcDao.getCourseByCode(course);
				Course c2 = mcDao.getCourseByTitle(course);

				if (course != null || option != null && course != "" || option != "") {
					if (option.equals("courseByID") && course.equals(c1.getCourseCode())) {
			%>
			<tr>
				<td><%=c1.getCourseCode()%></td>
				<td><%=c1.getTitle()%></td>
				<td><%=c1.getCreditHour()%></td>
				<td><%=c1.getPreRequisit()%></td>
				<td><%=c1.getDeptID()%></td>
				<td><%=c1.getCollegeID()%></td>
				<td><%=c1.getStreamID()%></td>
				<td><a href="deleteCourse.jsp?ccode=<%=c1.getCourseCode()%>"
					onclick="return confirm('Are you sure to delete this course?')"
					class="btn btn-danger btn-sm">Delete</a></td>
			</tr>
			<%
				} else if (option.equals("courseTitle") && course.equals(c2.getTitle())) {
			%>
			<tr>
				<td><%=c2.getCourseCode()%></td>
				<td><%=c2.getTitle()%></td>
				<td><%=c2.getCreditHour()%></td>
				<td><%=c2.getPreRequisit()%></td>
				<td><%=c2.getDeptID()%></td>
				<td><%=c2.getStreamID()%></td>
				<td><a href="deleteCourse.jsp?ccode=<%=c2.getCourseCode()%>"
					onclick="return confirm('Are you sure to delete this course?')"
					class="btn btn-danger btn-sm">Delete</a></td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td colspan="7">No Course Found.....!</td>
			</tr>
			<%
				}
				}
			%>
		</tbody>
	</table>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>