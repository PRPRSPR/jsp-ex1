<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="../db.jsp" %>
	
	<%
		String stuId = request.getParameter("stuId");
		
		String query = "UPDATE TBL_STULIST SET STU_DEPT='소프트웨어과' WHERE STU_ID = '"+stuId+"'";
		int result = stmt.executeUpdate(query);
		
		if(result != 0){
			out.println("수정되었습니다.");
			out.println("<button onclick='fnBack()'>되돌아가기</button>");
		} else {
			out.println("없는 데이터 입니다.");
		}
	%>
</body>
</html>
<script>
	function fnBack(stuId) {
		location.href="tbl-stuList.jsp";
	}
</script>