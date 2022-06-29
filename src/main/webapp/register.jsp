<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
	
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_demo","root","");
	
		String sql="insert into student(fname,lname)values(?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1,fname);
		ps.setString(2,lname);
		
		int i=ps.executeUpdate();
		
		if(i>0){
			out.println("Data insert successfully");
		}
		else{
			out.println("Fail");
		}
		
	%>
</body>
</html>