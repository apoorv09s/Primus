<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.*" %>
<%@page import="java.util.*" %>
<%@page import="p1.DB" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
 String name=request.getParameter("Name");
 String mail=request.getParameter("Email");
 java.util.Date dd=new java.util.Date(request.getParameter("Dob"));
 java.sql.Date dob=new java.sql.Date(dd.getTime());
 SimpleDateFormat fir=new SimpleDateFormat("dd-MMM-yyyy:hh:mm:ss");
 java.util.Date d=new java.util.Date();
 String memb=request.getParameter("Mem");
 String passw=request.getParameter("pass");
 String ques=request.getParameter("Sques");
 String ans=request.getParameter("Ans");
 String dor=fir.format(d);
	try
	{
	 Connection con=DB.getConnect();
	 String sql="insert into PORTAL_USERS values(?,?,?,?,?,?,?,?)";
	 PreparedStatement pst=con.prepareStatement(sql);
	 pst.setString(1,name);
	 pst.setString(2,mail);
	 pst.setDate(3,dob);
	 pst.setString(4,memb);
	 pst.setString(5,passw);
	 pst.setString(6,ques);
	 pst.setString(7,ans);
	 pst.setString(8,dor);
	 int x=pst.executeUpdate();
	 if(x>0)
	 {
		 //RequestDispatcher rd=request.getRequestDispatcher("afteregister.jsp?user=name");
		 
		 RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
		 rd.include(request, response);
	 }
	 else
	 {
		 response.sendRedirect("Error.jsp");
	 }
	}
	catch(Exception e)
	{response.sendRedirect("Error.jsp");}

 %>
</body>
</html>
