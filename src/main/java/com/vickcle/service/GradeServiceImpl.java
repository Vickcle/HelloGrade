package com.vickcle.service;

import com.vickcle.dao.GradeDao;
import com.vickcle.model.CourseObject;
import com.vickcle.model.Grade;
import com.vickcle.model.GradeObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeServiceImpl implements GradeService{
    @Autowired
    GradeDao gradedao;
    @Override
    public List<Grade> findAllGrade(){
        return gradedao.findAllGrade();
    }
    @Override
    public Grade findGradeById(int grade_id){
        return gradedao.findGradeById(grade_id);
    }
    @Override
    public void  insertGrade(Grade grade){
        gradedao.insertGrade(grade);
    }
    @Override
    public void updateGradeById(Grade grade){
        gradedao.updateGradeById(grade);
    }
    @Override
    public void deleteGradeById(int grade_id){
        gradedao.findGradeById(grade_id);
    }
    @Override
    public List<GradeObject> selectAllGradeInfo(){
        return gradedao.selectAllGradeInfo();
    }
    @Override
    public List<GradeObject> selectGradeInfoByTerms(GradeObject gradeObject){
        return gradedao.selectGradeInfoByTerms(gradeObject);
    }
    @Override
    public  GradeObject selectGradeInfoByGradeId(@Param("grade_id") int grade_id){
        return gradedao.selectGradeInfoByGradeId(grade_id);
    }
    public List<CourseObject> dealWithSqlSentences(String sql_sentences){
        return gradedao.dealWithSqlSentences(sql_sentences);
    }
}
