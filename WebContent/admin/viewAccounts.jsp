
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
<%!int noOfPages, pageSize, onPage;

	public void init() {
		pageSize = 5;
		noOfPages = (int) (Math.ceil((double) AccountDao.getRowCount() / pageSize));
	}%>

<%
	AccountDao aDao = new AccountDao();
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

	List<Account> accounts = aDao.ListAllAccount((onPage - 1) * pageSize, pageSize);
%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h3>Manage Accounts</h3>
	<hr>

	<a href="createAccount.jsp" class="btn btn-info btn-sm">Create
		Account</a>
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
				<th>Department ID</th>
				<th>College ID</th>
				<th>Email Address</th>
				<th>User Name</th>
				<th>Role</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (Account user : accounts) {
			%>
			<tr>
				<td><%=user.getUserID()%></td>
				<td><%=user.getDeptID()%></td>
				<td><%=user.getCollegeID()%></td>
				<td><%=user.getEmailAddress()%></td>
				<td><%=user.getUserName()%></td>
				<%-- <td><%=user.getPasswowrd() %></td> --%>
				<td><%=user.getRole()%></td>
				<td><a href="deleteAccount.jsp?idNo=<%=user.getUserID()%>"
					onclick="return confirm('Are you sure to Delete?')"
					class="btn btn-danger btn-sm">Delete</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<a href="viewAccounts.jsp?page=<%=1%>" class="btn btn-info btn-sm">First</a>
	<%
		for (int i = 1; i <= noOfPages; i++) {
	%>
	<a href="viewAccounts.jsp?page=<%=i%>" class="btn btn-info btn-sm"><%=i%></a>
	<%
		}
	%>
	<a href="viewAccounts.jsp?page=<%=noOfPages%>"
		class="btn btn-info btn-sm">Last</a>

</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>