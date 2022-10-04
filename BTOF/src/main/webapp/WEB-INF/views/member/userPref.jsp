<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심분야</title>
</head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>

	<form action="/member/userPref" method="post" name="checkboxForm">
		
		<h5 align="center">최대 5개까지 선택</h5>	
		<div  class="prefer" align="center">
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="music" value="music"/> 음악	
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="video" value="video"/> 영상
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="art" value="art"/> 미술
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="photo" value="photo"/> 사진
				<br/><br/><br/><br/>
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="sports" value="sports"/> 스포츠
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="ballet" value="ballet"/> 무용
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="fashion" value="fashion"/> 패션
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="animal" value="animal"/> 동물
				<br/><br/><br/><br/>
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="nature" value="nature"/> 자연
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="game" value="game"/> 게임
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="vr" value="vr"/> 가상현실
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="science" value="science"/> 과학
					<br/><br/><br/><br/>
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="trip" value="trip"/> 여행
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="feli" value="reli"/> 종교
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="craft" value="craft"/> 공예
			<input class="pref" onclick="count_ck(this);" type="checkbox" name="achi" value="achi"/>건축 
				<br/><br/><br/><br/>
				<input type="submit" value="확인">
		</div>
	
			<script type="text/javascript">
			
			function count_ck(obj){
				var chkbox = document.getElementsByClassName("pref");
				var chkCnt = 0;
				for(var i=0;i<chkbox.length; i++){
					if(chkbox[i].checked){
						chkCnt++;
					}
				}
				if(chkCnt>5){
					alert("최대 5개 까지 선택 가능합니다");
					obj.checked = false;
					return false;
				}
			}



		
				</script>
	
	
	</form>





</body>
</html>