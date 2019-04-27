package com.vickcle.service;

import com.vickcle.model.Creer;
import com.vickcle.model.CreerObject;

import java.util.List;

public interface CreerService {
    public void insertCreer(Creer creer);
    public List<Creer> findAllCreer();
    public Creer findCreerById(int creer_id);
    public void updateCreerById(Creer creer);
    public void deleteCreerById(int creer_id);
    public List<CreerObject> selectCreerInfo(CreerObject creerObject);
    public CreerObject selectCreerObjectById(int creer_id);
}
