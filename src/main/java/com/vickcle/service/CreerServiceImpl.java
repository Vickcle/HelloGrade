package com.vickcle.service;


import com.vickcle.dao.CreerDao;
import com.vickcle.model.Creer;
import com.vickcle.model.CreerObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CreerServiceImpl implements CreerService{
    @Autowired
    CreerDao creerDao;
    @Override
    public void insertCreer(Creer creer){
        creerDao.insertCreer(creer);
    }

    @Override
    public List<Creer> findAllCreer(){
        return creerDao.findAllCreer();
    }

    @Override
    public Creer findCreerById(int creer_id){
        return creerDao.findCreerById(creer_id);
    }

    @Override
    public void updateCreerById(Creer creer){
        creerDao.updateCreerById(creer);
    }

    @Override
    public void deleteCreerById(int creer_id){
        creerDao.deleteCreerById(creer_id);
    }

    @Override
    public List<CreerObject> selectCreerInfo(CreerObject creerObject){
        return creerDao.selectCreerInfo(creerObject);
    }

    @Override
    public CreerObject selectCreerObjectById(int creer_id){
        return creerDao.selectCreerObjectById(creer_id);
    }
}
