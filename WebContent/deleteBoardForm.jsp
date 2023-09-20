<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebContent 폴더 안에 deleteMemberForm.jsp 소스 코딩</title>
</head>
<body>

	<form action="deleteBoard.jsp" method='post'>
		
		<table border="1">
			<tr>
				<td>게시글번호</td>
				<td><input type="text" name="BOARDNUM" size="40"></td>
			</tr>
			<tr>
				<td> <input type="submit" value="삭제"> </td>
				<td> <input type="reset" value="취소"> </td>
			</tr>
		
		</table>
	
	</form>

</body>
</html>