<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WebContent폴더 안에 viewBoardForm.jsp 소스 코딩</title>
</head>
<body>
	<form action="viewBoard.jsp" method="post">
		<table border="1">
			<tr>
				<td>조회할 글 번호를 입력하세요</td>
				<td> <input type="text" name="BOARDNUM" size="10"></td>
			</tr>
			<tr>
				<td colspan="2"> <input type="submit" value="조회"></td>
			</tr>
		</table>
	
	</form>
	

</body>
</html>