<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>    
<html>
<head>
  <title>Technical Section</title>
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
          <h1><a href="index.html">YourOwn<span class="logo_colour">Portal</span></a></h1>
          <h2>All you need</h2>
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
          <%if(session.getAttribute("userid")==null || session.getAttribute("userid")=="")
          {%>
	          <li class="selected"><a href="index.html">Home</a></li>
	          <li><a href="About.jsp">About Us</a></li>
	          <li><a href="register.jsp">Sign Up</a></li>
	          <li><a href="Logger.jsp">Sign In</a></li>
          <%}
          else{%>
          	  <li><a href="About.jsp">About Us</a></li>
	          <li><a href="EBooks.jsp">E-Books</a></li>
	          <li><a href="Prog.jsp">Programming</a></li>
	          <li class="selected"><a href="TechUp.jsp">Tech Updates</a></li>
	          <li><a href="Web.jsp">Web Development</a></li>
	          <li><a href="Change.jsp">Change Password</a></li>
	          <li><a href="logout.jsp">Logout</a></li>
          <%} %>
        </ul>
        <% session=request.getSession(false); 
        %>
      </nav>
    </header>
    <div id="site_content">
      <div class="gallery">
        <ul class="images">
          <li class="show"><img width="950" height="300" src="images/codersl1.jpg" alt="photo_one" /></li>
          <li><img width="950" height="300" src="images/codersl2.jpg" alt="photo_two" /></li>
          <li><img width="950" height="300" src="images/codersl3.jpg" alt="photo_three" /></li>
          <li><img width="950" height="300" src="images/codersl4.jpg" alt="photo_four" /></li>
          <li><img width="950" height="300" src="images/codersl5.jpg" alt="photo_five" /></li>
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
            <li><a href="www.hackerrank.com">HackerRank</a></li>
            <li><a href="www.codechef.com">Codechef</a></li>
            <li><a href="www.hackerearth.com">HackerEarth</a></li>
            <li><a href="www.juit.acm.org">ACM-JUIT</a></li>
          </ul>
        </div>
      </div>
      <%! FileInputStream fin;
       String s;
        int i;%>
      <div class="content">
      <% if(session.getAttribute("userid")==null || session.getAttribute("userid")=="") 
			{%>
			You are not Logged In. Please <a href="Logger.jsp">Try Again!</a> 
			<%}
      else
      {%>
       <img width="314" height="61" src="images/logo1.png" alt="HackerRank"/>
       <p><%
         fin=new FileInputStream("D:\\Java Core+Advance\\workspace\\BookDownload\\WebContent\\HackerRank.txt");
         s="";
         while((i=fin.read())!=-1)
         {
        	 s=s+(char)i;
         }
         out.println(s);
         fin.close();
        %><br/></p>
        <img width="200" height="72" src="images/logo2.png" alt="Codechef"/>
        <p><%
         fin=new FileInputStream("D:\\Java Core+Advance\\workspace\\BookDownload\\WebContent\\CodeChef.txt");
         s="";
         while((i=fin.read())!=-1)
         {
        	 s=s+(char)i;
         }
         out.println(s);
         fin.close();
         %><br/></p>
         <img width="314" height="61" src="images/logo3.jpg" alt="HackerEarth"/>
         <p><%
         fin=new FileInputStream("D:\\Java Core+Advance\\workspace\\BookDownload\\WebContent\\HackerEarth.txt");
         s="";
         while((i=fin.read())!=-1)
         {
        	 s=s+(char)i;
         }
         out.println(s);
         fin.close();
         %><br/></p>
      </div>
      <% }%>
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
    