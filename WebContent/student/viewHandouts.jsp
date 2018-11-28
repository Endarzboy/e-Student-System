
<%
	String studid = (String) session.getAttribute("studID");
	String studdept = (String) session.getAttribute("studDept");
	String studcol = (String) session.getAttribute("studCollege");

	if (studid == null && studdept == null && studcol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>

<%@page import="com.studentDao.InfoHubDao"%>
<%@page import="com.model.Instructor"%>
<%@page import="com.model.Handout"%>
<%@page import="java.util.List"%>
<%@page import="com.studentDao.HandoutDao"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">
	<%
		String courseID = request.getParameter("courseIDNoforHo");

		int pageSize, noOfPages, onPage;

		pageSize = 4;
		noOfPages = (int) (Math.ceil((double) HandoutDao.getRowCount(courseID) / pageSize));
	%>
	<%
		InfoHubDao ih = new InfoHubDao();
		if (courseID != null && courseID != "") {

			String title = ih.getCourseTitle(courseID);

			Instructor inst = ih.getInstructorName(courseID);
			if (inst != null) {
	%>

	<h4>
		<strong style="color: red;"><%=title%></strong> <strong
			style="color: blue;">Course Materials by :</strong> <strong
			style="color: red;"><%=inst.getFullName()%></strong>
		<%
			}
			}
		%>
	</h4>
	<hr>
	<a href="viewCourses.jsp" class="btn btn-info btn-sm">Back to
		Courses</a>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Course</th>
				<th>File Name</th>
				<th>File Size</th>
				<th>Department</th>
				<th>Stream</th>
				<th>Instructor</th>
				<th>Batch</th>
				<th>Semester</th>
				<th>Actions</th>
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

				HandoutDao hoDao = new HandoutDao();
				List<Handout> hos = hoDao.getAllHandouts(courseID, (onPage - 1) * pageSize, pageSize);
				if (hos.size() != 0) {
					if (courseID != null && courseID != "") {
						for (Handout ho : hos) {
			%>
			<tr>
			<tr>
				<td><%=ho.getCourseID()%></td>
				<td><a
					href="downloadHandout.jsp?downloadHoID=<%=ho.getHandoutID()%>"><%=ho.getFileName()%></a></td>
				<td><%=ho.getFileSize()%></td>

				<td><%=ho.getDeptID()%></td>
				<td><%=ho.getStreamID()%></td>
				<td><%=ho.getPreparedBy()%></td>
				<td><%=ho.getBatch()%></td>
				<td><%=ho.getSemester()%></td>
				<td><a
					href="downloadHandout.jsp?downloadHoID=<%=ho.getHandoutID()%>"
					class="btn btn-primary btn-sm"> Download</a></td>

			</tr>
			</tr>

			<%
				}
					}
				} else {
			%>
			<tr>
				<td colspan="8"><strong style="color: red; font-size: 30px;">This
						Course has not Handout...!</strong></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<a href="viewHandouts.jsp?page=<%=1%>" class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewHandouts.jsp?page=<%=i%>" class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a href="viewHandouts.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>