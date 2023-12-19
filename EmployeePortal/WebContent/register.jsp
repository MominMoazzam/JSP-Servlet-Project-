<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
form {
background-color: aqua;
display: flex;
justify-content: center;
align-items: center;
height: 100vh;
}

#container{
text-align: center;
}

input{
margin-bottom: 1rem;
}

#container h1{
color: red;
}

button{
background-color: white;
border: none;
border: 1px solid black;
width: 6rem;
height: 2rem;
margin-top: 1rem;
}

button:hover {
     border: 1px solid red;
	 color: red;
    font-size:1rem;
    cursor: pointer;
}
</style>
</head>
<body>
<form action="register.jsp">
<div id="container">
<h1>Registration Form</h1>
<label for="input">Enter The ID</label> <br>
<input type="number" name = "id1"> <br>
<label for="input">Enter The Name</label> <br>
<input type="text" name="nm"> <br>
<label for="input">Enter The Salary</label> <br>
<input type="text" name="sal"> <br>
<label for="input">Enter The Place</label> <br>
<input type="text" name="pl"> <br>

<button type="submit">Register</button>
</div>
</form>

<%
   String id = request.getParameter("id1");
   String name = request.getParameter("nm");
   String sal = request.getParameter("sal");
   String place = request.getParameter("pl");
   
   try{
	   
	   String fqcn = "com.mysql.jdbc.Driver";
	   String url = "jdbc:mysql://localhost:3306?user=root&password=root";
	   
	   Class.forName(fqcn);
	   
	   Connection con = DriverManager.getConnection(url);
	   
	   PreparedStatement pstmt = con.prepareStatement("insert into empportal.employeedata values(?,?,?,?)");
	   
	   int id1 = Integer.parseInt(id);
	   pstmt.setInt(1, id1);
	   pstmt.setString(2, name);
	   pstmt.setString(3, sal);
	   pstmt.setString(4, place);
	   
	   pstmt.executeUpdate();
%>
 
<%
	   
   }catch(Exception e)
   {
	   System.out.println("Handled");
	   e.printStackTrace();
   }
%>
</body>
</html>