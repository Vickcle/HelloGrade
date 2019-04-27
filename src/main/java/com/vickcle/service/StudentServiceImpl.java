package com.vickcle.service;

import com.vickcle.dao.StudentDao;
import com.vickcle.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentDao studentDao;
    @Override
    public void insertStudent(Student student){
        studentDao.insertStudent(student);
    }
    @Override
    public List<Student> findAllStudent(){
        return studentDao.findAllStudent();
    }
    @Override
    public Student findStudentByCode(String student_code){
        return  studentDao.findStudentByCode(student_code);
    }

    @Override
    public List<Student> findStudentByName(String student_name){
        return studentDao.findStudentByName(student_name);
    }
    @Override
    public Student findStudentById(int student_id){
        return studentDao.findStudentById(student_id);
    }
    @Override
    public void updateStudentById(Student student){
        studentDao.updateStudentById(student);
    }
    @Override
    public void deleteStudentById(int student_id){
        studentDao.deleteStudentById(student_id);
    }
    @Override
    public List<Student> selectStudentInfo(Student student){
        return  studentDao.selectStudentInfo(student);
    }
}
