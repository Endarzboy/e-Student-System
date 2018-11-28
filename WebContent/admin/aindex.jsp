
<%
	String adminID = (String) session.getAttribute("adminID");
	String adminDept = (String) session.getAttribute("adminDept");
	String adminCollege = (String) session.getAttribute("adminCollege");

	if (adminID == null && adminDept == null && adminCollege == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>

<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<style type="text/css">
input {
	width: 150px;
	margin: 3px;
	height: 80px;
}
</style>
<div class="col-md-10">
	<h1>Welcome to Admin Panel</h1>
	
	<hr>
	<%
		if (request.getParameter("account") != null) {
			response.sendRedirect("viewAccounts.jsp");
		} else if (request.getParameter("dept") != null) {
			response.sendRedirect("viewDepartment.jsp");
		} else if (request.getParameter("stud") != null) {
			response.sendRedirect("viewStudent.jsp");
		} else if (request.getParameter("prof") != null) {
			response.sendRedirect("viewProfile.jsp");
		}
	%>
	<form action="" method="post">
		<div class="form-group">
			<input type="submit" name="account" value="Account"
				class="btn btn-info btn-sm"> <input type="submit" name="dept"
				value="Department" class="btn btn-info btn-sm"> <input
				type="submit" name="stud" value="Sutdent" class="btn btn-info btn-sm">
			<input type="submit" name="prof" value="Profle" class="btn btn-info btn-sm">

		</div>
	</form>


</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>