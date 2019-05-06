package com.vickcle.dao;

import com.vickcle.model.Academy;
import java.util.List;

public interface AcademyDao {
    public void insertAcademy(Academy Academy);
    public List<Academy> findAllAcademy();
    public List<Academy> findAcademyByName(String name);
    public Academy findAcademyById(int academy_id);
    public void updateAcademyById(Academy academy);
    public void deleteAcademyById(int academy_id);
    public List<Academy> queryAcademyInfoByTerms(Academy academy);
}
