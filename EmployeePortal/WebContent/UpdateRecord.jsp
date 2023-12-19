<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

body{
background-color:  #7dce94;
}

form{
width: 80%;
margin: auto;
text-align:center;
margin-top:10%;
}

input{
margin-bottom: 2rem;
}

#bottm{
margin-top: 1.5rem;
}

#bottm input{
width: 7rem;
height: 1.7rem;
border: 1.7px solid black;
color: white;
background-color: #9bc400;
}

#bottm input:hover{
border :1px solid black;
cursor: pointer;
}

</style>
</head>
<body>
<%
String u = request.getParameter("id3");


try{
	  int id3 = Integer.parseInt(u);
	  String fqcn = "com.mysql.jdbc.Driver";
	  String url = "jdbc:mysql://localhost:3306?user=root&password=root";
	  
	  Class.forName(fqcn);
	  
	  Connection con = DriverManager.getConnection(url);
	  
	  PreparedStatement pstmt = con.prepareStatement("select * from empportal.employeedata where id='"+id3+"' ");
	  
	  ResultSet rs = pstmt.executeQuery();
%>
<form action="UpdateRecord" method="post">

<%
while(rs.next()){
	
%>	
<div id="cont">
 <input type="hidden" name ="eid" value="<%out.print(rs.getInt(1));%>"> <br>
 <label for="input">Name</label> <br>
 <input type="text" name="ename" value="<%out.print(rs.getString(2));%>"> <br>
 <label for="input">Salary</label> <br>
  <input type="text" name="esal" value="<%out.print(rs.getInt(3));%>"> <br>
  <label for="input">Place</label> <br>
  <input type="text" name="eplace" value="<%out.print(rs.getString(4));%>"> <br>
  </div>
<% 
}
%>
   <div id="bottm">
  <input type="submit" name="submit" value="UpdateRecord" id="UpdateRecord">
  </div>
</form>	  
<%
}catch(Exception e)
{
	System.out.println("handled");
	e.printStackTrace();
}
%>
</body>
</html>