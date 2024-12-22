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

@WebServlet("/signup")
public class Signup extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		

		//collecting the data from user
		String name = req.getParameter("name");
		String phonenumber = req.getParameter("phoneNumber");
		String mail = req.getParameter("email");
		String branch = req.getParameter("branch");
		String location = req.getParameter("location");
		String password = req.getParameter("password");
		String confirmpassword = req.getParameter("confirm_password");

		//converting String to long
		long phone = Long.parseLong(phonenumber);
		//PrintWriter out = resp.getWriter();

		//JDBC Implementation 
		student s = new student();
		StudentDao sdao = new StudentDAOimpl();
		if (password.equals(confirmpassword)) {
			s.setName(name);
			s.setPhone(phone);
			s.setMailId(mail);
			s.setBranch(branch);
			s.setLocation(location);
			s.setPassword(password);

			boolean res = sdao.insertStudent(s);
			s=sdao.getstudent(mail, password);
			if (res == true) {
				
				//out.println("<h1>data added successfully your Student Id is:"+s.getId()+"</h1>");
				req.setAttribute("success", "signup successful");
				RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
				rd.forward(req, resp);
			} else {
				//out.println("<h1>failed to add</h1>");
				req.setAttribute("failure", "signup failed");
				RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
				rd.forward(req, resp);
			}
			
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
	}
}