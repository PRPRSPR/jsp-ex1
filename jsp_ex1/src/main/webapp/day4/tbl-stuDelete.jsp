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
			int result1 = stmt.executeUpdate("DELETE FROM TBL_STULIST WHERE STU_ID = '"+stuId+"'");
			int result2 = stmt.executeUpdate("DELETE FROM TBL_GRADE WHERE STU_ID = '"+stuId+"'");
			
			if(result1 != 0 && result2 != 0){
				out.println("삭제되었습니다.");
				out.println("<button onclick='fnBack()'>되돌아가기</button>");
			} else {
				out.println("없는 데이터 입니다.");
			}
		}catch(SQLException e){
			out.println("오류발생");
		}
	%>
	
</body>
</html>
<script>
	function fnBack(stuId) {
		location.href="tbl-stuList.jsp";
	}
</script>