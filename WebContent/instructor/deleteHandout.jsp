<%@page import="com.instructorDao.*"%>
<%
	String houtID = request.getParameter("deleteHOID");

	ManageHandoutDao mhoDao = new ManageHandoutDao();

	boolean deleted = mhoDao.DeleteHandout(houtID);

	if (deleted)
		response.sendRedirect("viewHandouts.jsp");
%>