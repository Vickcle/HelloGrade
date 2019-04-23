package com.vickcle.dao;

import com.vickcle.model.Lesson;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LessonDao {
    public List<Lesson> findAllLesson();
    public Lesson findLessonById(int lesson_id);
    public Lesson  findLessonInGrade(@Param("course_id")int course_id,@Param("teacher_id") int teacher_id,@Param("lesson_duration") String lesson_duration);
    public void  insertLesson(Lesson lesson);
    public void updateLessonById(Lesson lesson);
    public void deleteLessonById(int lesson_id);
}
