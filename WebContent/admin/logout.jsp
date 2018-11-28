













<%

session.setAttribute("adminUser", null);
session.setAttribute("adminSession", null);
session.setAttribute("adminID", null);
session.setAttribute("adminDept", null);
session.setAttribute("adminCollege", null);

session.invalidate();

response.sendRedirect("../login.jsp?msg=Logged Out, Successfully.");


%>