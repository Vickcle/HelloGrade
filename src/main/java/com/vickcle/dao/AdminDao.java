package com.vickcle.dao;

import com.vickcle.model.Admin;

import javax.xml.registry.infomodel.User;
import java.util.List;

public interface AdminDao {
    public List<Admin> findAll();
    public Admin findAdminByName(String admin_name);
}
