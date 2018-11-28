<%@page import="com.adminDao.*"%>
<%
	String idNo = request.getParameter("idNo");
	ManageDepartmentDao mDao = new ManageDepartmentDao();

	boolean deleted = mDao.DeleteDept(idNo);
	if (deleted) {
		response.sendRedirect("viewDepartment.jsp?msg=Department has been deleted");
	}
%>