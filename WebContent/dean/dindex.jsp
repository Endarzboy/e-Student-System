











<%
	String deanIdNo = (String) session.getAttribute("deanID");
	String deanDpt = (String) session.getAttribute("deanDept");
	String deanCol = (String) session.getAttribute("deanCollege");

	if (deanIdNo == null && deanDpt == null && deanCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.adminDao.AccountDao"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>
<!-- This is the right panel -->
<div class="col-md-10">
	<%
		String deanId = (String) session.getAttribute("deanCollege");
		if(deanId!=null&& deanId!=""){
		AccountDao aDao = new AccountDao();
		String college = aDao.getCollegeTitle(deanId);
		
	%>
	<h4>
		Welcome to College of <strong
			style="color: red; font-style:; font-family: monospace;"><%=college%></strong>
		Panel
	</h4>
	<%} else {
		%>
		<h4>
		Welcome to College of <strong
			style="color: red; font-style:; font-family: monospace;">Session Expired, Login Again.</strong>
		Panel
	</h4>
		<%
	}
	%>
	<hr>


</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>