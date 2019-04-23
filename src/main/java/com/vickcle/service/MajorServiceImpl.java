package com.vickcle.service;

import com.vickcle.dao.MajorDao;
import com.vickcle.model.Major;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MajorServiceImpl implements MajorService {
    @Autowired
    MajorDao majorDao;
    @Override
    public void insertMajor(Major major){
        majorDao.insertMajor(major);
    }
    @Override
    public List<Major> findAllMajor(){
        return majorDao.findAllMajor();
    }
    @Override
    public List<Major> findMajorByName(String name){
        return majorDao.findMajorByName(name);
    }
    @Override
    public Major findMajorById(int major_id){
        return majorDao.findMajorById(major_id);
    }
    @Override
    public void updateMajorById(Major major){
        majorDao.updateMajorById(major);
    }
    @Override
    public void deleteMajorById(int major_id){
        majorDao.deleteMajorById(major_id);
    }
}
