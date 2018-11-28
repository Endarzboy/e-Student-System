
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
	<h3>Management Accounts</h3>
	<hr>
	
	<a href="createAccount.jsp" class="btn btn-info btn-sm">Create Account</a>
	<div style="float: right;">
		<form action="searchAccount.jsp" method="post">
			<input type="text" name="search" placeholder="Search Here">
		</form>
	</div>
	<hr>
	<table class="table">
		<thead>
			<tr>
				<th>User ID</th>
				<th>Email Address</th>
				<th>Department ID</th>
				<th>College ID</th>
				<th>User Name</th>
				<th>Role</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
				String idNo = request.getParameter("search");
				AccountDao aDao = new AccountDao();

				Account user = aDao.SearchAccountByID(idNo);

				if (idNo.equals(user.getUserID())) {
			%>
			<tr>
				<td><%=user.getUserID()%></td>
				<td><%=user.getEmailAddress()%></td>
				<td><%=user.getDeptID() %></td>
				<td><%=user.getCollegeID() %></td>
				<td><%=user.getUserName()%></td>
				<%-- <td><%=user.getPasswowrd() %></td> --%>
				<td><%=user.getRole()%></td>
				<td><a href="deleteAccount.jsp?idNo=<%=user.getUserID()%>"
					onclick="return confirm('Are you sure to Delete?')" class="btn btn-danger btn-sm">Delete</a></td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td colspan="5">No Result Found!</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>