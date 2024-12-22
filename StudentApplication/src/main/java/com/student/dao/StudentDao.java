package com.student.dao;

import java.util.List;

import com.student.dto.student;

public interface StudentDao
{
	public boolean insertStudent(student s);
	public boolean updateStudent(student s);
	public boolean deleteStudent(student s);
	public student getstudent(String mail,String pass);
	public student getstudent(long phone,String mail);
	public student getstudent(int id);
	public List<student>getStudent();
}
