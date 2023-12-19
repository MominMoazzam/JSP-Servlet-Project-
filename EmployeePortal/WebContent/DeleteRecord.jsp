<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
          
  String id = request.getParameter("id4");
  
   try{
	   int id4 = Integer.parseInt(id);
	   String fqcn = "com.mysql.jdbc.Driver";
	   String url = "jdbc:mysql://localhost:3306?user=root&password=root";
	   
	   Class.forName(fqcn);
	   
	   Connection con = DriverManager.getConnection(url);
	    
	   PreparedStatement pstmt = con.prepareStatement("delete from empportal.employeedata where id ='"+id4+"' ");
	   
	   pstmt.executeUpdate();
	   
	   RequestDispatcher rd = request.getRequestDispatcher("fetch.jsp");
	   rd.forward(request, response);
   }
   catch(Exception e)
   {
	   System.out.println("handled");
	   e.printStackTrace();
   }

%>
</body>
</html>