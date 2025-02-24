<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서별 급여차트</title>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</head>
<body>

	<%@ include file="../db.jsp"%>
	
	<% 
		String deptNo = request.getParameter("deptNo");
		String query = "SELECT * FROM EMP WHERE DEPTNO = '"+deptNo+"'";
		
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()){
	%>
	
		<!-- <input id="test" value="1234"> -->
		<input class="ename" value="<%= rs.getString("ENAME") %>" hidden>
		<!-- id 의 경우 여러개 중 제일 위의 것만 인식되므로 class로 변경 -->
		<!-- hidden으로 숨겨주기 -->
		<input class="sal" value="<%= rs.getString("SAL") %>" hidden>
		
	<%
		}
	%>
	
	<div id="chart"></div>

</body>
</html>
<script>
	
	// let test = document.querySelector("#test").value;
	let ename = document.querySelectorAll(".ename");
	console.log(name);
	// NodeList(3) [input.ename, input.ename, input.ename]
	// '리스트'로 표현됨
	
	let sal = document.querySelectorAll(".sal");
	console.log(sal);
	
	let enameList = [];
	let salList = [];
	// 위에서 얻은 값을 담을 list 만들기
	
	for(let i=0; i<ename.length; i++){
		enameList.push(ename[i].value);
		//반복문으로 list에 값 담기
	}
	console.log(enameList);
	
	for(let i=0; i<sal.length; i++){
		salList.push(sal[i].value);
	}
	console.log(salList);
	
	var options = {
		series : [ {
			// data : [] << list 형식. 만든 list로 대체해주기
			data : salList
		} ],
		chart : {
			type : 'bar',
			height : 250
		},
		plotOptions : {
			bar : {
				borderRadius : 4,
				borderRadiusApplication : 'end',
				horizontal : true,
			}
		},
		dataLabels : {
			enabled : false
		},
		xaxis : {
			// categories : [], << list 형식. 만든 list로 대체해주기
			categories : enameList,
		}
	};

	var chart = new ApexCharts(document.querySelector("#chart"), options);
	chart.render();
</script>