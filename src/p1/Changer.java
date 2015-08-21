package p1;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Changer extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        
        PrintWriter out = res.getWriter();
        HttpSession session=req.getSession(true);
        
        String mail=req.getParameter("uzer");
        String old_pass= req.getParameter("old_pass");      
        String new_pass= req.getParameter("new_pass");      
        String re_new_pass= req.getParameter("re_new_pass");      
        
        Connection con=null;
        PreparedStatement st;
        ResultSet rs;
        
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","admin","thundereagle");
            st=con.prepareStatement("select * from PORTAL_USERS where EMAIL=?");
            st.setString(1, mail);
            rs=st.executeQuery();
            rs.next();
            if(rs.getString(5).equalsIgnoreCase(old_pass))
            {
            PreparedStatement ps1=con.prepareStatement("update PORTAL_USERS set PASSWORD=? where EMAIL=?");
            ps1.setString(1, new_pass);
            ps1.setString(2, mail);
            ps1.executeUpdate();
            session.setAttribute("pass_chng_success", "pass_chng_success");
            res.sendRedirect("Change.jsp");
            }
            else
            {
              session.setAttribute("old_pass_mismatch", "old_pass_mismatch");
              res.sendRedirect("Change.jsp");
            }
            
            }catch(Exception e){} 
             finally
             {
               try{
               con.close();
                  }catch(Exception e){}
             }
        }
    }

   