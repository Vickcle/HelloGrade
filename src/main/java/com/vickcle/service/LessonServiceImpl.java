package com.vickcle.service;

import com.vickcle.dao.LessonDao;
import com.vickcle.model.Lesson;
import com.vickcle.model.LessonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LessonServiceImpl implements LessonService{
    @Autowired
    LessonDao lessondao;
    @Override
    public List<Lesson> findAllLesson(){
        return lessondao.findAllLesson();
    }
    @Override
    public Lesson findLessonById(int lesson_id){
        return lessondao.findLessonById(lesson_id);
    }
    public Lesson  findLessonInGrade(int course_id,int teacher_id,String lesson_duration){
        return lessondao.findLessonInGrade(course_id,teacher_id,lesson_duration);
    }
    @Override
    public void  insertLesson(Lesson lesson){
        lessondao.insertLesson(lesson);
    }
    @Override
    public void updateLessonById(Lesson lesson){
        lessondao.updateLessonById(lesson);
    }
    @Override
    public void deleteLessonById(int lesson_id){
        lessondao.findLessonById(lesson_id);
    }
    @Override
    public List<LessonObject> selectLessonInfo(LessonObject lessonObject){
        return lessondao.selectLessonInfo(lessonObject);
    }

}
