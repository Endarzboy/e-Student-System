<%
	String depID = (String) session.getAttribute("deptID");
	String depDep = (String) session.getAttribute("deptDept");
	String depCol = (String) session.getAttribute("deptCollege");

	if (depID == null && depDep == null && depCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.model.CourseToStudent"%>
<%@page import="java.util.List"%>
<%@page import="com.deptHeadDao.ManageCourseToStudentDao"%>
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
		noOfPages = (int) (Math.ceil((double) ManageCourseToStudentDao.getRowCount(deptID) / pageSize));
	%>




	<h4>Manage Student and Course Assignment</h4>
	<hr>

	<a href="importCourseToStudent.jsp" class="btn btn-info btn-sm">Import
		Course ~ Student Offer</a>

	<hr>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Course ID</th>
				<th>Department ID</th>
				<th>College ID</th>
				<th>Student ID</th>
				<th>Academic Year</th>
				<th>Semester</th>
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

				ManageCourseToStudentDao mctsDao = new ManageCourseToStudentDao();
				List<CourseToStudent> ctd = mctsDao.getAllCourseToStudent(deptID, (onPage - 1) * pageSize, pageSize);
				for (CourseToStudent st : ctd) {
			%>
			<tr>
				<td><%=st.getCourseID()%></td>
				<td><%=st.getDeptID()%></td>
				<td><%=st.getCollegeID()%></td>
				<td><%=st.getStudentID()%></td>
				<td><%=st.getAcademicYear()%></td>
				<td><%=st.getSemester()%></td>
				<td><a
					href="deleteCourseToStud.jsp?courseToStudeIDNo=<%=st.getStudentID()%>"
					onclick="return confirm('Are you sure to delete?')"
					class="btn btn-danger btn-sm">Delete</a></td>

			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<a href="viewStudCourse.jsp?page=<%=1%>" class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewStudCourse.jsp?page=<%=i%>" class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a href="viewStudCourse.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>