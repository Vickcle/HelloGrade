package com.vickcle.dao;

import com.vickcle.model.Course;

import java.util.List;

public interface CourseDao {
    public void insertCourse(Course Course);
    public List<Course> findAllCourse();
    public List<Course> findCourseByName(String course_name);
    public Course findCourseByCode(String course_code);
    public Course findCourseById(int course_id);
    public void updateCourseById(Course course);
    public void deleteCourseById(int course_id);
}
