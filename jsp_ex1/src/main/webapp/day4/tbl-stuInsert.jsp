<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form name="stu" action="tbl-stuInsert-result.jsp">
		<div>
			아이디 : <input name="stuId" placeholder="학번 4자리">
		</div>
		<div>
			이	름 : <input name="stuName">
		</div>
		<div>
			학	과 : <input name="stuDept">
		</div>
		<div>
			과	목 : <input name="subject">
		</div>
		<div>
			점	수 : <input name="grade">
		</div>
		<div>
			<button onclick="fnInsert(); return false;">추가</button>
		</div>
	</form>
</body>
</html>
<script>
	function fnInsert() {
		let stu = document.stu;
		
		if(stu.stuId.value.length != 4 ){
			alert("아이디는 4글자만 입력 가능합니다")
			stu.stuId.focus();
			return;
		}
		
		if(stu.grade.value > 100 || stu.grade.value < 0){
			alert("점수는 0부터 100까지만 입력 가능합니다.")
			stu.grade.focus();
			return;
		}
		
		if(stu.stuName.value == "" || stu.stuDept.value == "" || stu.subject.value == ""){
			alert("모든 값을 입력해야합니다");
			return;
		}
		
		stu.submit();
	}
</script>