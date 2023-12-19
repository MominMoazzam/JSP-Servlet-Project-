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
  String a = request.getParameter("id");
  String button = request.getParameter("log");
  if(button.equals("1"))
  {
	  try{
		  
		  String fqcn = "com.mysql.jdbc.Driver";
		  String url = "jdbc:mysql://localhost:3306?user=root&password=root";
		  
		  Class.forName(fqcn);
		  
		  Connection con = DriverManager.getConnection(url);
		  
		  PreparedStatement pstmt = con.prepareStatement("select * from empportal.employeedata where ID=?");
		  int id1 = Integer.parseInt(a);
		  pstmt.setInt(1,id1);
		  
		 ResultSet rs = pstmt.executeQuery();
		  
		if(rs.next())
		  {
			RequestDispatcher rd = request.getRequestDispatcher("fetch.jsp");
			rd.forward(request, response);     
		  }
		else{
			RequestDispatcher rd = request.getRequestDispatcher("login.html");
			rd.forward(request, response);
			out.println("<h1>INCORECT ID</h1>");
		}
	  }catch(Exception e)
	  {
		  System.out.println("HANDLED");
		  e.printStackTrace();
	  }
  }
  else if(button.equals("2"))
  {
	 RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
	 rd.forward(request, response);
  }
%>
</body>
</html>