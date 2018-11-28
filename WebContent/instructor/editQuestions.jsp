<%
	String instIDNO = (String) session.getAttribute("instID");
	String instDep = (String) session.getAttribute("instDept");
	String instCol = (String) session.getAttribute("instCollege");

	if (instIDNO == null && instDep == null && instCol == null) {
		response.sendRedirect("../login.jsp?msg=Session has already Expired, Please Login Again.");
	}
%>
<%@page import="com.model.*,com.instructorDao.*"%>
<%@page import="com.db.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.instructorDao.ManageQuestionDao"%>
<%@page import="com.adminDao.AccountDao,com.deptHeadDao.*,com.model.*"%>
<jsp:include page="includes/mainheader.jsp"></jsp:include>
<br>
<jsp:include page="includes/leftMenu.jsp"></jsp:include>

<style type="text/css">
#frm {
	margin-top: 80px;
	margin-left: 100px;
}
</style>

<%
	String msg = "";
	String instructorID = (String) session.getAttribute("instID");
	String qID = request.getParameter("editQsnIDNo");
	
	AccountDao acDao = new AccountDao();
	String courseCode = acDao.selectCourse(instructorID);

	if (request.getParameter("editQuestion") != null) {

		String qid = request.getParameter("Qid");
		String examID = request.getParameter("examID");
		String qsn = request.getParameter("qsnNo");
		String qn = request.getParameter("qsn");
		String op1 = request.getParameter("op1");
		String op2 = request.getParameter("op2");
		String op3 = request.getParameter("op3");
		String op4 = request.getParameter("op4");
		String answer = request.getParameter("answer");

		String weight = request.getParameter("weight");

		Questions q = new Questions();

		q.setQuestionID(qid);
		q.setExamID(examID);
		q.setCourseID(courseCode);
		q.setQuestionNo(Integer.parseInt(qsn));
		q.setQuestion(qn);
		q.setOption1(op1);
		q.setOption2(op2);
		q.setOption3(op3);
		q.setOption4(op4);
		q.setAnswer(answer);
		q.setWeight(Double.parseDouble(weight));
		q.setInstructorID(instructorID);

		ManageQuestionDao mqDao = new ManageQuestionDao();
		boolean update = mqDao.UpdateQuestion(q, qID);

		if (update) {
			msg = "Questions has been updated successfully.";
		} else {
			msg = "Error has occured, Please check your inputs.";
		}
	}
%>

<%
	Connection con = null;
	PreparedStatement pSt, pSt1, pSt2;
	ResultSet rSet, rSet1, rSet2;
	con = DBConnection.createConnection();

	/*
	
	String selectQsn = "SELECT * FROM Questiontble WHERE QuestionID=?";
	pSt1 = con.prepareStatement(selectQsn);
	pSt1.setString(1, qID);
	
	rSet1 = pSt1.executeQuery(); */

	ManageQuestionDao mqdao = new ManageQuestionDao();
	Questions qq = mqdao.getQuestionByQsnID(qID);
%>
<!-- This is the right panel -->
<div class="col-md-10">
	<h4>Add Questions</h4>
	<hr>
	<%
		if (msg != null && msg != "") {
	%>
	<strong style="color: green; font-weight: bold;"><%=msg%></strong>
	<%
		}
	%>
	<form action="" method="post">

		<%
			String selectExamID = "SELECT * FROM Exam WHERE InstructorID=?";
			pSt = con.prepareStatement(selectExamID);
			pSt.setString(1, instructorID);

			rSet = pSt.executeQuery();
		%>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>Question ID:</label><input type="text" name="Qid"
							placeholder="Question ID" required="required"
							class="form-control" style="width: 300px;"
							value="<%=qq.getQuestionID()%>">
					</div>
					<div class="form-group">
						<label>Exam ID:</label> <select name="examID" required="required"
							class="form-control" style="width: 300px;">
							<option value="<%=qq.getExamID()%>"><%=qq.getExamID()%></option>
							<%
								while (rSet.next()) {
							%>
							<option value="<%=rSet.getString(1)%>"><%=rSet.getString(1)%></option>
							<%
								}
							%>
						</select>
					</div>

					<div class="form-group">
						<label>Question Number:</label><input type="text" name="qsnNo"
							placeholder="Question No" required="required"
							class="form-control" style="width: 300px;"
							value="<%=qq.getQuestionNo()%>">
					</div>
					<div class="form-group">
						<label>Question:</label>
						<textarea rows="11" cols="50" name="qsn" class="form-control"><%=qq.getQuestion()%>
							</textarea>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Option #1:</label> <input type="text" name="op1"
							placeholder="Option #1" required="required" class="form-control"
							style="width: 300px;" value="<%=qq.getOption1()%>">
					</div>
					<div class="form-group">
						<label>Option #2:</label> <input type="text" name="op2"
							placeholder="Option #2" required="required" class="form-control"
							style="width: 300px;" value="<%=qq.getOption2()%>">
					</div>
					<div class="form-group">
						<label>Option #3:</label> <input type="text" name="op3"
							placeholder="Option #3" required="required" class="form-control"
							style="width: 300px;" value="<%=qq.getOption3()%>">
					</div>
					<div class="form-group">
						<label>Option #4:</label> <input type="text" name="op4"
							placeholder="Option #4" required="required" class="form-control"
							style="width: 300px;" value="<%=qq.getOption4()%>">
					</div>
					<div class="form-group">
						<label>Answer:</label> <select name="answer" required="required"
							class="form-control" style="width: 300px;">
							<option value="<%=qq.getAnswer()%>"><%=qq.getAnswer()%></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
					</div>
					<div class="form-group">
						<label>Weight:</label> <select name="weight" required="required"
							class="form-control" style="width: 300px;">
							<option value="<%=qq.getWeight()%>"><%=qq.getWeight()%></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
					<div class="form-group">
						<input type="submit" name="editQuestion" value="Update Question"
							class="btn btn-info btn-sm"> <a href="viewQuestions.jsp"
							class="btn btn-default btn-sm"> Back to Exam List</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
</div>
</div>
<jsp:include page="includes/footer.jsp"></jsp:include>