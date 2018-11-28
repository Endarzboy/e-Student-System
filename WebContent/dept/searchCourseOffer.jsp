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






	<h4>Search Result</h4>
	<hr>

	<a href="importCourseOffer.jsp" class="btn btn-info btn-sm">Import Course
		Offer</a>
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
	<table class="table">
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
				String cid = request.getParameter("searchCourseOffer");
				String options = request.getParameter("searchOption");

				ManageCourseOfferDao mcoffDao = new ManageCourseOfferDao();
				CourseOffer co1 = mcoffDao.getCourseOfferByCourseID(cid);
				CourseOffer co2 = mcoffDao.getCourseOfferByTeacherID(cid);

				if (cid != null && cid != "" && options != null && options != "") {
					if (options.equals("byTeacherID") && cid.equals(co2.getInstructorID())) {
			%>
			<tr>
				<td><%=co2.getCourseID()%></td>
				<td><%=co2.getDeptID()%></td>
				<td><%=co2.getCollegeID()%></td>
				<td><%=co2.getInstructorID()%></td>
				<td><%=co2.getAcademicYear()%></td>
				<td><%=co2.getSemester()%></td>
				<td><a href="deleteCourseOffer.jsp?idNo=<%=co2.getCourseID()%>"
					onclick="return confirm('Are you sure to delete?')"
					class="btn btn-danger btn-sm">Delete</a></td>
			</tr>
			<%
				} else if (options.equals("byCourseID") && cid.equals(co1.getCourseID())) {
			%>
			<tr>
				<td><%=co1.getCourseID()%></td>
				<td><%=co1.getDeptID()%></td>
				<td><%=co1.getInstructorID()%></td>
				<td><%=co1.getAcademicYear()%></td>
				<td><%=co1.getSemester()%></td>
				<td><a href="deleteCourseOffer.jsp?idNo=<%=co1.getCourseID()%>"
					onclick="return confirm('Are you sure to delete?')"
					class="btn btn-danger btn-sm">Delete</a></td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td colspan="5">No Result Found.....!</td>

			</tr>
			<%
				}
				}
			%>
		</tbody>
	</table>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewCourseOffer.jsp?page=<%=i%>" class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>