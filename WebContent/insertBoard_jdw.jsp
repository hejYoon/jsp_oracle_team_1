<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	String boardNum = request.getParameter("BOARDNUM");
	String boardTit= request.getParameter("TITLE");
	String boardCon = request.getParameter("CONTENT");
	String boardWri = request.getParameter("WRITER");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebContent 폴더 안에 insertmemberpstmt.jsp 소스 코딩</title>
</head>
<body>

   <%

      Class.forName("oracle.jdbc.driver.OracleDriver");
      System.out.println("드라이버 로딩 성공");
      Connection conn = null;
	  PreparedStatement pstmt = null; 
	  
      try{
         String url = "jdbc:oracle:thin:@localhost:1521:orcl";
         String dbUser = "jsporacleteamuser1";
         String dbPass = "jsporaclepw";
         System.out.println("DB 접속 성공");
         
         // insert into member values('jang', '1234', '장나라', 'jang@naver.com');
         String query = "insert into board values(?, ?, ?, ?)";
         
         // 2. 데이터베이스 커넥션 생성
         conn = DriverManager.getConnection(url, "jsporacleteamuser1", "jsporaclepw");
         
         // 3. preparedStatement 생성
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, boardNum);
         pstmt.setString(2, boardTit);
         pstmt.setString(3, boardCon);
         pstmt.setString(4, boardWri);
         
         // 4. 쿼리문 실행
         int resultInsert = pstmt.executeUpdate();
         
         // 5. 쿼리문 실행 결과 출력
   %>
          
          <%= resultInsert %> 건의 데이터가 추가 되었습니다!
           
   <%
         
      } catch(SQLException ex){
         out.println(ex.getMessage());
         ex.printStackTrace();
      }finally{
          // 6. 사용한 Statement 종료         
          if(pstmt != null) try{
        	 pstmt.close();
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