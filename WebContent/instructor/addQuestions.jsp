
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

<style type="text/css">
#frm {
	margin-top: 80px;
	margin-left: 100px;
}
</style>

<!-- This is the right panel -->
<div class="col-md-10">
	<h4>Create Questions</h4>
	<hr>

	<%
		if (request.getParameter("trueFalse") != null) {
			response.sendRedirect("trueOrFalseExam.jsp");
		} else if (request.getParameter("choice") != null) {
			response.sendRedirect("multipleChoiceExam.jsp");
		}
	%>

	<div class="" id="frm">
		<h5 style="font-weight: bold; color: blue;">Select mode of
			examination</h5>
		<br>
		<form action="" method="post" class="form-horizontal">
			<div class="form-group">
				<input type="submit" name="trueFalse" value="True or False"
					class="btn btn-info btn-sm"> <strong style="color: black;">
					OR </strong> <input type="submit" name="choice" value="Multiple Choice"
					class="btn btn-info btn-sm">
			</div>
			<div class="form-group">
				<a href="publishExam.jsp" class="btn btn-info btn-sm"
					style="width: 233px;">Back</a>
			</div>
		</form>
	</div>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>