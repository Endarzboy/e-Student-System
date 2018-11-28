













<%

session.setAttribute("studUser", null);
session.setAttribute("studSession", null);
session.setAttribute("studID", null);
session.setAttribute("studDept", null);
session.setAttribute("studCollege", null);

session.invalidate();

response.sendRedirect("../login.jsp?msg=Logged Out, Successfully.");


%>