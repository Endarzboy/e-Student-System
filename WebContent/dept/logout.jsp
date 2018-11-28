













<%

session.setAttribute("departmentUser", null);
session.setAttribute("deptSession", null);
session.setAttribute("deptID", null);
session.setAttribute("deptDept", null);
session.setAttribute("deptCollege", null);

session.invalidate();

response.sendRedirect("../login.jsp?msg=Logged Out, Successfully.");


%>