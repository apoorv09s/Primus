<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Change Password</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
  <script>
            function chng_pass()
            {
                var old_pass=document.frm.old_pass.value;
                var new_pass=document.frm.new_pass.value;
                var re_new_pass=document.frm.re_new_pass.value;
                if(old_pass=="")
                    alert("Enter Old Password");
                else if(new_pass=="")
                    alert("Enter New Password");
                else if(re_new_pass=="")
                    alert("Enter Repeat New Password");
                else if(new_pass!=re_new_pass)
                    alert("New Password Mismatch");
                else
                    document.frm.submit(); 
            }
        </script>
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
	          <li class="selected"><a href="Change.jsp">Change Password</a></li>
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
          <li><img width="950" height="300" src="images/4.jpg" alt="photo_four" /></li>
          <li><img width="950" height="300" src="images/5.jpg" alt="photo_five" /></li>
        </ul>
      </div>
      <div id="sidebar_container">
        <div class="sidebar">
          <h3>Latest News</h3>
          <script type="text/javascript" src="http://output22.rssinclude.com/output?type=js&amp;id=910722&amp;hash=fc47b4a34d52bc2364dacba371e8536a"></script>
        </div>
      </div>
      <div class="content">
      <%if(session.getAttribute("userid")==null || session.getAttribute("userid")=="")
          {
          out.println("You are not Logged In. Please"); %><a href="Logger.jsp">Try Again!</a> <br/>
          <%}
      else{%>
      	<form id="contact" action="Changer?uzer=<%=session.getAttribute("userid") %>" name="frm" method="post">
      	<div class="form_settings">
      	<table width="400"  border="0">
      	<tr><td>Old Password</td>
            <td><input type="password" name="old_pass"></td>
            </tr>
                    <tr>
                        <td>New Password</td>
                        <td><input type="password" name="new_pass"></td>
                    </tr>
                    <tr>
                        <td>Confirm New Password</td>
                        <td><input type="password" name="re_new_pass"></td>
                    </tr>
         </table>
         <input class="submit" type="button" name="btn1" value="Submit" onclick="chng_pass()">
      	</div>
      	</form>
      </div>
    </div>
     <%
if(session.getAttribute("pass_chng_success")=="pass_chng_success")
        {
                   %><script language="javascript">alert("Password Changed Successfully");</script><%
                   session.removeAttribute("pass_chng_success");
        }
else if(session.getAttribute("old_pass_mismatch")=="old_pass_mismatch")
        {
                   %><script language="javascript">alert("Incorrect Old Password");</script><%
                   session.removeAttribute("old_pass_mismatch");
        }
}%>
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
