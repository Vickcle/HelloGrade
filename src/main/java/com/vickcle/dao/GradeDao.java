package com.vickcle.dao;

import com.vickcle.model.CourseObject;
import com.vickcle.model.Grade;
import com.vickcle.model.GradeObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GradeDao {
    public List<Grade> findAllGrade();
    public Grade findGradeById(int grade_id);
    public void  insertGrade(Grade grade);
    public void updateGradeById(Grade grade);
    public void deleteGradeById(int grade_id);
    public List<GradeObject> selectAllGradeInfo();
    public List<GradeObject> selectGradeInfoByTerms(GradeObject gradeObject);
    public List<CourseObject> dealWithSqlSentences(@Param("sql_sentences") String sql_sentences);
}
