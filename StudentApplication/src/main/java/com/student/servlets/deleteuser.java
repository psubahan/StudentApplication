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
@WebServlet("/deleteStudent")
public class deleteuser extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve the session
        HttpSession session = req.getSession(false);
        
        // Get parameters
        String sid = req.getParameter("eid");  // Student ID to delete
        String delete = req.getParameter("delete");  // Action parameter (should be "Delete")
        
        // Check if session is invalid or the student object is not found in the session
        if (session == null || session.getAttribute("student") == null) {
            req.setAttribute("failure", "Unauthorized access. Please log in.");
            RequestDispatcher rd = req.getRequestDispatcher("empList1.jsp");
            rd.forward(req, resp);
            return;
        }
        
        // Validate if the student ID is present
        if (sid == null || sid.isEmpty()) {
            req.setAttribute("failure", "Employee ID is missing.");
            RequestDispatcher rd = req.getRequestDispatcher("empList1.jsp");
            rd.forward(req, resp);
            return;
        }
        
        // Get the current logged-in student
        student currentStudent = (student) session.getAttribute("student");
        
        // Create StudentDao object
        StudentDao sdao = new StudentDAOimpl();
        int id = Integer.parseInt(sid);
        
        // Get the student object corresponding to the ID to delete
        student targetStudent = sdao.getstudent(id);
        
        // Check if the student exists
        if (targetStudent == null) {
            req.setAttribute("failure", "student not found.");
            RequestDispatcher rd = req.getRequestDispatcher("viewusers.jsp");
            rd.forward(req, resp);
            return;
        }
        
        // Prevent deletion of the admin account (assuming admin has id = 1)
        if (targetStudent.getId() == 1) {
            req.setAttribute("failure", "Cannot delete the Admin account.");
        } 
        // Prevent users from deleting their own account
        else if (currentStudent.getId() == targetStudent.getId()) {
            req.setAttribute("failure", "You cannot delete your own account.");
        } 
        // If "Delete" operation is confirmed, proceed with the deletion
        else if ("Delete".equalsIgnoreCase(delete)) {
            boolean isDeleted = sdao.deleteStudent(targetStudent);
            if (isDeleted) {
                req.setAttribute("success", "student deleted successfully.");
            } else {
                req.setAttribute("failure", "Failed to delete student. Please try again.");
            }
        } else {
            req.setAttribute("failure", "Invalid operation.");
        }
        
        // Forward the request to the view users page to show the result
        RequestDispatcher rd = req.getRequestDispatcher("viewusers.jsp");
        rd.forward(req, resp);
    }
}
