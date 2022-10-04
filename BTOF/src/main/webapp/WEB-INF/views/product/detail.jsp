<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
// 좋아요 버튼을 생성하는 코드
// 좋아요 이미지는 부트스트랩 아이콘의 like.svg, like-fill.svg 저장해서 사용
// heart : 좋아요O, heart-fill : 좋아요X
// 경로는 resouces폴더의 icon폴더안에 저장
// 이미지 경로는 맥 기준이므로 윈도우사용자는 윈도우에 맞게 변경할 것  --%>
<div>
	<a class="text-dark heart" style="text-decoration-line: none;">
		<img id="like" src="/resources/icon/like.svg">
		좋아요
	</a>
</div>

<%--  </body> 밑부분에 script 작성
// AJAX를 사용하므로 jQuery 사용 선언 (버젼은 본인걸로 알아서 변경)--%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
	    $(document).ready(function () {
					
		// 좋아요가 있는지 확인한 값을 heartval에 저장
	        var likeval = ${like.like}
	        // heartval이 1이면 좋아요가 이미 되있는것이므로 heart-fill.svg를 출력하는 코드
	        if(likeval>0) {
	            console.log(likeval);
	            $("#like").prop("src", "/resources/icon/like-fill.svg"); //사진 준비 필요
	            $(".like").prop('name',likeval)
	        }
	        else {
	            console.log(likeval);
	            $("#like").prop("src", "/resources/icon/like.svg"); //사진 준비 필요
	            $(".like").prop('name',likeval)
	        }
	
		// 좋아요 버튼을 클릭 시 실행되는 코드
	        $(".like").on("click", function () {
	            var that = $(".like");
		    $.ajax({
		    	url :'/product/like', //url 확인 필요
		        type :'POST',
		        data : {'p_number':${product.p_number}, 'm_number':${sessionScope.loginNumber}},
		    	success : function(data){
		    		that.prop('name',data);
		        	if(data==1) {
		            	     $('#like').prop("src","/resources/icon/like-fill.svg"); //사진 준비 필요
		        	} else {
	                    	     $('#like').prop("src","/resources/icon/like.svg"); //사진 준비 필요
		        	}
	             	}
		    });
	        });
	    });
	</script>
</body>
</html>