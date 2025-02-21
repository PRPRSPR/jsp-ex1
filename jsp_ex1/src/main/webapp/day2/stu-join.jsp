<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 학과,이름,학번,성별 -->
	<!-- stu-join-result.jsp 에서 db연결 -->
	<!-- 유효성검사 포함 -->
	
	<!-- 중복체크 버튼 클릭 > id-xheck.jsp 페이지로 이동 -->
	<!-- 입력한 학번 같이 넘기기. 팝업으로 200*200 사이즈 -->
	<form name="stu" action="stu-join-result.jsp">
		<div> 학번 : <input name="stuNo"> <input type="button" value="중복체크" onclick="fnCheck()"> </div>
		<div> 이름 : <input name="stuName" ></div>
		<div> 학과 : <input name="stuDept" ></div>
		<div> 성별 : 
			<label> <input name="stuGender" type="radio" value="M" checked> 남자 </label>
			<label> <input name="stuGender" type="radio" value="F"> 여자 </label>
		</div>
		<div>
			<input type="button" onclick="fnStuInsert()" value="저장"></input>
			<!-- <button onclick="fnStuInsert(); return false;">저장</button> -->
		</div>
	</form>
	
</body>
</html>
<script>
	let checkFlg = false;
	// 중복체크 통과 시 true
	
	function fnStuInsert() {
		let stu = document.stu;
		// form 태그는 바로 불러올 수 있음
		
		if(!checkFlg){
			alert("중복체크를 해주세요")
			return;
		}
		
		if(stu.stuNo.value.length != 8){
			alert("학번은 8글자여야함");
			stu.stuNo.focus();
			return;
		}
		if(stu.stuName.value == "" || stu.stuDept.value == ""){
			alert("모든 값을 입력해야함");
			return;
		}
		
		stu.stuNo.disabled = false;
		// disabled 가 true 인 경우 값이 전송되지 않음.
		// 전송 전 false 로 바꿔줘야함
		stu.submit();
	}
	function fnCheck() {
		
		let stu = document.stu;
		window.open("id-check.jsp?stuNo="+stu.stuNo.value, "check", "width=300, height=300");
	}
	
	function getReturn(flg) {
		// 버튼 없어도 함수 실행됨
		console.log(flg);
		if(flg == "N"){
			let obj = document.stu.stuNo;
			// form 태그 안의 stuNo를 가져와서 obj에 넣기
			checkFlg = true;
			obj.disabled = true;
			// 비활성화 하기
		}
	}
</script>