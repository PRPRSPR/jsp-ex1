<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<style>
.chart{
width:600px;
}
</style>
</head>
<body>

	<%@ include file="../db.jsp"%>

	<%
	String query = "SELECT E2.ENAME, COUNT(*) AS CNT FROM EMP E1 INNER JOIN EMP E2 ON E1.MGR = E2.EMPNO GROUP BY E2.ENAME ORDER BY CNT DESC";

	ResultSet rs = stmt.executeQuery(query);
	while (rs.next()) {
	%>

	<input class="ename" value="<%=rs.getString("ENAME")%>" hidden>
	<input class="cnt" value="<%=rs.getString("CNT")%>" hidden>

	<%
	}
	%>

	<div id="chart1" class="chart"></div>
	<br>
	<div id="chart2" class="chart"></div>

</body>
</html>
<script>

	let ename = document.querySelectorAll(".ename");
	let cnt = document.querySelectorAll(".cnt");
	
	let enameList = [];
	let cntList = [];
	
	for(let i=0;i<ename.length;i++){
		enameList.push(ename[i].value);
	}
	for(let i=0;i<cnt.length;i++){
		cntList.push(parseInt(cnt[i].value));
	}
	console.log(cntList);
	
	var options1 = {
		series : cntList,
		labels : enameList,
		plotOptions: {
			pie: {
				customScale: 0.8
		    }
		},
		chart : {
			type : 'donut',
		},
		responsive : [ {
			breakpoint : 480,
			options : {
				chart : {
					width : 100
				},
				legend : {
					position : 'bottom'
				}
			}
		} ]
	};

	var chart1 = new ApexCharts(document.querySelector("#chart1"), options1);
	chart1.render();
	
	
	var options2 = {
	          series: [{
	          name: '부하직원 수',
	          //마우스 오버 시 표시
	          data: [2.3, 3.1, 4.0, 6.1, 4.0, 3.6, 3.2, 2.3, 1.4, 0.8, 0.5, 0.2]
	        }],
	          chart: {
	          height: 350,
	          type: 'bar',
	        },
	        plotOptions: {
	          bar: {
	            borderRadius: 10,
	            dataLabels: {
	              position: 'top', // top, center, bottom
	            },
	          }
	        },
	        dataLabels: {
	          enabled: true,
	          formatter: function (val) {
	            // return val + "%";
	            return val + "명";
	          },
	          offsetY: -20,
	          style: {
	            fontSize: '12px',
	            colors: ["#304758"]
	          }
	        },
	        
	        xaxis: {
	          categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
	          position: 'top',
	          axisBorder: {
	            show: false
	          },
	          axisTicks: {
	            show: false
	          },
	          crosshairs: {
	            fill: {
	              type: 'gradient',
	              gradient: {
	                colorFrom: '#D8E3F0',
	                colorTo: '#BED1E6',
	                stops: [0, 100],
	                opacityFrom: 0.4,
	                opacityTo: 0.5,
	              }
	            }
	          },
	          tooltip: {
	            enabled: true,
	          }
	        },
	        yaxis: {
	          axisBorder: {
	            show: false
	          },
	          axisTicks: {
	            show: false,
	          },
	          labels: {
	            show: false,
	            formatter: function (val) {
	              return val + "명";
	        	// 마우스 오버 시
	            }
	          }
	        
	        },
	        title: {
	          text: '부하직원 수',
	          floating: true,
	          offsetY: 330,
	          align: 'center',
	          style: {
	            color: '#444'
	          }
	        }
	        };

	        var chart2 = new ApexCharts(document.querySelector("#chart2"), options2);
	        chart2.render();
</script>