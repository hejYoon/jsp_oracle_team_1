<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WebContent 폴더 안에 index.jsp 소스 코딩</title>
</head>
<body>
   <!-- 1단계 : 게시글 등록 -->
   <form action="insertBoardForm_yst.jsp">
      <input type="submit" value="게시글 등록_유승태" /> <br> <br>
   </form>
   
   <!-- 1단계 : 게시글 등록 -->
   <form action="insertBoardForm_jdw.jsp">
      <input type="submit" value="게시글 등록_정대원" /> <br> <br>
   </form>
   <!-- 2단계 : 게시글 번호 입력 상세조회 -->
   <form action="viewBoardForm.jsp">
      <input type="submit" value="게시글 번호 입력 상세조회_조윤채" /> <br> <br>
   </form>
   <!-- 3단계 : 게시글 수정 -->
   <form action="updateBoardForm.jsp">
      <input type="submit" value="게시글 번호입력 수정_이재빈" /> <br> <br>
   </form>
   <!-- 4단계 : 게시글 삭제 -->
   <form action="deleteBoardForm.jsp">
      <input type="submit" value="게시글 번호입력 삭제_정보영" /> <br> <br>
   </form>
</body>
</html>