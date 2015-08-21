<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Welcome</title>
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
          <h1><a href="index.jsp">YourOwn<span class="logo_colour">Portal</span></a></h1>
          <h2>All you need</h2>
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
        <%if(session.getAttribute("userid")==null || session.getAttribute("userid")=="")
          {%>
	          <li class="selected"><a href="index.html">Home</a></li>
	          <li ><a href="register.jsp">Sign Up</a></li>
	          <li><a href="Logger.jsp">Sign In</a></li>
          <%}
          else{%>
              <li><a href="About.jsp">About Us</a></li>
              <li><a href="EBooks.jsp">E-Books</a></li>
	          <li><a href="Prog.jsp">Programming</a></li>
	          <li><a href="TechUp.jsp">Tech Updates</a></li>
	          <li><a href="Web.jsp">Web Development</a></li>
	          <li><a href="Change.jsp">Change Password</a></li>
	          <li><a href="logout.jsp">Logout</a></li>
	          <%}%>
        </ul>
      </nav>
    </header>
    <div id="site_content">
      <div class="gallery">
        <ul class="images">
          <li class="show"><img width="950" height="300" src="images/1.jpg" alt="photo_one" /></li>
          <li><img width="950" height="300" src="images/2.jpg" alt="photo_two" /></li>
          <li><img width="950" height="300" src="images/3.png" alt="photo_three" /></li>
          <li><img width="950" height="300" src="images/4.jpg" alt="photo_four" /></li>
          <li><img width="950" height="300" src="images/5.jpg" alt="photo_five" /></li>
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
        	<% if(session.getAttribute("userid")==null || session.getAttribute("userid")=="") 
			{
			out.println("You are not Logged In. Please"); %><a href="Logger.jsp">Try Again!</a> <br/>
			<%}
			else
			{%>
			Welcome!
			<% out.println(request.getParameter("uzer"));
			   session=request.getSession(false);			   
			} %>
      </div>
    </div>
    <footer>
      <p>Copyright &copy; CSS3_photo_two | <a href="#">a09sahay@gmail.com</a></p>
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
