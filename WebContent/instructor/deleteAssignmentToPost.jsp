<%@page import="com.clientSide.NotificationDao"%>
<%@page import="com.instructorDao.ManagePostAssignDao"%>
<%
	String assignId = request.getParameter("assignID");

	ManagePostAssignDao mpadao = new ManagePostAssignDao();
	/* NotificationDao ndao = new NotificationDao();
	boolean deleteNotice = ndao.deleteNotification(assignId); */

	boolean deleted = mpadao.DeleteAssignment(assignId);

	if (deleted)
		response.sendRedirect("postAssignment.jsp");
%>