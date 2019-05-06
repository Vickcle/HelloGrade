package com.vickcle.dao;

import com.vickcle.model.School;

import java.util.List;

public interface SchoolDao {
    public void insertSchool(School school);
    public List<School> findAllSchool();
    public List<School> findSchoolByName(String name);
    public School findSchoolById(int school_id);
    public void updateSchoolById(School school);
    public void deleteSchoolById(int school_id);
    public List<School> querySchoolInfoByTerms(School school);
 }
