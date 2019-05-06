package com.vickcle.dao;

import com.vickcle.model.Class;
import com.vickcle.model.ClassObject;

import java.util.List;

public interface ClassDao {
    public void insertClass(Class cclass);
    public List<Class> findAllClass();
    public List<ClassObject> findAllClassObject();
    public List<ClassObject> queryMajorInfoByTerms(ClassObject classObject);
    public Class findClassByName(String name);
    public Class findClassById(int class_id);
    public void updateClassById(Class cclass);
    public void deleteClassById(int class_id);
}
