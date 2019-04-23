package com.vickcle.service;

import com.vickcle.model.Student;

import java.util.List;


public interface StudentService {
    public void insertStudent(Student Student);
    public List<Student> findAllStudent();
    public List<Student> findStudentByName(String student_name);
    public Student findStudentByCode(String student_code);
    public Student findStudentById(int student_id);
    public void updateStudentById(Student student);
    public void deleteStudentById(int student_id);
}
