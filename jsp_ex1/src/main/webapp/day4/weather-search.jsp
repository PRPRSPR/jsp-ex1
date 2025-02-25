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
	
	<div>
		시 : 
		<select id="si" onchange="fnSi(this.value)">
			<option>::선택::</option>
			
			<%
				try{
					ResultSet rsSi = stmt.executeQuery("SELECT DISTINCT SI FROM AREA");
					
					while(rsSi.next()){
						String si =  rsSi.getString("SI");
						// String selected = si.equals(selectSi) ? "selected":"";
						// 아래 옵션에 selected 붙여줌
						// script로 하는 방법과 결과가 같음. >> weather-search2.jsp
			%>
			<option value="<%= si %>"><%= si %></option>
			<%-- <option value="<%= si %>" <%= selected %>><%= si %></option> --%>
			<%
					}
			%>
		</select>
		구 : 
		<select>
			<option>::선택::</option>
			
			<%
				String selectSi = "";
				if(request.getParameter("si") != null){
					selectSi = request.getParameter("si");			
				}
			
				ResultSet rsGu = stmt.executeQuery("SELECT DISTINCT GU FROM AREA WHERE SI = '"+selectSi+"' AND GU IS NOT NULL");
				// 시에 맞는 구가 나오도록. 구에 NULL 나오지 않도록 조건 추가
				
				while(rsGu.next()){
					String gu =  rsGu.getString("GU");
			%>
			<option value="<%= gu %>"><%= gu %></option>
			<%
					}
			%>
		</select>
	</div>
	
	<input id="keySi" value="<%= selectSi %>" hidden>
	
	<% 
				}catch(SQLException e){
					out.println("오류발생");
				}
	%>
</body>
</html>
<script>
	
	let si = document.querySelector("#si");
	let keySi = document.querySelector("#keySi").value;
	for(let i=0;i<si.length; i++){
		if(si[i].value==keySi){
			si[i].selected = true;
			console.log(si[i].value);
		}
	}
	
	function fnSi(selectSi) {
		location.href="?si="+selectSi;
	}
</script>