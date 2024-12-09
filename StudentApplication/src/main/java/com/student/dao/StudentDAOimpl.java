package com.student.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.student.connector.connectionFactory;
import com.student.dto.student;


public class StudentDAOimpl implements StudentDao 
{
	private Connection con;
	
	public StudentDAOimpl() {
		this.con =connectionFactory.requestConnection();
	}

	@Override
	public boolean insertStudent(student s) 
	{
		
		//JDBC logics for insert operation;
		String query="INSERT INTO STUDENT_1 VALUES(0,?,?,?,?,?,?,SYSDATE())";
		PreparedStatement ps=null;
		int res=0;
		try 
		{
			ps=con.prepareStatement(query);
			ps.setString(1,s.getName());
			ps.setLong(2,s.getPhone());
			ps.setString(3,s.getMailId());
			ps.setString(4,s.getBranch());
			ps.setString(5,s.getLocation());
			ps.setString(6,s.getPassword());
			res=ps.executeUpdate();
			
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	@Override
	public boolean updateStudent(student s) {
		// JDBC Logic to update the student info;
		PreparedStatement ps=null;
		String query="UPDATE STUDENT_1 SET NAME=?,PHONE=?,MAILID=?,BRANCH=?,LOCATION=?,PASSWORD=? where ID=?";
		int res=0;
		try
		{
			ps=con.prepareStatement(query);
			ps.setString(1,s.getName());
			ps.setLong(2,s.getPhone());
			ps.setString(3,s.getMailId());
			ps.setString(4,s.getBranch());
			ps.setString(5,s.getLocation());
			ps.setString(6,s.getPassword());
			ps.setInt(7,s.getId());
			res=ps.executeUpdate();
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0)
		{
			return true;
			
		}
		else
		{
			return false;
		}
	}

	@Override
	public boolean deleteStudent(student s) 
	{
		// JDBC logic to delete the student data;
		String query="DELETE FROM STUDENT_1 WHERE ID=?";
		PreparedStatement ps=null;
		int res=0;
		try 
		{
			ps=con.prepareStatement(query);
			ps.setInt(1, s.getId());
			res=ps.executeUpdate();
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0)
		{
			return true;
		}
		else 
		{
			return false;
		}
	}

	@Override
	public student getstudent(String mail, String pass) {
		// JDBC logic to get the student data
		String query="SELECT * FROM STUDENT_1 WHERE MAILID=? AND PASSWORD=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		student s=null;
		try 
		{
			ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2, pass);
			rs=ps.executeQuery();
			while(rs.next())
			{
				s=new student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone"));
				s.setMailId(rs.getString("mailid"));
				s.setBranch(rs.getString("branch"));
				s.setLocation(rs.getString("location"));
				s.setPassword(rs.getString("password"));
				s.setDate(rs.getString("date"));
			}
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s ;
	}

	@Override
	public List<student> getStudent() {
		// JDBC Logic to get the studentsList details 
		ArrayList<student> students=new ArrayList<student>();
		student s=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="SELECT * FROM STUDENT_1";
		
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next())
			{
				s=new student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone"));
				s.setMailId(rs.getString("mailid"));
				s.setBranch(rs.getString("branch"));
				s.setLocation(rs.getString("location"));
				s.setPassword(rs.getString("password"));
				s.setDate(rs.getString("date"));
				students.add(s);
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return students;
	}

	@Override
	public student getstudent(long phone, String mail)
	{
		String query="SELECT * FROM STUDENT_1 WHERE PHONE=? AND MAILID=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		student s=null;
		try 
		{
			ps=con.prepareStatement(query);
			ps.setLong(1, phone);
			ps.setString(2, mail);
			rs=ps.executeQuery();
			while(rs.next())
			{
				s=new student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone"));
				s.setMailId(rs.getString("mailid"));
				s.setBranch(rs.getString("branch"));
				s.setLocation(rs.getString("location"));
				s.setPassword(rs.getString("password"));
				s.setDate(rs.getString("date"));
			}
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s ;
		
	}

}
