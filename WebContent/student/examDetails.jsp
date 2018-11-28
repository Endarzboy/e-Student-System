<%
	String studid = (String) session.getAttribute("studID");
	String studdept = (String) session.getAttribute("studDept");
	String studcol = (String) session.getAttribute("studCollege");

	if (studid == null && studdept == null && studcol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="java.util.Date"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.studentDao.GetExamInfoDao"%>
<%@page import="com.studentDao.ExamResultDao"%>
<%@page import="com.model.ExamResult"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.studentDao.AnswerDao"%>
<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page import="com.model.Answer"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.studentDao.InfoHubDao"%>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">

<script type="text/javascript">
	
<%String examInaID = request.getParameter("examIDNo");

			GetExamInfoDao timerGetExamInf = new GetExamInfoDao();
			String eStartDate = timerGetExamInf.getExamDate(examInaID);
			String eEndDate = timerGetExamInf.getEndDate(examInaID);

			SimpleDateFormat sdfTimer = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			sdfTimer.setTimeZone(TimeZone.getTimeZone("UTC"));

			Date d1 = sdfTimer.parse(eStartDate);
			Date d2 = sdfTimer.parse(eEndDate);

			SimpleDateFormat sdfTimeCounter = new SimpleDateFormat("HH:mm:ss");
			sdfTimeCounter.setTimeZone(TimeZone.getTimeZone("UTC+08:00"));

			Date curDate = new Date();

			String et1 = sdfTimeCounter.format(d2.getTime());
			String ct2 = sdfTimeCounter.format(curDate.getTime());

			if (ct2.compareTo(et1) > 0) {
				System.out.println("Expired");
			} else {
				long dif = (d2.getTime() - d1.getTime()) / 1000;

				/* System.out.println("Current Time: " + ct2);
				System.out.println("End Time: " + et1);
				System.out.println("Difference: " + dif); */%>
	var count =
<%=dif%>
	;

	var counter = setInterval(timer, 1000); // 1000 will run in 1 second

	function timer() {
		count = count - 1;
		if (count == -1) {
			clearInterval(counter);
			window.location.href = "viewCourses.jsp";
			return;
		}

		var secondCount = count;
		var seconds = count % 60;
		var minutes = Math.floor(count / 60);
		var hours = Math.floor(minutes / 60);
		minutes %= 60;
		hours %= 60;

		document.getElementById("demoTimer").innerHTML = hours + ":" + minutes
				+ ":" + seconds;
	}
<%}%>
	
</script>

<%
	Connection con = null;
	PreparedStatement ps = null, ps1 = null, ps2 = null, ps3 = null;
	ResultSet rset = null, rset1 = null, rset2 = null, rset3 = null;

	con = DBConnection.createConnection();

	String deptID = (String) session.getAttribute("studDept");
	String studentIDNo = (String) session.getAttribute("studID");

	String examinationID = request.getParameter("examIDNo");

	int countQusns = GetExamInfoDao.countNoOfQuestionsByExamID(examinationID);
	//System.out.println(countQusns);

	GetExamInfoDao getExamInf = new GetExamInfoDao();
	String examStartDate = getExamInf.getExamDate(examinationID);
	String examEndDate = getExamInf.getEndDate(examinationID);

	String today = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(LocalDate.now());

	/* ---------------- Validating Expiry -------------------- */

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	sdf.setTimeZone(TimeZone.getTimeZone("UTC"));

	SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
	sdfDate.setTimeZone(TimeZone.getTimeZone("UTC+08:00"));

	SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
	sdfTime.setTimeZone(TimeZone.getTimeZone("UTC+08:00"));

	// Get day and time of exam start time
	Date StartDate = sdf.parse(examStartDate);
	String startDt = sdfDate.format(StartDate);//2018-03-18
	String startTm = sdfTime.format(StartDate);//03:30:00

	/* ------------------------------------------------------- */
	// Get day and time of exam end time
	Date endDate = sdf.parse(examEndDate);
	String endExamDate = sdfDate.format(StartDate);//2018-03-18
	String endExamTime = sdfTime.format(StartDate);//03:30:00

	// Get current date and time
	Date currentDate = new Date();
	String currentTime = sdfTime.format(currentDate.getTime());

	/* ------------------------------------------------------- */

	if (today.compareTo(startDt) == 0 && currentTime.compareTo(endExamTime) < 0) {
		//if (currentTime.compareTo(endExamTime) < 0) {
%>

<style type="text/css">
body {
	background: url("../img/bg.png") no-repeat;
	background-size: 100%;
	font-family: serif;
}

.headera {
	width: 100%;
	height: 100px;
	background: #006699; /*  #85a3e0; */
	color: white;
}
</style>

<table class="headera">
	<tr>
		<td style="width: 300px;">
			<div style="margin-left: 15px;">
				<strong>Exam ID: </strong><strong
					style="color: red; margin-left: 28px;"><%=request.getParameter("examIDNo")%></strong>
			</div>
			<div style="margin-left: 15px;">
				<strong>Student ID: </strong><strong
					style="color: red; margin-left: 10px;"> <%=session.getAttribute("studID")%></strong>
			</div>
			<div style="margin-left: 15px;">
				<%
					LocalDate ld = LocalDate.now();
						String todays = DateTimeFormatter.ofPattern("MM-dd-yyyy").format(ld);
				%>
				<strong>Date: </strong><strong
					style="color: red; margin-left: 53px;"> <%=todays%></strong>
			</div>
		</td>
		<td style="width: 300px;">
			<div>
				<strong style="font-size: 30px; font-weight: bold;">Online
					Examination Portal</strong>
			</div>
			<div>
				<%
					InfoHubDao ih = new InfoHubDao();
						String examID = request.getParameter("examIDNo");
						String title = ih.getCourseTitleFromExambyExamID(examID);
						String examTitle = ih.getExamTitle(examID);
				%>
				<strong style="font-size: 15px; font-weight: bold;"><%=title%>
					: <strong style="color: red;"><%=examTitle%></strong> </strong>
			</div>
		</td>
		<td style="width: 300px;">
			<div style="float: right;">
				<div>
					<strong>Instructor: <strong style="color: red;"><%=ih.getInstructorNameFromExambyExamID(examID)%></strong>
					</strong>
				</div>
				<div>
					<strong>Remaining Time</strong>
				</div>
				<div>
					<p
						style="color: red; font-family: serif; font-weight: bold; font-size: 18px;"
						id="demoTimer"></p>
				</div>
			</div>
		</td>

	</tr>
</table>
<hr>
	<div style="text-align: center;">
	<strong
		style="color: red; text-align: center; font-size: 25px; font-weight: bold; font-family: serif;">Be
		wise to Manage your time, as much as possible.</strong>
</div>
	<hr>

<div
	style="display: table; margin-right: auto; margin-left: auto; color: black;">

	<%int current = 0;

				String qsnID = "", examId = "", courseIDNo = "", answerSelected = "", examDate = "";

				if (request.getParameter("nextbtn") != null) {

					qsnID = request.getParameter("questionID");
					examId = request.getParameter("examNo");
					courseIDNo = request.getParameter("courseIDNo");
					answerSelected = request.getParameter("answer");

					String dateOfExam = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(LocalDate.now());
					String examResultID = "ERID-" + Long.toHexString(Double.doubleToLongBits(Math.random()));

					String selectedAnswer = request.getParameter("ans");

					Answer ans = new Answer();

					ans.setQuestionID(qsnID);
					ans.setExamID(examId);
					ans.setStudentID(studentIDNo);
					ans.setCourseID(courseIDNo);
					ans.setDeptID(deptID);
					ans.setAnswerSelected(answerSelected);
					ans.setExamDate(dateOfExam);

					AnswerDao ansDao = new AnswerDao();
					boolean answerSaved = ansDao.InsertAnswer(ans);

					//System.out.println("Saved: " + answerSaved);
				}%>
	<form action="" method="post" style="font-size: 17px;">

		<%int countRedundance = 0;
				String errorDuplicate = "";

				if (request.getParameter("hidden") != null) {
					current = Integer.parseInt(request.getParameter("hidden"));
				}

				try {
					String selectQsn = "SELECT * FROM Questiontble q INNER JOIN CourseToStudent ct ON q.CourseID=ct.CourseID WHERE ct.StudentID=? AND ExamID=? ORDER BY ExamNumber ASC";

					ps = con.prepareStatement(selectQsn);
					ps.setString(1, (String) session.getAttribute("studID"));//session
					ps.setString(2, request.getParameter("examIDNo"));//from url

					rset = ps.executeQuery();
					for (int i = 0; i < current; i++) {
						rset.next();
					}

					if (!rset.next()) {

						/* ------------------------------------- */
						String getStudIDandExamID = "SELECT * FROM ExamResult WHERE StudentID=? AND ExamID=?";

						ps3 = con.prepareStatement(getStudIDandExamID);
						ps3.setString(1, (String) session.getAttribute("studID"));//session
						ps3.setString(2, request.getParameter("examIDNo"));//from url

						rset3 = ps3.executeQuery();
						while (rset3.next()) {
							countRedundance++;
						}

						/* ------------------------------------- */

						if (countRedundance >= 1) {
							errorDuplicate = "You already taken the Exam, Don't Waste your Time.....!";
						} else {
							String dbQuestionID = "", dbCourseID = "", dbExamID = "", dbAnswer = "";
							double dbWeight = 0.0;

							String ansQuestionID = "", ansExamID = "", ansAnswer = "", ansCourseID = "",
									ansExamDate = "";

							int countAnswer = 0;
							double totalMark = 0.0;

							try {

								String getAnswer = "SELECT * FROM Answertbl WHERE StudentID=?";
								ps1 = con.prepareStatement(getAnswer);
								ps1.setString(1, (String) session.getAttribute("studID"));

								String getQsn = "SELECT * FROM Questiontble";
								ps2 = con.prepareStatement(getQsn);

								rset1 = ps1.executeQuery();
								rset2 = ps2.executeQuery();

								while (rset1.next()) {

									ansQuestionID = rset1.getString("QuestionID");
									ansExamID = rset1.getString("ExamID");
									ansAnswer = rset1.getString("AnswerSelected");
									ansCourseID = rset1.getString("CourseID");
									ansExamDate = rset1.getString("ExamDate");

									while (rset2.next()) {

										dbQuestionID = rset2.getString("QuestionID");
										dbExamID = rset2.getString("ExamID");
										dbAnswer = rset2.getString("Answer");
										dbWeight = rset2.getDouble("Weight");

										if (dbQuestionID.equals(ansQuestionID) && dbAnswer.equals(ansAnswer)) {
											totalMark = totalMark + dbWeight;
											countAnswer++;
										}
									}

									rset2.first();
								}

								//if (request.getParameter("insertResult") != null) {
								String examResultID = Long.toHexString(Double.doubleToLongBits(Math.random()));

								ExamResult er = new ExamResult();

								er.setExamResultID(examResultID);
								er.setStudID(studentIDNo);
								er.setCourseID(ansCourseID);
								er.setDeptID(deptID);
								er.setExamID(ansExamID);
								er.setScoreObtained(totalMark);
								er.setDateOfExam(ansExamDate);

								ExamResultDao erDao = new ExamResultDao();

								if (erDao.InsertExamResult(er))
									response.sendRedirect("examResult.jsp");
								//}

							} catch (Exception e) {
								System.out.println("\nUnable to get Answer Details as well as Question Details: "
										+ e.getMessage());
							}
						}

					} else {%>
		<div class="form-group">
			<%=rset.getString(4)%>:
			<%=rset.getString(5)%>
		</div>

		<%if (rset.getString(8) != null && rset.getString(9) != null) {%>
		<div class="form-group">
			<input type="radio" name='<%="answer"%>' value="1"
				required="required">
			<%=rset.getString(6)%>
		</div>
		<div class="form-group">
			<input type="radio" name='<%="answer"%>' value="2"
				required="required">
			<%=rset.getString(7)%>
		</div>
		<div class="form-group">
			<input type="radio" name='<%="answer"%>' value="3"
				required="required">
			<%=rset.getString(8)%>
		</div>
		<div class="form-group">
			<input type="radio" name='<%="answer"%>' value="4"
				required="required">
			<%=rset.getString(9)%>
		</div>


		<hr>
		<%} else {%>
		<div class="form-group">
			<input type="radio" name='<%="answer"%>' value="1"
				required="required">
			<%=rset.getString(6)%>
		</div>
		<div class="form-group">
			<input type="radio" name='<%="answer"%>' value="2"
				required="required">
			<%=rset.getString(7)%>
		</div>

		<hr>

		<%}%>
		<input type="hidden" name="questionID" value="<%=rset.getString(1)%>">
		<input type="hidden" name="examNo" value="<%=rset.getString(2)%>">
		<input type="hidden" name="courseIDNo" value="<%=rset.getString(3)%>">
		<input type="hidden" name="dbanswer"
			value="<%=rset.getString("Answer")%>"> <input type="hidden"
			name="dbweight" value="<%=rset.getString("Weight")%>"> <input
			type="hidden" name="hidden" value="<%=current + 1%>">
		<div class="form-group">
			<input type="submit" name="nextbtn" value="Next" id="nextb"
				style="width: 80px;" class="btn btn-info btn-sm">
		</div>


		<%}

				} catch (Exception e) {
					System.out.println("\nUnable to Retrieve: " + e.getMessage());
				}%>

	</form>

</div>
<%if (errorDuplicate != null && errorDuplicate != "") {%>
<div class="form-group" style="text-align: center;">
	<a href="viewCourses.jsp"><strong
		style="color: red; text-align: center;"><%=errorDuplicate%></strong></a>
</div>
<%}%>
<br>
<div class="form-group" style="text-align: center;">
	<strong style="color: black;">Questions: </strong> <strong
		style="color: red; text-align: center;"><%=current + 1%>/<%=countQusns%>
		( <%=current + 1%> of <%=countQusns%> ) Questions Left.</strong>
</div>
<%/* } else if (today.compareTo(startDt) > 0) {
																					response.sendRedirect("viewCourses.jsp?msg=Examination has already Passed.");
																				} */
			} else if (today.compareTo(startDt) > 0) {
				response.sendRedirect("viewCourses.jsp?msg=Examination has already Passed.");
			}%>

<jsp:include page="includes/footer.jsp"></jsp:include>