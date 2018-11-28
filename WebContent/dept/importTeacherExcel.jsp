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
				File path = new File(root + "/uploadedTeachers");
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
				ManageTeacherDao mtDao = new ManageTeacherDao();
				List<ArrayList<String>> lists = mtDao.importTeacher(uploadedFile.getAbsolutePath(), index);

				for (ArrayList<String> list : lists) {
					Instructor inst = new Instructor();
					inst.setInstructorID(list.get(0));
					inst.setFullName(list.get(1));
					inst.setGender(list.get(2));
					inst.setAddress(list.get(3));
					inst.setDeptID(list.get(4));
					inst.setCollegeID(list.get(5));
					inst.setStreamID(list.get(6));

					if (mtDao.BatchInsertion(inst)) {
						countRows++;
					}
				}
			} catch (Exception e) {
				//response.sendRedirect("importTeachers.jsp?msg=Please Selecet the file first");
			}
		}
		response.sendRedirect("viewTeachers.jsp?msg=Import has been Succeded");
		/* RequestDispatcher redirect = request
				.getRequestDispatcher("viewCourses.jsp?msg=Import has been Succeded");
		redirect.forward(request, response); */

		System.out.println(countRows + " Rows has been Imported");
	}
%>