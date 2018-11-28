<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="java.util.List"%>
<%@page import="com.instructorDao.ManageHandoutDao"%>
<%@page import="com.adminDao.AccountDao,com.deptHeadDao.*,com.model.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<style type="text/css">
#frm {
	margin-top: 80px;
	margin-left: 100px;
}
</style>


<%
	String instID = (String) session.getAttribute("instID");

	int pageSize, noOfPages, onPage;

	pageSize = 4;
	noOfPages = (int) (Math.ceil((double) ManageHandoutDao.getRowCount(instID) / pageSize));
%>

<!-- This is the right panel -->
<div class="col-md-10">
	<h4>List of Handouts and Course Materials</h4>
	<hr>
	<a href="uploadHandout.jsp" class="btn btn-info btn-sm">Upload
		Handout</a>

	<div style="float: right;">
		<form action="searchHnadout.jsp" method="post">
			<input type="text" name="searchHandout"
				placeholder="Search Handout by Course ID" style="width: 270px;">
		</form>
	</div>
	<hr>
	<table class="table">
		<thead>
			<tr>
				<th>Course</th>
				<th>File Name</th>
				<th>File Size</th>
				<th>Department</th>
				<th>Stream</th>
				<th>Prepared By</th>
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

				ManageHandoutDao mhoDao = new ManageHandoutDao();
				List<Handout> hos = mhoDao.getAllHandouts(instID, (onPage - 1) * pageSize, pageSize);

				if (instID != null && instID != "") {
					for (Handout ho : hos) {
			%>
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
				<td><a href="editHandout.jsp?editHoID=<%=ho.getHandoutID()%>"
					class="btn btn-info btn-sm">Edit</a> <a
					href="downloadHandout.jsp?downloadHoID=<%=ho.getHandoutID()%>"
					class="btn btn-primary btn-sm"> Download</a> <a
					href="deleteHandout.jsp?deleteHOID=<%=ho.getHandoutID()%>"
					onclick="return confirm('Are you sure to delete?')"
					class="btn btn-danger btn-sm"> Delete</a></td>

			</tr>

			<%
				}
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