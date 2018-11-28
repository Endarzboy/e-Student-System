<%
	String depID = (String) session.getAttribute("deptID");
	String depDep = (String) session.getAttribute("deptDept");
	String depCol = (String) session.getAttribute("deptCollege");

	if (depID == null && depDep == null && depCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="java.util.List"%>
<%@page import="com.model.Student"%>
<%@page import="com.deptHeadDao.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">







	<h4>Search Result</h4>
	<hr>

	<strong>Search Student:</strong>
	<div style="float: right;">
		<form action="searchStudent.jsp" method="post">
			<select name="searchOption">
				<option>Options</option>
				<option value="studByID">Student ID</option>
				<option value="studBatch">Batch</option>
			</select> <input type="text" name="searchStudent" placeholder="Search Here">
		</form>
	</div>
	<hr>
	<table class="table">
		<thead>
			<tr>
				<th>Student ID</th>
				<th>Full Name</th>
				<th>Gender</th>
				<th>Address</th>
				<th>Department</th>
				<th>Stream</th>
				<th>Batch</th>
			</tr>
		</thead>
		<tbody>
			<%
				String stud = request.getParameter("searchStudent");
				String option = request.getParameter("searchOption");
				String deptID = (String) session.getAttribute("deptDept");

				ManageStudentDao mstDao = new ManageStudentDao();
				Student s1 = mstDao.getStudentByID(stud);
				List<Student> studs = mstDao.getStudentByBatch(stud);

				if (stud != null || stud != "" && option != null || option != "") {
					if (option.equals("studByID") && stud.equals(s1.getStudentID())) {
			%>
			<tr>
				<td><%=s1.getStudentID()%></td>
				<td><%=s1.getFullName()%></td>
				<td><%=s1.getGender()%></td>
				<td><%=s1.getAddress()%></td>
				<td><%=s1.getDeptID()%></td>
				<td><%=s1.getStreamID()%></td>
				<td><%=s1.getBatch()%></td>

			</tr>
			<%
				} else if (option.equals("studBatch")) {
						for (Student s2 : studs) {
							if (stud.equals(s2.getBatch()) && s2.getDeptID().equals(deptID)) {
			%>
			<tr>
				<td><%=s2.getStudentID()%></td>
				<td><%=s2.getFullName()%></td>
				<td><%=s2.getGender()%></td>
				<td><%=s2.getAddress()%></td>
				<td><%=s2.getDeptID()%></td>
				<td><%=s2.getStreamID()%></td>
				<td><%=s2.getBatch()%></td>

			</tr>
			<%
				}
						}
					} else {
			%>
			<tr>
				<td colspan="7">No Result Found....!</td>
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