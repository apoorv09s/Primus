package p1;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;

/**
 * Servlet implementation class Downloader
 */
public class Downloader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Downloader() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		
		String file="";
		String path="F:\\study material\\ebooks\\HeadFirstPackage\\";
		int s1=Integer.parseInt(request.getParameter("book"));
		Connection con=DB.getConnect();
		PreparedStatement ps;
		ResultSet rs;
		try{
	     ps=con.prepareStatement("select LINK from BOOKS_DETAILS where S_NO=?");
	     ps.setInt(1, s1);
		 rs=ps.executeQuery();
		if(rs.next())
		{
		file=rs.getString(1);
		ServletContext context = getServletContext();
		String mimeType = context.getMimeType(path+file);
        if (mimeType == null) {        
            // set to binary type if MIME mapping not found
            mimeType = "application/octet-stream";
        }
		response.setContentType("application/octet-stream");
		File f1=new File(path+file);
		FileInputStream fin = new FileInputStream(f1);
		response.setContentLength((int) f1.length());
		String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"", f1.getName());
        response.setHeader(headerKey, headerValue);
         
        // obtains response's output stream
        OutputStream outStream = response.getOutputStream();
         
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
         
        while ((bytesRead = fin.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
         
        fin.close();
        outStream.close();
	  }
	}catch(Exception e)
	{e.printStackTrace();}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
