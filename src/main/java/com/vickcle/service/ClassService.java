package com.vickcle.service;

import com.vickcle.model.Class;

import java.util.List;


public interface ClassService {
    public void insertClass(Class cclass);
    public List<Class> findAllClass();
    public Class findClassByName(String name);
    public Class findClassById(int class_id);
    public void updateClassById(Class cclass);
    public void deleteClassById(int class_id);
}
