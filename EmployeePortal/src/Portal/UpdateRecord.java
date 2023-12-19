package Portal;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class UpdateRecord extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	                PrintWriter pw  =  resp.getWriter();
	                pw.println("<h1>Registration Successfull</h1>");
	                String ei = req.getParameter("eid");
	                int eid = Integer.parseInt(ei);
	                String ename = req.getParameter("ename");
	                String esa = req.getParameter("esal");
	                String eplace = req.getParameter("eplace");
		
		try {
			  String fqcn = "com.mysql.jdbc.Driver";
			  String url = "jdbc:mysql://localhost:3306?user=root&password=root";
			  
			  Class.forName(fqcn);
			  
			  Connection con = DriverManager.getConnection(url);
			  
			  PreparedStatement pstmt = con.prepareStatement("update empportal.employeedata set ID=?, Name=?, Sal=?, Place=?where id='"+eid+"' ");
			  pstmt.setInt(1, eid);
			  pstmt.setString(2,ename);
			  int esal = Integer.parseInt(esa);
			  pstmt.setInt(3, esal);
			  pstmt.setString(4,eplace);
			  
		       pstmt.executeUpdate();
			  RequestDispatcher rd  =req.getRequestDispatcher("fetch.jsp");
			  rd.forward(req, resp);
		}
		catch(Exception e)
		{
			System.out.println("HANDLED");
			e.printStackTrace();
		}
	}
}
