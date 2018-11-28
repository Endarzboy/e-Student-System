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
				File path = new File(root + "/uploadedCourseOffer");
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
				ManageCourseOfferDao mcOfferDao = new ManageCourseOfferDao();
				List<ArrayList<String>> lists = mcOfferDao.importCourseOffer(uploadedFile.getAbsolutePath(),
						index);

				for (ArrayList<String> list : lists) {
					CourseOffer co = new CourseOffer();
					co.setCourseID(list.get(0));
					co.setDeptID(list.get(1));
					co.setCollegeID(list.get(2));
					co.setInstructorID(list.get(3));
					co.setAcademicYear(list.get(4));
					co.setSemester(list.get(5));

					if (mcOfferDao.BatchInsertion(co)) {
						countRows++;
					}
				}
			} catch (Exception e) {
				//response.sendRedirect("importCourseOffer.jsp?msg=Please Selecet the file first");
			}
			
		}
		response.sendRedirect("viewCourseOffer.jsp?msg=Import has been Succeded");
		/* RequestDispatcher redirect = request
				.getRequestDispatcher("viewCourses.jsp?msg=Import has been Succeded");
		redirect.forward(request, response); */

		System.out.println(countRows + " Rows has been Imported");
	}
%>