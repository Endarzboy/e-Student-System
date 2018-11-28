
<%
	String depID = (String) session.getAttribute("deptID");
	String depDep = (String) session.getAttribute("deptDept");
	String depCol = (String) session.getAttribute("deptCollege");

	if (depID == null && depDep == null && depCol == null) {
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
		String deptID = (String) session.getAttribute("deptDept");
		AccountDao aDao = new AccountDao();
		String dept = aDao.selectDeptName(deptID);
	%>
	<h4>
		Welcome to <strong
			style="color: red; font-style:; font-family: monospace;"><%=dept%>
			Department </strong> Panel
	</h4>
	<hr>

	<%-- <%=(String) session.getValue("deptDept")%> --%>

</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>