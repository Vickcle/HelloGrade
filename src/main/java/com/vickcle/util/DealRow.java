package com.vickcle.util;


import com.vickcle.bean.CourseBean;
import com.vickcle.bean.StudentBean;
import com.vickcle.bean.TeacherBean;
import com.vickcle.model.Course;
import com.vickcle.model.Student;
import com.vickcle.model.Teacher;

public class DealRow {
    public static  Student changeToStudent(StudentBean studentBean,int class_id){
        Student student = new Student();
        student.setStudent_code(studentBean.getStudent_code());
        student.setStudent_name(studentBean.getStudent_name());
        student.setStudent_pwd(studentBean.getStudent_pwd());
        student.setClass_id(class_id);
        return  student;
    }

    public static Course changeToCourse(CourseBean courseBean){
        Course course = new Course();
        course.setCourse_code(courseBean.getCourse_code());
        course.setCourse_name(courseBean.getCourse_name());
        course.setCourse_degree(courseBean.getCourse_degree());
        course.setCourse_type(courseBean.getCourse_type());
        course.setCourse_time(courseBean.getCourse_time());
        course.setCourse_property(courseBean.getCourse_property());
        return course;
    }

    public static Teacher changeToTeacher(TeacherBean teacherBean){
        Teacher teacher = new Teacher();
        return teacher;
    }
}