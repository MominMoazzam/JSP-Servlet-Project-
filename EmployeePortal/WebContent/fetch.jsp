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
background-color:#c2edda;
}


table{
width: 60%;
margin: auto;
border: 2px solid red;
}

h1{
text-align: center;
margin-top: 16%;
margin-bottom: 2rem;
color: black;
}

tbody td{
text-align: centre;
color: green;
border: 1px solid black;
}

td a{
text-decoration: none;
color: black;
}
</style>
</head>
<body>
<h1>Employee Data</h1>
<table >

<tbody>
<%

try{
	  
	  String fqcn = "com.mysql.jdbc.Driver";
	  String url = "jdbc:mysql://localhost:3306?user=root&password=root";
	  
	  Class.forName(fqcn);
	  
	  Connection con = DriverManager.getConnection(url);
	  
	  PreparedStatement pstmt = con.prepareStatement("select * from empportal.employeedata ");
	  
	 ResultSet rs = pstmt.executeQuery();
	 
	 while(rs.next())
	 {
		 %>
		<tr>
		 <td> <%out.println(rs.getString(2));%> </td>
		<td> <% out.println(rs.getInt(3)); %> </td>
		<td> <%out.println(rs.getString(4)); %> </td>
	    <td>  <a href='UpdateRecord.jsp?id3=<%=rs.getInt(1)%>'><b>Edit</b></a> </td>
	    <td>  <a href='DeleteRecord.jsp?id4=<%=rs.getInt(1)%>'><b>Delete</b></a> </td>
	    </tr>
	<% }
}catch(Exception e)
{
	System.out.println("handled");
	e.printStackTrace();
}
%>
</tbody>
</table>

</body>
</html>