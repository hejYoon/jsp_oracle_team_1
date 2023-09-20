<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String boardNum = request.getParameter("BOARDNUM");
	String boardTit = request.getParameter("TITLE");
	String boardCon = request.getParameter("CONTENT");
	String boardWri = request.getParameter("WRITER");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WebContent안에 viewBoard.jsp 소스 코딩</title>
</head>
<body>
<%
	//1-1. JDBC 드라이버 로딩
	// MySQL DB 8아래 버전은 com.mysql.jdbc.Driver을 사용했지만,
	// MySQL DB 8이상 버전은 com.mysql.cj.jdbc.Driver 로 사용합니다.	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("드라이버 로딩 성공!");
	
	//1-2. 드라이버가 로딩 됏으면 커넥션 인터페이스 이용해서 DB접속
	Connection conn= null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		//2. 데이터베이스 커넥션 생성	
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        conn = DriverManager.getConnection(url, "jsporacleteamuser1", "jsporaclepw");
        System.out.println("DB 접속 성공");
		
		//select * from board where BOARDNUM = 'jang';
		String query = "select * from board where BOARDNUM = '"+ boardNum+"'";
		
		//3. Statement 생성
		stmt = conn.createStatement();
		//4.쿼리문 실행
		rs = stmt.executeQuery(query);
		//5. 쿼리문 실행 결과 출력
		if(rs.next()){
			%>
			
			<table border="1">
			<tr>
				<td>글번호</td>
				<!--  <td><%= rs.getString("BOARDNUM")   %></td>-->
				<td><%= boardNum %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%= rs.getString("TITLE")   %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><%= rs.getString("CONTENT")   %></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><%= rs.getString("WRITER")   %></td>
			</tr>
			</table>
			<%}else{
			%>
			<%= boardNum %>에 해당하는 글이 존재하지 않습니다.
			
			<%
		}
		
	}catch(SQLException ex){
		out.println(ex.getMessage());
		ex.printStackTrace();
	}finally{
	      // 6. 사용한 Statement 종료
	      if(rs != null) try{
	         rs.close();
	      } catch(SQLException ex){
	         ex.printStackTrace();
	      }
	      
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
	<form action="index.jsp" method="post">
		<input type="submit" value="처음으로">
	</form>
</body>
</html>