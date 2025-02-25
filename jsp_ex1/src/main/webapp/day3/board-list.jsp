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
</style>
</head>
<body>

	<%@ include file="../db.jsp"%>
	
	<select id="number" onchange="fnNumber(this.value)">
	<!-- onchange >> 값이 바뀌면 실행 -->
		<option value="3">3개씩</option>
		<option value="5">5개씩</option>
		<option value="10">10개씩</option>
		<option value="15">15개씩</option>
		<option value="20">20개씩</option>
	</select>
	
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
		//  한 페이지에 보여줄 게시글 숫자

		int currentPage = 1;
		// 활성화 된 페이지

		// 1. 게시글 전체 개수 구하기
		// 2. 전체 개수 pageSize로 나누기
		// 3. 나눈값 올림처림
		// 4. 최종결과 반복문 돌려 게시글 아래에 출력
		
		if(request.getParameter("page") != null){
			// 처음 실행 시 주소에 page가 없어 오류 발생하기 때문에 처리해줘야함.
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("size") != null){
			pageSize = Integer.parseInt(request.getParameter("size"));			
		}
		
		int offset = (currentPage - 1) * pageSize;
		
		try {
			// SELECT COUNT(*) AS TOTAL FROM BOARD
			// >>>> 1. 게시글 전체 개수 구하기 <<<<
			ResultSet rsCnt = stmt.executeQuery("SELECT COUNT(*) AS TOTAL FROM BOARD");
			rsCnt.next();
			// >> total을 가리킴
			// int total = rsCnt.getString("TOTAL"); >> total의 리턴타입 int
			int total = rsCnt.getInt("TOTAL");

			// int pageList = total/pageSize;
			// 어느 하나라도 double, 소수점으로 바꾸기 >> (double)total/pageSize
			// Math. + ceil(올림), round(반올림), floor(내림) >> 올림으로 처리 Math.ceil()
			// 다시 int형으로 변경해준다. >> (int)
			int pageList = (int) Math.ceil((double) total / pageSize);
			// >>>> 2. 전체 개수 pageSize로 나누기 + 3. 나눈값 올림처림 <<<<

			String query = "SELECT BOARDNO,TITLE,USERID,CNT,TO_CHAR(CDATETIME,'YYYY-MM-DD') AS CDATETIME FROM BOARD " 
			+ "OFFSET " + offset + " ROWS FETCH NEXT " + pageSize + " ROWS ONLY";
			// 0(offset)부터 pageSize 까지 보여줌

			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
		%>

		<tr>
			<td><%=rs.getString("BOARDNO")%></td>
			<td><%=rs.getString("TITLE")%></td>
			<td><%=rs.getString("USERID")%></td>
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
				out.println("<a href='?page="+(currentPage-1)+"&size="+pageSize+"'>◁</a>");
			}
			for (int i = 1; i <= pageList; i++) {
				if(currentPage == i){
					out.println("<span class='page active'><a href='?page="+i+"&size="+pageSize+"'>"+ i +"</a></span>");
				}else{
					// out.println("<span class='page'><a href='board-list.jsp?page="+i+"'>"+ i +"</a></span>");
					// href='board-list.jsp?page=i'> >>> 현재 board-list.jsp 파일.
					// 다른 파일로 이동하는게 아니므로 생략 가능.
					out.println("<span class='page'><a href='?page="+i+"&size="+pageSize+"'>"+ i +"</a></span>");
					
				}
				// if끝
			}
			// for끝
			// >>>> 4. 최종결과 반복문 돌려 게시글 아래에 출력 <<<<
			if(currentPage != 5){
				out.println("<a href='?page="+(currentPage+1)+"&size="+pageSize+"'>▷</a>");				
			}
		} catch (SQLException e) {
		out.println("오류발생");
		}
		%>
	</div>
	<input id="pageSize" value="<%= pageSize %>" hidden>
</body>
</html>
<script>
	
	let pageSize = document.querySelector("#pageSize").value;
	let number = document.querySelector("#number");
	console.log(number[0].value);
	
	for(let i=0;i<number.length; i++){
		if(number[i].value==pageSize){
			numeber[i].selected = true;
		}
	}
	
	function fnNumber(num) {
		location.href="?size="+num;
		
	}
	
</script>