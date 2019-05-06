package com.vickcle.service;

import com.vickcle.model.Teacher;

import java.util.List;


public interface TeacherService {
    public void insertTeacher(Teacher Teacher);
    public List<Teacher> findAllTeacher();
    public List<Teacher> findTeacherByName(String teacher_name);
    public List<Teacher> queryTeacherByTerms(Teacher teacher);
    public Teacher findTeacherByCode(String teacher_code);
    public Teacher findTeacherById(int teacher_id);
    public void updateTeacherById(Teacher teacher);
    public void deleteTeacherById(int teacher_id);

}
