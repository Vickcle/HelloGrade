package com.vickcle.service;

import com.vickcle.dao.AcademyDao;
import com.vickcle.model.Academy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AcademyServiceImpl implements AcademyService {
    @Autowired
    AcademyDao academyDao;
    @Override
    public void insertAcademy(Academy academy){
        academyDao.insertAcademy(academy);
    }
    @Override
    public List<Academy> findAllAcademy(){
        return academyDao.findAllAcademy();
    }
    @Override
    public List<Academy> findAcademyByName(String name){
        return academyDao.findAcademyByName(name);
    }
    @Override
    public Academy findAcademyById(int academy_id){
        return academyDao.findAcademyById(academy_id);
    }
    @Override
    public void updateAcademyById(Academy academy){
        academyDao.updateAcademyById(academy);
    }
    @Override
    public void deleteAcademyById(int academy_id){
        academyDao.deleteAcademyById(academy_id);
    }
}
