<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="p1.DB" %>    
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Under Processing</title>
</head>
<body>
<%
String email=request.getParameter("mail");
String upass=request.getParameter("pass");
String ch=request.getParameter("rem");

try
 {
	Connection con=p1.DB.getConnect();
	String sql="select * from PORTAL_USERS where EMAIL=? and PASSWORD=?";
	PreparedStatement pst=con.prepareStatement(sql);
	pst.setString(1,email);
	pst.setString(2,upass);
	ResultSet rs=pst.executeQuery();
	if(rs.next())
	{
		session.setAttribute("userid",email);
		Cookie cx1=new Cookie("user",email);
		Cookie cx2=new Cookie("pass",upass);
		cx1.setMaxAge(300000);
		cx2.setMaxAge(300000);
		if(ch!=null && ch.equals("yes"))
		{
			response.addCookie(cx1);
			response.addCookie(cx2);
		}
		String j=rs.getString(1);
		response.sendRedirect("LoggedIn.jsp?uzer="+j);
	}
	else
	{
		response.sendRedirect("Error.jsp");
	}
 }
catch(Exception e)
 {
	e.printStackTrace();
	response.sendRedirect("Error.jsp");
 }


%>
</body>
</html>