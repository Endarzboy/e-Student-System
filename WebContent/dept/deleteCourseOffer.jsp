<%@page import="com.deptHeadDao.*"%>

<%
	String ccode = request.getParameter("idNo");

	ManageCourseOfferDao moDao = new ManageCourseOfferDao();

	boolean deleted = moDao.DeleteCourseOffer(ccode);
	if (deleted)
		response.sendRedirect("viewCourseOffer.jsp?msg=Course Offer has been deleted Successfully");
%>