<%@page import="com.model.Course"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.deptHeadDao.ManageCourseDao"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List, java.io.*"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
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
				File path = new File(root + "/uploadedCourses");
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
				ManageCourseDao msDao = new ManageCourseDao();
				List<ArrayList<String>> lists = msDao.importCourse(uploadedFile.getAbsolutePath(), index);

				for (ArrayList<String> list : lists) {
					Course cr = new Course();
					cr.setCourseCode(list.get(0));
					cr.setTitle(list.get(1));
					cr.setCreditHour(list.get(2));
					cr.setPreRequisit(list.get(3));
					cr.setDeptID(list.get(4));
					cr.setCollegeID(list.get(5));
					cr.setStreamID(list.get(6));

					if (msDao.BatchInsertion(cr)) {
						countRows++;
					}
				}
			} catch (Exception e) {
				//response.sendRedirect("importCourses.jsp?msg=Please Selecet the file first");
			}
		}
		//response.sendRedirect("viewCourses.jsp?msg=Import has been Succeded");
		RequestDispatcher redirect = request
				.getRequestDispatcher("viewCourses.jsp?msg=Import has been Succeded");
		redirect.forward(request, response);

		//System.out.println(countRows + " Rows has been Imported");
	}
%>