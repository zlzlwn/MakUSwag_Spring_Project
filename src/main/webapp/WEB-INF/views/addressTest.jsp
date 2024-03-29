<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
	 * Description : 카카오 주소 test
	 * 				
	 * Date : 2024.02.05 (요일)
	 * Author : 박지환
	 * 
 -->
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<p>카카오 주소 R&D</p>
<div>배송지 주소(test)</div>
	<!-- placeholder:텍스트필즈 초기 입력값, 클릭하면 findAddr 메소드를 호출 -->
  <input id="member_post"  type="text" placeholder="주소찾기" readonly="readonly" onclick="findAddr()">
  <input id="member_addr" type="text" placeholder="Address" readonly="readonly"> <br>
  <input type="text" placeholder="Detailed Address">
  
</body>
<script>


function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>