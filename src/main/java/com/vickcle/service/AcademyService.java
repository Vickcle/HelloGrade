package com.vickcle.service;

import com.vickcle.model.Academy;
import java.util.List;


public interface AcademyService {
    public void insertAcademy(Academy academy);
    public List<Academy> findAllAcademy();
    public List<Academy> findAcademyByName(String name);
    public Academy findAcademyById(int academy_id);
    public void updateAcademyById(Academy academy);
    public void deleteAcademyById(int academy_id);
    public List<Academy> queryAcademyInfoByTerms(Academy academy);
}
