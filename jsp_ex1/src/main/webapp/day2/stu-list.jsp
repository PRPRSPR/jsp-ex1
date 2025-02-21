<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!-- 
아래를 전부 입력한 것과 같음
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table, th, td{
border:1px solid black;
border-collapse: collapse;
/* 테이블에 선 중복 없이 나오려면 넣어줘야함 */
padding:8px;
}
</style>
<body>
	
	<%@ include file="../db.jsp" %>
	
	<%
		ResultSet rs = null;
	
		try{
			rs = stmt.executeQuery("SELECT * FROM STUDENT");
			// 첫번째 학생의 이름, 학번 출력
			// rs.next();
			// 빈 커서 -> 첫번째 학생
			// out.println(rs.getString("STU_NAME"));
			// out.println(rs.getString("STU_NO"));
			
			//	while(rs.next()){
			//		out.println(rs.getString("STU_NAME"));
			//		out.println("<br>");
			//		out.println(rs.getString("STU_NO"));
			//		out.println("<br>");
			//	}
			
			// 학번, 이름, 학과, 성별(남자,여자) >> '테이블'형태
			
			out.println("<table>");
			out.println("<tr>");
			out.println("<th>학번</th>");
			out.println("<th>이름</th>");
			out.println("<th>학과</th>");
			out.println("<th>성별</th>");
			out.println("</tr>");
			
			while(rs.next()){
				String gender = rs.getString("STU_GENDER").equals("M") ? "남자" : "여자" ;
				
				out.println("<tr>");
				out.println("<td>");
				out.println(rs.getString("STU_NO"));
				out.println("</td>");
				//아래처럼도 가능함.
				out.println("<td>"+rs.getString("STU_NAME")+"</td>");
				out.println("<td>"+rs.getString("STU_DEPT")+"</td>");
				out.println("<td>"+ gender +"</td>");
				//아래처럼도 가능함
				//if(rs.getString("STU_GENDER").equals("M")){
				//out.println("남자");
				//} else {
				//out.println("여자");
				//}
				out.println("<tr>");
			}
			out.println("</table>");
			
		}catch (SQLException e){
			out.println("오류발생");
		}
	%>
	
	
</body>
</html>