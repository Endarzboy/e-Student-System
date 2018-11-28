
<%
	String deanIdNo = (String) session.getAttribute("deanID");
	String deanDpt = (String) session.getAttribute("deanDept");
	String deanCol = (String) session.getAttribute("deanCollege");

	if (deanIdNo == null && deanDpt == null && deanCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>

<%@page import="com.adminDao.*, com.model.*"%>

<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">


	<h4>Modify Profile</h4>
	<hr>

	<table class="table table-bordered">
		<thead>
			<tr>
				<th>User ID</th>
				<th>Department</th>
				<th>College ID</th>
				<th>Email Address</th>
				<th>User Name</th>
				<th>Password</th>
				<th>Role</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>

			<%
				String idNo = (String) session.getAttribute("deanID");
				AccountDao acDao = new AccountDao();
				if (idNo != null && idNo != "") {
					Account user = acDao.SearchAccountByID(idNo);
					if (idNo.equals(user.getUserID())) {
			%>
			<tr>
				<td><%=user.getUserID()%></td>
				<td><%=user.getDeptID()%></td>
				<td><%=user.getCollegeID()%></td>
				<td><%=user.getEmailAddress()%></td>
				<td><%=user.getUserName()%></td>
				<td><%=user.getPasswowrd()%></td>
				<td><%=user.getRole()%></td>
				<td><a
					href="editDeptAccount.jsp?deanIDNo=<%=user.getUserID()%>"
					onclick="return confirm('Do you want to Update this Account?')"
					class="btn btn-primary btn-sm">Edit</a></td>
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