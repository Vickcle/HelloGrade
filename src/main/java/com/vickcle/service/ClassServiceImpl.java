package com.vickcle.service;

import com.vickcle.dao.ClassDao;
import com.vickcle.model.Class;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassServiceImpl implements ClassService {
    @Autowired
    ClassDao classDao;
    @Override
    public void insertClass(Class cclass){
        classDao.insertClass(cclass);
    }
    @Override
    public List<Class> findAllClass(){
        return classDao.findAllClass();
    }
    @Override
    public Class findClassByName(String name){
        return classDao.findClassByName(name);
    }
    @Override
    public Class findClassById(int class_id){
        return classDao.findClassById(class_id);
    }
    @Override
    public void updateClassById(Class cclass){
        classDao.updateClassById(cclass);
    }
    @Override
    public void deleteClassById(int class_id){
        classDao.deleteClassById(class_id);
    }
}
