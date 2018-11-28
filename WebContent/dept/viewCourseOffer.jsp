<%
	String depID = (String) session.getAttribute("deptID");
	String depDep = (String) session.getAttribute("deptDept");
	String depCol = (String) session.getAttribute("deptCollege");

	if (depID == null && depDep == null && depCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.deptHeadDao.*, com.model.*, java.util.*"%>
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
		noOfPages = (int) (Math.ceil((double) ManageCourseOfferDao.getRowCount(deptID) / pageSize));
	%>






	<h4>View Course Offers</h4>
	<hr>

	<a href="importCourseOffer.jsp" class="btn btn-info btn-sm">Import
		Course Offer</a>
	<div style="float: right;">
		<form action="searchCourseOffer.jsp" method="post">
			<select name="searchOption">
				<option>Options</option>
				<option value="byTeacherID">By Teacher ID</option>
				<option value="byCourseID">By Course ID</option>
			</select> <input type="text" name="searchCourseOffer" placeholder="Search by">
		</form>
	</div>
	<hr>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Course ID</th>
				<th>Department ID</th>
				<th>College ID</th>
				<th>Teacher ID</th>
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
				ManageCourseOfferDao mcoffDao = new ManageCourseOfferDao();
				List<CourseOffer> coffers = mcoffDao.getAllCourseOffers(deptID, (onPage - 1) * pageSize, pageSize);
				for (CourseOffer co : coffers) {
			%>
			<tr>
				<td><%=co.getCourseID()%></td>
				<td><%=co.getDeptID()%></td>
				<td><%=co.getCollegeID()%></td>
				<td><%=co.getInstructorID()%></td>
				<td><%=co.getAcademicYear()%></td>
				<td><%=co.getSemester()%></td>
				<td><a href="deleteCourseOffer.jsp?idNo=<%=co.getCourseID()%>"
					onclick="return confirm('Are you sure to delete?')"
					class="btn btn-danger btn-sm">Delete</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<a href="viewCourseOffer.jsp?page=<%=1%>" class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewCourseOffer.jsp?page=<%=i%>" class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a href="viewCourseOffer.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>