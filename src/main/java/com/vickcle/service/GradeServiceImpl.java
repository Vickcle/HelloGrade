package com.vickcle.service;

import com.vickcle.dao.GradeDao;
import com.vickcle.model.*;
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
        gradedao.deleteGradeById(grade_id);
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
    public List<ClassGrade> selectGradeInfoByClass(ClassGrade classGrade){
        return gradedao.selectGradeInfoByClass(classGrade);
    }
    @Override
    public  GradeObject selectGradeInfoByGradeId(@Param("grade_id") int grade_id){
        return gradedao.selectGradeInfoByGradeId(grade_id);
    }
    @Override
    public List<CourseObject> dealWithSqlSentences(String sql_sentences){
        return gradedao.dealWithSqlSentences(sql_sentences);
    }

    @Override
    public List<GradeCreer> selectGradeForCreer(GradeCreer gradeCreer){
        return gradedao.selectGradeForCreer(gradeCreer);
    }

    @Override
    public List<GradeYear> queryGradeYear(GradeYear gradeYear){
        return  gradedao.queryGradeYear(gradeYear);
    }

    @Override
    public List<GradeObject> queryGradeYearDetails(GradeYear gradeYear){
        return gradedao.queryGradeYearDetails(gradeYear);
    }
}
