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
				try{
					String selectSi = "";
					if(request.getParameter("si") != null){
						selectSi = request.getParameter("si");			
					}
					String selectGu = "";
					if(request.getParameter("gu") != null){
						selectGu = request.getParameter("gu");			
					}
			%>
			
	<div>
		시 : 
		<select id="si" onchange="fnSi(this.value)">
			<option>::선택::</option>
		
			<%
					
					ResultSet rsSi = stmt.executeQuery("SELECT DISTINCT SI FROM AREA");
					
					while(rsSi.next()){
						String si =  rsSi.getString("SI");
						String selected = si.equals(selectSi) ? "selected":"";
			%>
			<option value="<%= si %>" <%= selected %>><%= si %></option>
			<%
					}
			%>
		</select>
		구 : 
		<select id="gu" onchange="fnGu('<%= selectSi %>', this.value)">
			<option>::선택::</option>
			
			<%
				ResultSet rsGu = stmt.executeQuery("SELECT DISTINCT GU FROM AREA WHERE SI = '"+selectSi+"' AND GU IS NOT NULL");
				// 시에 맞는 구가 나오도록. 구에 NULL 나오지 않도록 조건 추가
				
				while(rsGu.next()){
					String gu =  rsGu.getString("GU");
					String selected = gu.equals(selectGu) ? "selected":"";
			%>
			<option value="<%= gu %>" <%= selected %>><%= gu %></option>
			<%
					}
			%>
		</select>
		동 : 
		<select>
			<option>::선택::</option>
			
			<%
				ResultSet rsDong = stmt.executeQuery("SELECT DONG, NX, NY FROM AREA WHERE SI='"+selectSi+"' AND GU='"+selectGu+"' AND DONG IS NOT NULL");
				
				while(rsDong.next()){
					String dong =  rsDong.getString("DONG");
			%>
			<option value="<%= dong %>"><%= dong %></option>
			<%
					}
			%>
		</select>
	</div>
	
	<% 
				}catch(SQLException e){
					out.println("오류발생");
				}
	%>
	
</body>
</html>
<script>
	
	function fnSi(selectSi) {
		location.href="?si="+selectSi;
	}
	function fnGu(selectSi, selectGu) {
		location.href="?si="+selectSi+"&gu="+selectGu;
	}
	
	function fnApiCall() {
		var xhr = new XMLHttpRequest();
		var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'hsJT5SRL4GeEsjtN7VeT%2BeicGzz4ZMztkgCmbXLI%2BiqQaH7vk9fQU%2B0uG5il6LxyKp1WPbPYkKYkVuTXlbDACQ%3D%3D'; /*Service Key*/
		queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
		queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
		queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20250225'); /**/
		queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('1000'); /* 10:00*/
		queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('55'); /**/
		queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('125'); /**/
		xhr.open('GET', url + queryParams);
		xhr.onreadystatechange = function () {
		    if (this.readyState == 4) {
		        console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		    }
		};

		xhr.send('');
	}
</script>