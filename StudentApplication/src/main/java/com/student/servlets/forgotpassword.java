package com.student.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.student.dao.StudentDAOimpl;
import com.student.dao.StudentDao;
import com.student.dto.student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/forgot-password")
public class forgotpassword extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session=req.getSession(false);
		String mail=req.getParameter("email");
		String phonenumber=req.getParameter("phone");
		String new_pass=req.getParameter("new_password");
		String con_pass=req.getParameter("confirm_password");
		
		long phone=Long.parseLong(phonenumber);
		
		
		student s=new student();
		StudentDao sdao=new StudentDAOimpl();
		s=(student)session.getAttribute("student");
		if(s!=null&&mail.equals(s.getMailId())&&phone==s.getPhone()&&new_pass.equals(con_pass))
		{
			s.setPassword(new_pass);
			boolean res1=sdao.updateStudent(s);
			if(res1)
			{
				req.setAttribute("success", "Pin updated Successful");
				RequestDispatcher rd=req.getRequestDispatcher("forgotpassword.jsp");
				rd.forward(req, resp);
			}
			else
			{
				req.setAttribute("failure", "Pin update Failed");
				RequestDispatcher rd=req.getRequestDispatcher("forgotpassword.jsp");
				rd.forward(req, resp);
			}
		}
	}
}
