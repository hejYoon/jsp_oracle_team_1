<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="insertBoard_yst.jsp" method='post'>
		
		<table border="1">
			<tr>
				<td>글번호</td>
				<td><input type="text" name="BOARDNUM" size="10"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="TITLE" size="10"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="CONTENT" size="10"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="WRITER" size="10"></td>
			</tr>
			<tr>
				<td> <input type="submit" value="등록"> </td>
				<td> <input type="reset" value="취소"> </td>
			</tr>
		
		</table>
	
	</form>

</body>
</html>