package com.vickcle.service;

import com.vickcle.dao.SchoolDao;
import com.vickcle.model.School;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SchoolServiceImpl implements SchoolService {
    @Autowired
    SchoolDao schoolDao;
    @Override
    public void insertSchool(School school){
        schoolDao.insertSchool(school);
    }
    @Override
    public List<School> findAllSchool(){
        return schoolDao.findAllSchool();
    }
    @Override
    public List<School> findSchoolByName(String name){
        return schoolDao.findSchoolByName(name);
    }
    @Override
    public School findSchoolById(int school_id){
        return schoolDao.findSchoolById(school_id);
    }
    @Override
    public void updateSchoolById(School school){
        schoolDao.updateSchoolById(school);
    }
    @Override
    public void deleteSchoolById(int school_id){
        schoolDao.deleteSchoolById(school_id);
    }
}
