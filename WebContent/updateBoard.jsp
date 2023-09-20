<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 프론트앤드 웹페이지에서 파라미터로 아이디를 전달받으면 MEMBER 테이블로부터
     해당 회원 정보를 읽어와서 화면으로 출력하는 JSP 웹 프로그램을 제작해 봅니다. -->
     
<%
	request.setCharacterEncoding("utf-8");

	String boardNum = request.getParameter("BOARDNUM");
	String title = request.getParameter("TITLE");
	String content = request.getParameter("CONTENT");
	String writer = request.getParameter("WRITER");
%>
     
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>소스 코딩</title>
</head>
<body>

   <%
		// 1. JDBC 드라이버 로딩
		// MySQL DB 8아래 버전은 com.mysql.jdbc.Driver을 사용했지만,
		// MySQL DB 8이상 버전은 com.mysql.cj.jdbc.Driver 로 사용합니다
		Class.forName("oracle.jdbc.OracleDriver");
		System.out.println("드라이버 로딩 성공!");
		Connection conn = null;
		Statement stmt = null;
      
      try{
               String url = "jdbc:oracle:thin:@localhost:1521:orcl";
               
               System.out.println("DB 접속 성공");
               
            // update board set TITLE = '세번째 제목', CONTENT = '세번째 내용', WRITER = 'yu' where BOARDNUM = 2;
               String query = "update board set TITLE = '"+title+"', CONTENT = '"+content+"', WRITER = '"+writer+"' where BOARDNUM = '"+boardNum+"'";
                  
            // 2. 데이터베이스 커넥션 생성
               conn = DriverManager.getConnection(url, "jsporacleteamuser1", "jsporaclepw");
            // 3. Statement 생성
            stmt = conn.createStatement();
            
            // 4. 쿼리문 실행
            int resultUpdate = stmt.executeUpdate(query);
            
            // 5. 쿼리문 실행 결과 출력
         %>
         
            <%= resultUpdate %>건의 데이터가 수정 되었습니다!
         	
         <%   
          
      } 
         catch(SQLException ex) {
         out.println(ex.getMessage());
         ex.printStackTrace();
      }   finally{
            // 6. 사용한 Statement 종료
    	  	if(stmt != null) try{
    	  		stmt.close();
    	      } catch(SQLException ex){
    	         ex.printStackTrace();
    	      }

            // 7. 커넥션 종료
            if(conn != null) try{
               conn.close();
            } catch(SQLException ex){
               ex.printStackTrace();
            }
         }

   %>
		<form action="index.jsp">
		<input type="submit" value="처음으로">
		</form>
</body>
</html>