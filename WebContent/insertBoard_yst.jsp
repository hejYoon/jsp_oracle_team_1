<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	request.setCharacterEncoding("utf-8");
	String boardNum = request.getParameter("BOARDNUM");
	String title = request.getParameter("TITLE");
	String content = request.getParameter("CONTENT");
	String writer = request.getParameter("WRITER");
%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>

	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("드라이버 로딩 성공");
		Connection conn = null;
		Statement stmt = null;
		
		try{
	         String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	         conn = DriverManager.getConnection(url, "jsporacleteamuser1", "jsporaclepw");
	         System.out.println("DB 접속 성공");
			
			
			//insert into student values(7, '강동원', '010-2355-8866', '독도');
			// insert into member BOARD('1', 'test1', '1번 글 테스트입니다', 'jby1');
			String query = "insert into BOARD values("+boardNum +",'"+title+"', '"+content +"', '"+writer+"')";
			

			
			// 3.Statement 생성
			stmt = conn.createStatement();
			
			int resultInsert = stmt.executeUpdate(query);
			
	
	%>

		<%= resultInsert %>건의 데이터가 추가되었습니다
			
	<%

		}catch(SQLException ex){
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally{
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