<%@page import="com.adminDao.AccountDao"%>
<%
	String id = request.getParameter("idNo");

	AccountDao aDao = new AccountDao();

	boolean deleted = aDao.DeleteAccount(id);

	if (deleted) {
		response.sendRedirect("viewAccounts.jsp?msg=Account has been deleted");
	}
%>