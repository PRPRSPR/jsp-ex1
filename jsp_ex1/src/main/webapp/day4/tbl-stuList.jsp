<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	padding: 8px;
	margin: 10px 0;
}
a {
	text-decoration:none;
}
</style>
</head>
<body>

	<%@ include file="../db.jsp"%>
	
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>평균점수</th>
		</tr>
		
		<%
			try{
				String query = "SELECT S.STU_ID, STU_NAME, STU_DEPT, GRADE FROM TBL_STULIST S INNER JOIN ( SELECT STU_ID, AVG(GRADE) AS GRADE FROM TBL_GRADE GROUP BY STU_ID )T ON S.STU_ID=T.STU_ID ORDER BY GRADE DESC";
				ResultSet rs = stmt.executeQuery(query);
				
				while(rs.next()){
					
		%>
		
		<tr>
			<td><%= rs.getString("STU_ID") %></td>
			<td><a href="tbl-stuView.jsp?stuId=<%= rs.getString("STU_ID") %>"><%= rs.getString("STU_NAME") %></a></td>
			<td><%= rs.getString("STU_DEPT") %></td>
			<td><%= rs.getString("GRADE") %></td>
		</tr>
		
		<%
					
				}
				
		%>
	</table>
	<div>
		<button onclick="fnStuInsert()">학생추가</button>	
	</div>
		
		
		<%
				
			}catch(SQLException e){
				out.println("오류발생");
			}
		%>
</body>
</html>
<script>
	function fnStuInsert() {
		location.href = "tbl-stuInsert.jsp";
	}
</script>