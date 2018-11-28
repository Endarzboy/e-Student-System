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


<!-- This is the right panel -->
<div class="col-md-10">
	<h4>List of Handouts and Course Materials</h4>
	<hr>
	<a href="uploadHandout.jsp" class="btn btn-info">Upload Handout</a>

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
				ManageHandoutDao mhoDao = new ManageHandoutDao();

				String searchKey = request.getParameter("searchHandout");

				Handout ho = mhoDao.getHandoutByCourseID(searchKey);

				if (searchKey != "" && searchKey != null) {

					if (searchKey.equals(ho.getCourseID())) {
			%>
			<tr>
				<td><%=ho.getCourseID()%></td>
				<td><a
					href="downloadHandout.jsp?downloadID=<%=ho.getHandoutID()%>"><%=ho.getFileName()%></a></td>
				<td><%=ho.getFileSize()%></td>
				<td><%=ho.getStreamID()%></td>
				<td><%=ho.getDeptID()%></td>
				<td><%=ho.getPreparedBy()%></td>
				<td><%=ho.getBatch()%></td>
				<td><%=ho.getSemester()%></td>
				<td><a href="editHandout.jsp?editHoID=<%=ho.getHandoutID()%>"
					class="btn btn-info">Edit</a> <a
					href="downloadHandout.jsp?downloadID=<%=ho.getHandoutID()%>"
					class="btn btn-primary"> Download</a> <a
					href="deleteHandout.jsp?deleteHOID=<%=ho.getHandoutID()%>"
					onclick="return confirm('Are you sure to delete?')"
					class="btn btn-danger"> Delete</a></td>

			</tr>

			<%
				} else {
			%>
			<tr>
				<td colspan="7">No results Found....</td>
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