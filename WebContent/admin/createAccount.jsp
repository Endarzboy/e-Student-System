
<%
	String adminID = (String) session.getAttribute("adminID");
	String adminDept = (String) session.getAttribute("adminDept");
	String adminCollege = (String) session.getAttribute("adminCollege");

	if (adminID == null && adminDept == null && adminCollege == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>

<%@page import="com.adminDao.AccountDao"%>
<%@page import="com.model.Account"%>
<%
	String msg = "";
	if (request.getParameter("createAcc") != null) {

		String userId = request.getParameter("userID");
		String dept = request.getParameter("dept");
		String college = request.getParameter("college");
		String emailID = request.getParameter("email");
		String uName = request.getParameter("userName");
		String pass = request.getParameter("pass");
		String role = request.getParameter("role");

		Account user = new Account();
		user.setUserID(userId);
		user.setDeptID(dept);
		user.setCollegeID(college);
		user.setEmailAddress(emailID);
		user.setUserName(uName);
		user.setPasswowrd(pass);
		user.setRole(role);

		AccountDao uadDao = new AccountDao();
		boolean created = uadDao.CreateAccount(user);
		if (created) {
			msg = "Account has been created successfully";
		} else {
			msg = "Unable to create Account";
		}
	}
%>

<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<!-- This is the right panel -->
<div class="col-md-10">
	<style>
form, input {
	width: 300px;
}
</style>
	<h3>Create User Account</h3>
	<hr>

	<%
		if (msg != null) {
	%>
	<div class="alert alert-success">
		<strong><%=msg%></strong>
	</div>
	<%
		}
	%>
	<form action="" method="post" class="">
		<div class="form-group">
			<label>User ID</label> <input type="text" name="userID"
				placeholder="Enter User ID" class="form-control" required="required">
		</div>
		<div class="form-group">
			<label>College</label> <input type="text" name="college"
				placeholder="Enter College" class="form-control"
				required="required">
		</div>
		<div class="form-group">
			<label>Department</label> <input type="text" name="dept"
				placeholder="Enter Department" class="form-control"
				required="required">
		</div>
		<div class="form-group">
			<label>Email Address</label> <input type="email" name="email"
				placeholder="Enter Email" class="form-control" required="required">
		</div>
		<div class="form-group">
			<label>User Name</label> <input type="text" name="userName"
				placeholder="Enter User Name" class="form-control"
				required="required">
		</div>
		<div class="form-group">
			<label>Password</label> <input type="password" name="pass"
				placeholder="Enter Password" class="form-control"
				required="required">
		</div>
		<div class="form-group">
			<label>Role</label> <select name="role" class="form-control"
				required="required">
				<option>Select Role</option>
				<option value="admin">Admin</option>
				<option value="department">Department</option>
				<option value="dean">Dean</option>
				<option value="instructor">Instructor</option>
				<option value="student">Student</option>
			</select>
		</div>
		<div class="form-group">
			<input type="submit" name="createAcc" value="Create Account"
				class="btn btn-info btn-sm"> <a href="viewAccounts.jsp"
				class="btn btn-default btn-sm"> Back</a>
		</div>
	</form>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>