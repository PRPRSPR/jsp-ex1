<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../db.jsp"%>
	
	<%
		String stuId = request.getParameter("stuId");
		
		try{
			String query = "SELECT S.STU_ID, STU_NAME, STU_DEPT, SUBJECT, GRADE FROM TBL_STULIST S INNER JOIN TBL_GRADE G ON S.STU_ID=G.STU_ID WHERE S.STU_ID='"+stuId+"'";
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
	%>
	
		<div>이름 : <%= rs.getString("STU_NAME") %></div>
		<div>학과 : <%= rs.getString("STU_DEPT") %></div>
	
	<%
			rs = stmt.executeQuery(query);
			while(rs.next()){
	%>
		
		<div>과목명 : <%= rs.getString("SUBJECT") %></div>
		<div>점수 : <%= rs.getString("GRADE") %></div>
	
	<%
			}
		}catch(SQLException e){
			out.println("오류발생");
		}
	%>
	
		<div>
			<button onclick="fnDelete(<%= stuId %>)">삭제</button>
			<button onclick="fnEdit(<%= stuId %>)">수정</button>
		</div>
</body>
</html>
<script>
	function fnDelete(stuId) {
		location.href = "tbl-stuDelete.jsp?stuId="+stuId;
	}
	function fnEdit(stuId) {
		location.href = "tbl-stuEdit.jsp?stuId="+stuId;	
	}
</script>