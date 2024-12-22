package com.student.servlets;

import java.io.IOException;

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
@WebServlet("/update")
public class update extends HttpServlet
{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		HttpSession session=req.getSession(false);
		String name=req.getParameter("name");
		long phone=Long.parseLong(req.getParameter("phone"));
		String mailid=req.getParameter("mail");
		String branch=req.getParameter("branch");
		String locaton=req.getParameter("location");
		
		StudentDao sdao=new StudentDAOimpl();
		student s=(student)session.getAttribute("student");
		if(s!=null)
		{
			s.setName(name);
			s.setPhone(phone);
			s.setMailId(mailid);
			s.setBranch(branch);
			s.setLocation(locaton);
			boolean res1=sdao.updateStudent(s);
			if(res1)
			{
				req.setAttribute("success", "update Successful");
				RequestDispatcher rd=req.getRequestDispatcher("Update.jsp");
				rd.forward(req, resp);
			}
			else
			{
				req.setAttribute("failure", "update failed");
				RequestDispatcher rd=req.getRequestDispatcher("Update.jsp");
				rd.forward(req, resp);
			}
		}
	}
}