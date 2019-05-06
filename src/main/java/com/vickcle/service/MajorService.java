package com.vickcle.service;

import com.vickcle.model.Major;

import java.util.List;


public interface MajorService {
    public void insertMajor(Major Major);
    public List<Major> findAllMajor();
    public List<Major> findMajorByName(String name);
    public Major findMajorById(int major_id);
    public void updateMajorById(Major major);
    public void deleteMajorById(int major_id);
    public List<Major> queryMajorInfoByTerms(Major major);
}
