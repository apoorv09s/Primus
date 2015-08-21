<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Forgot Password</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
</head>

<body>
 <div id="main">
    <header>
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="index.jsp">BOOK<span class="logo_colour">Portal</span></a></h1>
          <h2>All you need</h2>
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
           <li><a href="index.html">Home</a></li>
           <li><a href="About.jsp">About Us</a></li>
          <li><a href="register.jsp">Sign Up</a></li>
          <li class="selected"><a href="Logger.jsp">Sign In</a></li>
        </ul>
      </nav>
    </header>
    <div id="site_content">
      <div class="gallery">
        <ul class="images">
          <li class="show"><img width="950" height="300" src="images/1.jpg" alt="photo_one" /></li>
          <li><img width="950" height="300" src="images/2.jpg" alt="photo_two" /></li>
          <li><img width="950" height="300" src="images/3.png" alt="photo_three" /></li>
          <li><img width="950" height="300" src="images/4.jpg" alt="photo_three" /></li>
          <li><img width="950" height="300" src="images/5.jpg" alt="photo_three" /></li>
        </ul>
      </div>
      <div id="sidebar_container">
        <div class="sidebar">
         <h3>Latest News</h3>
          <script type="text/javascript" src="http://output22.rssinclude.com/output?type=js&amp;id=910722&amp;hash=fc47b4a34d52bc2364dacba371e8536a"></script>
        </div>
        <div class="sidebar">
          <h3>Useful Links</h3>
          <ul>
            <li><a href="#">First Link</a></li>
            <li><a href="#">Another Link</a></li>
            <li><a href="#">And Another</a></li>
            <li><a href="#">Last One</a></li>
          </ul>
        </div>
      </div>
      <div class="content">
      <h1>Password Reset</h1>
      <%
String mail=request.getParameter("mail");
try
{
	Connection con=p1.DB.getConnect();
	
	PreparedStatement pst=null;
	
	String sql="select * from PORTAL_USERS where EMAIL=?";
	
	pst=con.prepareStatement(sql);
	
	pst.setString(1,mail);
	
	ResultSet rs=pst.executeQuery();
	
	if(rs.next())
	{
		out.println("Security Question : "+rs.getString(6));
	    
		%>
		<form id="contact" action="ForgChanger?mail=<%=mail %>" method="post" name="frm1">
<table>
<tr>
<td>Answer : </td>
<td><input type="text" name="ans"></td>
</tr>
</table>
<input type="submit" value="SUBMIT" onclick="my()"></td>
</form>
		<%
	}
	else
	{
		RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
		rd.forward(request, response);
	}
}
catch(Exception e)
{
	e.printStackTrace();
	System.out.println(e);
	out.println(e);
	RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
	rd.include(request, response);
}
%>
    </div>
    </div>
    <footer>
      <p>Copyright &copy; BookPortal.com | <a href="#">a09sahay@gmail.com</a></p>
    </footer>
  </div>
  <p>&nbsp;</p>
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
  <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
  <script type="text/javascript" src="js/image_fade.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('ul.sf-menu').sooperfish();
    });
  </script>
  <script type="text/javascript">
	function my()
	{
		 var old1=document.frm.ans.value;
         if(old1=="")
             alert("Enter Answer");
         else
             document.frm1.submit();   
			
	}
   </script>
</body>
</html>
