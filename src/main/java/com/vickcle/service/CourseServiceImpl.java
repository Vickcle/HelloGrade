package com.vickcle.service;

import com.vickcle.dao.CourseDao;
import com.vickcle.model.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    CourseDao courseDao;
    @Override
    public void insertCourse(Course course){
        courseDao.insertCourse(course);
    }
    @Override
    public List<Course> findAllCourse(){
        return courseDao.findAllCourse();
    }
    @Override
    public Course findCourseByCode(String course_code){
        return  courseDao.findCourseByCode(course_code);
    }

    @Override
    public List<Course> findCourseByName(String course_name){
        return courseDao.findCourseByName(course_name);
    }
    @Override
    public Course findCourseById(int course_id){
        return courseDao.findCourseById(course_id);
    }
    @Override
    public void updateCourseById(Course course){
        courseDao.updateCourseById(course);
    }
    @Override
    public void deleteCourseById(int course_id){
        courseDao.deleteCourseById(course_id);
    }
}
