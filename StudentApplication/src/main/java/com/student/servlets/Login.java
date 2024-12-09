package com.student.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import com.student.dao.StudentDao;
import com.student.dao.StudentDAOimpl;
import com.student.dto.student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class Login extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException 
	{
		 	 HttpSession session=req.getSession();
			 //collect the data from the user
			 String mail=req.getParameter("mailid");
			 String password=req.getParameter("password");
			 //PrintWriter out=resp.getWriter();

			 //jdbc implementation
			 StudentDao sdao=new StudentDAOimpl();
			 student s=sdao.getstudent(mail, password);
			 if(s!=null)
			 {
				 //resp.sendRedirect("success.html");//return type is voide
				 //this method is used to redirect the servlet to the next page or next resource
				 //the next resource can be either html,jsp or another servlet
				 //syntax:public voide resp.sendredirect("url/next resource");
				 session.setAttribute("student", s);
				 RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
				 rd.forward(req, resp);
			 }
			 else
			 {
				 //resp.sendRedirect("failure.html");
				 req.setAttribute("failure", "Failed to login");
				 RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				 rd.forward(req, resp);
			 }
	}
	
}
