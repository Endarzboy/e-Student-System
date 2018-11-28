













<%

session.setAttribute("instUser", null);
session.setAttribute("instSession", null);
session.setAttribute("instID", null);
session.setAttribute("instDept", null);
session.setAttribute("instCollege", null);

session.invalidate();

response.sendRedirect("../login.jsp?msg=Logged Out, Successfully.");


%>