package com.vickcle.dao;

import com.vickcle.model.Major;

import java.util.List;

public interface MajorDao {
    public void insertMajor(Major Major);
    public List<Major> findAllMajor();
    public List<Major> findMajorByName(String name);
    public Major findMajorById(int major_id);
    public void updateMajorById(Major major);
    public void deleteMajorById(int major_id);
}
