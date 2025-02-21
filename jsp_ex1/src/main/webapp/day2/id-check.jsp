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
	
	<form name="check">
	<%
		String stuNo = request.getParameter("stuNo");
	
		String query = "SELECT * FROM STUDENT WHERE STU_NO = '"+stuNo+"'";
		ResultSet rs = stmt.executeQuery(query);
		
		if(rs.next()){
			out.println("사용중인 학번입니다.");
	%>
			<input name="flg" value="Y" hidden>
	<%			

		} else {
			out.println("사용 가능합니다.");			
	%>
			<input name="flg" value="N" hidden>
	<%
	
		}
	%>
	
	<div>
		<input type="button" onclick="fnBack()" value="되돌아가기">
	</div>
	
	</form>
	
	
	
</body>
</html>
<script>
	function fnBack() {
		window.opener.getReturn(document.check.flg.value);
		// popup을 open한 페이지 >> opener
		window.close();
		// popup 닫기
	}
</script>