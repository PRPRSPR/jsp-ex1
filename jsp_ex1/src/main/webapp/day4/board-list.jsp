<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>BOARD-LIST</title>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	padding: 8px;
	margin: 10px 0;
}
#page{
	width:400px;
	margin:0 145px;
}
.page{
	border: 1px solid #bbb;
	padding:0 7px;
}
.active{
	background-color: #bbb;
	font-weight : bold;
}
a {
	text-decoration:none;
}
select {
	margin-left: 90px;
}
</style>
</head>
<body>

	<%@ include file="../db.jsp"%>
	
	<div>
		<input placeholder="검색어" id="keyword">
		<button onclick="fnSearch()">검색</button>
		<select id="number" onchange="fnNumber(this.value)">
			<option value="3">3개씩</option>
			<option value="5">5개씩</option>
			<option value="10">10개씩</option>
			<option value="15">15개씩</option>
			<option value="20">20개씩</option>
		</select>
	</div>
	
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>

		<%
		int pageSize = 5;

		int currentPage = 1;
		
		String search = "";
		String keyword = "";

		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("size") != null){
			pageSize = Integer.parseInt(request.getParameter("size"));			
		}
		if(request.getParameter("keyword") != null){
			keyword = request.getParameter("keyword");
			search = "WHERE TITLE LIKE '%"+keyword+"%' ";			
		}
		
		int offset = (currentPage - 1) * pageSize;
		
		try {
			ResultSet rsCnt = stmt.executeQuery("SELECT COUNT(*) AS TOTAL FROM BOARD "+ search);
			rsCnt.next();
			int total = rsCnt.getInt("TOTAL");
			int pageList = (int) Math.ceil((double) total / pageSize);

			String query = "SELECT B.BOARDNO, TITLE, USERNAME, B.USERID, CNT, TO_CHAR(B.CDATETIME, 'YYYY-MM-DD') AS CDATETIME, NVL(BCCNT,0) AS BCCNT FROM BOARD B INNER JOIN MEMBER M ON B.USERID=M.USERID LEFT JOIN ( SELECT COUNT(*) AS BCCNT, BOARDNO FROM BOARD_COMMENT GROUP BY BOARDNO ) T ON B.BOARDNO=T.BOARDNO "
				+ search +"ORDER BY BOARDNO DESC "+ "OFFSET " + offset + " ROWS FETCH NEXT " + pageSize + " ROWS ONLY";

			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
		%>

		<tr>
			<td><%=rs.getString("BOARDNO")%></td>
			<td><%=rs.getString("TITLE")%></td>
			<td><%=rs.getString("USERNAME")%></td>
			<td><%=rs.getString("CNT")%></td>
			<td><%=rs.getString("CDATETIME")%></td>
		</tr>

		<%
			}
			//while끝
		%>
	</table>
	<div id="page">
		<%
		if(currentPage != 1){				
			out.println("<a href='?page="+(currentPage-1)+"&size="+pageSize+"&keyword="+keyword+"'>◁</a>");
		}
		for (int i = 1; i <= pageList; i++) {
			if(currentPage == i){
				out.println("<span class='page active'><a href='?page="+i+"&size="+pageSize+"&keyword="+keyword+"'>"+ i +"</a></span>");
			}else{
				out.println("<span class='page'><a href='?page="+i+"&size="+pageSize+"&keyword="+keyword+"'>"+ i +"</a></span>");
				
			}
			// if끝
		}
		// for끝
		if(currentPage != 5){
			out.println("<a href='?page="+(currentPage+1)+"&size="+pageSize+"&keyword="+keyword+"'>▷</a>");				
		}
	} catch (SQLException e) {
	out.println("오류발생");
	}
	%>
	</div>
	<input id="pageSize" value="<%= pageSize %>" hidden>
	<input id="paramKey" value="<%= keyword %>" hidden>
</body>
</html>
<script>
	
	let paramKey = document.querySelector("#paramKey").value;
	document.querySelector("#keyword").value = paramKey;
	// 이동시에도 검색창에 검색어 유지하기
	
	let pageSize = document.querySelector("#pageSize").value;
	let number = document.querySelector("#number");
	console.log(number[0].value);
	
	for(let i=0;i<number.length; i++){
		if(number[i].value==pageSize){
			number[i].selected = true;
		}
	}
	
	function fnNumber(num) {
		let keyword = document.querySelector("#keyword").value;
		location.href="?size="+num+"&keyword="+keyword;		
	}
	
	function fnSearch() {
		let keyword = document.querySelector("#keyword").value;
		let pageSize = document.querySelector("#pageSize").value;
		location.href="?keyword="+keyword+"&size="+pageSize;
	}
	
</script>