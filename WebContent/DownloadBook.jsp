<%@page import="p1.Downloader"%>
<%@page import="java.sql.*"%>
<%@page import="p1.DB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%! String ty; %>
<head>
  <title>EBooks</title>
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
          <h1><a href="index.jsp">BOOK<span class="logo_colour"> Portal</span></a></h1>
          <h2>All you need.</h2>
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
        <%if(session.getAttribute("userid")==null || session.getAttribute("userid")=="")
          {
          %>
	          <li class="selected"><a href="index.html">Home</a></li>
	          <li ><a href="register.jsp">Sign Up</a></li>
	          <li><a href="Logger.jsp">Sign In</a></li>
          <%}
          else{%>
              <li><a href="About.jsp">About Us</a></li>
	          <li class="selected"><a href="EBooks.jsp">E-Books</a></li>
	          <li><a href="Prog.jsp">Programming</a></li>
	          <li><a href="TechUp.jsp">Tech Updates</a></li>
	          <li><a href="Web.jsp">Web Development</a></li>
	          <li><a href="Change.jsp">Change Password</a></li>
	          <li><a href="logout.jsp">Logout</a></li>
         <%} %>
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
      <%! String a[]={"Head First Ajax","Head First Android Development","Head First C#","Head First C","Head First Design Patterns","Head First EJB","Head First HTML with CSS and XHTML","Head First HTML5 Programming","Head First Java 2nd edition","Head First Javascript","Head First jQuery","Head First Networking","Head First PHP & MySQL (A Brain-Friendly Guide)","Head First Programming (Python)","Head First Servlets and JSP, 2nd Edition","Head First Software Development"}; %>
        <h1>Welcome to BookPortal.com</h1>
        <% session=request.getSession(false); 
        %>
        <p>This is a simple book portal which provides you some of the most sort after e-books to download. This means you are free to download and use it. However, you <strong>So start downloading free of cost.</strong>.</p>
        <table border="5" cellpadding="10" cellspacing="10">
	     <%
	      Connection con=DB.getConnect();
	      String p=request.getParameter("menu1");
	      String q=request.getParameter("key");
	      out.println("<p>Stream : "+p+"</p>");
	      out.println("<p>Keyword : "+q+"</p>");
	      out.println("<p>Search Results : </p>");
	      PreparedStatement ps=con.prepareStatement("select * from BOOKS_DETAILS where STREAM=?");
	      ps.setString(1,p);
	      ResultSet rs=ps.executeQuery();
	      if(rs.next())
	      {	  int i=0;
	      do
	      {
	    	  String s=rs.getString(3);
	    	  String f=s.toUpperCase();
	    	  if(s.contains(q) || s.contains(q.toLowerCase())){
	    	  %><tr><td><%=f %></td><td><a href="Downloader?book=<%=rs.getInt(1) %>"><input type="button" value="Download"></a></td></tr><%
	    			  i++;
	    	  }
	      }while(rs.next());
	      if(i==0)
	    	  out.println("<p>Sorry!! Requested resource cannot be found.</p>");
	      else
	    	  i=0;
	      
	      }
	      else
	    	  out.println("<p>Sorry!! Requested resource cannot be found.</p>");
	     %>
	     </table>
	    
       <div>
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
</body>
</html>
