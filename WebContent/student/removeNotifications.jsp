<%@page import="com.clientSide.NotificationDao"%>
<%
	String assignId = request.getParameter("removeIDNo");

	NotificationDao ndao = new NotificationDao();
	boolean deleteNotice = ndao.deleteNotification(assignId); 

	
	if (deleteNotice)
		response.sendRedirect("viewCourses.jsp");
%>