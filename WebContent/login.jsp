<%@page import="com.adminDao.AccountDao"%>
<%@page import="com.model.Account"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<%



	if (request.getParameter("logIn") != null) {

		String uName = request.getParameter("userName");
		String uPass = request.getParameter("pass");

		Account user = new Account();
		user.setUserName(uName);//selu//mark
		user.setPasswowrd(uPass);//selu//mark

		AccountDao uaDao = new AccountDao();

		String validUser = uaDao.AuthenticatUsers(user);//instructor//department
		if (validUser.equals("admin")) {

			session = request.getSession();//creating session
			session.setAttribute("adminUser", uName);
			session.setAttribute("adminSession", uaDao.rSet.getString("EmailAddress"));
			session.setAttribute("adminID", uaDao.rSet.getString("UserID"));
			session.setAttribute("adminDept", uaDao.rSet.getString("DeptID"));
			session.setAttribute("adminCollege", uaDao.rSet.getString("CollegeID"));

			response.sendRedirect("admin/aindex.jsp?msg=Succesully Logged in to Admin Panel");

		} else if (validUser.equals("dean")) {

			session = request.getSession();//creating session
			session.setAttribute("deanUser", uName);
			session.setAttribute("deanSession", uaDao.rSet.getString("EmailAddress"));
			session.setAttribute("deanID", uaDao.rSet.getString("UserID"));
			session.setAttribute("deanDept", uaDao.rSet.getString("DeptID"));
			session.setAttribute("deanCollege", uaDao.rSet.getString("CollegeID"));
			
			response.sendRedirect("dean/dindex.jsp?msg=Succesully Logged in to Dean Panel");

		} else if (validUser.equals("department")) {

			session = request.getSession();//creating session
			session.setAttribute("departmentUser", uName);
			session.setAttribute("deptSession", uaDao.rSet.getString("EmailAddress"));
			session.setAttribute("deptID", uaDao.rSet.getString("UserID"));
			session.setAttribute("deptDept", uaDao.rSet.getString("DeptID"));
			session.setAttribute("deptCollege", uaDao.rSet.getString("CollegeID"));

			response.sendRedirect("dept/deindex.jsp?msg=Succesully Logged in to Department Panel");

		} else if (validUser.equals("instructor")) {

			session = request.getSession();//creating session
			session.setAttribute("instUser", uName);
			session.setAttribute("instSession", uaDao.rSet.getString("EmailAddress"));
			session.setAttribute("instID", uaDao.rSet.getString("UserID"));
			session.setAttribute("instDept", uaDao.rSet.getString("DeptID"));
			session.setAttribute("instCollege", uaDao.rSet.getString("CollegeID"));

			response.sendRedirect("instructor/iindex.jsp?msg=Succesully Logged in to Instructor Panel");

		} else if (validUser.equals("student")) {

			session = request.getSession();//creating session
			session.setAttribute("studUser", uName);
			session.setAttribute("studSession", uaDao.rSet.getString("EmailAddress"));
			session.setAttribute("studID", uaDao.rSet.getString("UserID"));
			session.setAttribute("studDept", uaDao.rSet.getString("DeptID"));
			session.setAttribute("studCollege", uaDao.rSet.getString("CollegeID"));
			
			//Student's task sessions
			

			response.sendRedirect("student/sindex.jsp?msg=Succesully Logged in to Student Panel");

		} else {
			response.sendRedirect("login.jsp?msg=incorrect input");
		}

	}
%>

<br>

<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<div class="col-md-6">
			<p>
			<h3>Welcome to OASaES Platform</h3>
			</p>
			<hr>
			<form action="" method="post" class="form-horizontal">
				<div class="form-group">
					<input type="text" name="userName" placeholder="Enter User Name"
						class="form-control" style="width: 300px;" required="required">
				</div>
				<div class="form-group">
					<input type="password" name="pass" placeholder="Enter Password"
						class="form-control" style="width: 300px;" required="required">
				</div>
				<div class="form-group">
					<input type="submit" name="logIn" value="Login"
						class="btn btn-info">
				</div>
			</form>
		</div>
		<!-- <div class="col-md-3">
			<h1>Right Panel</h1>
		</div> -->
	</div>

</div>

<jsp:include page="includes/footer.jsp"></jsp:include>