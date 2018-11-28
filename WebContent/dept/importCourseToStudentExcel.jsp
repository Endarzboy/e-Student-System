<%@page import="com.model.*"%>
<%@page import="java.util.*"%>
<%@page import="com.deptHeadDao.*"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%
	int countRows = 0;
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);

	if (isMultipart) {

		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);

		List<FileItem> items = upload.parseRequest(request);
		int index = 0;
		File uploadedFile = null;

		for (FileItem item : items) {

			if (!item.isFormField()) {
				String fileName = item.getName();

				String root = getServletContext().getRealPath("/");
				File path = new File(root + "/uploadedCourseToStud");
				if (!path.exists()) {
					boolean status = path.mkdirs();
				}

				uploadedFile = new File(path + "/" + fileName);
				System.out.println(uploadedFile.getAbsolutePath());
				item.write(uploadedFile);

			} else if (item.isFormField()) {
				if (item.getFieldName().equals("index"))
					index = Integer.parseInt(item.getString());
			}
			try {
				ManageCourseToStudentDao mctDao = new ManageCourseToStudentDao();
				List<ArrayList<String>> lists = mctDao.importCourseToStudent(uploadedFile.getAbsolutePath(),
						index);

				for (ArrayList<String> list : lists) {

					CourseToStudent cts = new CourseToStudent();

					cts.setCourseID(list.get(0));
					cts.setDeptID(list.get(1));
					cts.setCollegeID(list.get(2));
					cts.setStudentID(list.get(3));
					cts.setAcademicYear(list.get(4));
					cts.setSemester(list.get(5));

					if (mctDao.BatchInsertion(cts)) {
						countRows++;
					}
				}
			} catch (Exception e) {
				//response.sendRedirect("importCourseToStudent.jsp?msg=Please Selecet the file first");
			}
		}
		response.sendRedirect("viewStudCourse.jsp?msg=Import has been Succeded");
		/* RequestDispatcher redirect = request
		.getRequestDispatcher("viewCourses.jsp?msg=Import has been Succeded");
		redirect.forward(request, response); */

		System.out.println(countRows + " Rows has been Imported");
	}
%>