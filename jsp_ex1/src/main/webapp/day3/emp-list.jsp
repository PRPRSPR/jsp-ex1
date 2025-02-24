<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>EMP-LIST</title>
<style>
table, th, td{
border:1px solid black;
border-collapse: collapse;
text-align: center;
padding:8px;
margin: 10px 0;
}
</style>
</head>
<body>
	
	<%@ include file="../db.jsp" %>
	
	<table>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>급여</th>
			<th>급여등급</th>
			<th>팀장(사수)</th>
			<th>부서명</th>
		</tr>
		
	<%
		
		try{
			
			String query = "SELECT E1.EMPNO, E1.ENAME AS ENAME1, E1.SAL, GRADE, NVL(E2.ENAME, ' ') AS ENAME2, DNAME, E1.DEPTNO FROM EMP E1 INNER JOIN SALGRADE S ON E1.SAL BETWEEN S.LOSAL AND S.HISAL INNER JOIN DEPT D ON E1.DEPTNO=D.DEPTNO LEFT JOIN EMP E2 ON E1.MGR=E2.EMPNO ORDER BY GRADE DESC";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
				
		%>
		
			<tr>
				<td><%= rs.getString("EMPNO") %></td>
				<td><%= rs.getString("ENAME1") %></td>
				<td><%= rs.getString("SAL") %></td>
				<td><%= rs.getString("GRADE") %></td>
				<td>
					<a href="emp-t-chart.jsp">
						<%= rs.getString("ENAME2") %>
					</a>
				</td>
				<td>
					<a href="emp-d-chart.jsp?deptNo=<%= rs.getString("DEPTNO") %>">
						<%= rs.getString("DNAME") %>
					</a>
				</td>
			</tr>
		
		<%
				
			}
			
		}catch(SQLException e){
			out.println("오류발생");
		}
	%>
		
	</table>
</body>
</html>