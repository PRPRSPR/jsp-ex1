<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

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
text-align: center;
padding:8px;
margin: 10px 0;
}
</style>
<body>
	
	<%@ include file="../db.jsp" %>

	<table>
		<tr>
			<th>선택</th>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>성별</th>
		</tr>
	<!-- 바깥쪽에 테이블 생성 -->
	
	<%	
		ResultSet rs = null;
	
		try{
			rs = stmt.executeQuery("SELECT * FROM STUDENT");
			
			// 학번, 이름, 학과, 성별(남자,여자) >> '테이블'형태
			
			
			while(rs.next()){
			//while문 시작과 끝을 잘라서 안쪽에 태그로 작성
	%>
			
			<tr>
				<td><input type="radio" name="student" value="<%= rs.getString("STU_NO") %>"></td>
				<td><%= rs.getString("STU_NO") %></td>
				<td>
					<a href="stu-view.jsp?stuNo=<%= rs.getString("STU_NO") %>"><%= rs.getString("STU_NAME") %></a>
					<!-- 따로 변수에 담아서 넣어줘도 됨. -->
					<!-- String stuNo = rs.getString("STU_NO"); -->
					<!-- href="stu-view.jsp?stuNo=< %= stuNo %>"> -->
				</td>
				<td><%= rs.getString("STU_DEPT") %></td>
				<td><%= rs.getString("STU_GENDER").equals("M")?"남자":"여자" %></td>
			</tr>
			
	<%	
			}
		// ↑ while문 끝 괄호
		}catch (SQLException e){
			out.println("오류발생");
		}
	%>

	</table>
	<!-- 가장 아래 테이블 태그 닫아주기 -->
	<input class="btn" type="button" value="삭제" onclick="fnStuRemove()">
	
</body>
</html>
<script>
	function fnStuRemove() {
		if(!confirm("정말 삭제하시겠습니까?")){
			return;
		}
		let select = document.querySelector("input[name='student']:checked");
		console.log(select.value);
		//stu-delete.jsp 이동
		//학번같이
		location.href="stu-delete.jsp?stuNo="+select.value;
	}
</script>