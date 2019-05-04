package com.vickcle.service;

import com.vickcle.model.Lesson;
import com.vickcle.model.LessonObject;

import java.util.List;


public interface LessonService {
    public List<Lesson> findAllLesson();
    public Lesson findLessonById(int lesson_id);
    public Lesson  findLessonInGrade(int course_id,int teacher_id,String lesson_duration);
    public void  insertLesson(Lesson lesson);
    public void updateLessonById(Lesson lesson);
    public void deleteLessonById(int lesson_id);
    public List<LessonObject> selectLessonInfo(LessonObject lessonObject);
}
