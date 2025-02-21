<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="../db.jsp" %>
	
	<form action="stu-update.jsp">
		<%
			String stuNo = request.getParameter("stuNo");
	
			// 학번, 이름, 학과, 학년, 시험점수 가져오기
		
			try{
				ResultSet rs = stmt.executeQuery("SELECT S.STU_NO, STU_NAME, STU_DEPT, STU_GRADE, ENR_GRADE FROM STUDENT S LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO WHERE S.STU_NO = '"+stuNo+"'");
				rs.next();
					
		%>
		
			<div> 학번 : <%= rs.getString("STU_NO") %> </div>
			<div> 이름 : <%= rs.getString("STU_NAME") %> </div>
			<div> 학과 : <%= rs.getString("STU_DEPT") %> </div>
			<div> 학년 : <%= rs.getString("STU_GRADE") %> </div>
				
		<%
				
			rs = stmt.executeQuery("SELECT S.STU_NO, STU_NAME, STU_DEPT, STU_GRADE, ENR_GRADE FROM STUDENT S LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO WHERE S.STU_NO = '"+stuNo+"'");
			while(rs.next()){
					
		%>
			
			<div> 시험점수 : <%= rs.getString("ENR_GRADE") %> </div>
		
		<%
				}
			}catch(SQLException e){
				out.println("오류발생");
			}
		%>
		<input name="stuNo" value="<%= stuNo %>" hidden>
		<!-- hidden 으로 input 박스는 보이지 않지만 수정버튼 누를 시 stuNo가 같이 전송됨 -->
		<input type="submit" value="수정">
	</form>
</body>
</html>