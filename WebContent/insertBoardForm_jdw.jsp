<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertmemberFormpstmt.jsp 소스 코딩</title>
</head>

<body>
	<form action="insertBoard_jdw.jsp" method="post">
	
		<table border="1">
			<tr>
				<td>숫자 </td>
				<td><input type = "text" name="BOARDNUM" size="10"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type = "text" name="TITLE" size="10"></td>
			</tr>
			<tr>
				<td>컨텐츠</td>
				<td><input type = "text" name="CONTENT" size="10"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type = "text" name="WRITER" size="10"></td>
			</tr>
			<tr>
				<td> <input type="submit" value = "추가"></td>
				<td> <input type="submit" value = "성공"></td>
			</tr>
		</table>
	</form>
</body>

</html>