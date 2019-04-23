package com.vickcle.service;

import com.vickcle.dao.TeacherDao;
import com.vickcle.model.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    TeacherDao teacherDao;
    @Override
    public void insertTeacher(Teacher teacher){
        teacherDao.insertTeacher(teacher);
    }
    @Override
    public List<Teacher> findAllTeacher(){
        return teacherDao.findAllTeacher();
    }
    @Override
    public Teacher findTeacherByCode(String teacher_code){
        return  teacherDao.findTeacherByCode(teacher_code);
    }

    @Override
    public List<Teacher> findTeacherByName(String teacher_name){
        return teacherDao.findTeacherByName(teacher_name);
    }
    @Override
    public Teacher findTeacherById(int teacher_id){
        return teacherDao.findTeacherById(teacher_id);
    }
    @Override
    public void updateTeacherById(Teacher teacher){
        teacherDao.updateTeacherById(teacher);
    }
    @Override
    public void deleteTeacherById(int teacher_id){
        teacherDao.deleteTeacherById(teacher_id);
    }
}
