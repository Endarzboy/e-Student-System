













<%

session.setAttribute("deanUser", null);
session.setAttribute("deanSession", null);
session.setAttribute("deanID", null);
session.setAttribute("deanDept", null);
session.setAttribute("deanCollege", null);

session.invalidate();

response.sendRedirect("../login.jsp?msg=Logged Out, Successfully.");


%>