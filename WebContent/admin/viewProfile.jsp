
<%
	String adminID = (String) session.getAttribute("adminID");
	String adminDept = (String) session.getAttribute("adminDept");
	String adminCollege = (String) session.getAttribute("adminCollege");

	if (adminID == null && adminDept == null && adminCollege == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>

<%@page import="java.util.List"%>
<%@page import="com.model.Account"%>
<%@page import="com.adminDao.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<!--JSP Code for viewing list of accounts  -->

<!-- This is the right panel -->
<div class="col-md-10">
	<h3>Update Accounts</h3>
	<hr>

	<div style="float: right;"></div>
	<hr>
	<table class="table">
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
			<%-- <h1>Welcome to Administrator Panel</h1>
			<h3>
				Your Email is:
				<%=session.getAttribute("adminSession")%></h3>
			<h3>
				Your UserName is:
				<%=session.getAttribute("adminUser")%></h3>
			<h3>
				Your ID is:
				<%=session.getAttribute("adminID")%></h3> --%>
			<%
				String idNo = (String) session.getAttribute("adminID");
				AccountDao acDao = new AccountDao();
				Account user = acDao.SearchAccountByID(idNo);
				if (idNo != null && idNo != "") {
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
				<td><a href="editAccount.jsp?idNo=<%=user.getUserID()%>"
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