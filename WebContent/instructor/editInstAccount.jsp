<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>


<%@page import="com.adminDao.AccountDao,com.deptHeadDao.*,com.model.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<!-- This is the right panel -->
<div class="col-md-10">
	<h4>Modify Profile</h4>
	<hr>
	<%
		String msg = "";
		if (request.getParameter("updateAcc") != null) {

			String userId = request.getParameter("userID");
			String emailID = request.getParameter("email");
			String uName = request.getParameter("userName");
			String pass = request.getParameter("pass");

			Account user = new Account();
			user.setUserID(userId);
			user.setEmailAddress(emailID);
			user.setUserName(uName);
			user.setPasswowrd(pass);
			user.setUserID(userId);

			AccountDao uadDao = new AccountDao();
			boolean updated = uadDao.UpdateAccount(user);
			if (updated) {
				msg = "Account has been Updated successfully";
			} else {
				msg = "Unable to Update Account";
			}
		}
	%>

	<style>
form, input {
	width: 300px;
}
</style>
	<h4>Update My Account</h4>
	<hr>

	<%
		if (msg != null && msg != "") {
	%>
	<div class="alert alert-success">
		<strong><%=msg%></strong>
	</div>
	<%
		}
	%>

	<%
		String idNo = request.getParameter("instID");
		AccountDao ado = new AccountDao();
		Account user = ado.SearchAccountByID(idNo);
		if (user.getRole().equals("instructor")) {
	%>
	<form action="" method="post" class="form-horizontal">
		<div class="form-group">
			<label>User ID</label> <input type="text" name="userID"
				placeholder="Enter User ID" class="form-control" required="required"
				value="<%=user.getUserID()%>">
		</div>

		<div class="form-group">
			<label>Email Address</label> <input type="email" name="email"
				placeholder="Enter Email" class="form-control" required="required"
				value="<%=user.getEmailAddress()%>">
		</div>
		<div class="form-group">
			<label>User Name</label> <input type="text" name="userName"
				placeholder="Enter User Name" class="form-control"
				required="required" value="<%=user.getUserName()%>">
		</div>
		<div class="form-group">
			<label>Password</label> <input type="password" name="pass"
				placeholder="Enter Password" class="form-control"
				required="required" value="<%=user.getPasswowrd()%>">
		</div>

		<div class="form-group">
			<input type="submit" name="updateAcc" value="Update Account"
				class="btn btn-info btn-sm"> <a href="viewProfile.jsp"
				class="btn btn-default btn-sm"> Back</a>
		</div>
	</form>
	<%
		} else {
	%>
	<form action="" method="post" class="">
		<div class="form-group">
			<label>User ID</label> <input type="text" name="userID"
				placeholder="Enter User ID" class="form-control" required="required">
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
			<input type="submit" name="updateAcc" value="Update Account"
				class="btn btn-info btn-sm"> <a href="viewProfile.jsp"
				class="btn btn-default btn-sm"> Back</a>
		</div>
	</form>

	<%
		}
	%>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>

