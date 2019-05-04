package com.vickcle.service;

import com.vickcle.model.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface GradeService {
    public List<Grade> findAllGrade();
    public Grade findGradeById(int grade_id);
    public void  insertGrade(Grade grade);
    public void updateGradeById(Grade grade);
    public void deleteGradeById(int grade_id);
    public List<GradeObject> selectAllGradeInfo();
    public List<GradeObject> selectGradeInfoByTerms(GradeObject gradeObject);
    public List<ClassGrade> selectGradeInfoByClass(ClassGrade classGrade);
    public GradeObject selectGradeInfoByGradeId(@Param("grade_id") int grade_id);
    public List<CourseObject> dealWithSqlSentences(String sql_sentences);
    public List<GradeCreer> selectGradeForCreer(GradeCreer gradeCreer);
}
